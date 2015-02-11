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
    enum AnimationDirection : Int {
        case Positive = 1
        case Negative = -1
    }
    
    class ElementDetails : NSObject {
        var x_offset : CGFloat = 0
        var y_offset : CGFloat = 0
        var width    : CGFloat = 0
        var height   : CGFloat = 0
        var fillColor : UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
    }
        
    var intScore : Int = 0
    
    var offscreenXValue: CGFloat = -300.0

    var offscreenYValue: CGFloat = -300.0
    
    var screenWidth, screenHeight : CGFloat!
    
    var randomWinningElementPlacementInt = -1
    
    // ################################################################################
    
    
    // ################################################################################
    // Timers
    
    var timerCount = 0
    var timerRunning = false
    var timerGameLoopCountdown = NSTimer()
    
    var timerGetAttention = NSTimer()
    var attentionSeconds : CGFloat = 5.0 // currently not used and hardcoded
    // ################################################################################
    
    
    // ################################################################################
    // Main Screen User Interface Elements
    
    var labelApplicationTitle: UILabel!
    
    let consLabelApplicationTitleCenterX_MainScreen : CGFloat = 50.0 // percentage of screen
    let consLabelApplicationTitleCenterY_MainScreen : CGFloat = 25.0 // percentage of screen
    
    let consLabelApplicationTitleCenterX_GamePlayScreen : CGFloat = 50.0 // percentage of screen
    let consLabelApplicationTitleCenterY_GamePlayScreen : CGFloat = 10.0 // percentage of screen
    
    let consLabelApplicationTitleWidth_MainScreen : CGFloat = 40.0 // percentage of screen
    let consLabelApplicationTitleHeight_MainScreen : CGFloat = 10.0 // percentage of screen
    
    let consLabelApplicationTitleWidth_GamePlayScreen : CGFloat = 20.0 // percentage of screen
    let consLabelApplicationTitleHeight_GamePlayScreen : CGFloat = 10.0 // percentage of screen
    
    var buttonPlay: UIButton!
    
    let consButtonPlayCenterX : CGFloat = 50.0 // percentage of screen
    let consButtonPlayCenterY : CGFloat = 50.0 // percentage of screen

    var labelApplicationTitleSubtitle: UILabel!
    let consLabelApplicationTitleSubtitleCenterX_MainScreen : CGFloat = 50.0 // percentage of screen
    let consLabelApplicationTitleSubtitleCenterY_MainScreen : CGFloat = 36.0 // percentage of screen

    // ################################################################################
    

    // ################################################################################
    // Game Play User Interface Elements
    var arrayGameElements = [UIView]()
    
    let consLabelGameStats1CenterX : CGFloat = 20.0 //
    let consLabelGameStats1CenterY : CGFloat = 92.0 //
    
    let consLabelGameStats2CenterX : CGFloat = 40.0 //
    let consLabelGameStats2CenterY : CGFloat = 92.0 //
    
    let consLabelGameStats3CenterX : CGFloat = 60.0 //
    let consLabelGameStats3CenterY : CGFloat = 92.0 //
    
    let consLabelGameStats4CenterX : CGFloat = 80.0 //
    let consLabelGameStats4CenterY : CGFloat = 92.0 //
    
    var uiviewCountdownTimerView : UIView = UIView()
    var uiviewCountdownTimerViewLayer : CAShapeLayer = CAShapeLayer()
    
    var buttonCountdownTimer: UIButton!
    let consButtonCountdownTimerCenterX : CGFloat = 90.0 // percentage of screen
    let consButtonCountdownTimerCenterY : CGFloat = 7.0 // percentage of screen
    
    //var buttonCountdownTimer: UIButton!
    let consUIViewCountdownTimerCenterX : CGFloat = 70.0 // percentage of screen
    let consUIViewCountdownTimerCenterY : CGFloat = 7.0 // percentage of screen

    var labelGameStats1, labelGameStats2, labelGameStats3, labelGameStats4: UILabel!
    
    // ################################################################################
    // Game Paused User Interface Elements
    
    var labelGamePaused: UILabel!
    let consLabelGamePausedCenterX : CGFloat = 50.0 // percentage of screen
    let consLabelGamePausedCenterY : CGFloat = 30.0 // percentage of screen

    var buttonResume: UIButton!
    let consButtonResumeCenterX : CGFloat = 50.0 // percentage of screen
    let consButtonResumeCenterY : CGFloat = 70.0 // percentage of screen
    

    // ################################################################################
    // Game Over User Interface Elements
    
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
    
    var arrayColors = [
        // Primary colors
        UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
        UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0),
        UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0),
        // Secondary colors
        UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0),
        UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0),
        UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0),
        // Bright colors
        UIColor(red: 255.00/255.00, green: 204.00/255.00, blue:   0.00/255.00, alpha: 1.0),
        UIColor(red:   0.00/255.00, green:  51.00/255.00, blue: 102.00/255.00, alpha: 1.0),
        UIColor(red: 153.00/255.00, green: 102.00/255.00, blue: 153.00/255.00, alpha: 1.0),
        UIColor(red:   0.00/255.00, green: 255.00/255.00, blue: 153.00/255.00, alpha: 1.0),
        UIColor(red: 204.00/255.00, green: 204.00/255.00, blue: 204.00/255.00, alpha: 1.0)
        
