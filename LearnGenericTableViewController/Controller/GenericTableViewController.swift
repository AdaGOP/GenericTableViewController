//
//  GenericTableViewController.swift
//  LearnGenericTableViewController
//
//  Created by khoirunnisa' rizky noor fatimah on 01/09/22.
//

import UIKit

class GenericTableViewController<T, Cell: UITableViewCell>: UITableViewController {
    
    var items: [T]
    var configure: (Cell, T) -> Void
    var selectHandler: (T) -> Void
    
    init(items: [T], configure: @escaping (Cell, T) -> Void, selectHandler: @escaping (T) -> Void) {
        self.items = items
        self.configure = configure
        self.selectHandler = selectHandler
        super.init(style: .plain) // You can try another style
        self.tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if items.count != 1 {
            return 1
        }
        return items.count + 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Use of generics
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let item = items[indexPath.row]
        cell.tag = indexPath.section
        configure(cell, item)
        return cell
    }
    
    // MARK: - Navigation
    // Override to navigate view controller
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedIndex = indexPath.row
        let item = items[selectedIndex]
        selectHandler(item)
    }
    
}
