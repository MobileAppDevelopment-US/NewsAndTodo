//
//  TableViewCell.swift
//  NewsAndTodo
//
//  Created by User on 03.08.17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation
import UIKit


// MARK: Extension

extension UITableViewController {
    
    func setTableViewStyle() {
        
        let backgroundImage = UIImage(named: "Group")
        let imageView = UIImageView(image: backgroundImage)
        tableView.backgroundView = imageView
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
}
