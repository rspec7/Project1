//
//  ViewController.swift
//  Project1
//
//  Created by Tam Phan on 12/23/20.
//

import UIKit

class ViewController: UITableViewController {
    
    // Set empty array for files
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Challenge 1 of 3 - Large text for top bar title text
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Set title for top bar
        title = "Storm Viewer"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        // Test print array to console to ensure the append above is working
        print(pictures)
        
        // Challenge 2 of 3 - Sort array items alphabetically
        pictures.sort()
        
    }
    
    // Dynamically sets the number of rows by counting items in array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // When scrolling, dequeues unseen cells and creates a new one
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail view controller" and typcasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            // Challenge 3 of 3 - Send selected photo number and total photo count to DetailViewConroller via Segue
            vc.selectedPictureNumber = indexPath.row + 1
            vc.totalPictures = pictures.count
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

