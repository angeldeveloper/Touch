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
    
    let consButtonCountdownTimerCenterX : CGFloat = 90.0 // percentage of screen
    let consButtonCountdownTimerCenterY : CGFloat = 5.0 // percentage of screen
    
    let consLabelApplicationTitleCenterX : CGFloat = 50.0 // percentage of screen
    let consLabelApplicationTitleCenterY : CGFloat = 20.0 // percentage of screen
    
    let consLabelGameStats1CenterX : CGFloat = 20.0 //
    let consLabelGameStats1CenterY : CGFloat = 92.0 //
    
    let consLabelGameStats2CenterX : CGFloat = 40.0 //
    let consLabelGameStats2CenterY : CGFloat = 92.0 //
    
    let consLabelGameStats3CenterX : CGFloat = 60.0 //
    let consLabelGameStats3CenterY : CGFloat = 92.0 //
    
    let consLabelGameStats4CenterX : CGFloat = 80.0 //
    let consLabelGameStats4CenterY : CGFloat = 92.0 //

    var buttonPlay: UIButton!
    
    var labelApplicationTitle: UILabel!
    var labelAction: UILabel!

    var buttonCountdownTimer: UIButton!
    
    var labelGameStats1, labelGameStats2, labelGameStats3, labelGameStats4: UILabel!
    
    var view4 : UIView!
    
    var timerCount = 0
    var timerRunning = false
    var myTimer = NSTimer()

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
        playTouched(NSObject)
    }
    
    func startTimer() {
        if false == timerRunning {
                myTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
                timerRunning = true
        }
    }
    
    func Counting() {
        timerCount += 1
        buttonCountdownTimer.setTitle("\(timerCount)", forState: UIControlState.Normal)
        //buttonCountdownTimer.titleLabel?.text = "\(timerCount)"
        //buttonCountdownTimer.titleLabel?.sizeToFit()
    }
    
    func createUIElements() {
        
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
            screenWidth * 0.01 * 90, screenHeight * 0.01 * 5)
        
        labelAction.layer.backgroundColor = UIColor.redColor().CGColor
        labelAction.center = CGPointMake(self.view.center.x, self.view.center.y/3)
        labelAction.alpha = 0.0
        self.view.addSubview(labelAction)

        buttonCountdownTimer = UIButton()
        buttonCountdownTimer.setTitle("0", forState: UIControlState.Normal)
        buttonCountdownTimer.sizeToFit()
        buttonCountdownTimer.backgroundColor = UIColor.blueColor()
        buttonCountdownTimer.frame = CGRectMake(buttonCountdownTimer.frame.origin.x, buttonCountdownTimer.frame.origin.y,
                                                buttonCountdownTimer.frame.width * 0.01 * 150, buttonCountdownTimer.frame.height * 0.01 * 100)
        buttonCountdownTimer.layer.cornerRadius = 5.0
        buttonCountdownTimer.center = CGPointMake(screenWidth * 0.01 * consButtonCountdownTimerCenterX, screenHeight * 0.01 * consButtonCountdownTimerCenterY)
        buttonCountdownTimer.addTarget(self, action: "countdownTimerTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonCountdownTimer.alpha = 0.0
        self.view.addSubview(buttonCountdownTimer)
        
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
        
        
        createGameElementsForThisRound()
    }

    func makeGameStatsLabel() -> (UILabel) {
        var tempLabel = UILabel()
        tempLabel.text = "0"
        tempLabel.sizeToFit()
        tempLabel.textAlignment = NSTextAlignment.Center
        tempLabel.layer.cornerRadius = 5
        tempLabel.frame = CGRectMake(tempLabel.frame.origin.x, tempLabel.frame.origin.y,
            tempLabel.frame.size.width * 2.0, tempLabel.frame.size.height * 1.3)
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
    
    @IBAction func countdownTimerTouched(sender: AnyObject) {
        NSLog("Timer touched")
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
            //self.labelCountdownTimer.alpha = 1.0
            self.buttonCountdownTimer.alpha = 1.0

            
            self.labelGameStats1.alpha = 1.0
            self.labelGameStats2.alpha = 1.0
            self.labelGameStats3.alpha = 1.0
            self.labelGameStats4.alpha = 1.0
            
            }, completion: {_ in
                NSLog("completed fade in game play elements.")

                self.startTimer()
                
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

    func createGameElementsForThisRound() {
        // create and add one circle to UI
        let circleLayer = CAShapeLayer()
        circleLayer.path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 100, 100)).CGPath
        circleLayer.strokeColor = UIColor.whiteColor().CGColor
        circleLayer.lineWidth = 5
        circleLayer.fillColor = UIColor.blueColor().CGColor
        circleLayer.frame.origin = CGPointMake(50, 150)
        self.view.layer.addSublayer(circleLayer)

        let circleLayer2 = CAShapeLayer()
        circleLayer2.path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 50, 50)).CGPath
        circleLayer2.strokeColor = UIColor.whiteColor().CGColor
        circleLayer2.lineWidth = 5
        circleLayer2.fillColor = UIColor.greenColor().CGColor
        circleLayer2.frame.origin = CGPointMake(150, 250)
        self.view.layer.addSublayer(circleLayer2)

        let circleLayer3 = CAShapeLayer()
        circleLayer3.path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 200, 200)).CGPath
        circleLayer3.strokeColor = UIColor.whiteColor().CGColor
        circleLayer3.lineWidth = 5
        circleLayer3.fillColor = UIColor.redColor().CGColor
        circleLayer3.frame.origin = CGPointMake(250, 350)
        self.view.layer.addSublayer(circleLayer3)

    }
    
    func createOneGameElement()->() {
//        let circleLayer = CAShapeLayer()
//        circleLayer.path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 25, 25)).CGPath
//        circleLayer.strokeColor = UIColor.whiteColor().CGColor
//        circleLayer.lineWidth = 5
//        circleLayer.fillColor = UIColor.clearColor().CGColor

        //return circleLayer
    }
    
    
}






