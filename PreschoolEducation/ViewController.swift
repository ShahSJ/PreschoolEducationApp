//
//  ViewController.swift
//  PreschoolEducation
//
//  Created by Sachin Shah on 09/02/2017.
//  Copyright © 2017 Sachin Shah. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    

    // SS - Variables - SS \\
    
    @IBOutlet weak var Answer: UILabel!
    @IBOutlet weak var Random1: UILabel!
    var A = Int(arc4random_uniform(5))
    var B = Int(arc4random_uniform(5))
    var bgMusic = AVAudioPlayer()
    var rightSound = AVAudioPlayer()
    @IBOutlet weak var SadCloud: UIImageView!
    @IBOutlet weak var SunWithClouds: UIImageView!
    @IBOutlet weak var Stars: UIView!
    @IBOutlet weak var star1: Cloud!
    @IBOutlet weak var star2: Cloud!
    @IBOutlet weak var star3: Cloud!
    @IBOutlet weak var star4: Cloud!
    @IBOutlet weak var star5: Cloud!
    @IBOutlet weak var star6: Cloud!
    @IBOutlet weak var star7: Cloud!
    @IBOutlet weak var star8: Cloud!
    @IBOutlet weak var star9: Cloud!
    @IBOutlet weak var UnmuteMusic: UIButton!
    @IBOutlet weak var MuteMusic: UIButton!

    // SS - FUNCTIONS - SS \\

    
    // SS - Button numbers: this provides the numbered buttons with numbers
    @IBAction func Numbers(_ sender: UIButton) {
        Answer.text = String(sender.tag-1)
        CheckAnswer()
        clickButtonSound()
    }
    
    // SS - Check Answer Function: this checks to see if the users answer matches the sums number
    func CheckAnswer() {
        let output = (A + B)
        if output == Int(Answer.text!) {
            bgMusic.pause()
            CorrectSound()
            performSegue(withIdentifier: "correct", sender: self)
            Answer.text = ""
        }
        else {
            SadCloud.isHidden = false
            SunWithClouds.isHidden = true
            AudioServicesPlaySystemSound(SystemSoundID(4095)) // vibrates phone
            delay(1){
                self.SadCloud.isHidden = true
                self.SunWithClouds.isHidden = false
            }
            Answer.text = ""
        }
    }
    
    // SS - Prepares popver to fit in correct size height and width
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    // SS - creating a delay function, use: ' delay(2) { code } '
    func delay(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    // Star BounceAnimation
    func BounceEffect() {
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse, .allowUserInteraction], animations: {
            self.star1.center.x = self.star1.center.x + 10
            self.star2.center.x = self.star2.center.x + 10
            self.star3.center.x = self.star3.center.x + 10
            self.star4.center.x = self.star4.center.x + 10
            self.star5.center.x = self.star5.center.x + 10
            self.star6.center.x = self.star6.center.x + 10
            self.star7.center.x = self.star7.center.x + 10
            self.star8.center.x = self.star8.center.x + 10
            self.star9.center.x = self.star9.center.x + 10
        }, completion: nil)
    }
    

    // set up click button
    var buttonClick = AVAudioPlayer()
    
    // Click sound
    func clickButtonSound(){
        do{
            buttonClick = try AVAudioPlayer (contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "click", ofType: "mp3")!))
            buttonClick.prepareToPlay()
            
        } catch{
            print("ButtonClicked") // just for testing purpose
        }
        buttonClick.play()
    }
    
    // Background Music
    func MusicBackground() {
        do{
            bgMusic = try AVAudioPlayer (contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "MusicBackground", ofType: "mp3")!))
            bgMusic.prepareToPlay()
        }
        catch {
            print("MusicPlaying")
        }
        bgMusic.play()
    }
    
    // Unmute Music
    @IBAction func Unmute(_ sender: UIButton) {
        bgMusic.play()
        UnmuteMusic.isHidden = true
        MuteMusic.isHidden = false
    }
    
    // Mute Music
    @IBAction func Mute(_ sender: UIButton) {
        bgMusic.pause()
        UnmuteMusic.isHidden = false
        MuteMusic.isHidden = true
    }
    
    // Correct Sound Effect
    func CorrectSound() {
        do{
            rightSound = try AVAudioPlayer (contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "Applause", ofType:"mp3")!))
            rightSound.prepareToPlay()
        }
        catch{
            print("Correct Answer Sound")
        }
        rightSound.play()
    }
    
    // SS - OVERRIDE FUNCTIONS - SS \\
    override func viewDidLoad() {
        super.viewDidLoad()
        Random1.text = String(A) + " + " + String(B) + " = "
        MusicBackground()
    }
    
    // Adds animation to the stars
    override func viewDidAppear(_ animated: Bool) {
        BounceEffect()
    }
    
    // SS - Provides the text for correct segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "correct"
        {
            let DestViewController : CorrectViewController = segue.destination as! CorrectViewController
            Random1.text = String(A) + " + " + String(B) + " = " + String(Answer.text!)
            DestViewController.RN1Text = Random1.text!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

