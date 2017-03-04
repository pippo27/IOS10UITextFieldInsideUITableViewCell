//
//  AddTopicTableViewController.swift
//  IOS10UITextFieldInsideUITableViewCell
//
//  Created by Arthit Thongpan on 3/4/17.
//  Copyright © 2017 Arthit Thongpan. All rights reserved.
//

import UIKit

class AddTopicTableViewController: UITableViewController {

    @IBOutlet weak var topicTextField: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var topic: Topic?
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        setupTextField()
        updateSaveButtonState()
    }

    func initData() {
        if let topic = topic {
            navigationItem.title = topic.title
            topicTextField.text = topic.title
            detailTextView.text = topic.detail
            nameTextField.text = topic.name
        }
    }
    
    func setupTextField() {
        topicTextField.delegate = self
        nameTextField.delegate = self
    }

    // MARK: Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.view.endEditing(true)
        if let _ = presentingViewController {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The AddTopicTableViewController is not inside a navigation controller.")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button == saveButton else {
            return
        }
        
        let title = topicTextField.text ?? ""
        let detail = detailTextView.text ?? ""
        let name = nameTextField.text ?? ""
        
        // Set topic to be passed to WebboardViewController after unwind segue.
        topic = Topic(title: title, detail: detail, name: name)
    }
    
    // MARK: - Private Methods
    
    fileprivate func updateSaveButtonState() {
        saveButton.isEnabled = validate()
    }
    
    // MARK: - Validation
    
    private func validate() -> Bool {
        guard !topicTextField.text!.isEmpty else {
            return false
        }
        
        guard !detailTextView.text!.isEmpty else {
            return false
        }
        
        guard !nameTextField.text!.isEmpty else {
            return false
        }
        
        return true
    }
}

// MARK: - UITextFieldDelegate

extension AddTopicTableViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case topicTextField:
            detailTextView.becomeFirstResponder()
        case detailTextView: break
        default:
            // Hide the keyboard.
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        
        if textField == topicTextField {
            navigationItem.title = textField.text
        }
    }
}
