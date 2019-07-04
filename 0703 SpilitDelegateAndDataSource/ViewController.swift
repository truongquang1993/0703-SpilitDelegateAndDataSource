//
//  ViewController.swift
//  0703 SpilitDelegateAndDataSource
//
//  Created by Trương Quang on 6/26/19.
//  Copyright © 2019 Trương Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outletTableView: UITableView!
    let dataSource = DataSource()
    let numberDataSource = NumberDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outletTableView.dataSource = dataSource
    }
    
    
    @IBAction func actionSwitch(_ sender: UISwitch) {
        if sender.isOn {
            outletTableView.dataSource = numberDataSource
        }else{
            outletTableView.dataSource = dataSource
        }
        outletTableView.reloadData()
    }
    
}


class DataSource: NSObject, UITableViewDataSource{
    var list = ["a", "b", "c"]
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(list[indexPath.row])
        return cell
    }
}

class NumberDataSource: NSObject, UITableViewDataSource {
    var list = [Int](1...10)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(list[indexPath.row])
        return cell
    }
    
}
