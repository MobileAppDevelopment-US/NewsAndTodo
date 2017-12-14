//
//  DetailsNewsViewController.swift
//  NewsAndTodo
//
//  Created by User on 03.08.17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class DetailsNewsViewController: UIViewController {
    
    
    // MARK: Outlets

    @IBOutlet weak var textWebView: UIWebView!
    
    
    // MARK: Properties

    var detailsImage: String?
    var detailsUrl: String?
    
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textWebView.loadRequest(URLRequest(url: URL(string: self.detailsUrl!)!))
        self.view.reloadInputViews()
        self.textWebView.layer.cornerRadius = 15
        self.textWebView.clipsToBounds = true

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        //self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        loadData()
    }
    
    
    // MARK: Methods

    private func loadData() {
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            let urlRequest = URLRequest(url: URL(string: self.detailsImage!)!) as URLRequest?
            let task = URLSession.shared.dataTask(with: urlRequest!) {
                (data, response, error) in
                if error != nil {
                    print(error ?? "Can't download an image")
                    return
                }
            }
            task.resume()
        }
    }
    
}
