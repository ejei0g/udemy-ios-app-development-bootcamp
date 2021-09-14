//
//  ViewController.swift
//  CGRect
//
//  Created by Jaeyoung Lee on 2021/09/14.
//

import UIKit

class ViewController: UIViewController {

    let myView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemBlue
        view.frame.size = CGSize(width: 400, height: 800)
        return view
    }()
    
    let mySecondView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemRed
        view.frame = CGRect(origin: CGPoint(x: 200,y: 400), size: CGSize(width: 200,height: 400))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(myView)
        view.addSubview(mySecondView)
        print("mySubViews center: ", myView.center)
    }

}

