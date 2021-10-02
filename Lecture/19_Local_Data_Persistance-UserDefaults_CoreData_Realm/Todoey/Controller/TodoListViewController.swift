//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    //var itemArray = ["Find Mike", "Buy Eggos", "Destory Demogorgon"]
    var itemArray = [Item]()
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - MVC Models refactoring
        
        let newItems = Item()
        newItems.title = "Find Mike"
        itemArray.append(newItems)
        
        let newItems2 = Item()
        newItems2.title = "Find Mike"
        itemArray.append(newItems2)
        
        let newItems3 = Item()
        newItems3.title = "Destroy Mike"
        itemArray.append(newItems3)
        
        // Do any additional setup after loading the view.
//        if let items = userDefaults.array(forKey: "TodoListArray") as? [String] {
//            itemArray = items
//        }

        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.backgroundColor = .blue
        self.view.backgroundColor = .gray
        self.navigationController?.navigationBar.barTintColor = .red
    }

    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        // 항상 새로 만들기 때문에 범위를 벗어나면 deallocate하고 새로 만든다.
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        //cell.textLabel?.text = itemArray[indexPath.row]
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title//itemArray[indexPath.row].title
        
        
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        //toggle is replaced this
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        } else {
//            itemArray[indexPath.row].done = false
//        }
        
//        let type = tableView.cellForRow(at: indexPath)?.accessoryType
        
//        if type == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableView.reloadData()
    }
    
//    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
//        return false
//    }
    //MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        print("start func pressed add button")
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { action in
            //what will happen once the user  clicks  the add items button on our uialert
            print("start action!")
            if let text = textField.text {
                let newItem = Item()
                newItem.title = text
                self.itemArray.append(newItem)
                
                self.userDefaults.set(self.itemArray, forKey: "TodoListArray")
                
                self.tableView.reloadData()
            }
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item" //뒷배경
            textField = alertTextField
            if textField === alertTextField {
                print("this same address")
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        print("end func pressed add button")
    }
    
}

