//
//  NewViewController.swift
//  Notes
//
//  Created by Zeynep Sevgi on 22.03.2023.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    public var completion : ((String,String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
    }
    @objc func didTapSave() {
        if let title = textField.text,!title.isEmpty, !textView.text.isEmpty {
            completion?(title,textView.text)
        }
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
