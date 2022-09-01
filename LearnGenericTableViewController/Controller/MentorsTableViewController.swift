//
//  MentorsTableViewController.swift
//  LearnGenericTableViewController
//
//  Created by khoirunnisa' rizky noor fatimah on 01/09/22.
//

import UIKit

class MentorsTableViewController: UITableViewController {

    var mentorsData = Mentors().generateData()
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mentorsData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mentorList", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = mentorsData[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "MoveToDetail", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let detailVC = segue.destination as? DetailTableViewController
        // Pass the selected object to the new view controller.
        detailVC?.mentorDetail = mentorsData[selectedIndex]
    }
    

}
