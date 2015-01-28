//
//  ViewController.swift
//  Touch
//
//  Created by Sunil Variar on 1/27/15.
//  Copyright (c) 2015 Random Chaos Studios. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var offscreenXValue: CGFloat = -300.0
    var offscreenYValue: CGFloat = -300.0
    
    // ################################################################################
    // Game Over Elements
    
    var labelGameOver: UILabel!
    let consLabelGameOverCenterX : CGFloat = 50.0 // percentage of screen
    let consLabelGameOverCenterY : CGFloat = 30.0 // percentage of screen
    
    var labelObjectsTouched: UILabel!
    let consLabelObjectsTouchedCenterX : CGFloat = 20.0 // percentage of screen
    let consLabelObjectsTouchedCenterY : CGFloat = 40.0 // percentage of screen

    var labelObjectsTouchedValue: UILabel!
    let consLabelObjectsTouchedValueCenterX : CGFloat = 60.0 // percentage of screen
    let consLabelObjectsTouchedValueCenterY : CGFloat = 40.0 // percentage of screen
    
    var labelSpeed: UILabel!
    let consLabelSpeedCenterX : CGFloat = 20.0 // percentage of screen
    let consLabelSpeedCenterY : CGFloat = 50.0 // percentage of screen
    
    var labelSpeedValue: UILabel!
    let consLabelSpeedValueCenterX : CGFloat = 40.0 // percentage of screen
    let consLabelSpeedValueCenterY : CGFloat = 50.0 // percentage of screen

    var labelScore: UILabel!
    let consLabelScoreCenterX : CGFloat = 20.0 // percentage of screen
    let consLabelScoreCenterY : CGFloat = 60.0 // percentage of screen
    
    var labelScoreValue: UILabel!
    let consLabelScoreValueCenterX : CGFloat = 40.0 // percentage of screen
    let consLabelScoreValueCenterY : CGFloat = 60.0 // percentage of screen
    
    var buttonTryAgain: UIButton!
    let consButtonTryAgainCenterX : CGFloat = 50.0 // percentage of screen
    let consButtonTryAgainCenterY : CGFloat = 70.0 // percentage of screen
    
    var buttonQuit: UIButton!
    let consButtonQuitCenterX : CGFloat = 50.0 // percentage of screen
    let consButtonQuitCenterY : CGFloat = 80.0 // percentage of screen
    
    // ################################################################################

    // ################################################################################
    // Main Screen Elements
    
    var labelApplicationTitle: UILabel!
    let consLabelApplicationTitleCenterX_MainScreen : CGFloat = 50.0 // percentage of screen
    let consLabelApplicationTitleCenterY_MainScreen : CGFloat = 20.0 // percentage of screen
    let consLabelApplicationTitleCenterX_GamePlayScreen : CGFloat = 20.0 // percentage of screen
    let consLabelApplicationTitleCenterY_GamePlayScreen : CGFloat = 10.0 // percentage of screen

    var buttonPlay: UIButton!
    let consButtonPlayCenterX : CGFloat = 50.0 // percentage of screen
    let consButtonPlayCenterY : CGFloat = 50.0 // percentage of screen

    // ################################################################################

    // ################################################################################
    // Game Play Elements
    var labelAction: UILabel!
    let consLabelActionCenterX : CGFloat = 50.0 // percentage of screen
    let consLabelActionCenterY : CGFloat = 10.0 // percentage of screen

    var arrayGameElements = [AnyObject]()
    
    let consLabelGameStats1CenterX : CGFloat = 20.0 //
    let consLabelGameStats1CenterY : CGFloat = 92.0 //
    
    let consLabelGameStats2CenterX : CGFloat = 40.0 //
    let consLabelGameStats2CenterY : CGFloat = 92.0 //
    
    let consLabelGameStats3CenterX : CGFloat = 60.0 //
    let consLabelGameStats3CenterY : CGFloat = 92.0 //
    
    let consLabelGameStats4CenterX : CGFloat = 80.0 //
    let consLabelGameStats4CenterY : CGFloat = 92.0 //
    
    // ################################################################################
    
    var screenWidth, screenHeight : CGFloat!
    
    let consButtonCountdownTimerCenterX : CGFloat = 90.0 // percentage of screen
    let consButtonCountdownTimerCenterY : CGFloat = 5.0 // percentage of screen
    
//    let consLabelApplicationTitleCenterX : CGFloat = 50.0 // percentage of screen
//    let consLabelApplicationTitleCenterY : CGFloat = 20.0 // percentage of screen
    

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
        createUIElementsOffScreen()

        //playTouched(NSObject)
        
        animateIntoMainScreen()
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
        
        
        // TESTING TESTING TESTING REMOVED
        
