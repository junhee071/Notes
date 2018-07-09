//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    var note: Note?
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let note = note {
            titleTextField.text = note.title
            contentTextView.text = note.content
        }
        else {
            titleTextField.text = ""
            contentTextView.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let destination = segue.destination as? ListNotesTableViewController else { return }

        switch identifier {
        case "save" where note != nil:
            note?.title = titleTextField.text ?? ""
            note?.content = contentTextView.text ?? ""
            note?.modificationTime = Date()

            coreDataHelper.saveNote()
            destination.tableView.reloadData()
            
        case "save" where note == nil:
            let note = coreDataHelper.newNote()
            note.title = titleTextField.text ?? ""
            note.content = contentTextView.text ?? ""
            note.modificationTime = Date()
            coreDataHelper.saveNote()

        
            
        case "cancel":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    
    
}
