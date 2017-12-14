//
//  TodoModel.swift
//  NewsAndTodo
//
//  Created by User on 01.08.17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation

class TodoModel {
    
    
    // MARK: Properties

    var id: String
    var image: String
    var title: String
    var date: Date
    var descriptionText: String
    
    
    // MARK: Methods

    init (id: String, image: String, title: String, date: Date, descriptionText: String) {
        
        self.id = id
        self.image = image
        self.title = title
        self.date = date
        self.descriptionText = descriptionText
    }
    
}
