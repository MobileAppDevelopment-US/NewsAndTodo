//
//  Common.swift
//  NewsAndTodo
//
//  Created by User on 01.08.17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation


// MARK: Methods

func dateFromString (_ dateStr: String) -> Date? {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from: dateStr)
    
    return date
    
}
