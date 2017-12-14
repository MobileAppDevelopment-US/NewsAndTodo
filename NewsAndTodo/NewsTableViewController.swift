//
//  NewsDetailsTableViewController.swift
//  NewsAndTodo
//
//  Created by User on 02.08.17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    
    // MARK: Properties

    var numberOfRows: Int?
    var art: NewsModel?
    var url = ""
    fileprivate  var arrayOfData: [NewsModel]?
    var currentRow:Int?
    
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setTableViewStyle()
        
        self.tableView.register(UINib(nibName: "NewsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "CellNews")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    // MARK: Methods

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func loadData() {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            let url = URL(string: self.url)
            let task = URLSession.shared.dataTask(with: url!) {
                (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    if let content = data {
                        self.arrayOfData = [NewsModel]()
                        do {
                            let jsonDict = try JSONSerialization.jsonObject(with: content, options: .mutableContainers) as! [String : AnyObject]
                            if let allArticles = jsonDict["articles"] as! [NSDictionary]? {
                                for some  in allArticles {
                                    
                                    let dataTitle: String
                                    let dataDescription: String
                                    let dateNow: String
                                    var dataImage: String
                                    var dataURL: String
                                    
                                    if let jsonTitle = some.value(forKey: "title") as? String {
                                        dataTitle = jsonTitle
                                    } else {
                                        dataTitle = "Title"
                                    }
                                    if let jsonDescription = some.value(forKey: "description") as? String {
                                        dataDescription = jsonDescription
                                    } else {
                                        dataDescription = "Description"
                                    }
                                    if let jsonDate = some.value(forKey: "publishedAt") as? String {
                                        dateNow = jsonDate
                                    } else {
                                        dateNow = "Data"
                                    }
                                    if let jsonUrl = some.value(forKey: "url") as? String {
                                        dataURL = jsonUrl
                                    } else {
                                        dataURL = "URL"
                                    }
                                    if let jsonImage = some.value(forKey: "urlToImage") as? String {
                                        dataImage = jsonImage
                                    } else {
                                       dataImage = "http://www.freeiconspng.com/img/23500"
                                    }
                                    let modelValue = NewsModel(title: dataTitle, description: dataDescription, dateNow: dateNow, imageURL: dataImage, articleURL: dataURL)
                                    self.arrayOfData?.append(modelValue)
                                }
                            }
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                        catch let error {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayOfData?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellNews", for: indexPath) as! NewsTableViewCell
        
        if let titleValue = self.arrayOfData?[indexPath.item] {
            guard let title = titleValue.title, let description = titleValue.description, let imageURLString = titleValue.imageURL else {
                cell.titleLabel.text = "Title"
                cell.descriptionLabel.text = "Description"
                cell.cellImageView.downloadImage(from: "http://www.freeiconspng.com/uploads/no-image-icon-10.png")
                return cell
            }
            cell.titleLabel.text = title
            cell.descriptionLabel.text = description
            cell.cellImageView.downloadImage(from: imageURLString)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.art = arrayOfData?[indexPath.row]
        let controller = storyboard?.instantiateViewController(withIdentifier: "DetailsNews") as! DetailsNewsViewController
        controller.detailsUrl = art?.articleURL
        controller.detailsImage = art?.imageURL
        //self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}


// MARK: Extension

extension UIImageView {
    
    func downloadImage(from url: String) -> Void {
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) in
            if error != nil {
                print(error ?? "Can't download an image")
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
    
}

