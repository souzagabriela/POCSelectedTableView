//
//  ViewController.swift
//  SelectedTableView
//
//  Created by Gabriela Souza Batista on 06/12/22.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    var arrayTest = [String]()
    var selectedItens = [String]()
//    var DeselectedItens = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(tableView)
        self.getData()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.isEditing = false
        self.tableView.allowsMultipleSelectionDuringEditing = true
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func getData() {
        arrayTest = [
            "Arroz", "Alecrim", "Abobrinha", "Banana", "Beringela", "Brocolis", "Caramelo", "Cuscuz"]
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTest.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayTest[indexPath.row]
//        let selectedRow = tableView.cellForRow(at: indexPath)
//        selectedRow?.isSelected == true
//        selectedRow?.imageView?.image = UIImage(named: "checkMark")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedDeselectCell(tableView: tableView, indexPath: indexPath)
        let selectedRow = tableView.cellForRow(at: indexPath)
        selectedRow?.accessoryType = (selectedRow?.accessoryType == .checkmark) ? .none : .checkmark
        selectedRow?.tintColor = UIColor(named: "green-02")
        selectedRow?.selectionStyle = .none
        print("Selected item")
    }

}
extension ViewController {

    func selectedDeselectCell(tableView: UITableView, indexPath: IndexPath) {
        self.selectedItens.removeAll()
        if let array = tableView.indexPathsForSelectedRows {
            for index in array {
                selectedItens.append(arrayTest[index.row])
            }
        }
        print(selectedItens)
    }
}
