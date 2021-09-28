//
//  ViewController.swift
//  GradientLayer
//
//  Created by Jaeyoung Lee on 2021/09/27.
//

import UIKit

class ViewController: UIViewController {
    let myView = UIView(frame: .init(x: 0, y: 0, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(myView)
        myView.center = view.center
        
        // start and finish point
        let startPoint = CGPoint(x: myView.bounds.minX, y: myView.bounds.midY)
        let finishPoint = CGPoint(x: myView.bounds.maxX, y: myView.bounds.midY)
        //Path
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: finishPoint)
        
        //Gradient mask
        let gradientMask = CAShapeLayer()
        let lineHeight = myView.frame.height
        gradientMask.fillColor = UIColor.clear.cgColor
        gradientMask.strokeColor = UIColor.black.cgColor
        gradientMask.lineWidth = lineHeight
        gradientMask.frame = myView.bounds
        gradientMask.path = path.cgPath
        
        // Filling animation
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.duration = 10
        gradientMask.add(animation, forKey: "LineAnimation")
        
        //Gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        // make sure to use .cgColor
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.green.cgColor]
        gradientLayer.frame = myView.bounds
        gradientLayer.mask = gradientMask
        
        myView.layer.addSublayer(gradientLayer)
        // Corner radius
        myView.layer.cornerRadius = 10
        myView.clipsToBounds = true
        
    }


}

