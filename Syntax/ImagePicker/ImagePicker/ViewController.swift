//
//  ViewController.swift
//  ImagePicker
//
//  Created by Jaeyoung Lee on 2021/08/31.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func touchUpSelectImageButton(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    var a :Int = 3
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self //ViewController가 picker의 delegate 역할을 한다.
        // 합성 프로토콜 (imagePicker,navigationControllerDelegate)
        print("return picker object with delegate")
        return picker
    }()
    
    //이미지 피커가 한 일(사진을 선택한 일)을 전달하기 위해서는 딜리게이트를 활용
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("pick image")
        print(info)
      //  self.imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        if let originalImage : UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
        }
        print("pick picture")
        self.dismiss(animated: true , completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancel")
        self.dismiss(animated: true , completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

