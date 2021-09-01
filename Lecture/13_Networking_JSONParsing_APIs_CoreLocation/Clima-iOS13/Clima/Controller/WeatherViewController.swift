//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self
    }
    @IBAction func searchPressed(_ sender: UIButton) {
        if let inputString: String = searchTextField.text {
            print(inputString)
        }
        searchTextField.endEditing(true)
        searchTextField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("press the return button")
        
        //endEditing호출 = 키보드 닫기
        searchTextField.endEditing(true)
        
        searchTextField.text = "hello"
        print("clear")
        return true
        
    }
    
    //endEditing이 호출되었을 때 동작
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("did end Edit\n hey view con, user end edit")
        searchTextField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("should End Edit")
        if searchTextField.text != "" {
            return true
        } else {
            searchTextField.placeholder = "please input"
            return false
        }
    }

}

