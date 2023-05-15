//
//  SettingsViewController.swift
//  File_Manager
//
//  Created by Слава Орлов on 02.05.2023.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    var delegate: MainTableViewController?
    
    var manager = SettingsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.settingVC = self
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        checkmark(at: indexPath, tableView)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "change" else { return }
        guard let loginVC = segue.destination as? LoginViewController else { return }
        UserDefaults.standard.set(false, forKey: "checked")
        UserDefaults.standard.set(false, forKey: "touched")
        loginVC.loadViewIfNeeded()
        loginVC.welcomeLabel.text = "Cмена пароля"
    }
    
    private func checkmark(at indexPath: IndexPath, _ tableView: UITableView) {
        
        if indexPath.row == 0 {
            if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
                manager.sortByABC = false
                UserDefaults.standard.set(false, forKey: "sort")
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
                delegate?.tableView.reloadData()
            }
            else {
                manager.sortByABC = true
                UserDefaults.standard.set(true, forKey: "sort")
                tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
                delegate?.tableView.reloadData()
            }
        }
    }
}
