//
//  SocketIOManager.swift
//  SocketIO-Test
//
//  Created by Muzlive on 2022/02/07.
//

import Foundation
import UIKit
import SocketIO

class SocketIOManager: NSObject {
    static let shared = SocketIOManager()
    var manager = {
        return SocketManager(socketURL: URL(string: "https//localhost:9000")!, config: [.log(false), .compress])
    }()
    var socket: SocketIOClient!
    override init() {
        super.init()
        socket = self.manager.socket(forNamespace: "/test")
        
        socket.on("test") { dataArray, AckCallback in
            print(dataArray)
        }
    }
    
    func establishConnection() {
        socket.connect()
    }
    func closeConnection() {
        socket.disconnect()
    }
    func sendMessage(message: String, nickname: String) {
        socket.emit("event", ["message" : "This is a test message"])
        socket.emit("message", ["nick" : nickname, "msg" : message])
        socket.emit("test", ["time" : "18:00"], completion: nil)
        
    }

}
