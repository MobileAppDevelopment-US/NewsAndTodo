//
//  NewsModel.swift
//  NewsAndTodo
//
//  Created by User on 02.08.17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation

class NewsModel {
    
    
    // MARK: Properties

    var title: String?
    var description: String?
    var dateNow: String?
    var imageURL: String?
    var articleURL: String?
    
    
    // MARK: Methods

    init(title: String, description: String, dateNow: String, imageURL: String, articleURL: String) {
        
        self.title = title
        self.description = description
        self.dateNow = dateNow
        self.imageURL = imageURL
        self.articleURL = articleURL
    }
    
}
