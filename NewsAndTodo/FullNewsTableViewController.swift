//
//  FullNewsTableViewController.swift
//  NewsAndTodo
//
//  Created by User on 31.07.17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class FullNewsTableViewController: UITableViewController {
    
    
    // MARK: Properties
    
    let imageNewsArray = NewsManager.retrieveImageNews()
    let nameNewsArray = NewsManager.retrieveNameNews()
    let urlNewsArray = NewsManager.retrieveUrlNews()
    
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableViewStyle()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.nameNewsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FullNewsCell", for: indexPath) as! FullNewsTableViewCell
        cell.nameNewsLabel.text = self.nameNewsArray[indexPath.row]
        cell.imageNewsView.image = UIImage(named: self.imageNewsArray[indexPath.row])
        cell.selectionStyle = .none
        cell.imageNewsView.layer.cornerRadius = 5

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "News") as! NewsTableViewController
        controller.url = urlNewsArray[indexPath.row]
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}



