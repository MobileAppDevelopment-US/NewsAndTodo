//
//  ViewController.swift
//  NewsAndTodo
//
//  Created by User on 31.07.17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit


// MARK: Properties

var todos: [TodoModel] = []
var filteredTodos: [TodoModel] = []

class TodoListViewController: UIViewController {
    
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Properties
    
    var countCell = Int()
    var viewsArray: [UIView] = []
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        todos = TodoManager.retrieveTodo()
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        var contentOffset = tableView.contentOffset
        contentOffset.y += searchDisplayController!.searchBar.frame.size.height
        tableView.contentOffset = contentOffset
        searchDisplayController?.searchResultsTableView.backgroundColor = UIColor(red: 66.0/255.0, green: 132.0/255.0, blue: 187.0/255.0, alpha: 1)
        
        setTableViewStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        separatorViews()
    }
    
    
    // MARK: Methods
    
    func separatorViews() {
        
        separatorViews(forScreenWidth: UIScreen.main.bounds.size.width)
    }
    
    func separatorViews(forScreenWidth screenWidth: CGFloat) {
        
        for i in self.viewsArray {
            i.removeFromSuperview()
        }
        self.viewsArray.removeAll()
        let separatorHeight = CGFloat(4.0)
        
        for i in 1...todos.count {
            let additionalSeparator = UIView.init(frame: CGRect(x: 0, y: CGFloat(80 * i), width: screenWidth, height: separatorHeight))
            additionalSeparator.backgroundColor = UIColor(red: 33.0/255.0, green: 37.0/255.0, blue: 62.0/255.0, alpha: 1)
            self.viewsArray.append(additionalSeparator)
            tableView.addSubview(additionalSeparator)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        if UIDevice.current.orientation.isPortrait {
            separatorViews(forScreenWidth: size.height)
        } else {
            separatorViews(forScreenWidth: size.width)
        }
    }
    
    
    // MARK - Storyboard stuff
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "EditTodo" {
            let controller = segue.destination as! DetailsViewController
            let indexPath = tableView.indexPathForSelectedRow
            if let index = indexPath {
                controller.todo = todos[index.row]
            }
        }
    }
    
//    func saveUserDefault() {
//        //self.todosUserDefault = todos
//        self.userDefault.set(todos, forKey: "modelsArray")
//        self.userDefault.synchronize()
//    }

}


// MARK - UITableViewDataSource

extension TodoListViewController: UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == searchDisplayController?.searchResultsTableView {
            return filteredTodos.count
        } else {
            return todos.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "todoCell")! as UITableViewCell
        var todo: TodoModel
        if tableView == searchDisplayController?.searchResultsTableView {
            todo = filteredTodos[indexPath.row]
        } else {
            todo = todos[indexPath.row]
        }
        let image = cell.viewWithTag(101) as! UIImageView
        let title = cell.viewWithTag(102) as! UILabel
        let date = cell.viewWithTag(103) as! UILabel
        
        self.countCell = indexPath.row + 1
        image.image = UIImage(named: todo.image)
        title.text = String(self.countCell) + ". " + todo.title
        
        let locale = Locale.current
        let dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy-MM-dd", options: 0, locale:locale)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        date.text = dateFormatter.string(from: todo.date as Date)
        
        return cell
    }
    
    
    // MARK - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
        separatorViews()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return self.isEditing
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = todos.remove(at: sourceIndexPath.row)
        todos.insert(todo, at: destinationIndexPath.row)
    }
    
    
    // MARK - UISearchDisplayDelegate
    
    func searchDisplayController(_ controller: UISearchDisplayController, shouldReloadTableForSearch searchString: String?) -> Bool {
        
        filteredTodos = todos.filter() {
            $0.title.range(of: searchString!) != nil
        }
        return true
    }
    
    @IBAction func saveData(_ segue: UIStoryboardSegue) {
        
        tableView.reloadData()
    }
    
}


// MARK: Extension

extension TodoListViewController {
    
    func setTableViewStyle() {
        
        let backgroundImage = UIImage(named: "Group")
        let imageView = UIImageView(image: backgroundImage)
        tableView.backgroundView = imageView
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
}

