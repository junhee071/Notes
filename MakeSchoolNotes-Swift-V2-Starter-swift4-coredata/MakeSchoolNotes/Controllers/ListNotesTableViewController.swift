//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        notes = coreDataHelper.retrieveNotes()
    }
    
    // MARK: - Properties
    
    var notes = [Note]() {
        didSet {
            print(notes.count)
            tableView.reloadData()
        }
    }
    
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        // 3
        let note = notes[indexPath.row]
        cell.noteTitleLabel.text = note.title
        // 4
        cell.noteModificationTimeLabel.text = note.modificationTime?.convertToString() ?? "unknown"
        
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1
        guard let identifier = segue.identifier else { return }
        
        // 2
        switch identifier {
        case "displayNote":
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            
            let note = notes[indexPath.row]
            
            let destination = segue.destination as! DisplayNoteViewController
            
            destination.note = note
            print("note cell tapped")
            
        case "addNote":
            print("create note bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let noteToDelete = notes[indexPath.row]
            coreDataHelper.delete(note: noteToDelete)
            
            notes = coreDataHelper.retrieveNotes()
        }
    }
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        notes = coreDataHelper.retrieveNotes()
    }
    
    func setTheme(isDark: Bool) {
        let theme = isDark ? ColorTheme.dark : ColorTheme.light
        
        view.backgroundColor = theme.listNotesTableViewControllerBackgroundColor
        
        //noteTitleLabel.textColor = theme.primaryColor
        
        
    }
    
    
}
