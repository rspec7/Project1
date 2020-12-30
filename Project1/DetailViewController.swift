//
//  DetailViewController.swift
//  Project1
//
//  Created by Tam Phan on 12/24/20.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //overrides large title text inherited from our ViewController
        navigationItem.largeTitleDisplayMode = .never
        
        // shows picture filename in top bar
        title = selectedImage

        // checks and unwraps the optional selectedImage
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    // hides top bar when user clicks on image
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    // shows top bar again if user taps
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
