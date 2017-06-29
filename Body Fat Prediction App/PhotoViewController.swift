//
//  PhotoViewController.swift
//  Body Fat Prediction App
//
//  Created by Adrian Dar Ting Serapio on 16/06/2017.
//  Copyright © 2017 Adrian Dar Ting Serapio. All rights reserved.
//

import UIKit

import UIKit

class PhotoViewController: UIViewController {
    
    var takenPhoto:UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let availableImage = takenPhoto {
            imageView.image = availableImage
        }
        
        
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