//        
//        // game over in 5 seconds for testing only
//        if 2 == timerCount {
//            // game over
//            myTimer.invalidate()
//            NSLog("Game Over this round")
//
//            removeElements()
//            
//            removeGameElements()
//            
//            createGameOverElements()
//        }
        
    }
    
    func createUIElementsOffScreen() {
        
        buttonPlay = UIButton()
        buttonPlay.setTitle("PLAY", forState: UIControlState.Normal)
        buttonPlay.sizeToFit()
        buttonPlay.backgroundColor = UIColor.blueColor()
        buttonPlay.frame = CGRectMake(buttonPlay.frame.origin.x, buttonPlay.frame.origin.y, buttonPlay.frame.width*2, buttonPlay.frame.height*2)
        buttonPlay.layer.cornerRadius = 15.0
        
        //buttonPlay.center = CGPointMake(self.view.center.x, self.view.center.y)
        buttonPlay.center = CGPointMake(-100, -100)
        
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
        //labelApplicationTitle.center = CGPointMake(screenWidth * 0.01 * consLabelApplicationTitleCenterX, screenHeight * 0.01 * consLabelApplicationTitleCenterY)
        labelApplicationTitle.center = CGPointMake(-100, -100)
        self.view.addSubview(labelApplicationTitle)

        
        labelAction = UILabel()
        labelAction.text = "Action needs to come here"
        labelAction.sizeToFit()
        labelAction.textAlignment = NSTextAlignment.Center
        labelAction.layer.cornerRadius = 5
        labelAction.frame = CGRectMake(labelAction.frame.origin.x, labelAction.frame.origin.y,
            screenWidth * 0.01 * 90, screenHeight * 0.01 * 5)
        labelAction.layer.backgroundColor = UIColor.redColor().CGColor
        //labelAction.center = CGPointMake(self.view.center.x, self.view.center.y/3)
        labelAction.center = CGPointMake(-100, -100)
        labelAction.alpha = 0.0
        self.view.addSubview(labelAction)

        buttonCountdownTimer = UIButton()
        buttonCountdownTimer.setTitle("0", forState: UIControlState.Normal)
        buttonCountdownTimer.sizeToFit()
        buttonCountdownTimer.backgroundColor = UIColor.blueColor()
        buttonCountdownTimer.frame = CGRectMake(buttonCountdownTimer.frame.origin.x, buttonCountdownTimer.frame.origin.y,
                                                buttonCountdownTimer.frame.width * 0.01 * 150, buttonCountdownTimer.frame.height * 0.01 * 100)
        buttonCountdownTimer.layer.cornerRadius = 5.0
        //buttonCountdownTimer.center = CGPointMake(screenWidth * 0.01 * consButtonCountdownTimerCenterX, screenHeight * 0.01 * consButtonCountdownTimerCenterY)
        buttonCountdownTimer.center = CGPointMake(-100, -100)
        buttonCountdownTimer.addTarget(self, action: "countdownTimerTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonCountdownTimer.alpha = 0.0
        self.view.addSubview(buttonCountdownTimer)
        
        labelGameStats1 = makeGameStatsLabel()
        //labelGameStats1.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats1CenterX, screenHeight * 0.01 * consLabelGameStats1CenterY)
        labelGameStats1.center = CGPointMake(-100, -100)
        self.view.addSubview(labelGameStats1)
        
        labelGameStats2 = makeGameStatsLabel()
        //labelGameStats2.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats2CenterX, screenHeight * 0.01 * consLabelGameStats2CenterY)
        labelGameStats2.center = CGPointMake(-100, -100)
        self.view.addSubview(labelGameStats2)

        labelGameStats3 = makeGameStatsLabel()
        //labelGameStats3.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats3CenterX, screenHeight * 0.01 * consLabelGameStats3CenterY)
        labelGameStats3.center = CGPointMake(-100, -100)
        self.view.addSubview(labelGameStats3)

        labelGameStats4 = makeGameStatsLabel()
        //labelGameStats4.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats4CenterX, screenHeight * 0.01 * consLabelGameStats4CenterY)
        labelGameStats4.center = CGPointMake(-100, -100)
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
    
    
    func countdownTimerTouched(sender: AnyObject) {
        NSLog("Timer touched")
    }
    
    /*
    when play button is touched, main screen elements need to disappear and then
    game play elements need to animate in after the finish of the main screen OUT animation.
    there would be a delay for second animation which has to be appropriate...
    */
    
    func playTouched(sender: AnyObject) {
    
        animateOutofMainScreen()
        
        animateIntoGamePlayScreen()
        
        
//        //fadeOutView(buttonPlay)
//        
//        UIView.animateWithDuration(0.5, animations: {
//            self.buttonPlay.alpha = 0.0
//            }, completion: {_ in
//                NSLog("Play button faded.")
//        })
//
//        UIView.animateWithDuration(1.0, animations: {
//            //self.labelApplicationTitle.center = CGPointMake(self.labelApplicationTitle.center.x, self.labelApplicationTitle.center.y - 100)
//            self.labelApplicationTitle.center = CGPointMake(self.labelApplicationTitle.frame.width * 0.5 + 20, self.labelApplicationTitle.frame.height * 0.5 + 20)
//            }, completion: {_ in
//                NSLog("Title moved with animation.")
//                self.fadeInGamePlayElements()
//        })
    }
    
//    func removeMainScreenElements () -> () {
//        buttonPlay.enabled = false
//        buttonPlay.hidden = true
//        buttonPlay.alpha = 1.0
//    }

    
    
//    func fadeInGamePlayElements () -> () {
//        
//    }
//    

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
                self.animateIntoMainScreen()
        })
    }

    func fadeOutGameEndScreen () -> () {
        self.view4.hidden = true
    }

    // ################################################################################
    // Animation Functions
    
    func animateIntoMainScreen () -> () {

        buttonPlay.alpha = 0.0
        buttonPlay.center = CGPointMake(screenWidth * 0.01 * consButtonPlayCenterX, screenHeight * 0.01 * consButtonPlayCenterY)
        
        labelApplicationTitle.alpha = 0.0
        labelApplicationTitle.center = CGPointMake(screenWidth * 0.01 * consLabelApplicationTitleCenterX_MainScreen, screenHeight * 0.01 * consLabelApplicationTitleCenterY_MainScreen)
        
        UIView.animateWithDuration(1.0, animations: {
            
            self.buttonPlay.alpha = 1.0
            self.labelApplicationTitle.alpha = 1.0
            
            }, completion: {_ in
                NSLog("CAME TO MAIN SCREEN")
        })
    }
    
    func animateOutofMainScreen () -> () {
        UIView.animateWithDuration(1.0, animations: {
            
            self.buttonPlay.alpha = 0.0
            self.labelApplicationTitle.alpha = 0.0
            
            }, completion: {_ in
                self.buttonPlay.center = CGPointMake(self.offscreenXValue, self.offscreenYValue)
                self.labelApplicationTitle.center = CGPointMake(self.offscreenXValue, self.offscreenYValue)
                NSLog("OUT OF MAIN SCREEN")
        })
    }
    
    
    func animateIntoGamePlayScreen () -> () {
        
        // bring the elements (as required) to visible area
        // also set the alpha to 0, which means invisible
        
        // this value is expected to be 0 at this time, but setting it here would cause animation problems.
        //labelApplicationTitle.alpha = 0.0
        //labelApplicationTitle.center = CGPointMake(screenWidth * 0.01 * consLabelApplicationTitleCenterX_GamePlayScreen,
        //    screenHeight * 0.01 * consLabelApplicationTitleCenterY_GamePlayScreen)

        labelAction.alpha = 0.0
        labelAction.center = CGPointMake(screenWidth * 0.01 * consLabelActionCenterX, screenHeight * 0.01 * consLabelActionCenterY)
        
        buttonCountdownTimer.alpha = 0.0
        buttonCountdownTimer.center = CGPointMake(screenWidth * 0.01 * consButtonCountdownTimerCenterX, screenHeight * 0.01 * consButtonCountdownTimerCenterY)

        labelGameStats1.alpha = 0.0
        labelGameStats1.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats1CenterX, screenHeight * 0.01 * consLabelGameStats1CenterY)
        labelGameStats2.alpha = 0.0
        labelGameStats2.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats2CenterX, screenHeight * 0.01 * consLabelGameStats2CenterY)
        labelGameStats3.alpha = 0.0
        labelGameStats3.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats3CenterX, screenHeight * 0.01 * consLabelGameStats3CenterY)
        labelGameStats4.alpha = 0.0
        labelGameStats4.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats4CenterX, screenHeight * 0.01 * consLabelGameStats4CenterY)
        
        
        UIView.animateWithDuration(1.0, delay: 1.0, options: nil, animations: {
            
            //self.labelApplicationTitle.alpha = 1.0
            self.labelAction.alpha = 1.0
            self.buttonCountdownTimer.alpha = 1.0
            self.labelGameStats1.alpha = 1.0
            self.labelGameStats2.alpha = 1.0
            self.labelGameStats3.alpha = 1.0
            self.labelGameStats4.alpha = 1.0
            
            }, completion: {_ in
                NSLog("CAME TO GAME PLAY SCREEN")
        })
    }
    
    func animateOutofGamePlayScreen () -> () {
        
    }

    // ################################################################################
    
    
    
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
                //self.removeMainScreenElements()
                //self.fadeInGamePlayElements()
        })
    }

    
    func createGameElementsForThisRound() {
        // create and add one circle to UI
        let circleLayer = CAShapeLayer()
        circleLayer.path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 100, 100)).CGPath
        circleLayer.strokeColor = UIColor.whiteColor().CGColor
        circleLayer.lineWidth = 5
        circleLayer.fillColor = UIColor.blueColor().CGColor
        //circleLayer.frame.origin = CGPointMake(50, 150)
        circleLayer.frame.origin = CGPointMake(-300, -300)
