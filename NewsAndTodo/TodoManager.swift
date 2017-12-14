//
//  TodoManagers.swift
//  NewsAndTodo
//
//  Created by User on 03.08.17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation

class TodoManager {
    
    
    // MARK: Methods
    
    static func retrieveTodo() -> [TodoModel] {
        
        let todo1 = TodoModel(id: "1", image: "checkmarkSelected", title: "Встреча", date: dateFromString("2017-05-20")!, descriptionText: "Встретиться с Колей, обговорить дела")
        let todo2 = TodoModel(id: "2", image: "warningSelected", title: "Покупки", date: dateFromString("2017-06-28")!, descriptionText: "Купить продукты: молоко, хлеб, творог, яйца.")
        let todo3 = TodoModel(id: "3", image: "checkmarkSelected", title: "Звонок", date: dateFromString("2017-07-30")!, descriptionText: "Созвониться с арендатором, обговорить условия оренды")
        let todo4 = TodoModel(id: "4", image: "errorSelected", title: "Работа", date: dateFromString("2017-07-31")!, descriptionText: "Выполнить поиск вакансии")
        
        return [todo1, todo2, todo3, todo4]
    }
    
}


         
