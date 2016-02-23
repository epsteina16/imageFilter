//
//  InfoViewController.swift
//  imageFilter
//
//  Created by block7 on 12/15/15.
//  Copyright © 2015 block7. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

     let swipe = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipe.addTarget(self, action: "dismissview")
        swipe.direction = UISwipeGestureRecognizerDirection.Right
        
        self.view.addGestureRecognizer(swipe)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissview(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
