//
//  ViewController.swift
//  Touch
//
//  Created by Sunil Variar on 1/27/15.
//  Copyright (c) 2015 Random Chaos Studios. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIGestureRecognizerDelegate {

    // ################################################################################
    let numberRowsOrColumns = 3
    var intScore : Int = 0
    // ################################################################################
    
    
    // ################################################################################
    // Actions that can be performed
    /* 
    Blue Circle, Red Circle, Yellow Circle, [different color circles]
    Largest Circle, Smallest Circle, Blinking Circle, Odd Circle,
    Rotating Circle
    
    Square
    Triangle
    Rectangle
    
    Other Shapes can be added after the above works properly
    
    TOUCH THE ODD SHAPE, THE WHOLE GAME CAN BE THIS.
    THINK ABOUT ALL THE IDEAS
    */
    
    
    class ElementDetails : NSObject {
        var x_offset : CGFloat = 0
        var y_offset : CGFloat = 0
        var width    : CGFloat = 0
        var height   : CGFloat = 0
        var fillColor : UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
    }
    
    // ################################################################################
    // GestureRecognizer
    
    // ################################################################################
    // Common Elements
    
    var offscreenXValue: CGFloat = -300.0
    var offscreenYValue: CGFloat = -300.0
    
    var screenWidth, screenHeight : CGFloat!

    var view4 : UIView!
    
    var timerCount = 0
    var timerRunning = false
    var myTimer = NSTimer()
    
    var randomWinningElementPlacementInt = -1
    
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
    let consLabelActionCenterY : CGFloat = 13.0 // percentage of screen

    
    // Can I make an array of 16 elements here and have the same functionality???

    var arrayGameElements = [UIView]()
    
    //var arrayGameElementsPlacement = [CGPoint]()
    var arrayGameElements_WinningElement : Int = -1
    
    
    let consLabelGameStats1CenterX : CGFloat = 20.0 //
    let consLabelGameStats1CenterY : CGFloat = 92.0 //
    
    let consLabelGameStats2CenterX : CGFloat = 40.0 //
    let consLabelGameStats2CenterY : CGFloat = 92.0 //
    
    let consLabelGameStats3CenterX : CGFloat = 60.0 //
    let consLabelGameStats3CenterY : CGFloat = 92.0 //
    
    let consLabelGameStats4CenterX : CGFloat = 80.0 //
    let consLabelGameStats4CenterY : CGFloat = 92.0 //
    
    var buttonCountdownTimer: UIButton!
    let consButtonCountdownTimerCenterX : CGFloat = 90.0 // percentage of screen
    let consButtonCountdownTimerCenterY : CGFloat = 7.0 // percentage of screen
    
    //    let consLabelApplicationTitleCenterX : CGFloat = 50.0 // percentage of screen
    //    let consLabelApplicationTitleCenterY : CGFloat = 20.0 // percentage of screen
    
    var labelGameStats1, labelGameStats2, labelGameStats3, labelGameStats4: UILabel!
    
    // ################################################################################
    // Game Paused Elements
    
    var labelGamePaused: UILabel!
    let consLabelGamePausedCenterX : CGFloat = 50.0 // percentage of screen
    let consLabelGamePausedCenterY : CGFloat = 30.0 // percentage of screen

    var buttonResume: UIButton!
    let consButtonResumeCenterX : CGFloat = 50.0 // percentage of screen
    let consButtonResumeCenterY : CGFloat = 70.0 // percentage of screen
    

    // ################################################################################
    // Game Over Elements
    
    var labelGameOver: UILabel!
    let consLabelGameOverCenterX : CGFloat = 50.0 // percentage of screen
    let consLabelGameOverCenterY : CGFloat = 30.0 // percentage of screen
    
    var labelObjectsTouched: UILabel!
    let consLabelObjectsTouchedCenterX : CGFloat = 30.0 // percentage of screen
    let consLabelObjectsTouchedCenterY : CGFloat = 40.0 // percentage of screen
    
    var labelObjectsTouchedValue: UILabel!
    let consLabelObjectsTouchedValueCenterX : CGFloat = 70.0 // percentage of screen
    let consLabelObjectsTouchedValueCenterY : CGFloat = 40.0 // percentage of screen
    
    var labelSpeed: UILabel!
    let consLabelSpeedCenterX : CGFloat = 30.0 // percentage of screen
    let consLabelSpeedCenterY : CGFloat = 50.0 // percentage of screen
    
    var labelSpeedValue: UILabel!
    let consLabelSpeedValueCenterX : CGFloat = 70.0 // percentage of screen
    let consLabelSpeedValueCenterY : CGFloat = 50.0 // percentage of screen
    
    var labelScore: UILabel!
    let consLabelScoreCenterX : CGFloat = 30.0 // percentage of screen
    let consLabelScoreCenterY : CGFloat = 60.0 // percentage of screen
    
    var labelScoreValue: UILabel!
    let consLabelScoreValueCenterX : CGFloat = 70.0 // percentage of screen
    let consLabelScoreValueCenterY : CGFloat = 60.0 // percentage of screen
    
    var buttonTryAgain: UIButton!
    let consButtonTryAgainCenterX : CGFloat = 50.0 // percentage of screen
    let consButtonTryAgainCenterY : CGFloat = 75.0 // percentage of screen
    
    var buttonQuit: UIButton!
    let consButtonQuitCenterX : CGFloat = 50.0 // percentage of screen
    let consButtonQuitCenterY : CGFloat = 85.0 // percentage of screen
    
    // ################################################################################
    // ################################################################################
    // Game Play Logic
    // start with 5 different color circles which are shown randomly
    // tap the Circle with the color which you are asked at the top
    //
    
    
    var arrayActions = [
        "Red Circle",
        "Green Circle",
        "Blue Circle",
        
        "Yellow Circle",
        "Magenta Circle",
        "Cyan Circle",
     
        "White Circle",
        "Black Circle"
    ]
    
    var arrayColors = [
        UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
        UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0),
        UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0),
        
        UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0),
        UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0),
        UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0),

        UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
        UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var screen: UIScreen = UIScreen.mainScreen()
        screenWidth = screen.bounds.size.width
        screenHeight = screen.bounds.size.height
    }

    override func viewDidAppear(animated: Bool) {
        createUIElementsOffScreen()
        animateIntoMainScreen()
    }
    
    override func viewWillAppear(animated: Bool) {
        view.backgroundColor = UIColor(red: 153.00/255.00, green: 255.0/255.0, blue: 0.00/255.0, alpha: 1.00)
        NSLog("self.view.bounds.width : \(self.view.bounds.width)")
        NSLog("self.view.bounds.height: \(self.view.bounds.height)")
    }
    
    
    func startTimer() {
        println(__FUNCTION__)

        if false == timerRunning {
            myTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
            myTimer.tolerance = 0.10
            timerRunning = true
        }
    }
    
    
    func Counting() {
        //println(__FUNCTION__)

        timerCount += 1
        // this needs to be animated
        buttonCountdownTimer.setTitle("\(timerCount)", forState: UIControlState.Normal)
        
        // game over in 10 seconds for testing only
        if 20 == timerCount {
            println("Timer Count Reached")

            timerCount = 0

            timerRunning = false
            myTimer.invalidate()
            
            NSLog("Game Over this round")

            animateOutofGamePlayElements()
            animateOutofGamePlayElements_EverythingElse()
            
            // the above takes time so delay the following function
            delay(seconds:2, completion: {
                println("delay is over in counting and so calling remove game play elements")
                self.removeGamePlayElements()
                self.removeGamePlayElements_EverythingElse()
            })

            settingUpGameOverElements()
            
            animateIntoGameOverElements()
            
            resetScores()
        }
    }

    func settingUpGameOverElements()->() {
        labelObjectsTouchedValue.text = "\(intScore)"
    }
    
    func resetScores()->() {
        intScore = 0
        labelGameStats1.text = "\(intScore)"
        
    }
    
    // ################################################################################
    // ################################################################################
    // ################################################################################
    
    func createUIElementsOffScreen() {
        println(__FUNCTION__)
        createMainScreenElements()
        createGamePlayElements()
        createGamePausedElements()
        createGameOverElements()
    }

    func createMainScreenElements()->() {
        println(__FUNCTION__)
        buttonPlay = UIButton()
        buttonPlay.setTitle("PLAY", forState: UIControlState.Normal)
        buttonPlay.sizeToFit()
        buttonPlay.backgroundColor = UIColor.blueColor()
        buttonPlay.frame = CGRectMake(buttonPlay.frame.origin.x, buttonPlay.frame.origin.y, buttonPlay.frame.width*2, buttonPlay.frame.height*2)
        buttonPlay.layer.cornerRadius = 15.0
        
        //buttonPlay.center = CGPointMake(self.view.center.x, self.view.center.y)
        buttonPlay.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        buttonPlay.addTarget(self, action: "tapPlayEvent:", forControlEvents: UIControlEvents.TouchUpInside)
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
        labelApplicationTitle.center = CGPointMake(offscreenXValue, offscreenYValue)
        self.view.addSubview(labelApplicationTitle)
    }
    
    func createGamePlayElements()->() {
        labelAction = UILabel()
        labelAction.text = "Action needs to come here"
        labelAction.sizeToFit()
        labelAction.textAlignment = NSTextAlignment.Center
        labelAction.layer.cornerRadius = 5
        labelAction.frame = CGRectMake(labelAction.frame.origin.x, labelAction.frame.origin.y,
            screenWidth * 0.01 * 80, screenHeight * 0.01 * 5)
        labelAction.layer.backgroundColor = UIColor.redColor().CGColor
        //labelAction.center = CGPointMake(self.view.center.x, self.view.center.y/3)
        labelAction.center = CGPointMake(offscreenXValue, offscreenYValue)
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
        buttonCountdownTimer.center = CGPointMake(-offscreenXValue, offscreenYValue)
        buttonCountdownTimer.addTarget(self, action: "tapCountdownTimerEvent:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonCountdownTimer.alpha = 0.0
        self.view.addSubview(buttonCountdownTimer)
        
        
        labelGameStats1 = makeGameStatsLabel()
        //labelGameStats1.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats1CenterX, screenHeight * 0.01 * consLabelGameStats1CenterY)
        labelGameStats1.center = CGPointMake(offscreenXValue, offscreenYValue)
        self.view.addSubview(labelGameStats1)
        
        labelGameStats2 = makeGameStatsLabel()
        //labelGameStats2.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats2CenterX, screenHeight * 0.01 * consLabelGameStats2CenterY)
        labelGameStats2.center = CGPointMake(offscreenXValue, offscreenYValue)
        self.view.addSubview(labelGameStats2)
        
        labelGameStats3 = makeGameStatsLabel()
        //labelGameStats3.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats3CenterX, screenHeight * 0.01 * consLabelGameStats3CenterY)
        labelGameStats3.center = CGPointMake(offscreenXValue, offscreenYValue)
        self.view.addSubview(labelGameStats3)
        
        labelGameStats4 = makeGameStatsLabel()
        //labelGameStats4.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats4CenterX, screenHeight * 0.01 * consLabelGameStats4CenterY)
        labelGameStats4.center = CGPointMake(offscreenXValue, offscreenYValue)
        self.view.addSubview(labelGameStats4)
    }
    
    func createGamePausedElements()->() {
        // ================================================================================
        // LABEL game paused
        labelGamePaused = createLabelGameOver()
        labelGamePaused.text = "Game Paused"
        labelGamePaused.sizeToFit()
        labelGamePaused.frame = CGRectMake(labelGamePaused.frame.origin.x, labelGamePaused.frame.origin.y, screenWidth * 0.01 * 40, labelGamePaused.frame.height)
        labelGamePaused.center = CGPointMake(offscreenXValue, offscreenYValue)
        self.view.addSubview(labelGamePaused)

        // ================================================================================
        // Button game resume
        buttonResume = UIButton()
        buttonResume.setTitle("Resume", forState: UIControlState.Normal)
        buttonResume.sizeToFit()
        buttonResume.backgroundColor = UIColor.blueColor()
        buttonResume.frame = CGRectMake(buttonResume.frame.origin.x, buttonResume.frame.origin.y, buttonResume.frame.width*2, buttonResume.frame.height*2)
        buttonResume.layer.cornerRadius = 15.0
        buttonResume.center = CGPointMake(offscreenXValue, offscreenYValue)
        buttonResume.addTarget(self, action: "tapResumeEvent:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonResume)
    }
    
    func createGameOverElements()->() {
        
        
        // LABEL game over
        labelGameOver = createLabelGameOver()
        labelGameOver.text = "Game Over"
        labelGameOver.sizeToFit()
        labelGameOver.frame = CGRectMake(labelGameOver.frame.origin.x, labelGameOver.frame.origin.y, screenWidth * 0.01 * 40, labelGameOver.frame.height)
        
        //labelGameOver.center = CGPointMake(screenWidth * 0.01 * consLabelGameOverCenterX, screenHeight * 0.01 * consLabelGameOverCenterY)
        labelGameOver.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelGameOver)
        
        // LABEL Objects touched
        
        labelObjectsTouched = createLabelGameOver()
        labelObjectsTouched.text = "Objects Touched"
        labelObjectsTouched.sizeToFit()
        
        labelObjectsTouched.frame = CGRectMake(labelObjectsTouched.frame.origin.x, labelObjectsTouched.frame.origin.y, screenWidth * 0.01 * 40, labelObjectsTouched.frame.height)
        
        //        labelObjectsTouched.textAlignment = NSTextAlignment.Center
        //        labelObjectsTouched.layer.cornerRadius = 15
        //        labelObjectsTouched.frame = CGRectMake(labelObjectsTouched.frame.origin.x, labelObjectsTouched.frame.origin.y,
        //            labelObjectsTouched.frame.width * 2, labelObjectsTouched.frame.height * 2)
        //
        //        labelObjectsTouched.layer.backgroundColor = UIColor.brownColor().CGColor
        
        //labelObjectsTouched.center = CGPointMake(screenWidth * 0.01 * consLabelObjectsTouchedCenterX, screenHeight * 0.01 * consLabelObjectsTouchedCenterY)
        labelObjectsTouched.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelObjectsTouched)
        
        // LABEL objects touched value
        
        labelObjectsTouchedValue = createLabelGameOver()
        labelObjectsTouchedValue.text = "0"
        labelObjectsTouchedValue.sizeToFit()
        labelObjectsTouchedValue.frame = CGRectMake(labelObjectsTouchedValue.frame.origin.x, labelObjectsTouchedValue.frame.origin.y, screenWidth * 0.01 * 20, labelObjectsTouchedValue.frame.height)
        
        //labelObjectsTouchedValue.center = CGPointMake(screenWidth * 0.01 * consLabelObjectsTouchedValueCenterX, screenHeight * 0.01 * consLabelObjectsTouchedValueCenterY)
        labelObjectsTouchedValue.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelObjectsTouchedValue)
        
        // LABEL speed
        labelSpeed = createLabelGameOver()
        labelSpeed.text = "Speed"
        labelSpeed.sizeToFit()
        
        //labelSpeed.frame = CGRectMake(labelSpeed.frame.origin.x, labelSpeed.frame.origin.y, screenWidth * 0.01 * 30, labelSpeed.frame.height)
        labelSpeed.frame = CGRectMake(labelSpeed.frame.origin.x, labelSpeed.frame.origin.y, screenWidth * 0.01 * 40, labelSpeed.frame.height)
        
        //labelSpeed.center = CGPointMake(screenWidth * 0.01 * consLabelSpeedCenterX, screenHeight * 0.01 * consLabelSpeedCenterY)
        labelSpeed.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelSpeed)
        
        labelSpeedValue = createLabelGameOver()
        labelSpeedValue.text = "0"
        labelSpeedValue.sizeToFit()
        labelSpeedValue.frame = CGRectMake(labelSpeedValue.frame.origin.x, labelSpeedValue.frame.origin.y, screenWidth * 0.01 * 20, labelSpeedValue.frame.height)
        
        //labelSpeedValue.center = CGPointMake(screenWidth * 0.01 * consLabelSpeedValueCenterX, screenHeight * 0.01 * consLabelSpeedValueCenterY)
        labelSpeedValue.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelSpeedValue)
        
        labelScore = createLabelGameOver()
        labelScore.text = "Score"
        labelScore.sizeToFit()
        
        labelScore.frame = CGRectMake(labelScore.frame.origin.x, labelScore.frame.origin.y, screenWidth * 0.01 * 40, labelScore.frame.height)
        
        //labelScore.center = CGPointMake(screenWidth * 0.01 * consLabelScoreCenterX, screenHeight * 0.01 * consLabelScoreCenterY)
        labelScore.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelScore)
        
        labelScoreValue = createLabelGameOver()
        labelScoreValue.text = "0"
        labelScoreValue.sizeToFit()
        labelScoreValue.frame = CGRectMake(labelScoreValue.frame.origin.x, labelScoreValue.frame.origin.y, screenWidth * 0.01 * 20, labelScoreValue.frame.height)
        
        //labelScoreValue.center = CGPointMake(screenWidth * 0.01 * consLabelScoreValueCenterX, screenHeight * 0.01 * consLabelScoreValueCenterY)
        labelScoreValue.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelScoreValue)
        
        buttonTryAgain = createButtonGameOver()
        buttonTryAgain.setTitle("Try Again", forState: UIControlState.Normal)
        buttonTryAgain.sizeToFit()
        buttonTryAgain.frame = CGRectMake(buttonTryAgain.frame.origin.x, buttonTryAgain.frame.origin.y, screenWidth * 0.01 * 30, buttonTryAgain.frame.height)
        
        //buttonTryAgain.center = CGPointMake(screenWidth * 0.01 * consButtonTryAgainCenterX, screenHeight * 0.01 * consButtonTryAgainCenterY)
        buttonTryAgain.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        buttonTryAgain.addTarget(self, action: "tapTryAgainEvent:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonTryAgain)
        
        
        buttonQuit = createButtonGameOver()
        buttonQuit.setTitle("Quit", forState: UIControlState.Normal)
        buttonQuit.sizeToFit()
        buttonQuit.frame = CGRectMake(buttonQuit.frame.origin.x, buttonQuit.frame.origin.y, screenWidth * 0.01 * 20, buttonQuit.frame.height)
        
        //buttonQuit.center = CGPointMake(screenWidth * 0.01 * consButtonQuitCenterX, screenHeight * 0.01 * consButtonQuitCenterY)
        buttonQuit.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        buttonQuit.addTarget(self, action: "tapQuitEvent:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonQuit)
        
    }
    
    // ################################################################################
    // ################################################################################
    // ################################################################################

    func createButtonGameOver()->(UIButton) {
        
        var buttonTemp = UIButton()
        buttonTemp.setTitle("Temp", forState: UIControlState.Normal)
        buttonTemp.sizeToFit()
        buttonTemp.backgroundColor = UIColor.blueColor()
        //        buttonTemp.frame = CGRectMake(buttonPlay.frame.origin.x, buttonPlay.frame.origin.y, buttonPlay.frame.width*2, buttonPlay.frame.height*2)
        buttonTemp.layer.cornerRadius = 15.0
        //        buttonTemp.center = CGPointMake(self.view.center.x, self.view.center.y)
        //        buttonTemp.addTarget(self, action: "tapPlayEvent:", forControlEvents: UIControlEvents.TouchUpInside)
        
        return buttonTemp
    }
    
    func createLabelGameOver()->(UILabel) {
        var labelReturnObject = UILabel()
        labelReturnObject.textAlignment = NSTextAlignment.Center
        labelReturnObject.layer.cornerRadius = 6
        labelReturnObject.layer.backgroundColor = UIColor.brownColor().CGColor
        return labelReturnObject
    }
    
    func makeGameStatsLabel() -> (UILabel) {
        var tempLabel = UILabel()
        tempLabel.text = "0"
        tempLabel.sizeToFit()
        tempLabel.textAlignment = NSTextAlignment.Center
        tempLabel.layer.cornerRadius = 5
        tempLabel.frame = CGRectMake(tempLabel.frame.origin.x, tempLabel.frame.origin.y,
            tempLabel.frame.size.width * 3.0, tempLabel.frame.size.height * 1.3)
        tempLabel.layer.backgroundColor = UIColor.redColor().CGColor
        tempLabel.alpha = 0.0
        return tempLabel
    }
    
    // ################################################################################
    // ################################################################################
    // ################################################################################
    // Animation Functions - START
    
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
                
                // ONLY FOR TESTING
                //self.tapPlayEvent(UIView)
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
                
                self.createGameElementsForNextRound()
                
        })
    }
    
    func animateOutofGamePlayScreen () -> () {
        
    }
    
    
    func animateIntoGamePlayElements()->() {
        
        var additiveDelay :Double = 0.05
        var animationDuration : Double = 0.15
        
        for iCount in 0..<arrayGameElements.count {
            arrayGameElements[iCount].transform = CGAffineTransformMakeScale(0, 0)
            arrayGameElements[iCount].alpha = 1.0
            
            UIView.animateWithDuration(animationDuration, delay: Double(iCount) * additiveDelay, options: .CurveEaseOut, animations: {
                self.arrayGameElements[iCount].transform = CGAffineTransformIdentity
                }, completion: {_ in
                    //println("Animation completed \(iCount)")
            })
        }
        
    }
    
    func animateOutofGamePlayElements()->() {
        
        var additiveDelay :Double = 0.10
        var animationDuration : Double = 0.20
        
        for iCount in 0..<arrayGameElements.count {
            //arrayGameElements[iCount].transform = CGAffineTransformMakeScale(0, 0)
            //arrayGameElements[iCount].alpha = 1.0
            
            UIView.animateWithDuration(animationDuration, delay: Double(iCount) * additiveDelay, options: .CurveEaseOut, animations: {
                //self.arrayGameElements[iCount].transform = CGAffineTransformMakeScale(0, 0)
                self.arrayGameElements[iCount].alpha = 0.0
                }, completion: {_ in
                    println("out of game elements Animation completed \(iCount)")
            })
        }
    }
    
    func animateOutofGamePlayElements_EverythingElse()->() {
        var additiveDelay :Double = 0.10
        var animationDuration : Double = 0.20
        
        UIView.animateWithDuration(animationDuration, delay: 1.0, options: .CurveEaseOut, animations: {

            self.labelGameStats1.alpha = 0.0
            self.labelGameStats2.alpha = 0.0
            self.labelGameStats3.alpha = 0.0
            self.labelGameStats4.alpha = 0.0
            self.buttonCountdownTimer.alpha = 0.0
            self.labelAction.alpha = 0.0

                }, completion: {_ in
                    println("animation complete everything else game play elements")
        })
    }

    
    func animateIntoGamePausedElements()->() {
        
        var animationDelay :Double = 0.0
        var animationDuration : Double = 0.5
        
        labelGamePaused.alpha = 0.0
        buttonResume.alpha = 0.0
        buttonQuit.alpha = 0.0
        
        labelGamePaused.center = CGPointMake(screenWidth * 0.01 * consLabelGamePausedCenterX, screenHeight * 0.01 * consLabelGamePausedCenterY)
        buttonResume.center = CGPointMake(screenWidth * 0.01 * consButtonResumeCenterX, screenHeight * 0.01 * consButtonResumeCenterY)
        buttonQuit.center = CGPointMake(screenWidth * 0.01 * consButtonQuitCenterX, screenHeight * 0.01 * consButtonQuitCenterY)
        
        UIView.animateWithDuration(animationDuration, delay: animationDelay, options: .CurveEaseOut, animations: {
            
            self.labelGamePaused.alpha  = 1.0
            self.buttonResume.alpha     = 1.0
            self.buttonQuit.alpha       = 1.0
            
            }, completion: {_ in
                println("Animation Game Paused Completed!")
        })
    }
    
    
    func animateOutofGamePausedElements()->() {
        labelGamePaused.center = CGPointMake(offscreenXValue, offscreenYValue)
        buttonResume.center = CGPointMake(offscreenXValue, offscreenYValue)
        buttonQuit.center = CGPointMake(offscreenXValue, offscreenYValue)
    }
    
    
    func animateIntoGameOverElements()->() {
        

        var additiveDelay :Double = 1.0
        var animationDuration : Double = 1.0
        
//        for iCount in 0..<arrayGameElements.count {
//            arrayGameElements[iCount].transform = CGAffineTransformMakeScale(0, 0)
//            arrayGameElements[iCount].alpha = 1.0
//            
//            UIView.animateWithDuration(animationDuration, delay: Double(iCount) * additiveDelay, options: .CurveEaseOut, animations: {
//                self.arrayGameElements[iCount].transform = CGAffineTransformIdentity
//                }, completion: {_ in
//                    //println("Animation completed \(iCount)")
//            })
//        }

        // Game Over Elements
        
        labelGameOver.alpha = 0.0
        labelObjectsTouched.alpha = 0.0
        labelObjectsTouchedValue.alpha = 0.0
        labelSpeed.alpha = 0.0
        labelSpeedValue.alpha = 0.0
        labelScore.alpha = 0.0
        labelScoreValue.alpha = 0.0
        buttonTryAgain.alpha = 0.0
        buttonQuit.alpha = 0.0
        
        
        labelGameOver.center = CGPointMake(screenWidth * 0.01 * consLabelGameOverCenterX, screenHeight * 0.01 * consLabelGameOverCenterY)
        labelObjectsTouched.center = CGPointMake(screenWidth * 0.01 * consLabelObjectsTouchedCenterX, screenHeight * 0.01 * consLabelObjectsTouchedCenterY)
        labelObjectsTouchedValue.center = CGPointMake(screenWidth * 0.01 * consLabelObjectsTouchedValueCenterX, screenHeight * 0.01 * consLabelObjectsTouchedValueCenterY)
        labelSpeed.center = CGPointMake(screenWidth * 0.01 * consLabelSpeedCenterX, screenHeight * 0.01 * consLabelSpeedCenterY)
        labelSpeedValue.center = CGPointMake(screenWidth * 0.01 * consLabelSpeedValueCenterX, screenHeight * 0.01 * consLabelSpeedValueCenterY)
        labelScore.center = CGPointMake(screenWidth * 0.01 * consLabelScoreCenterX, screenHeight * 0.01 * consLabelScoreCenterY)
        labelScoreValue.center = CGPointMake(screenWidth * 0.01 * consLabelScoreValueCenterX, screenHeight * 0.01 * consLabelScoreValueCenterY)
        buttonTryAgain.center = CGPointMake(screenWidth * 0.01 * consButtonTryAgainCenterX, screenHeight * 0.01 * consButtonTryAgainCenterY)
        buttonQuit.center = CGPointMake(screenWidth * 0.01 * consButtonQuitCenterX, screenHeight * 0.01 * consButtonQuitCenterY)
        
        
        // ################################################################################

        UIView.animateWithDuration(animationDuration, delay: additiveDelay, options: .CurveEaseOut, animations: {

            self.labelGameOver.alpha = 1.0
            self.labelObjectsTouched.alpha = 1.0
            self.labelObjectsTouchedValue.alpha = 1.0
            self.labelSpeed.alpha = 1.0
            self.labelSpeedValue.alpha = 1.0
            self.labelScore.alpha = 1.0
            self.labelScoreValue.alpha = 1.0
            self.buttonTryAgain.alpha = 1.0
            self.buttonQuit.alpha = 1.0
            
            }, completion: {_ in
                println("Animation Game Over Completed.")
        })
    }
    
    // Animation Functions - END
    // ################################################################################
    // ################################################################################
    // ################################################################################
    
    
    
    
    // ################################################################################
    // ################################################################################
    // ################################################################################
    // Removing Elements - START
    
    // Removing Main Screen Elements
    
    func removeMainScreenElements()->() {
    
    }

    func removeGamePlayElements()->() {
        // REMOVING FROM VIEW
        for iCount in 0..<self.arrayGameElements.count {
            self.arrayGameElements[iCount].removeFromSuperview()
        }
        // CLEARING THE ARRAY
        self.arrayGameElements.removeAll(keepCapacity: true)
    }

    func hideForPausedGamePlayElements()->() {
        for iCount in 0..<self.arrayGameElements.count {
            self.arrayGameElements[iCount].alpha = 0.0
        }
        labelGameStats1.alpha = 0.0
        labelGameStats2.alpha = 0.0
        labelGameStats3.alpha = 0.0
        labelGameStats4.alpha = 0.0
    }
    
    func unhideForPausedGamePlayElements()->() {
        for iCount in 0..<self.arrayGameElements.count {
            self.arrayGameElements[iCount].alpha = 1.0
        }
        labelGameStats1.alpha = 1.0
        labelGameStats2.alpha = 1.0
        labelGameStats3.alpha = 1.0
        labelGameStats4.alpha = 1.0
    }
    
    func removeGamePlayElements_EverythingElse()->() {
        // These elements are only moved offscreen
        // and not actually deleted/removed from the view
        labelGameStats1.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelGameStats2.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelGameStats3.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelGameStats4.center = CGPointMake(offscreenXValue, offscreenYValue)
        buttonCountdownTimer.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelAction.center = CGPointMake(offscreenXValue, offscreenYValue)
    }

    func removeGameOverElements()->() {
        
        labelGameOver.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelObjectsTouched.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelObjectsTouchedValue.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelSpeed.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelSpeedValue.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelScore.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelScoreValue.center = CGPointMake(offscreenXValue, offscreenYValue)
        buttonTryAgain.center = CGPointMake(offscreenXValue, offscreenYValue)
        buttonQuit.center = CGPointMake(offscreenXValue, offscreenYValue)
    }

    func removeGamePausedElements()->() {
        labelGamePaused.center = CGPointMake(offscreenXValue, offscreenYValue)
        buttonResume.center = CGPointMake(offscreenXValue, offscreenYValue)
    }
    
    
    // Removing Elements - END
    // ################################################################################
    // ################################################################################
    // ################################################################################

    
    
    // ################################################################################
    // ################################################################################
    
    func createGameElementsForNextRound() {
        println(__FUNCTION__)
        
        // Decide which try to use randomly
        
        var randomNumber : CGFloat = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        println("randomNumber is \(randomNumber)")
        var randomTryEffort : CGFloat = randomNumber * 5
        println("randomTryEffort is \(randomTryEffort)")
        var randomTryEffortInt = Int(randomTryEffort)
        
        //randomTryEffortInt = 0
        
        println("randomTryEffortInt is \(randomTryEffortInt)")
        
        
        let sizeElement01_Width : CGFloat = 100.0 / CGFloat(numberRowsOrColumns)
        let sizeElement01_Height :CGFloat = 100.0 / CGFloat(numberRowsOrColumns)
        
        var Y_offset = ( screenHeight - screenWidth ) / 2
        
        let pointTopLeftElement01 = CGPointMake(0, Y_offset)
        
        var elementDetailsObj = ElementDetails()

        
        var randomNumber1 : CGFloat = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        
        //var randomWinningElement : CGFloat = randomNumber1 * CGFloat(numberRowsOrColumns) * CGFloat(numberRowsOrColumns)
        var randomWinningElement : CGFloat = randomNumber1 * CGFloat(arrayActions.count)
        
        println("randomNumber1 is \(randomNumber1)")
        println("randomWinningElement is \(randomWinningElement)")
        
        arrayGameElements_WinningElement = Int(randomWinningElement)
        println("arrayGameElements_WinningElement is \(arrayGameElements_WinningElement)")
        
        
        labelAction.text = arrayActions[arrayGameElements_WinningElement]

        
        var randomNumber2 : CGFloat = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        var randomWinningElementPlacement : CGFloat = randomNumber2 * CGFloat(numberRowsOrColumns  * numberRowsOrColumns)
        randomWinningElementPlacementInt = Int(randomWinningElementPlacement)
        println("randomWinningElementPlacementInt is \(randomWinningElementPlacementInt)")

        
        for i in 0..<numberRowsOrColumns {
            
            //println("i is \(i)")
            
            for j in 0..<numberRowsOrColumns {
            
                //println("j is \(j)")
                
                elementDetailsObj.x_offset = (CGFloat(j) * (screenWidth * 0.01 * sizeElement01_Width))
                elementDetailsObj.y_offset = (CGFloat(i) * (screenWidth * 0.01 * sizeElement01_Height)) + (screenHeight - screenWidth)/2
                
                elementDetailsObj.width = screenWidth * 0.01 * sizeElement01_Width
                elementDetailsObj.height = screenWidth * 0.01 * sizeElement01_Width

                
                let recognizer = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
                recognizer.delegate = self

                // Check whether you are at the winning element, if yes it is a different scenario
                if ((i*numberRowsOrColumns + j) == randomWinningElementPlacementInt) {
                //if ((i*numberRowsOrColumns + j) == arrayGameElements_WinningElement) {
                    elementDetailsObj.fillColor = arrayColors[arrayGameElements_WinningElement]
                } else {
                    elementDetailsObj.fillColor = returnOtherColor(1.0, inGreen: 0.0, inBlue: 0.0)
                }
                
                var tempViewToAddToArray = makeGameElementWithDetails(elementDetailsObj, ElementType:randomTryEffortInt)
                
                tempViewToAddToArray.addGestureRecognizer(recognizer)
                
                //arrayGameElements[i * numberRowsOrColumns + j] = tempViewToAddToArray
                arrayGameElements.insert(tempViewToAddToArray, atIndex: i * numberRowsOrColumns + j)
                
                self.view.addSubview(tempViewToAddToArray)
                
            }
        }
        
        animateIntoGamePlayElements()
        
    }
    
    func makeGameElementWithDetails (e_details: ElementDetails, ElementType:Int) -> (UIView) {
        
        var tempElement = UIView(frame: CGRectMake(e_details.x_offset, e_details.y_offset, e_details.width, e_details.height))
        
        tempElement.backgroundColor = UIColor(red: 204.0, green: 204.0, blue: 153.0, alpha: 1.0)
        
        tempElement.alpha = 0.0 // it is not visible when created, you will need to animated it.
        
        
        // MAKING the LAYER
        // create and add Shape to the UI, can be circle square or triangle
        let oneLayer = CAShapeLayer()
        
        var randomX = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        //println("randomX is \(randomX)")
        
        if randomX < 0.05 {
            randomX = 0.05
        }
        
        // width is used twice with intention
        // the RECT passed gives the top left and size of the Shape inside the superview
        
//        oneLayer.path = UIBezierPath(ovalInRect: CGRectMake(
//            (e_details.width  - randomX * e_details.width )/2,
//            (e_details.height - randomX * e_details.height)/2,
//            randomX * e_details.width,
//            randomX * e_details.height)).CGPath
//        
        
        randomX = 0.70
        oneLayer.path = UIBezierPath(ovalInRect: CGRectMake(
            (e_details.width  - randomX * e_details.width )/2,
            (e_details.height - randomX * e_details.height)/2,
            randomX * e_details.width,
            randomX * e_details.height)).CGPath

        
//        switch(ElementType) {
//        case 0:
//            // first try
//            // making a circle or oval
//            //oneLayer.path = UIBezierPath(ovalInRect: CGRectMake(0, 0, randomX * e_details.width, randomX * e_details.height)).CGPath
//            oneLayer.path = UIBezierPath(ovalInRect: CGRectMake(
//                (e_details.width  - randomX * e_details.width )/2,
//                (e_details.height - randomX * e_details.height)/2,
//                randomX * e_details.width,
//                randomX * e_details.height)).CGPath
//            
//        case 1:
//            // second try
//            // making a square or a rectangle
//            oneLayer.path = UIBezierPath(rect: CGRectMake((e_details.width  - randomX * e_details.width )/2,
//                (e_details.height - randomX * e_details.height)/2,
//                randomX * e_details.width, randomX * e_details.height)).CGPath
//            
//        case 2:
//            // third try
//            var point = CGPointMake(50, 50)
//            oneLayer.path = UIBezierPath(arcCenter:point, radius: 35, startAngle: 0, endAngle: 3.14, clockwise: true).CGPath
//            
//        case 3:
//            
//            // fourth try
//            //making a triangle
//            
//            var triangle = UIBezierPath()
//            triangle.moveToPoint(CGPointMake(10,10))
//            triangle.addLineToPoint(CGPointMake(60, 40))
//            triangle.addLineToPoint(CGPointMake(20, 60))
//            triangle.closePath()
//            //UIColor.redColor().set()
//            //triangle.fill()
//            
//            oneLayer.path = triangle.CGPath
//            
//        default:
//            println("default switch case")
//        }
        
        
        // attributes
        oneLayer.lineWidth = 4
        oneLayer.strokeColor = UIColor.whiteColor().CGColor
        //oneLayer.strokeColor = UIColor.magentaColor().CGColor
        
        //oneLayer.fillColor = UIColor.blueColor().CGColor
        oneLayer.fillColor = e_details.fillColor.CGColor
        
        
        
        // Adding the Current Element
        tempElement.layer.addSublayer(oneLayer)
        
        // Element attributes
        tempElement.layer.borderWidth = 5
        tempElement.layer.borderColor = UIColor.yellowColor().CGColor
        
        return tempElement
        
    }

    
    func returnPassedColor(UIColor)->(UIColor) {
        var someColor : UIColor
        someColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        return someColor
    }
    
    
    func returnOtherColor(inRed: CGFloat, inGreen: CGFloat, inBlue: CGFloat)->(UIColor) {
        
        var returnColor : UIColor
        var returnRedValue : CGFloat = 0.0
        var returnGreenValue : CGFloat = 0.0
        var returnBlueValue : CGFloat = 0.0
        
        var awayFactor : CGFloat = 0.30
        
        // all 3 values are between 0.00 and 1.00
        // so generate random colors which are away from these values for RGB
        
        // RED
        var randomGenerated1 = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        //println("randomGenerated1 is \(randomGenerated1)")
        
        if ((inRed + awayFactor < randomGenerated1) || (randomGenerated1 + awayFactor < inRed)) {
            returnRedValue = randomGenerated1
        }
        else if (randomGenerated1 - awayFactor > 0.00) {
            returnRedValue = randomGenerated1 - awayFactor
        }
        else if (randomGenerated1 + awayFactor < 1.00) {
            returnRedValue = randomGenerated1 + awayFactor
        }
        // GREEN
        var randomGenerated2 = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        //println("randomGenerated2 is \(randomGenerated2)")
        
        if ((inGreen + awayFactor < randomGenerated2) || (randomGenerated2 + awayFactor < inGreen)) {
            returnGreenValue = randomGenerated2
        }
        else if (randomGenerated2 - awayFactor > 0.00) {
            returnGreenValue = randomGenerated2 - awayFactor
        }
        else if (randomGenerated2 + awayFactor < 1.00) {
            returnGreenValue = randomGenerated2 + awayFactor
        }
        // BLUE
        var randomGenerated3 = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        //println("randomGenerated3 is \(randomGenerated3)")
        
        if ((inBlue + awayFactor < randomGenerated3) || (randomGenerated3 + awayFactor < inBlue)) {
            returnBlueValue = randomGenerated3
        }
        else if (randomGenerated3 - awayFactor > 0.00) {
            returnBlueValue = randomGenerated3 - awayFactor
        }
        else if (randomGenerated3 + awayFactor < 1.00) {
            returnBlueValue = randomGenerated3 + awayFactor
        }
        
        println("Returning red : \(returnRedValue) green : \(returnGreenValue) blue : \(returnBlueValue)")
        
        return UIColor(red: returnRedValue, green: returnGreenValue, blue: returnBlueValue, alpha: 1.0)
    }
    
    func handleTap(recognizer: UITapGestureRecognizer) {

        for iCount in 0..<arrayGameElements.count {
            if recognizer.view === arrayGameElements[iCount] {
                println("User has tapped Element \(iCount)")
                
                // things need to be done here... like whether the user was right or wrong
         
                if iCount == randomWinningElementPlacementInt {
                //if iCount == arrayGameElements_WinningElement {
                    println("You Win")
                    handleOneRoundWin()
                    
                } else {
                    println("You Lose")
                    handleOneRoundLose()
                    
                }
            }
        }
        
        
        // this is actually not working
        // it does not get the time to do anything
        // the next function is called and it takes over
        // the animation needs time to complete
        
        // animate away the Game elements
        animateOutofGamePlayElements()
        
        // Remove all the elements from the view
        // and then clear off the array which has all the elements
        // they will be created and then added again for next round.
        // I am not changing anything now, but the elements will be created differently every time
        // so removal and adding is required
        
        
        // THIS DELAY SHOULD BE CORRECTLY CALCULATED FOR GETTING PROPER ANIMATIONS
        var newRoundDelay : Double = 2.0
        delay(seconds:newRoundDelay, completion: {
            println("finished delay and waiting")
            
//            // REMOVING FROM VIEW
//            for iCount in 0..<self.arrayGameElements.count {
//                self.arrayGameElements[iCount].removeFromSuperview()
//            }
//            
//            // CLEARING THE ARRAY
//            self.arrayGameElements.removeAll(keepCapacity: true)
//            
            self.removeGamePlayElements()
            
            // Create new game elements with some logic which changes the elements everytime
            // the function is called
            self.createGameElementsForNextRound()

        })
    }
    
    func delay(#seconds: Double, completion:()->()) {
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
        
        dispatch_after(popTime, dispatch_get_main_queue()) {
            completion()
        }
    }

    
    func handleOneRoundWin() {
        
        
        // increase the Score - total correctly touched objects
        intScore++
        
        labelGameStats1.text = "\(intScore)"
        //buttonCountdownTimer.setTitle("\(timerCount)", forState: UIControlState.Normal)

        
        // update all the game statistics
    }
    
    
    func handleOneRoundLose() {
        
    }
    
    // ######################################################################
    // ######################################################################
    // ######################################################################
    // Tap Events - START

    func tapQuitEvent(sender: AnyObject) {
        println(__FUNCTION__)

        timerCount = 0
        myTimer.invalidate()
        timerRunning = false
        // remove from visible region all the game over elements
        removeGameOverElements()
        removeGamePausedElements()
        //removeGameOverElements_EverythingElse()
        // get into the main screen now
        animateIntoMainScreen()
    }
    
    func tapTryAgainEvent(sender: AnyObject) {
        println(__FUNCTION__)
        // remove from visible region all the game over elements
        removeGameOverElements()
        self.tapPlayEvent(UIView)
    }
    
    func tapCountdownTimerEvent(sender: AnyObject) {
        println(__FUNCTION__)
        
        myTimer.invalidate()
        timerRunning = false
        self.hideForPausedGamePlayElements()
        animateIntoGamePausedElements()
    }
    
    func tapResumeEvent(sender: AnyObject) {
        println(__FUNCTION__)
        self.unhideForPausedGamePlayElements()
        animateOutofGamePausedElements()
        // Create and Add the timer Again
        startTimer()
    }
    
    /*
    when play button is touched, main screen elements need to disappear and then
    game play elements need to animate in after the finish of the main screen OUT animation.
    there would be a delay for second animation which has to be appropriate...
    */
    
    func tapPlayEvent(sender: AnyObject) {
        animateOutofMainScreen()
        animateIntoGamePlayScreen()
        startTimer()
    }
    
    // Tap Events - END
    // ######################################################################
    // ######################################################################
    // ######################################################################

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}






