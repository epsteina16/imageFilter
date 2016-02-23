//
//  FilterViewController.swift
//  imageFilter
//
//  Created by block7 on 12/4/15.
//  Copyright © 2015 block7. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

        @IBOutlet weak var image: UIImageView!
        @IBOutlet weak var filterOne: UIButton!
        @IBOutlet weak var filterTwo: UIButton!
        @IBOutlet weak var originalFilter: UIButton!
        @IBOutlet weak var bigview: UIView!
    
        var unfilteredimage = UIImage()
        
        let imagePicker = UIImagePickerController()
    
        let swipe = UISwipeGestureRecognizer()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            imagePicker.delegate = self
            
            swipe.addTarget(self, action: "dismissview")
            swipe.direction = UISwipeGestureRecognizerDirection.Right
            
            self.view.addGestureRecognizer(swipe)
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        @IBAction func pickPicture(sender: AnyObject) {
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            presentViewController(imagePicker, animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(picker: UIImagePickerController) {
            dismissViewControllerAnimated(true, completion: nil)
        }
        
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            var newImage: UIImage
            if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
                newImage = possibleImage
            } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
                newImage = possibleImage
            } else {
                return
            }
            image.image = newImage
            
            unfilteredimage = image.image!
            
            self.view.addSubview(image)
            
            dismissViewControllerAnimated(true, completion: nil)
        }
        @IBAction func filter1(){
            let firstimage: UIImage = unfilteredimage
            let originalimage: CIImage = CIImage(image: firstimage)!
            let filter1 = CIFilter(name: "CISepiaTone")
            filter1?.setValue(originalimage, forKey: kCIInputImageKey)
            filter1?.setValue(0.5, forKey: kCIInputIntensityKey)
            let newImage = UIImage(CIImage: (filter1?.outputImage)!)
            image.image = newImage
        }
        @IBAction func filter2(){
            let firimage: UIImage = unfilteredimage
            let origimage: CIImage = CIImage(image: firimage)!
            let filter2 = CIFilter(name: "CIPhotoEffectMono")
            filter2!.setDefaults()
            filter2!.setValue(origimage, forKey: kCIInputImageKey)
            let newImage = UIImage(CIImage: (filter2?.outputImage)!)
            image.image = newImage
        }
        @IBAction func origFilterAction(){
            image.image = unfilteredimage
        }
    func dismissview(){
        dismissViewControllerAnimated(true, completion: nil)
    }

}
