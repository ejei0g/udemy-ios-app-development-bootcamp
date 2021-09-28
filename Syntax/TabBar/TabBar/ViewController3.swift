//
//  ViewController3.swift
//  TabBar
//
//  Created by Jaeyoung Lee on 2021/09/27.
//

import UIKit

class ViewController3: UIViewController {

    let viewTitle = "third"
    override func viewDidLoad() {
        super.viewDidLoad()


        view.backgroundColor = UIColor.brown
        print("[[[\(viewTitle)]]] viewDidLoad only one")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("\(viewTitle) view will appear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("\(viewTitle) view did appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("\(viewTitle) view will disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("\(viewTitle) view did disappear")
    }
}
