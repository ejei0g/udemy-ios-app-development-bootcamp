//
//  ViewController.swift
//  UITableView
//
//  Created by Jaeyoung Lee on 2021/08/27.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    // (필수) 한 섹션에 몇개의 로우(셀)를 담을것인가
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.korean.count
        case 1:
            return self.english.count
        default:
            return 0
        }
    }
    
    //(필수) 테이블 뷰에 사용될 모든 셀들을 리턴
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let text: String = indexPath.section == 0 ? self.korean[indexPath.row] : self.english[indexPath.row]
        cell.textLabel?.text = text
        
        return cell
    }
    // 사용할 섹션의 수 (옵셔널함수) : 영어, 한글섹션
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    //
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "한글 \(self.korean[1])"
        case 1:
            return "영어"
        default:
            return "날짜"
        }
    }
    
    @IBOutlet var tableView: UITableView!
    
    let cellIdentifier: String = "cell"
    
    let korean: [String] = ["하나", "둘", "삼", "넷", "오"]
    let english: [String] = ["one", "two", "three", "four", "five"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.tableView.backgroundColor = UIColor.gray
    }
    // 테이블 뷰
    //section 과 row 로 이루어짐


}

