//
//  ViewController.swift
//  Touch
//
//  Created by Sunil Variar on 1/27/15.
//  Copyright (c) 2015 Random Chaos Studios. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var screenWidth, screenHeight : CGFloat!
    
    let consLabelCountdownTimerCenterX : CGFloat = 90.0 // percentage of screen
    let consLabelCountdownTimerCenterY : CGFloat = 5.0 // percentage of screen
    
    let consLabelApplicationTitleCenterX : CGFloat = 50.0 // percentage of screen
    let consLabelApplicationTitleCenterY : CGFloat = 20.0 // percentage of screen
    
    let consLabelGameStats1CenterX : CGFloat = 20.0 //
    let consLabelGameStats1CenterY : CGFloat = 90.0 //
    
    let consLabelGameStats2CenterX : CGFloat = 40.0 //
    let consLabelGameStats2CenterY : CGFloat = 90.0 //
    
    let consLabelGameStats3CenterX : CGFloat = 60.0 //
    let consLabelGameStats3CenterY : CGFloat = 90.0 //
    
    let consLabelGameStats4CenterX : CGFloat = 80.0 //
    let consLabelGameStats4CenterY : CGFloat = 90.0 //

    
    var buttonPlay: UIButton!
    
    var labelApplicationTitle: UILabel!
    var labelAction: UILabel!
    var labelCountdownTimer: UILabel!
    
    var labelGameStats1, labelGameStats2, labelGameStats3, labelGameStats4: UILabel!
    
    var view4 : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var screen: UIScreen = UIScreen.mainScreen()
        var fullScreenRect: CGRect = screen.bounds

        screenWidth = fullScreenRect.size.width
        screenHeight = fullScreenRect.size.height
    }

    override func viewDidAppear(animated: Bool) {
        createUIElements()
    }
    
    func createUIElements () -> () {
        
        buttonPlay = UIButton()
        buttonPlay.setTitle("PLAY", forState: UIControlState.Normal)
        buttonPlay.sizeToFit()
        buttonPlay.backgroundColor = UIColor.blueColor()
        buttonPlay.frame = CGRectMake(buttonPlay.frame.origin.x, buttonPlay.frame.origin.y, buttonPlay.frame.width*2, buttonPlay.frame.height*2)
        buttonPlay.layer.cornerRadius = 15.0
        buttonPlay.center = CGPointMake(self.view.center.x, self.view.center.y)
        buttonPlay.addTarget(self, action: "playTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonPlay)
        
        labelApplicationTitle = UILabel()
        labelApplicationTitle.text = "TOUCH"
        labelApplicationTitle.sizeToFit()
        labelApplicationTitle.textAlignment = NSTextAlignment.Center
        labelApplicationTitle.layer.cornerRadius = 15
        labelApplicationTitle.frame = CGRectMake(labelApplicationTitle.frame.origin.x, labelApplicationTitle.frame.origin.y,
                                                labelApplicationTitle.frame.width*2, labelApplicationTitle.frame.height*2)

        //labelApplicationTitle.backgroundColor = UIColor.brownColor()
        labelApplicationTitle.layer.backgroundColor = UIColor.brownColor().CGColor
        //labelApplicationTitle.center = CGPointMake(self.view.center.x, self.view.center.y/2)
        labelApplicationTitle.center = CGPointMake(screenWidth * 0.01 * consLabelApplicationTitleCenterX, screenHeight * 0.01 * consLabelApplicationTitleCenterY)
        self.view.addSubview(labelApplicationTitle)

        
        labelAction = UILabel()
        labelAction.text = "Action needs to come here"
        labelAction.sizeToFit()
        labelAction.textAlignment = NSTextAlignment.Center
        labelAction.layer.cornerRadius = 5
        labelAction.frame = CGRectMake(labelAction.frame.origin.x, labelAction.frame.origin.y,
            screenWidth * 0.01 * 98, screenHeight * 0.01 * 10)
        
        labelAction.layer.backgroundColor = UIColor.redColor().CGColor
        labelAction.center = CGPointMake(self.view.center.x, self.view.center.y/3)
        labelAction.alpha = 0.0
        self.view.addSubview(labelAction)

        
        labelCountdownTimer = UILabel()
        labelCountdownTimer.text = "XXX"
        labelCountdownTimer.sizeToFit()
        labelCountdownTimer.textAlignment = NSTextAlignment.Center
        labelCountdownTimer.layer.cornerRadius = 2
        labelCountdownTimer.frame = CGRectMake(labelCountdownTimer.frame.origin.x, labelCountdownTimer.frame.origin.y,
            self.view.bounds.width * 0.01 * 10, self.view.bounds.height * 0.01 * 5)
        
        labelCountdownTimer.layer.backgroundColor = UIColor.redColor().CGColor
        labelCountdownTimer.center = CGPointMake(screenWidth * 0.01 * consLabelCountdownTimerCenterX, screenHeight * 0.01 * consLabelCountdownTimerCenterY)
        labelCountdownTimer.alpha = 0.0
        self.view.addSubview(labelCountdownTimer)

        labelGameStats1 = makeGameStatsLabel()
        labelGameStats1.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats1CenterX, screenHeight * 0.01 * consLabelGameStats1CenterY)
        self.view.addSubview(labelGameStats1)
        
        labelGameStats2 = makeGameStatsLabel()
        labelGameStats2.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats2CenterX, screenHeight * 0.01 * consLabelGameStats2CenterY)
        self.view.addSubview(labelGameStats2)

        labelGameStats3 = makeGameStatsLabel()
        labelGameStats3.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats3CenterX, screenHeight * 0.01 * consLabelGameStats3CenterY)
        self.view.addSubview(labelGameStats3)

        labelGameStats4 = makeGameStatsLabel()
        labelGameStats4.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats4CenterX, screenHeight * 0.01 * consLabelGameStats4CenterY)
        self.view.addSubview(labelGameStats4)
}

    func makeGameStatsLabel() -> (UILabel) {
        var tempLabel = UILabel()
        tempLabel.text = "XXX"
        tempLabel.sizeToFit()
        tempLabel.textAlignment = NSTextAlignment.Center
        tempLabel.layer.cornerRadius = 2
        tempLabel.frame = CGRectMake(tempLabel.frame.origin.x, tempLabel.frame.origin.y,
            tempLabel.frame.size.width * 1.1, tempLabel.frame.size.height * 1.1)
        tempLabel.layer.backgroundColor = UIColor.redColor().CGColor
        tempLabel.alpha = 0.0
        return tempLabel
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        view.backgroundColor = UIColor(red: 153.00/255.00, green: 255.0/255.0, blue: 0.00/255.0, alpha: 1.00)
        
        NSLog("self.view.bounds.width : \(self.view.bounds.width)")
        NSLog("self.view.bounds.height: \(self.view.bounds.height)")
        
    }

    @IBAction func playTouched(sender: AnyObject) {
    
        //fadeOutView(buttonPlay)
        
        UIView.animateWithDuration(0.5, animations: {
            self.buttonPlay.alpha = 0.0
            }, completion: {_ in
                NSLog("Play button faded.")
        })

        UIView.animateWithDuration(1.0, animations: {
            //self.labelApplicationTitle.center = CGPointMake(self.labelApplicationTitle.center.x, self.labelApplicationTitle.center.y - 100)
            self.labelApplicationTitle.center = CGPointMake(self.labelApplicationTitle.frame.width * 0.5 + 20, self.labelApplicationTitle.frame.height * 0.5 + 20)
            }, completion: {_ in
                NSLog("Title moved with animation.")
                self.fadeInGamePlayElements()
        })
    }
    
    func removeMainScreenElements () -> () {
        buttonPlay.enabled = false
        buttonPlay.hidden = true
        buttonPlay.alpha = 1.0
    }

    func fadeInGamePlayElements () -> () {
        
        UIView.animateWithDuration(3.0, animations: {
            
            self.labelAction.alpha = 1.0
            self.labelCountdownTimer.alpha = 1.0

            
            self.labelGameStats1.alpha = 1.0
            self.labelGameStats2.alpha = 1.0
            self.labelGameStats3.alpha = 1.0
            self.labelGameStats4.alpha = 1.0
            
            }, completion: {_ in
                NSLog("completed fade in game play elements.")

//                NSThread.sleepForTimeInterval(4.0)
//                NSLog("Slept for 4 seconds")
//
//                self.fadeOutGamePlayScreen()
//                
//                self.fadeInEndGameScreen()
        })
    }
    
    func fadeOutGamePlayScreen() -> () {
        
    }
    
    func fadeInEndGameScreen() -> () {

        view4 = UIView(frame: CGRectMake(0, self.view.bounds.height/4, self.view.bounds.width, self.view.bounds.height/2))
        view4.backgroundColor = UIColor.yellowColor()

        view4.alpha = 0.0

        self.view.addSubview(view4)

        UIView.animateWithDuration(3.0, animations: {
            self.view4.alpha = 1.0
            
            }, completion: {_ in
                NSLog("completed the third animation.")
                
                NSThread.sleepForTimeInterval(4.0)
                NSLog("Slept for 4 seconds")

                self.fadeOutGameEndScreen()
                self.fadeInMainScreen()
        })
    }

    func fadeOutGameEndScreen () -> () {
        self.view4.hidden = true
    }

    func fadeInMainScreen () -> () {
        buttonPlay.enabled = true
        buttonPlay.hidden = false
        buttonPlay.alpha = 0.0
        
        UIView.animateWithDuration(3, animations: {
            self.buttonPlay.alpha = 1.0
            }, completion: {_ in
                NSLog("Back to main screen")
        })
    }
    
    func fadeOutView (view: UIView) -> () {
        
        // create a fade out element and add the animation to the passed view
        // the properties of the fade can be changed only from here.
        
//        UIView.animateWithDuration(3.0, animations: {
//            view.alpha = 0.0
//        })
        
        UIView.animateWithDuration(0.5, animations: {
                view.alpha = 0.0
            }, completion: {_ in
                NSLog("completed first animation. starting second animation")
                self.removeMainScreenElements()
                self.fadeInGamePlayElements()
        })
    }
}






