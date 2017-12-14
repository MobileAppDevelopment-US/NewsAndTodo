//
//  TableViewCell.swift
//  NewsAndTodo
//
//  Created by User on 03.08.17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {

    func setupStyles1() {

        backgroundColor = UIColor.clear
        selectionStyle = .none
        layer.shadowOffset = CGSize(width: 0, height: 1.5)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.25
    }
}
