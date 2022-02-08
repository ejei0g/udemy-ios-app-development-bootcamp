//
//  ViewController.swift
//  SocketIO-Test
//
//  Created by Muzlive on 2022/02/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var connectBtn: UIButton!
    @IBOutlet weak var disconnectSocketBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func disconnectSocket(_ sender: Any) {
        print("disconnect socket")
        SocketIOManager.shared.closeConnection()
    }
    @IBAction func connectSocket(_ sender: Any) {
        print("connect Socket in localhost")
        SocketIOManager.shared.establishConnection()
    }
    @IBAction func sendData(_ sender: Any) {
        guard let message = textField.text else { return }
        SocketIOManager.shared.sendMessage(message: message, nickname: "jae.ly")
    }
    
}

