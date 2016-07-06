//
//  ViewController.swift
//  NVHPushView2
//
//  Created by Hùng Nguyễn  on 7/4/16.
//  Copyright © 2016 MobileSoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img_logo: UIImageView!
    @IBOutlet weak var lbl_text: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img_logo!.alpha = 0
        lbl_text!.alpha = 0
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animateWithDuration(3, animations: {
            self.img_logo.alpha = 1
        }) {(finished) in
            UIView.animateWithDuration(3, animations: {
                self.lbl_text.center = CGPointMake(self.img_logo.center.x, 100)
                self.lbl_text.alpha = 0.85
        
            }) {(finished) in
                UIView.animateWithDuration(1, animations: {
                    let v2 = self.storyboard?.instantiateViewControllerWithIdentifier("V2") as! View2
                    self.navigationController?.pushViewController(v2 , animated: true)

                })
            }
          }
    }
    
}

