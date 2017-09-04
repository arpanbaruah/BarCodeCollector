//
//  AddImageViewController.swift
//  BarCodeCollector
//
//  Created by ARPAN BARUAH on 9/2/17.
//  Copyright © 2017 ARPAN BARUAH. All rights reserved.
//

import UIKit

class AddImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var AddUpdateButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    var game: Game? = nil
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imagePicker.delegate = self
        print("hello")
        
        if game != nil {
            ImageView.image = UIImage(data : game!.image! as Data)
            titleText.text  = game!.textlabel
            AddUpdateButton.setTitle("Update", for: .normal)
            
        } else {
            
            deleteButton.isHidden = true
        }
        
        
        // Do any additional setup after loading the view.
    }
   
    @IBAction func photoTapped(_ sender: Any) {
        print("hello photo")
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        ImageView.image = image
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func CameraTapped(_ sender: Any) {
        print("Camera")
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)

    }
    
    @IBAction func AddTapped(_ sender: Any) {
        
        if game != nil {
            game!.textlabel = titleText.text
            game!.image =   UIImagePNGRepresentation(ImageView.image!)! as NSData
            
        }
        else {
        
        let context = (UIApplication.shared.delegate as!
                        AppDelegate).persistentContainer.viewContext
        
        let game = Game(context: context)
        game.textlabel = titleText.text
        game.image =   UIImagePNGRepresentation(ImageView.image!)! as NSData
        
        }
        (UIApplication.shared.delegate as!
            AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
        
        
    }
    @IBAction func deleteTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as!
            AppDelegate).persistentContainer.viewContext
        context.delete(game!)
        (UIApplication.shared.delegate as!
            AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
        
    }
}
