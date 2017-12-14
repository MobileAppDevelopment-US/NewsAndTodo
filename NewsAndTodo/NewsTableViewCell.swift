//
//  NewsDetailsTableViewCell.swift
//  NewsAndTodo
//
//  Created by User on 03.08.17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    
    // MARK: Outlets

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    // MARK: Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
