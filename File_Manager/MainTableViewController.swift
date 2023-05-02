//
//  MainTableViewController.swift
//  File_Manager
//
//  Created by Слава Орлов on 30.04.2023.
//

import UIKit

class MainTableViewController: UITableViewController, UINavigationControllerDelegate {
        
    var model = Model(path: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Picker.defaultPicker.imagePicker.delegate = self

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.images.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        var configuration = UIListContentConfiguration.cell()
        
        configuration.text = model.images[indexPath.row]
                
        cell.contentConfiguration = configuration
        
        return cell
        
    }
    
    @IBAction func addImage(_ sender: UIBarButtonItem) {
        Picker.defaultPicker.showImagePicker(in: self)
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            model.removeImage(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }

}

extension MainTableViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let image = info[.editedImage] as? UIImage {
            picker.dismiss(animated: true)
            model.addImage(imageName: "Image_\(model.images.count).png", image: image)
        }
        tableView.reloadData()
    }
}
