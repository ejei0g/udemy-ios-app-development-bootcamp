//
//  ViewController.swift
//  Current Device
//
//  Created by Jaeyoung Lee on 2021/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
    }
    
    func createButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
//        button.configuration = UIButton.Configuration.createConfig()
        button.configuration = .createConfig()
        button.configurationUpdateHandler = { button in
            if button.isHighlighted {
                button.backgroundColor = .systemYellow
            } else {
                button.backgroundColor = .white
            }
        }
        view.addSubview(button)
    }

    override var prefersStatusBarHidden: Bool {
        if UIDevice.current.model == "iPhone 6s" {
            return true
        } else {
            return false
        }
    }
}

extension UIButton.Configuration {
    static func createConfig() -> UIButton.Configuration {
        var config: UIButton.Configuration = .filled()
        config.baseBackgroundColor = .systemPink
        config.title = "Start Button"
        config.subtitle = "subtitle 123$"
        config.titleAlignment = .center
        config.cornerStyle = .capsule
        config.showsActivityIndicator = true
        return config
    }
    
}
