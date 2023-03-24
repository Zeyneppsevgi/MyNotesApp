//
//  ViewController.swift
//  Notes
//
//  Created by Zeynep Sevgi on 20.03.2023.
//

import UIKit


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    var models: [(title: String, note: String)] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = models[indexPath.row]
        cell.textLabel?.text = row.title
        cell.detailTextLabel?.text = row.note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.row]
        guard let vc = storyboard?.instantiateViewController(identifier: "NoteViewController") as? NoteViewController else {return}
        vc.title = "Note"
        vc.noteTitle = model.title
        vc.note = model.note
        navigationController?.pushViewController(vc, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnAdd(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "NewViewController") as? NewViewController else {return}
        
        vc.title = "New Note"
        vc.completion = {
            
            noteTitle,note in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append((title: noteTitle, note: note))
            self.myTableView.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController { //silme işlemi notları
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: nil) { (action,sourchView,completionHandler) in
            self.models.remove(at: indexPath.row)
            self.myTableView.reloadData()
            
            completionHandler(true)
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .purple
        return UISwipeActionsConfiguration(actions: [delete])
    }
    }
