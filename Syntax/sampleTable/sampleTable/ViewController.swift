//
//  ViewController.swift
//  sampleTable
//
//  Created by Jaeyoung Lee on 2021/08/31.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBAction func btnAddData(_ sender: Any) {
         //touchUpAddButton
        
        self.datas.append(Date())
      //  self.tableView.reloadData()
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic )
        
        print("reload dates \(datas)")
    }
    // cell 의 instance의 클래스를 만든다
    // 새파일
    
    
    var datas: [Date] = []
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    let timeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        case 2:
            return datas.count
        default:
            return 0
        }
    }
    var checkCount: Int = 0
    // 사용할 셀 정의
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //view reuse
     
        
        if (indexPath.section < 2) {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
             
            let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
            
            print("cell: \(text)")
            cell.textLabel?.text = text
            return cell
        } else {
            let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomTableViewCell
            
            cell.leftLabel?.text = self.dateFormatter.string(from: self.datas[indexPath.row])
            cell.rightLabel?.text = self.timeFormatter.string(from: self.datas[indexPath.row])
            
            return cell
        }
        
        
        //print("out tableView! and \(checkCount)")
        //checkCount += 1
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Title \(section)"
    }
  
    
    let cellIdentifier: String = "cell"
    
    let customCellIdentifier: String = "customCell"
     
    let korean: [String] = [ "가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카","가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카","가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카" ]
    let english: [String] = [ "A", "B", "C", "D", "E","A", "B", "C", "D", "E","A", "B", "C", "D", "E","A", "B", "C", "D", "E","A", "B", "C", "D", "E","A", "B", "C", "D", "E" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

