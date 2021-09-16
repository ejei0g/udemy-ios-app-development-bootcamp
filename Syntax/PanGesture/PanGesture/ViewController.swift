//
//  ViewController.swift
//  PanGesture
//
//  Created by Jaeyoung Lee on 2021/09/16.
//

import UIKit

class ViewController: UIViewController {
    
    var circleView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        circleView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        circleView.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        circleView.backgroundColor = UIColor.red
        circleView.layer.cornerRadius = 50
        self.view.addSubview(circleView)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        
        circleView.addGestureRecognizer(panGestureRecognizer)
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
        }
        
        // self는 여기서 ViewController이므로 self.view ViewController가 기존에가지고 있는 view이다.
        let translation = sender.translation(in: self.view) // translation에 움직인 위치를 저장한다.
        // sender의 view는 sender가 바라보고 있는 circleView이다. 드래그로 이동한 만큼 circleView를 이동시킨다.
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        sender.setTranslation(.zero, in: self.view) // 0으로 움직인 값을 초기화 시켜준다.
        
    }

}

