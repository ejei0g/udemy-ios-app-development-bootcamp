//
//  GLViewController.swift
//  GradientLayer
//
//  Created by Jaeyoung Lee on 2021/10/03.
//

import UIKit

class GLViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .darkGray
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = gradientColors
        view.layer.addSublayer(gradientLayer)
        
        //gradientLayer.frame.origin.y = 800
        
        print(view.frame)
        
        print(gaugeViewColorTop.hexStringFromColor())
        var s = gaugeViewColorTop.hexStringFromColor()
        // MARK: - string to hex(int)
        let value = UInt(s.dropFirst(2), radix: 16) ?? 0
        print(value)
        print(gaugeViewColorTop)
        print(gaugeViewColorBottom)
        print(getColourFromPoint(point: CGPoint(x: gradientLayer.frame.origin.x, y: gradientLayer.frame.origin.y)))
        print(getColourFromPoint(point: CGPoint(x: 0.0, y:gradientLayer.frame.origin.y + 800 )))
        
        // MARK: - 두 색상 사이에서 값 가져오기.
        let p:Float = max(min(29, 100), 0) / 100
        print(p)
        print( gaugeViewColorTop.toColor(gaugeViewColorBottom, percentage: 0) )
        print( gaugeViewColorTop.toColor(gaugeViewColorBottom, percentage: 10) )
        print( gaugeViewColorTop.toColor(gaugeViewColorBottom, percentage: 20) )
        print( gaugeViewColorTop.toColor(gaugeViewColorBottom, percentage: 30) )
        print( gaugeViewColorTop.toColor(gaugeViewColorBottom, percentage: 100) )
    }
    
   //컬러- 게이지창 배경색 #FFFCDB / 게이지 그라데이션 #FFB5AF ~ #A29FFF / 도형: 그라데이션 (화이트 ~ 해당 게이지 색) / 메인 컬러: #A29FFF / 메인에서 톤다운 (포인트, 마이페이지와 설정 배경색) #706DD3

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    open func getColourFromPoint(point:CGPoint) -> UIColor {
        let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        
        var pixelData:[UInt8] = [0, 0, 0, 0]
        let context = CGContext(data: &pixelData, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        context?.translateBy(x: -point.x, y: -point.y)
        if let _context = context {
            self.view.layer.render(in: _context)
        }
        let red:CGFloat = CGFloat(pixelData[0]) / CGFloat(255.0)
        let green:CGFloat = CGFloat(pixelData[1]) / CGFloat(255.0)
        let blue:CGFloat = CGFloat(pixelData[2]) / CGFloat(255.0)
        let alpha:CGFloat = CGFloat(pixelData[3]) / CGFloat(255.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UIColor {
    func toColor(_ color: UIColor, percentage: CGFloat) -> UIColor {
        let percentage = max(min(percentage, 100), 0) / 100
        switch percentage {
               case 0: return self
               case 1: return color
               default:
                   var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
                   var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
                   guard self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1) else { return self }
                   guard color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2) else { return self }

                   return UIColor(red: CGFloat(r1 + (r2 - r1) * percentage),
                                  green: CGFloat(g1 + (g2 - g1) * percentage),
                                  blue: CGFloat(b1 + (b2 - b1) * percentage),
                                  alpha: CGFloat(a1 + (a2 - a1) * percentage))
        }
    }
}
