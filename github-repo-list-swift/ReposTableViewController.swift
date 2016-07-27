//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    var dataStore = ReposDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.accessibilityLabel = "tableView"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.dataStore.getRepositoriesWithCompletion({
            self.tableView.reloadData()
        })
    }

    // MARK: - Table view data source
 
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataStore.repositories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
        let repo = self.dataStore.repositories[indexPath.row]
        cell.textLabel?.text = repo.fullName
        return cell
    }

}
