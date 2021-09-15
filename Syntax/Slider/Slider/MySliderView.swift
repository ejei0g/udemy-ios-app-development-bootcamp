//
//  MySliderView.swift
//  Slider
//
//  Created by Jaeyoung Lee on 2021/09/15.
//

import Foundation
import UIKit

class SliderView: UISlider {
     override func trackRect(forBounds bounds: CGRect) -> CGRect {
          var result = super.trackRect(forBounds: bounds)
          result.origin.x = 0
          result.size.width = bounds.width
          result.size.height = 10 //added height for desired effect
          return result
     }


}
