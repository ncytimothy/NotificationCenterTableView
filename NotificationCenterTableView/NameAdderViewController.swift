//
//  NameAdderViewController.swift
//  NotificationCenterTableView
//
//  Created by Timothy Ng on 12/18/17.
//  Copyright © 2017 Timothy Ng. All rights reserved.
//

import Foundation
import UIKit

class NameAdderViewController: UIViewController, UITextFieldDelegate {
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBAction func pressCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addName(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let newName = nameText?.text {
            appDelegate.names.append(newName)
            self.nameText.resignFirstResponder()
            print("appDelegate.names: \(appDelegate.names)")
            self.dismiss(animated: true, completion: nil)
        }
    }
}
