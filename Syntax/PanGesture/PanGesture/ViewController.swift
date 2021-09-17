//
//  ViewController.swift
//  PanGesture
//
//  Created by Jaeyoung Lee on 2021/09/16.
//

import UIKit
fileprivate let defaultBackgroundColorTop = UIColor(red: 0.263, green: 0.118, blue: 0.565, alpha: 1.00)
fileprivate let defaultBackgroundColorBottom = UIColor(red: 1.000, green: 0.357, blue: 0.525, alpha: 1.00)

class ViewController: UIViewController {
    
    var circleView = UIView()
    var originCenter = CGPoint()
    private let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        return layer
    }()
    private let animateView: UIView = {
        let view = UIView(frame: .zero)
        //view.backgroundColor = UIColor.red
        //view.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 100)
        view.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originCenter = self.view.center
        // Do any additional setup after loading the view.
        circleView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        circleView.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        circleView.backgroundColor = UIColor.red
        circleView.layer.cornerRadius = 50
        self.view.addSubview(circleView)
        self.view.addSubview(animateView)
        
        
        animateView.layer.addSublayer(gradientLayer)
        print(animateView.frame.size)
        print(originCenter)
        animateView.center = CGPoint(x: originCenter.x, y: originCenter.y * 2)
      
        
        let touchGesture = UITapGestureRecognizer(target: self, action: #selector(touchAction))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGesture))

        self.view.addGestureRecognizer(panGestureRecognizer)

        circleView.addGestureRecognizer(touchGesture)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
        
        updateBackgroundGradient()
        
    }
    
    @objc private func touchAction(sender: UITapGestureRecognizer) {
        print("touch")
       self.view.center = originCenter
    }
    
    var count = 0
    @objc private func panGesture(sender: UIPanGestureRecognizer) {
        print("start pan action! \(count)")
        count += 1
        
        let state = sender.state.rawValue
        //print(state)
        if state == 3 {
            count = 0
            print(sender.view?.center as Any)
//self.view.center = originCenter
        }
      //  print(sender.view?.frame)
       // print(self.view.frame)
        // self는 여기서 ViewController이므로 self.view ViewController가 기존에가지고 있는 view이다.
        let translation = sender.translation(in: self.view) // translation에 움직인 위치를 저장한다.
        print(translation)
        // sender의 view는 sender가 바라보고 있는 circleView이다. 드래그로 이동한 만큼 circleView를 이동시킨다.
        sender.view!.center = CGPoint(x: sender.view!.center.x, y: sender.view!.center.y + translation.y)
       sender.setTranslation(.zero, in: self.view) // 0으로 움직인 값을 초기화 시켜준다.
        
    }

    
    private var backgroundColorTop = defaultBackgroundColorTop {
        didSet{ updateBackgroundGradient() }
    }
    
    private var backgroundColorBottom = defaultBackgroundColorBottom {
        didSet{ updateBackgroundGradient() }
    }
    private func updateBackgroundGradient() {
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        gradientLayer.colors = [backgroundColorTop.cgColor, backgroundColorBottom.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.locations = [0.0, 1.0]
        
        CATransaction.commit()
    }
}

