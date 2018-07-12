//
//  ViewController.swift
//  LunaView
//
//  Created by Rawand Ahmed Shaswar on 7/9/18.
//  Copyright © 2018 DreamLabs LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func presentLuna(_ sender: Any) {
       
        
        let luna = Luna()
        
        luna.setLuna(inView: self.view, title: "Introducing our new football notifications on the Guardian app", message: "Today we are excited to announce the launch of our new and improved football notifications in our latest update to the Guardian app. Our Mobile Innovation Lab has been researching innovative ways of using push notifications to keep you updated on the go. We have taken the award-winning research and made a significant upgrade to our existing goal alerts feature. We know notifications can sometimes feel intrusive and that is why, with our new football notifications, we will send you only a single notification per match. We will update it throughout the game with the latest live news – keeping your lock screen nice and tidy.  Updates will cover the kick-off, any goals and the result at half-time and full-time. You will also be able to click through to our unrivalled live blogs. We will be adding different types of updates and leagues to the service soon, such as red/yellow cards and substitutions.", dissmiss: 2)
        
        self.view.addSubview(luna)
        
        
        
      
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      //  print("bull: \(touches)")
    }
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

