//
//  ViewController.swift
//  Body Fat Prediction App
//
//  Created by Adrian Dar Ting Serapio on 16/06/2017.
//  Copyright © 2017 Adrian Dar Ting Serapio. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imagePicker: UIImagePickerController!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var colorValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
        
    }

    
// https://stackoverflow.com/questions/28532564/extract-rgb-values-from-uicolor
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let gatheredImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        imageView.image = gatheredImage
        
        picker.dismiss(animated: true, completion: nil)
       
        let color = gatheredImage?.getColors().background
        
        var red = 0.0
        var blue = 0.0
        var green = 0.0
        
        let myColor = color
        if let myColorComponents = myColor?.components {
            red = Double(myColorComponents.red * 255)
            blue = Double(myColorComponents.green * 255)
            green = Double(myColorComponents.blue * 255)
            
            colorValue.text = "R: \(red) G: \(green) B: \(blue)"
            
        }
        
    }
}

// https://stackoverflow.com/questions/28532564/extract-rgb-values-from-uicolor

extension UIColor {
    var coreImageColor: CIColor {
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreImageColor = self.coreImageColor
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}

