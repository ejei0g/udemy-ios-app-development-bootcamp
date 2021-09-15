//
//  ViewController.swift
//  Slider
//
//  Created by Jaeyoung Lee on 2021/09/15.
//

import UIKit

class ViewController: UIViewController {

    private let slider: SliderView = {
        let slider = SliderView(frame: .zero)
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.isUserInteractionEnabled = true
        slider.isContinuous = true
        slider.value = 0
        slider.thumbTintColor = UIColor.clear
        
        return slider
    }()
    
    @IBOutlet weak var mySlider: UISlider! {
        didSet {
            mySlider.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        } // didSet
    }
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(slider)
       // view.addSubview(greetingView)

        self.mySlider.value = 0.0
        self.slider.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Layout Slider
        slider.sizeToFit()
        let margin = CGFloat(20)
        slider.frame = CGRect(x: margin,
                              y: view.bounds.size.height - slider.bounds.size.height - 50,
                              width: view.bounds.size.width - (margin * 2),
                              height: slider.bounds.size.height);
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        myLabel.text = "\(mySlider.value), \(slider.value)"
    }
    
}
