//
//  ImageViewController.swift
//  BarCodeCollector
//
//  Created by ARPAN BARUAH on 8/31/17.
//  Copyright © 2017 ARPAN BARUAH. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var titleLabel: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }

    @IBAction func cameraTapped(_ sender: Any) {
    }
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
    
    }
    @IBAction func buttonTapped(_ sender: Any) {
    }
}
