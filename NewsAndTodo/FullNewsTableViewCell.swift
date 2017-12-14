//
//  NewsTableViewCell.swift
//  NewsAndTodo
//
//  Created by User on 02.08.17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class FullNewsTableViewCell: UITableViewCell {
    
    
    // MARK: Outlets

    @IBOutlet weak var nameNewsLabel: UILabel!
    @IBOutlet weak var imageNewsView: UIImageView!

    
    // MARK: Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageNewsView.layer.cornerRadius = 20
        self.imageNewsView.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
