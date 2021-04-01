//
//  ViewController.swift
//  SortedArray
//
//  Created by Angelos Staboulis on 31/3/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var numbers:[Int]=[]
    
    var sortedArray:[Int]=[]
    
    var index:[IndexPath]=[]
    
    var row:Int?
 
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ArrayCell = tableView.dequeueReusableCell(withIdentifier: "arraycell") as! ArrayCell
        return setupCell(cell: cell, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150.0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell:ArrayCell = tableView.cellForRow(at: indexPath) as! ArrayCell
        row = indexPath.row
        cell.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    @IBOutlet var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
       
      
    }
    @objc func clickRandomArray(){
        numbers.removeAll()
        for _ in 0..<100{
            numbers.append(Int.random(in: 0..<10000))
        }
        mainTableView.reloadData()
    }
    @objc func clickArray(){
        numbers = numbers.sorted()
        mainTableView.reloadData()
    }

}
extension ViewController{
    func setupCell(cell:ArrayCell,indexPath:IndexPath)->ArrayCell{
        cell.selectionStyle  = .none
        if indexPath.row == row {
            cell.accessoryType = .checkmark
        }
        if indexPath.row < numbers.count {
            cell.textLabel?.text = String(numbers[indexPath.row])
        }
        return cell
    }
    func setupView(){
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: "ArrayCell", bundle: nil), forCellReuseIdentifier: "arraycell")
        self.title = "List Array Elements"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Random Values", style: .done, target:self, action: #selector(clickRandomArray))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .done, target:self, action: #selector(clickArray))
        for _ in 0..<100{
            numbers.append(Int.random(in: 0..<10000))
        }
    }
}