//        UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
//        UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
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
        view.backgroundColor = colorAppBackground
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func startAllTimers() {
        //println(__FUNCTION__)

        if false == timerRunning {
            
            // Game Loop Countdown Timer
            timerGameLoopCountdown = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("eventGameLoopOneSecond"), userInfo: nil, repeats: true)
            timerGameLoopCountdown.tolerance = 0.10
            timerRunning = true
            
            // Attention Timer
            timerGetAttention = NSTimer.scheduledTimerWithTimeInterval(bringAttentionToWinningElement_EveryXSeconds, target: self, selector: Selector("bringAttentionToWinningElement"), userInfo: nil, repeats: true)
        }
    }
    
    
    func eventGameLoopOneSecond() {
        //println(__FUNCTION__)

        timerCount += 1
        
        // Stroke Start increase by the amount required
        self.uiviewCountdownTimerViewLayer.strokeEnd = CGFloat(timerCount)/CGFloat(intGameLoopDuration)
        
        // this needs to be animated somehow
        // I will use an entirely different element to show this element
        buttonCountdownTimer.setTitle("\(timerCount)", forState: UIControlState.Normal)
        
        // game over in 10 seconds for testing only
        if intGameLoopDuration == timerCount {
            
            println("Timer Count Reached")

            // Game Loop Countdown Timer
            timerCount = 0
            timerRunning = false
            timerGameLoopCountdown.invalidate()
            
            NSLog("Game Over this round")

            
            // Attention Timer
            timerGetAttention.invalidate()
            
            
            animateOutofGamePlayElements()
            
            animateOutofGamePlayElements_EverythingElse()
            
            
            // the above takes time so delay the following function
            delay(seconds:animateOutofGamePlayElementsDuration, completion: {
                
                // Stroke End should be 0 now, as this game is over
                self.uiviewCountdownTimerViewLayer.strokeEnd = 0.00

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
        
        labelGameStats2.text = "\(intScore)"
        labelGameStats3.text = "\(intScore)"
        labelGameStats4.text = "\(intScore)"
    }
    
    
    func bringAttentionToWinningElement() {

        var movementValue : CGFloat = 20.0
        var bringAttentionToWinningElementDuration : Double = 0.40
        
        self.arrayGameElements[randomWinningElementPlacementInt].center.x += movementValue
        
        UIView.animateWithDuration(bringAttentionToWinningElementDuration, delay: 0.00, usingSpringWithDamping: 0.05, initialSpringVelocity: 0.00, options: nil, animations: {
                self.arrayGameElements[self.randomWinningElementPlacementInt].center.x -= movementValue
            },
            completion: {_ in
                println("Attention animation done")
            })
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
        
        
        
        // ================================================================================
        // BUTTON PLAY
        buttonPlay = UIButton()
        
        // background color for buttons always comes from constants
        buttonPlay.backgroundColor = buttonBackgroundColor

        //var font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)

        var stringButtonPlayText = "PLAY"
        
        var myMutableString = NSMutableAttributedString()
        
        myMutableString = NSMutableAttributedString(string: stringButtonPlayText, attributes: [
            NSFontAttributeName:UIFont(name: "Georgia", size: 30.0)!,
            NSTextEffectAttributeName : NSTextEffectLetterpressStyle,
            ])
        
        //myMutableString.addAttribute(NSFontAttributeName, value: UIFont(name: "Georgia", size: 36.0)!, range: NSRange(location: 0,length: 4))
        
        //var font = UIFont(name: "Verdana-Bold", size: 24.0)
        //var font = UIFont.
        
//        var textColor = UIColor.greenColor()
//        
//        var attributedText = NSMutableAttributedString(string: "PLAY")
//        
//        let textFontAttributes = [NSForegroundColorAttributeName: textColor, NSFontAttributeName : font, NSTextEffectAttributeName : NSTextEffectLetterpressStyle]
//        
//        attributedText.addAttributes(textFontAttributes, range: NSMakeRange(0, "PLAY".length))
        
        //buttonPlay.setAttributedTitle(attributedText, forState: UIControlState.Normal)
        buttonPlay.setAttributedTitle(myMutableString, forState: UIControlState.Normal)
        //buttonPlay.setTitle("PLAY", forState: UIControlState.Normal)
        buttonPlay.sizeToFit()
        // font end

        var buttonPlayWidth = screenWidth * 0.40
        //var buttonPlayHeight = screenHeight * 0.20
        var buttonPlayHeight = buttonPlayWidth * 0.50
        
        //buttonPlay.frame = CGRectMake(buttonPlay.frame.origin.x, buttonPlay.frame.origin.y, buttonPlay.frame.width*2, buttonPlay.frame.height*2)
        buttonPlay.frame = CGRectMake(buttonPlay.frame.origin.x, buttonPlay.frame.origin.y, buttonPlayWidth, buttonPlayHeight)
        //buttonPlay.frame = CGRectMake(buttonPlay.frame.origin.x, buttonPlay.frame.origin.y, buttonPlayWidth, buttonPlayWidth)
        
        buttonPlay.layer.cornerRadius = buttonCornerRadius
        buttonPlay.layer.borderWidth = buttonBorderWidth
        buttonPlay.layer.borderColor = buttonBorderColor
        
        buttonPlay.center = CGPointMake(offscreenXValue, offscreenYValue)
        buttonPlay.addTarget(self, action: "tapPlayEvent:", forControlEvents: UIControlEvents.TouchUpInside)

        
        self.view.addSubview(buttonPlay)
        
        
        
        
        // ================================================================================
        // LABEL APPLICATION TITLE
        labelApplicationTitle = UILabel()
        labelApplicationTitle.text = "TOUCH"
        labelApplicationTitle.sizeToFit()
        labelApplicationTitle.textAlignment = NSTextAlignment.Center
        labelApplicationTitle.layer.cornerRadius = 15

        var labelApplicationTitleWidth = screenWidth * 0.60
        var labelApplicationTitleHeight = screenHeight * 0.15
        //labelApplicationTitle.frame = CGRectMake(labelApplicationTitle.frame.origin.x, labelApplicationTitle.frame.origin.y, labelApplicationTitle.frame.width*2, labelApplicationTitle.frame.height*2)
        labelApplicationTitle.frame = CGRectMake(labelApplicationTitle.frame.origin.x, labelApplicationTitle.frame.origin.y, labelApplicationTitleWidth, labelApplicationTitleHeight)
        
        labelApplicationTitle.layer.backgroundColor = UIColor.brownColor().CGColor
        labelApplicationTitle.center = CGPointMake(offscreenXValue, offscreenYValue)
        self.view.addSubview(labelApplicationTitle)
        
        // ================================================================================
        // LABEL APPLICATION TITLE SUBTITLE
        labelApplicationTitleSubtitle = UILabel()
        labelApplicationTitleSubtitle.text = "Can You Touch?"
        labelApplicationTitleSubtitle.sizeToFit()
        labelApplicationTitleSubtitle.textAlignment = NSTextAlignment.Center
        labelApplicationTitleSubtitle.layer.cornerRadius = 5
        
        var labelApplicationTitleSubtitleWidth = screenWidth * 0.60
        var labelApplicationTitleSubtitleHeight = screenHeight * 0.05
        labelApplicationTitleSubtitle.frame = CGRectMake(labelApplicationTitleSubtitle.frame.origin.x, labelApplicationTitleSubtitle.frame.origin.y, labelApplicationTitleSubtitleWidth, labelApplicationTitleSubtitleHeight)
        
        labelApplicationTitleSubtitle.layer.backgroundColor = UIColor.brownColor().CGColor
        labelApplicationTitleSubtitle.center = CGPointMake(offscreenXValue, offscreenYValue)
        self.view.addSubview(labelApplicationTitleSubtitle)
        
        
    }
    
    
    func createGamePlayElements()->() {
        
        // ================================================================================
        buttonCountdownTimer = UIButton()
        buttonCountdownTimer.setTitle("0", forState: UIControlState.Normal)
        buttonCountdownTimer.sizeToFit()
        buttonCountdownTimer.backgroundColor = UIColor.blueColor()
        buttonCountdownTimer.frame = CGRectMake(buttonCountdownTimer.frame.origin.x, buttonCountdownTimer.frame.origin.y,
            buttonCountdownTimer.frame.width * 0.01 * 150, buttonCountdownTimer.frame.height * 0.01 * 100)
        buttonCountdownTimer.layer.cornerRadius = 5.0
        buttonCountdownTimer.center = CGPointMake(-offscreenXValue, offscreenYValue)
        buttonCountdownTimer.addTarget(self, action: "tapCountdownTimerEvent:", forControlEvents: UIControlEvents.TouchUpInside)
        buttonCountdownTimer.alpha = 0.0
        self.view.addSubview(buttonCountdownTimer)
        
        // ================================================================================
        makeCountdownTimerView()
        self.view.addSubview(uiviewCountdownTimerView)
        
        // ================================================================================
        labelGameStats1 = makeGameStatsLabel()
        labelGameStats1.center = CGPointMake(offscreenXValue, offscreenYValue)
        self.view.addSubview(labelGameStats1)
        
        labelGameStats2 = makeGameStatsLabel()
        labelGameStats2.center = CGPointMake(offscreenXValue, offscreenYValue)
        self.view.addSubview(labelGameStats2)
        
        labelGameStats3 = makeGameStatsLabel()
        labelGameStats3.center = CGPointMake(offscreenXValue, offscreenYValue)
        self.view.addSubview(labelGameStats3)
        
        labelGameStats4 = makeGameStatsLabel()
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
        // ================================================================================
        // LABEL game over
        labelGameOver = createLabelGameOver()
        labelGameOver.text = "Game Over"
        labelGameOver.sizeToFit()
        labelGameOver.frame = CGRectMake(labelGameOver.frame.origin.x, labelGameOver.frame.origin.y, screenWidth * 0.01 * 40, labelGameOver.frame.height)
        
        //labelGameOver.center = CGPointMake(screenWidth * 0.01 * consLabelGameOverCenterX, screenHeight * 0.01 * consLabelGameOverCenterY)
        labelGameOver.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelGameOver)
        
        // ================================================================================
        // LABEL Objects touched
        
        labelObjectsTouched = createLabelGameOver()
        labelObjectsTouched.text = "Objects Touched"
        labelObjectsTouched.sizeToFit()
        
        labelObjectsTouched.frame = CGRectMake(labelObjectsTouched.frame.origin.x, labelObjectsTouched.frame.origin.y, screenWidth * 0.01 * 40, labelObjectsTouched.frame.height)
        
        labelObjectsTouched.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelObjectsTouched)
        
        // ================================================================================
        // LABEL objects touched value
        
        labelObjectsTouchedValue = createLabelGameOver()
        labelObjectsTouchedValue.text = "0"
        labelObjectsTouchedValue.sizeToFit()
        labelObjectsTouchedValue.frame = CGRectMake(labelObjectsTouchedValue.frame.origin.x, labelObjectsTouchedValue.frame.origin.y, screenWidth * 0.01 * 20, labelObjectsTouchedValue.frame.height)
        
        //labelObjectsTouchedValue.center = CGPointMake(screenWidth * 0.01 * consLabelObjectsTouchedValueCenterX, screenHeight * 0.01 * consLabelObjectsTouchedValueCenterY)
        labelObjectsTouchedValue.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelObjectsTouchedValue)
        
        // ================================================================================
        // LABEL speed
        labelSpeed = createLabelGameOver()
        labelSpeed.text = "Speed"
        labelSpeed.sizeToFit()
        
        //labelSpeed.frame = CGRectMake(labelSpeed.frame.origin.x, labelSpeed.frame.origin.y, screenWidth * 0.01 * 30, labelSpeed.frame.height)
        labelSpeed.frame = CGRectMake(labelSpeed.frame.origin.x, labelSpeed.frame.origin.y, screenWidth * 0.01 * 40, labelSpeed.frame.height)
        
        //labelSpeed.center = CGPointMake(screenWidth * 0.01 * consLabelSpeedCenterX, screenHeight * 0.01 * consLabelSpeedCenterY)
        labelSpeed.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelSpeed)
        
        // ================================================================================
        labelSpeedValue = createLabelGameOver()
        labelSpeedValue.text = "0"
        labelSpeedValue.sizeToFit()
        labelSpeedValue.frame = CGRectMake(labelSpeedValue.frame.origin.x, labelSpeedValue.frame.origin.y, screenWidth * 0.01 * 20, labelSpeedValue.frame.height)
        
        //labelSpeedValue.center = CGPointMake(screenWidth * 0.01 * consLabelSpeedValueCenterX, screenHeight * 0.01 * consLabelSpeedValueCenterY)
        labelSpeedValue.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelSpeedValue)
        
        // ================================================================================
        labelScore = createLabelGameOver()
        labelScore.text = "Score"
        labelScore.sizeToFit()
        
        labelScore.frame = CGRectMake(labelScore.frame.origin.x, labelScore.frame.origin.y, screenWidth * 0.01 * 40, labelScore.frame.height)
        
        //labelScore.center = CGPointMake(screenWidth * 0.01 * consLabelScoreCenterX, screenHeight * 0.01 * consLabelScoreCenterY)
        labelScore.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelScore)
        
        // ================================================================================
        labelScoreValue = createLabelGameOver()
        labelScoreValue.text = "0"
        labelScoreValue.sizeToFit()
        labelScoreValue.frame = CGRectMake(labelScoreValue.frame.origin.x, labelScoreValue.frame.origin.y, screenWidth * 0.01 * 20, labelScoreValue.frame.height)
        
        //labelScoreValue.center = CGPointMake(screenWidth * 0.01 * consLabelScoreValueCenterX, screenHeight * 0.01 * consLabelScoreValueCenterY)
        labelScoreValue.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelScoreValue)
        
        // ================================================================================
        buttonTryAgain = createButtonGameOver()
        buttonTryAgain.setTitle("Try Again", forState: UIControlState.Normal)
        buttonTryAgain.sizeToFit()
        buttonTryAgain.frame = CGRectMake(buttonTryAgain.frame.origin.x, buttonTryAgain.frame.origin.y, screenWidth * 0.01 * 30, buttonTryAgain.frame.height)
        
        //buttonTryAgain.center = CGPointMake(screenWidth * 0.01 * consButtonTryAgainCenterX, screenHeight * 0.01 * consButtonTryAgainCenterY)
        buttonTryAgain.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        buttonTryAgain.addTarget(self, action: "tapTryAgainEvent:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonTryAgain)
        
        // ================================================================================
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
        tempLabel.alpha = 1.0
        return tempLabel
    }
    
    func makeCountdownTimerView()->() {

        var sizeOfTimer : CGFloat = 30.00

        // ================================================================================
        // SHAPE
        uiviewCountdownTimerViewLayer = CAShapeLayer()
        
        var point = CGPointMake(sizeOfTimer/2, sizeOfTimer/2)
        
        var pi : CGFloat = 3.14
        
        uiviewCountdownTimerViewLayer.path = UIBezierPath(arcCenter:point, radius: sizeOfTimer/2, startAngle: 0, endAngle: 2 * pi, clockwise: true).CGPath
        
        // Attributes for the Shape
        uiviewCountdownTimerViewLayer.lineWidth = 7
        uiviewCountdownTimerViewLayer.lineCap = kCALineCapButt
        uiviewCountdownTimerViewLayer.strokeColor = UIColor.greenColor().CGColor
        
        //oneLayer.fillColor = UIColor.blueColor().CGColor
        //uiviewCountdownTimerViewLayer.fillColor = colorAppBackground.CGColor
        uiviewCountdownTimerViewLayer.fillColor = UIColor.blueColor().CGColor
        
        uiviewCountdownTimerViewLayer.strokeStart    = 0.00
        uiviewCountdownTimerViewLayer.strokeEnd      = 0.00
        
        // ================================================================================
        // VIEW
        // UIView for the Countdown Timer (making a filling circle as time progresses)
        // frame is x value offset, y value offset, width and then height
        uiviewCountdownTimerView = UIView(frame: CGRectMake(0, 0, sizeOfTimer, sizeOfTimer))

        //uiviewCountdownTimerView.backgroundColor = UIColor.greenColor()
        uiviewCountdownTimerView.backgroundColor = colorAppBackground
        uiviewCountdownTimerView.alpha = 1.0
        
        // Attributes for the Return View
        uiviewCountdownTimerView.layer.borderWidth = 0
        uiviewCountdownTimerView.layer.borderColor = UIColor.yellowColor().CGColor

        uiviewCountdownTimerView.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        uiviewCountdownTimerView.layer.addSublayer(uiviewCountdownTimerViewLayer)

        // translate it 90 degress anticlockwise to start the look at 12 o clock
        self.uiviewCountdownTimerView.transform = CGAffineTransformMakeRotation(-1.57)
        
        
//        var sizeOfTimer : CGFloat = 30.00
//        
//        // UIView for the Countdown Timer (making a filling circle as time progresses)
//        // frame is x value offset, y value offset, width and then height
//        var returnUIView = UIView(frame: CGRectMake(0, 0, sizeOfTimer, sizeOfTimer))
//
//        //returnUIView.backgroundColor = UIColor.greenColor()
//        returnUIView.backgroundColor = colorAppBackground
//        
//        returnUIView.alpha = 1.0
//        
//
//        // MAKING THE SHAPE LAYER
//        // create and add Shape to the UI, can be circle square or triangle or any other shape
//        let oneLayer = CAShapeLayer()
//        
//        var point = CGPointMake(sizeOfTimer/2, sizeOfTimer/2)
//
//        var pi : CGFloat = 3.14
//        
//        //oneLayer.path = UIBezierPath(ovalInRect: CGRectMake(0, 0, sizeOfTimer, sizeOfTimer)).CGPath
//        //oneLayer.path = UIBezierPath(arcCenter:point, radius: sizeOfTimer/2, startAngle: 0, endAngle: 3.14, clockwise: true).CGPath
//        //oneLayer.path = UIBezierPath(arcCenter:point, radius: sizeOfTimer/2, startAngle: 0, endAngle: 1.57, clockwise: true).CGPath
//        //oneLayer.path = UIBezierPath(arcCenter:point, radius: sizeOfTimer/2, startAngle: 0, endAngle: 6.28, clockwise: true).CGPath
//        
//        oneLayer.path = UIBezierPath(arcCenter:point, radius: sizeOfTimer/2, startAngle: 0, endAngle: 2 * pi, clockwise: true).CGPath
//
//        // Attributes for the Shape
//        oneLayer.lineWidth = 10
//        oneLayer.lineCap = kCALineCapButt
//        oneLayer.strokeColor = UIColor.magentaColor().CGColor
//        
//        //oneLayer.fillColor = UIColor.blueColor().CGColor
//        oneLayer.fillColor = colorAppBackground.CGColor
//        
//        oneLayer.strokeStart    = 0.00
//        oneLayer.strokeEnd      = 0.65
//        
//        
//        // Adding the Shape to the Return View
//        returnUIView.layer.addSublayer(oneLayer)
//        
//        // Attributes for the Return View
//        returnUIView.layer.borderWidth = 0
//        returnUIView.layer.borderColor = UIColor.yellowColor().CGColor
//
//        returnUIView.center = CGPointMake(offscreenXValue, offscreenYValue)
//        
//        return returnUIView
    }
    
    
    func animateCountdownTimer () -> () {
    
        
    }
    
    
    // ################################################################################
    // ################################################################################
    // ################################################################################
    // Animation Functions - START
    
    func animateIntoMainScreen () -> () {
        println(__FUNCTION__)
        
        buttonPlay.alpha = 1.0
        buttonPlay.center = CGPointMake(screenWidth * 0.01 * consButtonPlayCenterX, screenHeight * 0.01 * consButtonPlayCenterY)
        
        labelApplicationTitle.alpha = 1.0
        labelApplicationTitle.center = CGPointMake(screenWidth * 0.01 * consLabelApplicationTitleCenterX_MainScreen, screenHeight * 0.01 * consLabelApplicationTitleCenterY_MainScreen)
        
        labelApplicationTitleSubtitle.alpha = 1.0
        labelApplicationTitleSubtitle.center = CGPointMake(screenWidth * 0.01 * consLabelApplicationTitleSubtitleCenterX_MainScreen, screenHeight * 0.01 * consLabelApplicationTitleSubtitleCenterY_MainScreen)
        
        UIView.animateWithDuration(1.0, animations: {
            
            //self.buttonPlay.alpha = 1.0
            //self.labelApplicationTitle.alpha = 1.0
            
            }, completion: {_ in
                NSLog("CAME TO MAIN SCREEN")
                
                // ONLY FOR TESTING
                //self.tapPlayEvent(UIView)
        })
    }
    
    
    func animateOutofMainScreen () -> () {
        println(__FUNCTION__)

        UIView.animateWithDuration(animateOutofMainScreenDuration, animations: {
            
            self.buttonPlay.alpha = 0.0
            
            self.labelApplicationTitleSubtitle.alpha = 0.00
            
            //self.labelApplicationTitle.alpha = 0.0
            
            self.labelApplicationTitle.transform = CGAffineTransformMakeScale(0.25, 0.25)
//            self.labelApplicationTitle.transform = CGAffineTransformMakeScale(self.consLabelApplicationTitleWidth_GamePlayScreen/self.consLabelApplicationTitleWidth_MainScreen,
//                self.consLabelApplicationTitleHeight_GamePlayScreen/self.consLabelApplicationTitleHeight_MainScreen)
            
            //self.labelApplicationTitle.textAlignment = NSTextAlignment.Center
            
            self.labelApplicationTitle.center = CGPointMake(self.screenWidth * 0.01 * self.consLabelApplicationTitleCenterX_GamePlayScreen, self.screenHeight * 0.01 * self.consLabelApplicationTitleCenterY_GamePlayScreen)
            
            
            }, completion: {_ in

//                self.labelApplicationTitle.transform = CGAffineTransformIdentity
//                
//                self.labelApplicationTitle.frame = CGRectMake(self.labelApplicationTitle.center.x, self.labelApplicationTitle.center.y, self.screenWidth * 0.01 * self.consLabelApplicationTitleWidth_GamePlayScreen, self.screenHeight * 0.01 * self.consLabelApplicationTitleHeight_GamePlayScreen)

                self.removeMainScreenElements()
                NSLog("OUT OF MAIN SCREEN")
        })
    }
    
    
    
    func animateIntoGamePlayScreen () -> () {
        println(__FUNCTION__)
        
        // bring the elements (as required) to visible area
        // also set the alpha to 0, which means invisible
        
        // this value is expected to be 0 at this time, but setting it here would cause animation problems.
        //labelApplicationTitle.alpha = 0.0
        //labelApplicationTitle.center = CGPointMake(screenWidth * 0.01 * consLabelApplicationTitleCenterX_GamePlayScreen,
        //    screenHeight * 0.01 * consLabelApplicationTitleCenterY_GamePlayScreen)

//        labelAction.alpha = 0.0
//        labelAction.center = CGPointMake(screenWidth * 0.01 * consLabelActionCenterX, screenHeight * 0.01 * consLabelActionCenterY)

        buttonCountdownTimer.alpha = 1.00
        buttonCountdownTimer.center = CGPointMake(screenWidth * 0.01 * consButtonCountdownTimerCenterX, screenHeight * 0.01 * consButtonCountdownTimerCenterY)
        
        self.uiviewCountdownTimerView.alpha = 1.0
        uiviewCountdownTimerView.center = CGPointMake(screenWidth * 0.01 * consUIViewCountdownTimerCenterX + movementCountdownTimerView,
            screenHeight * 0.01 * consUIViewCountdownTimerCenterY)
        self.uiviewCountdownTimerViewLayer.strokeStart = 0.00
        self.uiviewCountdownTimerViewLayer.strokeEnd = 0.00

        
        labelGameStats1.alpha = 1.0
        labelGameStats2.alpha = 1.0
        labelGameStats3.alpha = 1.0
        labelGameStats4.alpha = 1.0
        
        labelGameStats1.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats1CenterX, screenHeight * 0.01 * consLabelGameStats1CenterY + movementGameStatsLabel)
        labelGameStats2.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats2CenterX, screenHeight * 0.01 * consLabelGameStats2CenterY + movementGameStatsLabel)
        labelGameStats3.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats3CenterX, screenHeight * 0.01 * consLabelGameStats3CenterY + movementGameStatsLabel)
        labelGameStats4.center = CGPointMake(screenWidth * 0.01 * consLabelGameStats4CenterX, screenHeight * 0.01 * consLabelGameStats4CenterY + movementGameStatsLabel)
        
        
        UIView.animateWithDuration(animateIntoGamePlayScreenDuration, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {

            self.labelGameStats1.center = CGPointMake(self.screenWidth * 0.01 * self.consLabelGameStats1CenterX,
                self.screenHeight * 0.01 * self.consLabelGameStats1CenterY - movementGameStatsLabel)
            self.labelGameStats2.center = CGPointMake(self.screenWidth * 0.01 * self.consLabelGameStats2CenterX,
                self.screenHeight * 0.01 * self.consLabelGameStats2CenterY - movementGameStatsLabel)
            self.labelGameStats3.center = CGPointMake(self.screenWidth * 0.01 * self.consLabelGameStats3CenterX,
                self.screenHeight * 0.01 * self.consLabelGameStats3CenterY - movementGameStatsLabel)
            self.labelGameStats4.center = CGPointMake(self.screenWidth * 0.01 * self.consLabelGameStats4CenterX,
                self.screenHeight * 0.01 * self.consLabelGameStats4CenterY - movementGameStatsLabel)
            
            self.uiviewCountdownTimerView.center = CGPointMake(self.screenWidth * 0.01 * self.consUIViewCountdownTimerCenterX - movementCountdownTimerView,
                self.screenHeight * 0.01 * self.consUIViewCountdownTimerCenterY)

//            self.buttonCountdownTimer.alpha = 1.0
//            self.labelGameStats1.alpha = 1.0
//            self.labelGameStats2.alpha = 1.0
//            self.labelGameStats3.alpha = 1.0
//            self.labelGameStats4.alpha = 1.0
//            self.uiviewCountdownTimerView.alpha = 1.0

            }, completion: {_ in
                NSLog("CAME TO GAME PLAY SCREEN")
                
                
                
        })
    }
    
    func animateOutofGamePlayScreen () -> () {
        println(__FUNCTION__)
        
    }
    
    
    func animateIntoGamePlayElements()->() {
        println(__FUNCTION__)

        for iCount in 0..<self.arrayGameElements.count {
            self.arrayGameElements[iCount].center = CGPointMake(self.arrayGameElements[iCount].center.x + 1000, self.arrayGameElements[iCount].center.y)
            self.arrayGameElements[iCount].alpha = 1.00
        }
        
        UIView.animateWithDuration(animateIntoGamePlayElementsDuration, delay: 0.00, options: .CurveEaseOut, animations: {
                for iCount in 0..<self.arrayGameElements.count {
                    self.arrayGameElements[iCount].center = CGPointMake(self.arrayGameElements[iCount].center.x - 500, self.arrayGameElements[iCount].center.y)
                }
            }, completion: {_ in
                println("Animation completed animateIntoGamePlayElements")
            }
        )
        
//        var additiveDelay :Double = 0.05
//        var animationDuration : Double = 0.15
//        
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
    }
    
    
    func animateOutofGamePlayElements()->() {
        println(__FUNCTION__)
        
        UIView.animateWithDuration(animateOutofGamePlayElementsDuration, delay: 0.00, options: .CurveEaseOut, animations: {
            
            // giving the constant here for 500 is not working, animationElementsToOffScreen_XValue
            for iCount in 0..<self.arrayGameElements.count {
                self.arrayGameElements[iCount].center = CGPointMake(self.arrayGameElements[iCount].center.x - 500, self.arrayGameElements[iCount].center.y)
            }
            
            }, completion: {_ in
                println("out of game elements Animation completed.")
        })
        
//        var additiveDelay :Double = 0.02
//        var animationDuration : Double = 0.10
//        
//        for iCount in 0..<arrayGameElements.count {
//            //arrayGameElements[iCount].transform = CGAffineTransformMakeScale(0, 0)
//            //arrayGameElements[iCount].alpha = 1.0
//            
//            UIView.animateWithDuration(animationDuration, delay: Double(iCount) * additiveDelay, options: .CurveEaseOut, animations: {
//                //self.arrayGameElements[iCount].transform = CGAffineTransformMakeScale(0, 0)
//                self.arrayGameElements[iCount].alpha = 0.0
//                }, completion: {_ in
//                    println("out of game elements Animation completed \(iCount)")
//            })
//        }
    }
    
    func animateOutofGamePlayElements_EverythingElse()->() {
        println(__FUNCTION__)

        UIView.animateWithDuration(animateOutofGamePlayElementsDuration, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.labelGameStats1.center = CGPointMake(self.screenWidth * 0.01 * self.consLabelGameStats1CenterX,
                self.screenHeight * 0.01 * self.consLabelGameStats1CenterY + movementGameStatsLabel)
            self.labelGameStats2.center = CGPointMake(self.screenWidth * 0.01 * self.consLabelGameStats2CenterX,
                self.screenHeight * 0.01 * self.consLabelGameStats2CenterY + movementGameStatsLabel)
            self.labelGameStats3.center = CGPointMake(self.screenWidth * 0.01 * self.consLabelGameStats3CenterX,
                self.screenHeight * 0.01 * self.consLabelGameStats3CenterY + movementGameStatsLabel)
            self.labelGameStats4.center = CGPointMake(self.screenWidth * 0.01 * self.consLabelGameStats4CenterX,
                self.screenHeight * 0.01 * self.consLabelGameStats4CenterY + movementGameStatsLabel)

            
            //self.buttonCountdownTimer.center =
            self.uiviewCountdownTimerView.center = CGPointMake(self.screenWidth * 0.01 * self.consUIViewCountdownTimerCenterX + movementCountdownTimerView,
                self.screenHeight * 0.01 * self.consUIViewCountdownTimerCenterY)

            }, completion: {_ in
                NSLog("CAME TO GAME PLAY SCREEN")
        })
        
        
        
