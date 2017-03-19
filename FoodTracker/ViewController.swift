//
//  ViewController.swift
//  FoodTracker
//
//  Created by Ratan Parai on 3/19/17.
//  Copyright © 2017 Ratan Parai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealTextLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // handle the Text field's user input through delegate callbacks
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealTextLabel.text = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // dismiss the picker if user cancled
        // for swift 3 use dismiss()
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following : \(info)")
        }
        
        // set imageview to display the image
        photoImageView.image = selectedImage
        
        // dismiss the picker
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    // MARK: Action
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        // if the user tap the image picker while typing in the text fild hide the keyboard
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that let user pick image from 
        // their photo library
        let imagePickerController = UIImagePickerController()
        
        // only allow photo to be picked not take
        imagePickerController.sourceType = .PhotoLibrary
        
        // make sure ViewController is notified when the user pick a photo
        imagePickerController.delegate = self
        
        // now show the image picker 
        // for swift 2 use presentViewController()
        // for swift 3 use present()
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func setDefaultLabelText(sender: UIButton) {
        mealTextLabel.text = "Default Text"
    }
    


}

