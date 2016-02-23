//
//  CameraViewController.swift
//  imageFilter
//
//  Created by block7 on 12/10/15.
//  Copyright © 2015 block7. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var filterOne: UIButton!
    @IBOutlet weak var filterTwo: UIButton!
    @IBOutlet weak var originalFilter: UIButton!
    @IBOutlet weak var cameraBtn: UIButton!
    
    
    var unfilteredimage = UIImage()
    
    let imagePicker = UIImagePickerController()
    
    let swipe = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
        
        swipe.addTarget(self, action: "dismisscamera")
        swipe.direction = UISwipeGestureRecognizerDirection.Right
        
        self.view.addGestureRecognizer(swipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var tookImage: UIImage
        if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            tookImage = possibleImage
        } else {
            return
        }
        image.contentMode = .ScaleAspectFit
        image.image = tookImage
        
        unfilteredimage = image.image!
        
        self.view.addSubview(image)
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func cameraBtnAction(sender: AnyObject) {
        imagePicker.sourceType = .Camera
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    @IBAction func filterSepia(sender: AnyObject){
        image.contentMode = .ScaleAspectFit
        let firstimage: UIImage = unfilteredimage
        let originalimage: CIImage = CIImage(image: firstimage)!
        let filter1 = CIFilter(name: "CISepiaTone")
        filter1?.setValue(originalimage, forKey: kCIInputImageKey)
        filter1?.setValue(0.5, forKey: kCIInputIntensityKey)
        let newImage = UIImage(CIImage: (filter1?.outputImage)!)
        image.contentMode = .ScaleAspectFit
        image.image = newImage
    }
    @IBAction func filterMono(sender: AnyObject){
        image.contentMode = .ScaleAspectFit
        let firimage: UIImage = unfilteredimage
        let origimage: CIImage = CIImage(image: firimage)!
        let filter2 = CIFilter(name: "CIPhotoEffectMono")
        filter2!.setDefaults()
        filter2!.setValue(origimage, forKey: kCIInputImageKey)
        let newImage = UIImage(CIImage: (filter2?.outputImage)!)
        image.contentMode = .ScaleAspectFit
        image.image = newImage
    }
    @IBAction func filterOriginal(sender: AnyObject) {
        image.contentMode = .ScaleAspectFit
        image.image = unfilteredimage
    }
    func dismisscamera(){
        dismissViewControllerAnimated(true, completion: nil)
    }

}
