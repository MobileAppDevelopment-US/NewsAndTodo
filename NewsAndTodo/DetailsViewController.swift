//
//  DetailViewController.swift
//  NewsAndTodo
//
//  Created by User on 01.08.17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: Outlets
    
    @IBOutlet weak var activeButton: UIButton!
    @IBOutlet weak var completedButton: UIButton!
    @IBOutlet weak var deletedButton: UIButton!
    @IBOutlet weak var todoItem: UITextField!
    @IBOutlet weak var todoDate: UIDatePicker!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!


    // MARK: Properties
    
    var todo: TodoModel?
    let customColor = UIColor(red: 33.0/255.0, green: 37.0/255.0, blue: 62.0/255.0, alpha: 0.3).cgColor
    let customColor1 = UIColor(red: 33.0/255.0, green: 37.0/255.0, blue: 62.0/255.0, alpha: 1).cgColor


    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DetailsViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.todoItem.delegate = self
        
        if self.todo == nil {
            self.activeButton.isSelected = true
            navigationController?.title = "Todo"
        } else {
            navigationController?.title = "Todo"
            if self.todo?.image == "checkmarkSelected"{
                self.activeButton.isSelected = true
            } else if self.todo?.image == "warningSelected"{
                self.completedButton.isSelected = true
            } else if self.todo?.image == "errorSelected"{
                self.deletedButton.isSelected = true
            }
            self.todoItem.text = self.todo?.title
            self.todoDate.setDate((self.todo?.date)! as Date, animated: false)
            self.descriptionText.text = self.todo?.descriptionText
        }
        
        self.todoItem.layer.borderColor = self.customColor
        self.todoItem.layer.borderWidth = 2
        self.todoItem.layer.cornerRadius = 5
        self.descriptionText.layer.borderColor = self.customColor
        self.descriptionText.layer.borderWidth = 2
        self.saveButton.layer.borderWidth = 2
        self.saveButton.layer.borderColor = self.customColor1
        self.scrollView.bounces = false

    }
    
    
    // MARK: Actions
    
    @IBAction func activeTapped(_ sender: AnyObject) {
        resetButtons()
        self.activeButton.isSelected = true
    }
    
    @IBAction func completedTapped(_ sender: AnyObject) {
        resetButtons()
        self.completedButton.isSelected = true
    }
    
    @IBAction func deletedTapped(_ sender: AnyObject) {
        resetButtons()
        self.deletedButton.isSelected = true
    }
    
    @IBAction func okTapped(_ sender: AnyObject) {
        var image = ""
        if self.activeButton.isSelected {
            image = "checkmarkSelected"
        } else if self.completedButton.isSelected {
            image = "warningSelected"
        } else if self.deletedButton.isSelected {
            image = "errorSelected"
        }
        
        if self.todo == nil {
            let uuid = UUID().uuidString
            self.todo = TodoModel(id: uuid, image: image, title: self.todoItem.text!, date: self.todoDate.date, descriptionText: self.descriptionText.text!)
            todos.append(self.todo!)
        } else {
            self.todo?.image = image
            self.todo?.title = self.todoItem.text!
            self.todo?.date = self.todoDate.date
            self.todo?.descriptionText = self.descriptionText.text!
        }

        //self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: Methods
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func resetButtons() {
        self.activeButton.isSelected = false
        self.completedButton.isSelected = false
        self.deletedButton.isSelected = false
    }
    
    
    // MARK: - Textfield
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.todoItem.resignFirstResponder()
    }
    
}


