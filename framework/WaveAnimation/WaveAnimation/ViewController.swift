//
//  ViewController.swift
//  WaveAnimation
//
//  Created by Jaeyoung Lee on 2021/09/21.
//

import UIKit
import WaveAnimationView

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    var wave: WaveAnimationView!
    var waveView: UIView = UIView()
    let layer = CALayer()
    func setUpLayer() {
        layer.frame = waveView.bounds
       
        layer.contentsGravity = .center
        layer.magnificationFilter = .linear
        
        layer.cornerRadius = 100.0
        layer.borderWidth = 12.0
        layer.borderColor = UIColor.white.cgColor
        layer.backgroundColor = UIColor.brown.cgColor
      }
    
    @IBAction func touchButton(_ sender: UIButton) {
        wave.progress = 1.0
        print(wave.frame.width)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        waveView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        waveView.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        //waveView.backgroundColor = UIColor.red
        view.addSubview(waveView)
        setUpLayer()
        // Do any additional setup after loading the view.
        //wave = WaveAnimationView(frame: waveView.frame, color: UIColor.blue)
        wave = WaveAnimationView(frame: CGRect(origin: .zero, size: waveView.bounds.size), frontColor: .lightGray, backColor: .systemBlue)
        //wave.maskImage = UIImage(named: "world")
        wave.layer.addSublayer(layer)
        waveView.addSubview(wave)
        wave.startAnimation()
        //wave.progress = 1.0
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        wave.stopAnimation()
    }

}

