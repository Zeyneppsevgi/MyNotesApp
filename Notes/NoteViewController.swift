//
//  NoteViewController.swift
//  Notes
//
//  Created by Zeynep Sevgi on 22.03.2023.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var textViewSubTitle: UITextView!
    @IBOutlet weak var labelTitle: UILabel!
    
    public var noteTitle = String()
    public var note = String()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        labelTitle.text = noteTitle
        textViewSubTitle.text = note
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