//        var additiveDelay :Double = 0.02
//        var animationDuration : Double = 0.10
//        
//        UIView.animateWithDuration(animationDuration, delay: 1.0, options: .CurveEaseOut, animations: {
//
////            self.labelGameStats1.alpha = 0.0
////            self.labelGameStats2.alpha = 0.0
////            self.labelGameStats3.alpha = 0.0
////            self.labelGameStats4.alpha = 0.0
////            self.buttonCountdownTimer.alpha = 0.0
////            self.uiviewCountdownTimerView.alpha = 0.0
//
//                }, completion: {_ in
//                    println("animation complete everything else game play elements")
//        })
    }

    
    func animateIntoGamePausedElements()->() {
        println(__FUNCTION__)

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
        println(__FUNCTION__)

        labelGamePaused.center = CGPointMake(offscreenXValue, offscreenYValue)
        buttonResume.center = CGPointMake(offscreenXValue, offscreenYValue)
        buttonQuit.center = CGPointMake(offscreenXValue, offscreenYValue)
    }
    
    
    func animateIntoGameOverElements()->() {
        println(__FUNCTION__)

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
    
    func animateOutOfGameOverElements()->() {
        println(__FUNCTION__)
        
        UIView.animateWithDuration(animateOutOfGameOverElementsDuration, delay: 0.00, options: .CurveEaseOut, animations: {
            
            self.labelApplicationTitle.transform = CGAffineTransformIdentity
            self.labelApplicationTitle.center = CGPointMake(self.screenWidth * 0.01 * self.consLabelApplicationTitleCenterX_MainScreen, self.screenHeight * 0.01 * self.consLabelApplicationTitleCenterY_MainScreen)

            }, completion: {_ in
                println("")
                self.buttonCountdownTimer.setTitle("\(self.timerCount)", forState: UIControlState.Normal)
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
        println(__FUNCTION__)
        self.buttonPlay.center = CGPointMake(self.offscreenXValue, self.offscreenYValue)
        self.labelApplicationTitleSubtitle.center = CGPointMake(self.offscreenXValue, self.offscreenYValue)
        //self.labelApplicationTitle.center = CGPointMake(self.offscreenXValue, self.offscreenYValue)
    }

    func removeGamePlayElements()->() {
        println(__FUNCTION__)
        // REMOVING FROM VIEW
        for iCount in 0..<self.arrayGameElements.count {
            self.arrayGameElements[iCount].removeFromSuperview()
        }
        // CLEARING THE ARRAY
        self.arrayGameElements.removeAll(keepCapacity: true)
    }

    func hideForPausedGamePlayElements()->() {
        println(__FUNCTION__)
        for iCount in 0..<self.arrayGameElements.count {
            self.arrayGameElements[iCount].alpha = 0.0
        }
        labelGameStats1.alpha = 0.0
        labelGameStats2.alpha = 0.0
        labelGameStats3.alpha = 0.0
        labelGameStats4.alpha = 0.0
    }
    
    func unhideForPausedGamePlayElements()->() {
        println(__FUNCTION__)
        for iCount in 0..<self.arrayGameElements.count {
            self.arrayGameElements[iCount].alpha = 1.0
        }
        labelGameStats1.alpha = 1.0
        labelGameStats2.alpha = 1.0
        labelGameStats3.alpha = 1.0
        labelGameStats4.alpha = 1.0
    }
    
    func removeGamePlayElements_EverythingElse()->() {
        println(__FUNCTION__)
        // These elements are only moved offscreen
        // and not actually deleted/removed from the view
        labelGameStats1.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelGameStats2.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelGameStats3.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelGameStats4.center = CGPointMake(offscreenXValue, offscreenYValue)

        buttonCountdownTimer.center = CGPointMake(offscreenXValue, offscreenYValue)
        uiviewCountdownTimerView.center = CGPointMake(offscreenXValue, offscreenYValue)
        
//        labelAction.center = CGPointMake(offscreenXValue, offscreenYValue)
    }

    func removeGameOverElements()->() {
        println(__FUNCTION__)
        
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
        println(__FUNCTION__)
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
        
        let sizeElement01_Width : CGFloat = 100.0 / CGFloat(numberRowsOrColumns)
        let sizeElement01_Height : CGFloat = 100.0 / CGFloat(numberRowsOrColumns)
        
        // how to choose the correct height and width where elements will go
        // 60 % of height will be used 
        // or width will be used if 60% of height is more than width
        
        println("ratio of width to height currently: \(screenWidth)\\\(screenHeight)")
        
        var usableHeightTotal : CGFloat = 0.60 * screenHeight
        var usableWidthTotal : CGFloat = 0.00
        
        if usableHeightTotal > screenWidth {
            usableHeightTotal = CGFloat(screenWidth)
            usableWidthTotal = CGFloat(screenWidth)
        } else {
            // usableHeight has a good value
            usableWidthTotal = usableHeightTotal
        }
        
        var usableWidthElement : CGFloat = CGFloat(usableWidthTotal) / CGFloat(numberRowsOrColumns)
        var usableHeightElement : CGFloat = CGFloat(usableWidthTotal) / CGFloat(numberRowsOrColumns)
        
        // ================================================================================
        // ================================================================================
        

        // Offsets
        var X_offset = ( screenWidth - usableWidthTotal ) / 2
        var Y_offset = ( screenHeight - usableHeightTotal ) / 2
        

        let pointTopLeftElement01 = CGPointMake(X_offset, Y_offset)
        
        var elementDetailsObj = ElementDetails()
        
        var randomNumber2 : CGFloat = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        var randomWinningElementPlacement : CGFloat = randomNumber2 * CGFloat(numberRowsOrColumns  * numberRowsOrColumns)
        randomWinningElementPlacementInt = Int(randomWinningElementPlacement)
        println("randomWinningElementPlacementInt is \(randomWinningElementPlacementInt)")

        
        for i in 0..<numberRowsOrColumns {
            
            //println("i is \(i)")
            
            for j in 0..<numberRowsOrColumns {
            
                //println("j is \(j)")
                
                //elementDetailsObj.x_offset = (CGFloat(j) * (screenWidth * 0.01 * sizeElement01_Width))
                elementDetailsObj.x_offset = X_offset + (CGFloat(j) * usableWidthElement)
                
                //elementDetailsObj.y_offset = (CGFloat(i) * (screenWidth * 0.01 * sizeElement01_Height)) + (screenHeight - screenWidth)/2
                elementDetailsObj.y_offset = Y_offset + (CGFloat(i) * usableHeightElement)
                
                
                elementDetailsObj.width = usableWidthElement
                elementDetailsObj.height = usableHeightElement

                
                let recognizer = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
                
                recognizer.numberOfTapsRequired = 1
                recognizer.numberOfTouchesRequired = 1
                recognizer.delegate = self

                // Check whether you are at the winning element, if yes it is a different scenario
                if ((i*numberRowsOrColumns + j) == randomWinningElementPlacementInt) {
                //if ((i*numberRowsOrColumns + j) == arrayGameElements_WinningElement) {
                    //elementDetailsObj.fillColor = arrayColors[arrayGameElements_WinningElement]
                    elementDetailsObj.fillColor = UIColor.blackColor()
                } else {
                    elementDetailsObj.fillColor = returnOtherColor(1.0, inGreen: 0.0, inBlue: 0.0)
                }
                
                // elementtype parameter is not used, can be cleaned up from the function
                var tempViewToAddToArray = makeGameElementWithDetails(elementDetailsObj, ElementType:0)
                
                tempViewToAddToArray.addGestureRecognizer(recognizer)
                
                //arrayGameElements[i * numberRowsOrColumns + j] = tempViewToAddToArray
                arrayGameElements.insert(tempViewToAddToArray, atIndex: i * numberRowsOrColumns + j)
                
                tempViewToAddToArray.center = CGPointMake(tempViewToAddToArray.center.x - 500, tempViewToAddToArray.center.y)
                
                self.view.addSubview(tempViewToAddToArray)
                
            }
        }
        
        animateIntoGamePlayElements()
        
    }
    
    func makeGameElementWithDetails (e_details: ElementDetails, ElementType:Int) -> (UIView) {
        
        var tempElement = UIView(frame: CGRectMake(e_details.x_offset, e_details.y_offset, e_details.width, e_details.height))
        
        tempElement.backgroundColor = UIColor(red: 204.0, green: 204.0, blue: 153.0, alpha: 1.0)
        
        tempElement.alpha = 1.0
        
        
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
        
        randomX = blackDotSize
        oneLayer.path = UIBezierPath(ovalInRect: CGRectMake(
            (e_details.width  - randomX * e_details.width )/2,
            (e_details.height - randomX * e_details.height)/2,
            randomX * e_details.width,
            randomX * e_details.height)).CGPath

        
        // attributes
        oneLayer.lineWidth = 4
        oneLayer.strokeColor = UIColor.whiteColor().CGColor
        //oneLayer.strokeColor = UIColor.magentaColor().CGColor
        
        //oneLayer.fillColor = UIColor.blueColor().CGColor
        oneLayer.fillColor = e_details.fillColor.CGColor
//        // HARDCODING the fill color to BLACK
//        oneLayer.fillColor = UIColor.blackColor().CGColor
        
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

        // THIS PICKS THE COLOR FROM THE ARRAYCOLOR AT RANDOM
        var randomForColor = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        var randomForColorHigher = randomForColor * CGFloat(arrayColors.count)
        var randomForColorHigherInt = Int(randomForColorHigher)
        
        return arrayColors[randomForColorHigherInt]
    }
    
    func handleTap(recognizer: UITapGestureRecognizer) {
        println(__FUNCTION__)

        // Attention timer invalidate
        timerGetAttention.invalidate()
        
        for iCount in 0..<arrayGameElements.count {
            if recognizer.view === arrayGameElements[iCount] {
                //println("User has tapped Element \(iCount)")
                
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
        
        
        delay(seconds:animateOutofGamePlayElementsDuration, completion: {
            println("finished delay and waiting inside handleTap")
            
            self.removeGamePlayElements()

            // Create new game elements with some logic which changes the elements everytime
            // the function is called
            // this function also brings the created elements into visible area with animation
            // that delay is used in the next line
            self.createGameElementsForNextRound()

//            self.delay(seconds:animateIntoGamePlayElementsDuration, completion: {
//                self.timerGetAttention =
//                    NSTimer.scheduledTimerWithTimeInterval(
//                        bringAttentionToWinningElement_EveryXSeconds,
//                        target: self,
//                        selector: Selector("bringAttentionToWinningElement"),
//                        userInfo: nil,
//                        repeats: true)
//            })
        })
    }
    
    func delay(#seconds: Double, completion:()->()) {
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
        
        dispatch_after(popTime, dispatch_get_main_queue()) {
            completion()
        }
    }

    
    func handleOneRoundWin() {
        println(__FUNCTION__)

        // ================================================================================
        // Increase the Score - Total Correctly Touched Objects
        intScore++

        // simple change of label text
        //labelGameStats1.text = "\(intScore)"
        
        cubeTransition(labelGameStats1, text: "\(intScore)", direction: AnimationDirection.Negative)
        
        labelGameStats2.text = "\(intScore)"
        labelGameStats3.text = "\(intScore)"
        labelGameStats4.text = "\(intScore)"

        //buttonCountdownTimer.setTitle("\(timerCount)", forState: UIControlState.Normal)
        // update all other game statistics
    }
    
    
    func cubeTransition(label: UILabel, text: String, direction: AnimationDirection) {
        
        let originalFrame = label.frame
        
        var newLabel = UILabel(frame: originalFrame)
        newLabel.text = text
        
        newLabel.textAlignment = label.textAlignment
        newLabel.textColor = label.textColor
        newLabel.backgroundColor = label.backgroundColor
        
        newLabel.layer.backgroundColor = label.layer.backgroundColor
        newLabel.layer.cornerRadius = label.layer.cornerRadius
        newLabel.layer.borderWidth = label.layer.borderWidth
        newLabel.layer.borderColor = label.layer.borderColor
        
        let newLabelOffset = CGFloat(direction.rawValue) * originalFrame.size.height/2
        
        newLabel.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, 0), CGAffineTransformMakeTranslation(0, newLabelOffset))
        
        view.addSubview(newLabel)

        UIView.animateWithDuration(cubeTransitionDuration, delay: 0.00, options: UIViewAnimationOptions.CurveEaseOut, animations: {

            newLabel.transform = CGAffineTransformIdentity
            label.transform = CGAffineTransformConcat(
                CGAffineTransformMakeScale(1.00, 0.10),
                CGAffineTransformMakeTranslation(0, -newLabelOffset)
            )
            
            }, completion: { _ in
                
                label.text = text
                label.transform = CGAffineTransformIdentity
                
                newLabel.removeFromSuperview()
        })
    }
    
    
    func handleOneRoundLose() {
        println(__FUNCTION__)

    }
    
    // ######################################################################
    // ######################################################################
    // ######################################################################
    // Tap Events - START

    func tapQuitEvent(sender: AnyObject) {
        println(__FUNCTION__)

        timerCount = 0
        timerGameLoopCountdown.invalidate()
        timerRunning = false
        
        // remove from visible region all the game over elements
        removeGameOverElements()
        removeGamePausedElements()
        
        //self.labelApplicationTitle.transform = CGAffineTransformMakeScale(1.00/0.25, 1.00/0.25)
        //self.labelApplicationTitle.transform = CGAffineTransformIdentity
        
        animateOutOfGameOverElements()
        
        //removeGameOverElements_EverythingElse()
        // get into the main screen now
        delay(seconds:animateOutOfGameOverElementsDuration, completion: {
            self.animateIntoMainScreen()
        })
    }
    
    func tapTryAgainEvent(sender: AnyObject) {
        println(__FUNCTION__)
        
        // remove from visible region all the game over elements
        removeGameOverElements()
        
        self.tapPlayEvent(UIView)
    }
    
    func tapCountdownTimerEvent(sender: AnyObject) {
        println(__FUNCTION__)
        
        timerGameLoopCountdown.invalidate()
        timerRunning = false
        self.hideForPausedGamePlayElements()
        animateIntoGamePausedElements()
    }
    
    func tapResumeEvent(sender: AnyObject) {
        println(__FUNCTION__)
        self.unhideForPausedGamePlayElements()
        animateOutofGamePausedElements()
        // Create and Add the timer Again
        startAllTimers()
    }
    
    /*
    when play button is touched, main screen elements need to disappear and then
    game play elements need to animate in after the finish of the main screen OUT animation.
    there would be a delay for second animation which has to be appropriate...
    */
    
    func tapPlayEvent(sender: AnyObject) {
        animateOutofMainScreen()
        
        delay(seconds:animateOutofMainScreenDuration, completion: {
            println("delay animateOutofMainScreenDuration introduced here!")

            self.animateIntoGamePlayScreen()
            
            self.createGameElementsForNextRound()
            
            
            self.delay(seconds:animateIntoGamePlayScreenDuration+animateIntoGamePlayElementsDuration, completion: {
                self.startAllTimers()
            })
            
        })
    }
    
    // Tap Events - END
    // ######################################################################
    // ######################################################################
    // ######################################################################
}






