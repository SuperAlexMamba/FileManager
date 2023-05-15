//
//  Model.swift
//  File_Manager
//
//  Created by Слава Орлов on 30.04.2023.
//

import Foundation
import UIKit

class Model {
    
    var path: String
    
    init(path: String) {
        self.path = path
    }
    
    var title: String {
        return NSString(string: path).expandingTildeInPath
    }
    
    var images: [String] {
        return (try? FileManager.default.contentsOfDirectory(atPath: path)) ?? []
    }
    
    func addImage(imageName: String, image: UIImage) {
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let fileName = imageName
        let fileURL = documentsDirectory.appending(path: fileName)
        
        guard let data = image.jpegData(compressionQuality: 1) else { return }
        
        do {
            try data.write(to: fileURL)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func removeImage(at indexPath: Int) {
        let pathForDelete = path + "/" + images[indexPath]
        try? FileManager.default.removeItem(atPath: pathForDelete)
    }
    
}
