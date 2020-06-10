//
//  DetailsViewController.swift
//  Notes
//
//  Created by Mithun Raj on 07/06/20.
//  Copyright © 2020 Mithun Raj. All rights reserved.
//

import UIKit

protocol DetailsDelegate: AnyObject {
    func addToModel(noteTitle: String, noteContents: String)
    func updateModel(noteTitle: String, noteContents: String, index: Int)
}

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    weak var delegate: DetailsDelegate?
    var notesData: Notes?
    var index: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        basicSetUp()
    }
    
    // MARK: - Actions for save button pressed
    @IBAction func saveButtonClicked(_ sender: Any) {
        if basicValidation() {
            if notesData == nil {
            delegate?.addToModel(noteTitle: titleTextField.text ?? "", noteContents: contentsTextView.text)
            } else {
                delegate?.updateModel(noteTitle: titleTextField.text ?? "", noteContents: contentsTextView.text, index: index ?? 0)
            }
            self.navigationController?.popViewController(animated: true)
        } else {
            alert(message: Constants.alertEmptyMessage, title: "Empty")
        }
    }
}

extension DetailsViewController {
    func basicSetUp() {
        self.title = "Add Notes"
        titleTextField.roundedViewCorners(cornerRadius: 5.0)
        contentsTextView.roundedViewCorners(cornerRadius: 5.0)
        saveButton.roundedViewCorners(cornerRadius: 5.0)
        dataLoading()
    }
    
    func basicValidation() -> Bool {
        if let titleTextFieldText = titleTextField.text, !titleTextFieldText.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty, let contentsTextViewText = contentsTextView.text, !contentsTextViewText.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty {
            return true
        }
        return false
    }
    
    func dataLoading() {
        if let notesData = notesData {
            titleTextField.text = notesData.notesTitle
            contentsTextView.text = notesData.notesContents
        }
    }
}