//        self.view.layer.addSublayer(circleLayer)

        let circleLayer2 = CAShapeLayer()
        circleLayer2.path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 50, 50)).CGPath
        circleLayer2.strokeColor = UIColor.whiteColor().CGColor
        circleLayer2.lineWidth = 5
        circleLayer2.fillColor = UIColor.greenColor().CGColor
        //circleLayer2.frame.origin = CGPointMake(150, 250)
        circleLayer2.frame.origin = CGPointMake(-300, -300)
//        self.view.layer.addSublayer(circleLayer2)

        let circleLayer3 = CAShapeLayer()
        circleLayer3.path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 200, 200)).CGPath
        circleLayer3.strokeColor = UIColor.whiteColor().CGColor
        circleLayer3.lineWidth = 5
        circleLayer3.fillColor = UIColor.redColor().CGColor
        //circleLayer3.frame.origin = CGPointMake(250, 350)
        circleLayer3.frame.origin = CGPointMake(-300, -300)
//        self.view.layer.addSublayer(circleLayer3)

        arrayGameElements.append(circleLayer)
        arrayGameElements.append(circleLayer2)
        arrayGameElements.append(circleLayer3)

        for obj in arrayGameElements {
            self.view.layer.addSublayer(obj as CAShapeLayer)
        }
    }
    
    func removeElements () {
        
        self.labelAction.alpha = 0.0
        self.buttonCountdownTimer.alpha = 0.0
        
    }
    
    
    func removeGameElements() {
        for obj in arrayGameElements {
            (obj as CAShapeLayer).removeFromSuperlayer()
        }
        
        arrayGameElements.removeAll(keepCapacity: true)
    }
    
    func createOneGameElement()->() {
//        let circleLayer = CAShapeLayer()
//        circleLayer.path = UIBezierPath(ovalInRect: CGRectMake(0, 0, 25, 25)).CGPath
//        circleLayer.strokeColor = UIColor.whiteColor().CGColor
//        circleLayer.lineWidth = 5
//        circleLayer.fillColor = UIColor.clearColor().CGColor

        //return circleLayer
    }
    
    
    func createGameOverElements() {
        
        var labelGameOver: UILabel!
        
        var labelObjectsTouched: UILabel!
        var labelObjectsTouchedValue: UILabel!
        
        var labelSpeed: UILabel!
        var labelSpeedValue: UILabel!
        
        var labelScore: UILabel!
        var labelScoreValue: UILabel!
        
        var buttonTryAgain: UIButton!
        var buttonQuit: UIButton!

        
        labelGameOver = createLabelGameOver()
        labelGameOver.text = "Game Over"
        labelGameOver.sizeToFit()
        labelGameOver.center = CGPointMake(screenWidth * 0.01 * consLabelGameOverCenterX, screenHeight * 0.01 * consLabelGameOverCenterY)
        self.view.addSubview(labelGameOver)

        labelObjectsTouched = createLabelGameOver()
        labelObjectsTouched.text = "Objects Touched"
        labelObjectsTouched.sizeToFit()
//        labelObjectsTouched.textAlignment = NSTextAlignment.Center
//        labelObjectsTouched.layer.cornerRadius = 15
//        labelObjectsTouched.frame = CGRectMake(labelObjectsTouched.frame.origin.x, labelObjectsTouched.frame.origin.y,
//            labelObjectsTouched.frame.width * 2, labelObjectsTouched.frame.height * 2)
//        
//        labelObjectsTouched.layer.backgroundColor = UIColor.brownColor().CGColor
        labelObjectsTouched.center = CGPointMake(screenWidth * 0.01 * consLabelObjectsTouchedCenterX, screenHeight * 0.01 * consLabelObjectsTouchedCenterY)
        self.view.addSubview(labelObjectsTouched)
        
        labelObjectsTouchedValue = createLabelGameOver()
        labelObjectsTouchedValue.text = "0"
        labelObjectsTouchedValue.sizeToFit()
        labelObjectsTouchedValue.center = CGPointMake(screenWidth * 0.01 * consLabelObjectsTouchedValueCenterX, screenHeight * 0.01 * consLabelObjectsTouchedValueCenterY)
        self.view.addSubview(labelObjectsTouchedValue)
        
        labelSpeed = createLabelGameOver()
        labelSpeed.text = "Speed"
        labelSpeed.sizeToFit()
        labelSpeed.center = CGPointMake(screenWidth * 0.01 * consLabelSpeedCenterX, screenHeight * 0.01 * consLabelSpeedCenterY)
        self.view.addSubview(labelSpeed)

        labelSpeedValue = createLabelGameOver()
        labelSpeedValue.text = "0"
        labelSpeedValue.sizeToFit()
        labelSpeedValue.center = CGPointMake(screenWidth * 0.01 * consLabelSpeedValueCenterX, screenHeight * 0.01 * consLabelSpeedValueCenterY)
        self.view.addSubview(labelSpeedValue)

        labelScore = createLabelGameOver()
        labelScore.text = "Score"
        labelScore.sizeToFit()
        labelScore.center = CGPointMake(screenWidth * 0.01 * consLabelScoreCenterX, screenHeight * 0.01 * consLabelScoreCenterY)
        self.view.addSubview(labelScore)
        
        labelScoreValue = createLabelGameOver()
        labelScoreValue.text = "0"
        labelScoreValue.sizeToFit()
        labelScoreValue.center = CGPointMake(screenWidth * 0.01 * consLabelScoreValueCenterX, screenHeight * 0.01 * consLabelScoreValueCenterY)
        self.view.addSubview(labelScoreValue)

        buttonTryAgain = createButtonGameOver()
        buttonTryAgain.setTitle("Try Again", forState: UIControlState.Normal)
        buttonTryAgain.sizeToFit()
        buttonTryAgain.center = CGPointMake(screenWidth * 0.01 * consButtonTryAgainCenterX, screenHeight * 0.01 * consButtonTryAgainCenterY)
        buttonTryAgain.addTarget(self, action: "tryAgainTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonTryAgain)
        
        buttonQuit = createButtonGameOver()
        buttonQuit.setTitle("Quit", forState: UIControlState.Normal)
        buttonQuit.sizeToFit()
        buttonQuit.center = CGPointMake(screenWidth * 0.01 * consButtonQuitCenterX, screenHeight * 0.01 * consButtonQuitCenterY)
        buttonQuit.addTarget(self, action: "quitTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonQuit)
        
    }
    
    func tryAgainTouched(sender: AnyObject) {
        NSLog("try again touched")
    }
    
    func quitTouched(sender: AnyObject) {
        NSLog("quit touched")
    }
    
    func createButtonGameOver()->(UIButton) {
     
        var buttonTemp = UIButton()
        buttonTemp.setTitle("Temp", forState: UIControlState.Normal)
        buttonTemp.sizeToFit()
        buttonTemp.backgroundColor = UIColor.blueColor()
//        buttonTemp.frame = CGRectMake(buttonPlay.frame.origin.x, buttonPlay.frame.origin.y, buttonPlay.frame.width*2, buttonPlay.frame.height*2)
        buttonTemp.layer.cornerRadius = 15.0
//        buttonTemp.center = CGPointMake(self.view.center.x, self.view.center.y)
//        buttonTemp.addTarget(self, action: "playTouched:", forControlEvents: UIControlEvents.TouchUpInside)

        return buttonTemp
    }
    
    func createLabelGameOver () -> (UILabel) {
        var labelReturnObject = UILabel()
        labelReturnObject.textAlignment = NSTextAlignment.Center
        labelReturnObject.layer.cornerRadius = 15
        
        labelReturnObject.text = "Temp"
        labelReturnObject.sizeToFit()
        labelReturnObject.frame = CGRectMake(
            labelReturnObject.frame.origin.x,
            labelReturnObject.frame.origin.y,
            labelReturnObject.frame.width * 2,
            labelReturnObject.frame.height * 2)
        
        labelReturnObject.layer.backgroundColor = UIColor.brownColor().CGColor

        return labelReturnObject
    }
    
}






