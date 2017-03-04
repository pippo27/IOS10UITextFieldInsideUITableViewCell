//
//  WebboardViewController.swift
//  IOS10UITextFieldInsideUITableViewCell
//
//  Created by Arthit Thongpan on 3/4/17.
//  Copyright © 2017 Arthit Thongpan. All rights reserved.
//

import UIKit

class WebboardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearSelectionIndexPath()
    }
    
    // MARK: - Private Methods
    
    func setupTableView() {
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
    }
    
    func clearSelectionIndexPath() {
        if let selectionIndexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: selectionIndexPath, animated: true)
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier ?? "" {
        case "AddItem":
            break
        case "ShowDetail":
            guard let addTopicTableViewController = segue.destination as? AddTopicTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedTopic = topics[indexPath.row]
            addTopicTableViewController.topic = selectedTopic
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
        
    // MARK: - Unwind Segue Methods
    
    @IBAction func saveTopicToWebboardViewController(_ segue: UIStoryboardSegue) {
        if let sourceViewController = segue.source as? AddTopicTableViewController,
            let topic = sourceViewController.topic {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing topic.
                topics[selectedIndexPath.row] = topic
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // Add new topic
                let newIndexPath = IndexPath(row: topics.count, section: 0)
                topics.append(topic)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension WebboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicTableViewCell", for: indexPath) as! TopicTableViewCell
        let topic = topics[indexPath.row]
        cell.topic = topic
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            topics.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}

