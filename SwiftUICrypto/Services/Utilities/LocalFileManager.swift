//
//  LocalFileManager.swift
//  SwiftUICrypto
//
//  Created by Kevin Liao on 11/27/21.
//

import Foundation
import UIKit

final class LocalFileManager {
    static let shared = LocalFileManager()
    private init() { }
    
    func saveImage(image: UIImage, withName imageName: String, toFolder folderName: String) {
        createFolderIfNeeded(folderName: folderName)
        
        // Get path for image
        guard
            let data = image.pngData(),
            let url = urlForImage(from: folderName, imageName: imageName) else { return }
        
        // Try saving image to folder
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image: \(error.localizedDescription)")
        }
    }
    
    func image(withName imageName: String, atFolder folderName: String) -> UIImage? {
        guard
            let url = urlForImage(from: folderName, imageName: imageName),
            FileManager.default.fileExists(atPath: url.path) else { return nil }
        
        return UIImage(contentsOfFile: url.path)
    }
}

private extension LocalFileManager {
    func createFolderIfNeeded(folderName: String) {
        guard
            let url = urlForFolder(folderName: folderName),
            !FileManager.default.fileExists(atPath: url.path) else { return }
        
        do {
            try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        } catch let error {
            print("Error creating directory with folder name: \(folderName). Error: \(error.localizedDescription)")
        }
    }
    
    func urlForFolder(folderName: String) -> URL? {
        // Use caches directory because it's okay if we need to re-fetch data
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        return url.appendingPathComponent(folderName)
    }
    
    func urlForImage(from folderName: String, imageName: String) -> URL? {
        // Use caches directory because it's okay if we need to re-fetch data
        guard let folderURL = urlForFolder(folderName: folderName) else {
            return nil
        }
        
        return folderURL.appendingPathComponent(imageName + ".png")
    }
}
