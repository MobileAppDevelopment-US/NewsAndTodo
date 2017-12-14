//
//  NewsTableViewCell.swift
//  NewsAndTodo
//
//  Created by User on 01.08.17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupStyles()
    }
    
}


// MARK: Extension

extension TodoTableViewCell {
    
    func setupStyles() {
        
        backgroundColor = UIColor.clear
        selectionStyle = .none
        layer.shadowOffset = CGSize(width: 0, height: 1.5)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.25
    }
    
}

