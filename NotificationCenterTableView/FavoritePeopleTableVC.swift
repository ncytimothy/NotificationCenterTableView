//
//  FavoritePeopleVC.swift
//  NotificationCenterTableView
//
//  Created by Timothy Ng on 12/18/17.
//  Copyright © 2017 Timothy Ng. All rights reserved.
//

import UIKit

class FavoritePeopleVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    var names = [String]()
    @IBOutlet weak var favoritePeopleTable: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        names = appDelegate.names
        NotificationCenter.default.addObserver(self, selector: #(self.reloadTable), name: NSNotification.Name(rawValue: "reloadTable"), object: nil)
    }
    
    func reloadTable() {
        favoritePeopleTable.reloadData()
    }
    
    @IBAction func addName(_ sender: Any) {
        let addNameVC = storyboard?.instantiateViewController(withIdentifier: "NameAdderVC") as! NameAdderViewController
        self.present(addNameVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("names.count: \(names.count)")
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell") as! UITableViewCell
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }

}

