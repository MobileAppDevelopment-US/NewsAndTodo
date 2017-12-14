//
//  NewsManager.swift
//  NewsAndTodo
//
//  Created by User on 04.08.17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation

class NewsManager {
    
    
    // MARK: Methods
    
    static func retrieveImageNews() -> [String] {
        
        let imageNewsArray = ["Al Jazeera English",
                             "Football Italia",
                             "BBC News",
                             "Financial Times",
                             "Fox Sports",
                             "Bloomberg",
                             "CNN",
                             "MTV News",
                             "The New York Times",
                             "Focus",
                             "National Geographic"]
        
        return imageNewsArray
    }
    
    static func retrieveNameNews() -> [String] {
        
        let nameNewsArray = ["Al Jazeera English",
                             "Football Italia",
                             "BBC News",
                             "Financial Times",
                             "Fox Sports",
                             "Bloomberg",
                             "CNN",
                             "MTV News",
                             "The New York Times",
                             "Focus",
                             "National Geographic"]
        
        return nameNewsArray
    }
    
    static func retrieveUrlNews() -> [String] {
        
        let urlNewsArray = ["https://newsapi.org/v1/articles?source=al-jazeera-english&sortBy=top&apiKey=32b7c23c15674e73b71c8dad64f97023",
                            "https://newsapi.org/v1/articles?source=football-italia&sortBy=top&apiKey=32b7c23c15674e73b71c8dad64f97023",
                            "https://newsapi.org/v1/articles?source=bbc-news&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                            "https://newsapi.org/v1/articles?source=financial-times&sortBy=top&apiKey=32b7c23c15674e73b71c8dad64f97023",
                            "https://newsapi.org/v1/articles?source=fox-sports&sortBy=top&apiKey=32b7c23c15674e73b71c8dad64f97023",
                            "https://newsapi.org/v1/articles?source=bloomberg&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                            "https://newsapi.org/v1/articles?source=cnn&sortBy=top&apiKey=32b7c23c15674e73b71c8dad64f97023",
                            "https://newsapi.org/v1/articles?source=mtv-news&sortBy=top&apiKey=32b7c23c15674e73b71c8dad64f97023",
                            "https://newsapi.org/v1/articles?source=the-new-york-times&sortBy=top&apiKey=32b7c23c15674e73b71c8dad64f97023",
                            "https://newsapi.org/v1/articles?source=focus&sortBy=top&apiKey=0ceab341623a4da79719490634ff4cbc",
                            "https://newsapi.org/v1/articles?source=national-geographic&sortBy=top&apiKey=32b7c23c15674e73b71c8dad64f97023"]
        
        return urlNewsArray
    }
    
}
