//
//  SqliteManager.swift
//  NewsAndTodo
//
//  Created by User on 07.08.17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation
//import SQLite


class SqliteManager {
    
    func openDatabase() -> COpaquePointer {
        var db: COpaquePointer = nil
        if sqlite3_open(part1DbPath, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(part1DbPath)")
            return db
        } else {
            print("Unable to open database. Verify that you created the directory described " +
                "in the Getting Started section.")
            XCPlaygroundPage.currentPage.finishExecution()
        }
    }
    
}
