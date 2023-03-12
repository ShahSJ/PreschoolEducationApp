//
//  CorrectViewController.swift
//  PreschoolEducation
//
//  Created by Sachin Shah on 10/02/2017.
//  Copyright © 2017 Sachin Shah. All rights reserved.
//

import UIKit

class CorrectViewController: UIViewController {
    
    // SS - variables
    @IBOutlet weak var RN1: UILabel!
    var RN1Text = String()
    
    @IBOutlet weak var Sun: UIImageView!
    @IBOutlet weak var PlayButton: UIImageView!
    
    
    // SS - Button Function: returns the user back to previous Seque
    @IBAction func Next(_ sender: UIButton) {
        performSegue(withIdentifier: "home", sender: self)
    }

    // Animations
    func FadeAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.Sun.alpha = 0
        }, completion: nil)
    }
    
    // Jump Animations
    func BounceAnimation () {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.PlayButton.center.y = self.PlayButton.center.y - 10
        })
    }
    
    //Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        RN1.text = RN1Text
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        FadeAnimation()
        BounceAnimation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
