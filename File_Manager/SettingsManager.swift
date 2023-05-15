//
//  SettingsManager.swift
//  File_Manager
//
//  Created by Слава Орлов on 04.05.2023.
//
import UIKit

class SettingsManager {
        
    var settingVC: SettingsViewController?
    
    var model = Model(path: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? "")
    
    var sortByABC = false
    
    init() {
        self.sortByABC = UserDefaults.standard.bool(forKey: "sort")
    }
    
    func sortedImage(by: Bool) -> [String] {
        
        if by == true {
            return model.images.sorted(by: >)
        }
        else {
            return model.images.sorted(by: <)
        }
    }
    
    func sort(_ : Bool) {
        
        
        
    }
    
}
