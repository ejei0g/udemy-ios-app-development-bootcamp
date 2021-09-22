/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class CALayerViewController: UIViewController {
  @IBOutlet weak var viewForLayer: UIView!

  let layer = CALayer()
  let subLayer = CALayer()

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpLayer(layer: layer)
    setUpLayer(layer: subLayer)
    subLayer.backgroundColor = UIColor.blue.cgColor
    viewForLayer.layer.addSublayer(subLayer)
    viewForLayer.layer.addSublayer(layer)
    viewForLayer.backgroundColor = .brown
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "DisplayLayerControls" {
      (segue.destination as? CALayerControlsViewController)?.layerViewController = self
    }

  }
}

// MARK: - Layer
extension CALayerViewController {
  func setUpLayer(layer: CALayer) {
    layer.frame = viewForLayer.bounds
    layer.contents = UIImage(named: "star")?.cgImage //cgImage, cgColor로 convert
    
    layer.contentsGravity = .center //contents의 중력을 통해 배치 (위 아래 좌상단 등등)
    layer.magnificationFilter = .linear
    
    layer.cornerRadius = 100.0  //원형으로
    layer.borderWidth = 12.0    //가장자리 두께
    layer.borderColor = UIColor.white.cgColor
    layer.backgroundColor = swiftOrangeColor.cgColor
    
    layer.shadowOpacity = 0.75 //그림자효과
    layer.shadowOffset = CGSize(width: 0, height: 3)
    layer.shadowRadius = 3.0
    layer.isGeometryFlipped = false
  }
}
