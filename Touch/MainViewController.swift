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
    
    var offscreenXValue: CGFloat = -500.0

    var offscreenYValue: CGFloat = -500.0
    
    var screenWidth, screenHeight : CGFloat!
    
    var randomWinningElementPlacementInt = -1
    
    var animationInProgressGamePlayElements = false
    
    var gameloopTimerFrequencyCallsPerSecond : Int = 1

    var boolElementsDisabled = false
    
    var averageTimePerTouch : CGFloat = 0.00
    
    var objectsTouchedInThisGameLoop : CGFloat = 0
        
    var touchTimeStartAt = CFAbsoluteTimeGetCurrent() // the default will not be used
    
    //let rainEmitter = SKEmitterNode(fileNamed: "rain.sks")
//    let emitter = CAEmitterLayer()
//    rainEmitter.position = CGPoint(x: 100, y: 100)
//    addChild(rainEmitter)
    // ################################################################################
    
    
    // ################################################################################
    // Timers
    
    var timerCount = 0
    var timerCountLocal = 0
    
    var timerRunning = false
    var timerGameLoopCountdown = NSTimer()
    
    var timerGetAttention = NSTimer()
    //var attentionSeconds : CGFloat = 5.0 // currently not used and hardcoded
    
    var timerMaxDurationToTouch = NSTimer()

    // ################################################################################
    
    
    // ################################################################################
    // Main Screen User Interface Elements
    
    var labelApplicationTitle: UILabel!
    
    let consLabelApplicationTitleCenterX_MainScreen : CGFloat = 0.50 // percentage of screen
    let consLabelApplicationTitleCenterY_MainScreen : CGFloat = 0.30 // percentage of screen
    
    let consLabelApplicationTitleCenterX_GamePlayScreen : CGFloat = 0.50 // percentage of screen
    let consLabelApplicationTitleCenterY_GamePlayScreen : CGFloat = 0.20 // percentage of screen
    
    let consLabelApplicationTitleWidth_MainScreen : CGFloat = 0.40 // percentage of screen
    let consLabelApplicationTitleHeight_MainScreen : CGFloat = 0.10 // percentage of screen
    
    let consLabelApplicationTitleWidth_GamePlayScreen : CGFloat = 0.20 // percentage of screen
    let consLabelApplicationTitleHeight_GamePlayScreen : CGFloat = 0.10 // percentage of screen
    
    var buttonPlay: UIButton!
    
    let consButtonPlayCenterX : CGFloat = 0.50 // percentage of screen
    let consButtonPlayCenterY : CGFloat = 0.50 // percentage of screen

    var labelApplicationTitleSubtitle: UILabel!
    let consLabelApplicationTitleSubtitleCenterX_MainScreen : CGFloat = 0.50 // percentage of screen
    let consLabelApplicationTitleSubtitleCenterY_MainScreen : CGFloat = 0.35 // percentage of screen

    var labelVersion: UILabel!
    let consLabelVersionCenterX : CGFloat = 0.50 // percentage of screen
    let consLabelVersionCenterY : CGFloat = 0.90 // percentage of screen
    
    // ################################################################################
    

    // ################################################################################
    // Game Play User Interface Elements
    var arrayGameElements = [UIView]()
    
    let consLabelGameStats1CenterX : CGFloat = 0.30 //
    let consLabelGameStats1CenterY : CGFloat = 0.80 //
    
    let consLabelGameStats2CenterX : CGFloat = 0.4333 //
    let consLabelGameStats2CenterY : CGFloat = 0.80 //
    
    let consLabelGameStats3CenterX : CGFloat = 0.5666 //
    let consLabelGameStats3CenterY : CGFloat = 0.80 //
    
    let consLabelGameStats4CenterX : CGFloat = 0.70 //
    let consLabelGameStats4CenterY : CGFloat = 0.80 //
    
    var uiviewCountdownTimerView : UIView = UIView()
    var uiviewCountdownTimerViewLayer : CAShapeLayer = CAShapeLayer()
    
    var buttonCountdownTimer: UIButton!
    let consButtonCountdownTimerCenterX : CGFloat = 0.70 // percentage of screen
    let consButtonCountdownTimerCenterY : CGFloat = 0.20 // percentage of screen
    
    let consUIViewCountdownTimerCenterX : CGFloat = 0.70 // percentage of screen
    let consUIViewCountdownTimerCenterY : CGFloat = 0.20 // percentage of screen

    var labelGameStats1, labelGameStats2, labelGameStats3, labelGameStats4: UILabel!
    
    // ################################################################################
    // Game Paused User Interface Elements
    
    var labelGamePaused: UILabel!
    let consLabelGamePausedCenterX : CGFloat = 0.50 // percentage of screen
    let consLabelGamePausedCenterY : CGFloat = 0.30 // percentage of screen

    var buttonResume: UIButton!
    let consButtonResumeCenterX : CGFloat = 0.50 // percentage of screen
    let consButtonResumeCenterY : CGFloat = 0.50 // percentage of screen
    

    // ################################################################################
    // Game Over User Interface Elements
    
    var labelGameOver: UILabel!
    let consLabelGameOverCenterX : CGFloat = 0.50 // percentage of screen
    let consLabelGameOverCenterY : CGFloat = 0.30 // percentage of screen
    
    var labelObjectsTouched: UILabel!
    let consLabelObjectsTouchedCenterX : CGFloat = 0.40 // percentage of screen
    let consLabelObjectsTouchedCenterY : CGFloat = 0.40 // percentage of screen
    
    var labelObjectsTouchedValue: UILabel!
    let consLabelObjectsTouchedValueCenterX : CGFloat = 0.70 // percentage of screen
    let consLabelObjectsTouchedValueCenterY : CGFloat = 0.40 // percentage of screen
    
    var labelSpeed: UILabel!
    let consLabelSpeedCenterX : CGFloat = 0.40 // percentage of screen
    let consLabelSpeedCenterY : CGFloat = 0.50 // percentage of screen
    
    var labelSpeedValue: UILabel!
    let consLabelSpeedValueCenterX : CGFloat = 0.70 // percentage of screen
    let consLabelSpeedValueCenterY : CGFloat = 0.50 // percentage of screen
    
    var labelScore: UILabel!
    let consLabelScoreCenterX : CGFloat = 0.40 // percentage of screen
    let consLabelScoreCenterY : CGFloat = 0.60 // percentage of screen
    
    var labelScoreValue: UILabel!
    let consLabelScoreValueCenterX : CGFloat = 0.70 // percentage of screen
    let consLabelScoreValueCenterY : CGFloat = 0.60 // percentage of screen
    
    var buttonTryAgain: UIButton!
    let consButtonTryAgainCenterX : CGFloat = 0.50 // percentage of screen
    let consButtonTryAgainCenterY : CGFloat = 0.75 // percentage of screen
    
    var buttonQuit: UIButton!
    let consButtonQuitCenterX : CGFloat = 0.50 // percentage of screen
    let consButtonQuitCenterY : CGFloat = 0.85 // percentage of screen
    
    
    var uiviewGameOverView_AllTime : UIView = UIView()
    var uiviewGameOverView_LastGame : UIView = UIView()

    
    // ################################################################################
    // ################################################################################
    
    var arrayColors = [
        
        // Primary colors - Red, Green, Blue
        UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
        UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0),
        UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0),
        
        // Secondary colors - Yellow, Magenta, Cyan
        UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0),
        UIColor(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0),
        UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0),

        
        
/*
        // Add colors here - START
        // violet blue
        UIColor(red: 102.00/255.00, green:   0.00/255.00, blue: 204.00/255.00, alpha: 1.0),
        // tangerine, orange yellow
        UIColor(red: 255.00/255.00, green: 204.00/255.00, blue:   0.00/255.00, alpha: 1.0),
        // yellow green
        UIColor(red: 255.00/255.00, green: 255.00/255.00, blue: 102.00/255.00, alpha: 1.0),

        // midnight blue
        UIColor(red:   0.00/255.00, green:  51.00/255.00, blue: 102.00/255.00, alpha: 1.0),
        // orange red ---
        UIColor(red: 255.00/255.00, green: 153.00/255.00, blue: 102.00/255.00, alpha: 1.0),
        // orange red --- blaze orange
        UIColor(red: 255.00/255.00, green: 102.00/255.00, blue:   2.00/255.00, alpha: 1.0),
        // violet
        UIColor(red: 102.00/255.00, green:   0.00/255.00, blue: 153.00/255.00, alpha: 1.0),
        // danube
        UIColor(red: 102.00/255.00, green: 153.00/255.00, blue: 204.00/255.00, alpha: 1.0),

        
        // dodger blue
        UIColor(red:  51.00/255.00, green: 153.00/255.00, blue: 255.00/255.00, alpha: 1.0),
        // finlandia green
        UIColor(red:  88.00/255.00, green: 112.00/255.00, blue:  88.00/255.00, alpha: 1.0),

        // pacific blue
        UIColor(red:   0.00/255.00, green: 153.00/255.00, blue: 204.00/255.00, alpha: 1.0),
        // snowy mint
        UIColor(red: 204.00/255.00, green: 255.00/255.00, blue: 204.00/255.00, alpha: 1.0),
        // smalt, blue
        UIColor(red:   0.00/255.00, green:  51.00/255.00, blue: 153.00/255.00, alpha: 1.0),
*/
        // Add colors here - END

        // White
        //UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
        // Black
        //UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        // Add colors here - end
        
//        // Other Bright colors
//        UIColor(red: 153.00/255.00, green: 102.00/255.00, blue: 153.00/255.00, alpha: 1.0),
//        UIColor(red:   0.00/255.00, green: 255.00/255.00, blue: 153.00/255.00, alpha: 1.0),
//        UIColor(red: 204.00/255.00, green: 204.00/255.00, blue: 204.00/255.00, alpha: 1.0)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var screen: UIScreen = UIScreen.mainScreen()
        
        screenWidth = screen.bounds.size.width
        screenHeight = screen.bounds.size.height
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onNotification_applicationDidBecomeActive:",
            name: notificationName_applicationDidBecomeActive,
            object: nil)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onNotification_applicationDidEnterBackground:",
            name: notificationName_applicationDidEnterBackground,
            object: nil)
        
        // Play background music
        var objCommon = CommonFunctions()
        //objCommon.playBackgroundMusic("Wallpaper")

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

    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        println(__FUNCTION__)
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func onNotification_applicationDidBecomeActive(notification: NSNotification) {
        println(__FUNCTION__)
    }
    
    func onNotification_applicationDidEnterBackground(notification: NSNotification) {
        println(__FUNCTION__)
        
        if true == timerRunning {
            self.stopAllTimers()
            self.hideForPausedGamePlayElements()
            animateIntoGamePausedElements()
        }
    }

    func returnFloatFormattedDecimals (inUnformattedValue: CGFloat) -> (String!) {
        
        let formatter = NSNumberFormatter()
        formatter.minimumIntegerDigits = 1
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2

        return formatter.stringFromNumber(inUnformattedValue)!
    }
    
    func startAllTimers() {
        //println(__FUNCTION__)

        if false == timerRunning {
            
            // Game Loop Countdown Timer
            timerGameLoopCountdown = NSTimer.scheduledTimerWithTimeInterval(Double(1.00/Double(gameloopTimerFrequencyCallsPerSecond)), target: self, selector: Selector("eventGameLoop"), userInfo: nil, repeats: true)
            //timerGameLoopCountdown = NSTimer.scheduledTimerWithTimeInterval(0.50, target: self, selector: Selector("eventGameLoopOneSecond"), userInfo: nil, repeats: true)
            //timerGameLoopCountdown.tolerance = 0.10
            timerRunning = true
            
            self.uiviewCountdownTimerViewLayer.strokeEnd = CGFloat(timerCount + 1)/CGFloat(intGameLoopDuration)

            // Attention Timer
            timerGetAttention = NSTimer.scheduledTimerWithTimeInterval(bringAttentionToWinningElement_EveryXSeconds, target: self, selector: Selector("bringAttentionToWinningElement"), userInfo: nil, repeats: true)
            
        }
    }
    
    func stopAllTimers() {
        if true == timerRunning {
            
            timerGameLoopCountdown.invalidate()
            timerGetAttention.invalidate()
            timerMaxDurationToTouch.invalidate()
            
            timerRunning = false
        }
    }
    
    func eventGameLoop() {
        println(__FUNCTION__)

        if timerCount < intGameLoopDuration {
            timerCount += 1
        }
        
        // this needs to be animated somehow
        // I will use an entirely different element to show this element
        var objCommon = CommonFunctions()
        //buttonCountdownTimer.titleLabel?.attributedText = objCommon.attributedTextForText("\(intGameLoopDuration-timerCount)", fontSize:fontsize_Small)
        buttonCountdownTimer.setAttributedTitle(objCommon.attributedTextForText("\(intGameLoopDuration-timerCount)",
            fontSize:fontsize_CountdownTimerButton,
            fontForeGroundColor: fontForeGroundColor_CountdownTimerButton),
            
            forState: UIControlState.Normal)

        //buttonCountdownTimer.setTitle("\(intGameLoopDuration-timerCount)", forState: UIControlState.Normal)
        
        self.uiviewCountdownTimerViewLayer.strokeEnd = CGFloat(timerCount+1) / CGFloat(intGameLoopDuration)
        

        // game over in XXX seconds for testing only
        if intGameLoopDuration == timerCount {
            
            // end in the next loop if animation is in progress
            if animationInProgressGamePlayElements {
                boolElementsDisabled = true
                return
            }
            
            println("Timer Count Reached")

            // Game Loop Countdown Timer
            timerCount = 0
            
            stopAllTimers()
            
            animateOutofGamePlayElements()
            
            animateOutofGamePlayElements_EverythingElse()
            
            // the above takes time so delay the following function
            delay(seconds:animateOutofGamePlayElementsDuration + (4*animateGameStats_InAndOut), completion: {
                
                // Stroke End should be 0 now, as this game is over
                self.uiviewCountdownTimerViewLayer.strokeEnd = 0.00

                println("delay is over in counting and so calling remove game play elements")
                
                self.removeGamePlayElements()
                
                self.settingUpGameOverElements()
                
                self.animateIntoMainScreen()
                
                // now the buttons can be enabled again
                // this current game loop is done
                self.boolElementsDisabled = false
                
                self.resetScores()
                
            })
        }
    }

    func eventMaxDurationToTouch()->() {
     
        println(__FUNCTION__)

        timerMaxDurationToTouch.invalidate()
        
        handleGamePlayElementsInAndOut()
        
    }
    
    
    func settingUpGameOverElements()->() {
        var objCommon = CommonFunctions()
        labelObjectsTouchedValue.attributedText = objCommon.attributedTextForText("\(intScore)", fontSize:fontsize_Medium)
        labelSpeedValue.attributedText = objCommon.attributedTextForText(returnFloatFormattedDecimals(averageTimePerTouch), fontSize:fontsize_Medium)

        // Calculate the Score based on total black dots collected and the average time of touches
        var scoreValueLocal : CGFloat
        if 0 != averageTimePerTouch {
            scoreValueLocal = (CGFloat(intScore) * 10) * (2 / averageTimePerTouch)
        } else {
            scoreValueLocal = 0.00
        }
        labelScoreValue.attributedText = objCommon.attributedTextForText(returnFloatFormattedDecimals(scoreValueLocal), fontSize:fontsize_Medium)
    }
    
    func resetScores()->() {
        intScore = 0
        averageTimePerTouch = 0.00
    }
    
    
    func resetGameStatsLabels() {
        var objCommon = CommonFunctions()
        labelGameStats1.attributedText = objCommon.attributedTextForText("\(intScore)",
            fontSize:fontsize_GameStatsLabel,
            fontForeGroundColor: fontForeGroundColor_GameStatsLabel)
        
        labelGameStats2.attributedText = objCommon.attributedTextForText(returnFloatFormattedDecimals(averageTimePerTouch),
            fontSize:fontsize_GameStatsLabel,
            fontForeGroundColor: fontForeGroundColor_GameStatsLabel)
        
    }
    
    func bringAttentionToWinningElement() {

        // temporarity disabled as it does not seem to be a nice feature
        
//        var movementValue : CGFloat = 20.0
//        var bringAttentionToWinningElementDuration : Double = 0.40
//        
//        self.arrayGameElements[randomWinningElementPlacementInt].center.x += movementValue
//        
//        UIView.animateWithDuration(bringAttentionToWinningElementDuration, delay: 0.00, usingSpringWithDamping: 0.05, initialSpringVelocity: 0.00, options: nil, animations: {
//                self.arrayGameElements[self.randomWinningElementPlacementInt].center.x -= movementValue
//            },
//            completion: {_ in
//                println("Attention animation done")
//            })
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
        createGameOverView()
    }

    func createMainScreenElements()->() {
        println(__FUNCTION__)

        // ================================================================================
        // BUTTON PLAY
        buttonPlay = UIButton()
        // background color for buttons always comes from constants
        buttonPlay.backgroundColor = buttonBackgroundColor

        var objCommon = CommonFunctions()
        buttonPlay.setAttributedTitle(objCommon.attributedTextForText("P L A Y", fontSize:fontsize_PlayButton), forState: UIControlState.Normal)
        buttonPlay.sizeToFit()

        // ====
        // Play button width is % of width and height is % of the width of the button which looks nice
        var buttonPlayWidth = screenWidth * 0.35
        var buttonPlayHeight = buttonPlayWidth * 0.50
        buttonPlay.frame = CGRectMake(buttonPlay.frame.origin.x, buttonPlay.frame.origin.y, buttonPlayWidth, buttonPlayHeight)
        
        buttonPlay.layer.cornerRadius = buttonCornerRadius
        buttonPlay.layer.borderWidth = buttonBorderWidth
        buttonPlay.layer.borderColor = buttonBorderColor
        
        // dont create it offscreen
        //buttonPlay.center = CGPointMake(offscreenXValue, offscreenYValue)
        buttonPlay.center = CGPointMake(screenWidth * consButtonPlayCenterX, screenHeight * consButtonPlayCenterY)
        
        buttonPlay.addTarget(self, action: "tapPlayEvent:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(buttonPlay)
        
        // ================================================================================
        // LABEL APPLICATION TITLE

        labelApplicationTitle = UILabel()
        labelApplicationTitle.attributedText = objCommon.attributedTextForText("TOUCH",
            fontSize:fontsize_ApplicationTitleLabel,
            fontForeGroundColor: fontForeGroundColor_ApplicationTitleLabel)
        
        labelApplicationTitle.sizeToFit()
        
        labelApplicationTitle.textAlignment = NSTextAlignment.Center

        labelApplicationTitle.layer.cornerRadius = labelCornerRadius
        labelApplicationTitle.layer.borderColor = labelBorderColor
        labelApplicationTitle.layer.borderWidth = labelBorderWidth

        // =====
        // Application Title label width is 100% of screen width
        // Height is 20% of screen width
        var labelApplicationTitleWidth = screenWidth * 1.00
        var labelApplicationTitleHeight = screenWidth * 0.10
        labelApplicationTitle.frame = CGRectMake(labelApplicationTitle.frame.origin.x, labelApplicationTitle.frame.origin.y, labelApplicationTitleWidth, labelApplicationTitleHeight)
        
        //labelApplicationTitle.layer.backgroundColor = UIColor.brownColor().CGColor
        labelApplicationTitle.layer.backgroundColor = UIColor.clearColor().CGColor
        
        //labelApplicationTitle.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelApplicationTitle.center = CGPointMake(screenWidth * consLabelApplicationTitleCenterX_MainScreen, screenHeight * consLabelApplicationTitleCenterY_MainScreen)

        self.view.addSubview(labelApplicationTitle)
        
        // ================================================================================
        // LABEL APPLICATION TITLE SUBTITLE

        labelApplicationTitleSubtitle = UILabel()
        labelApplicationTitleSubtitle.attributedText = objCommon.attributedTextForText("FOLLOW THE BLACK DOT",
            fontSize:fontsize_Small,
            fontForeGroundColor: fontForeGroundColor_ApplicationTitleSubtitleLabel)
        
        labelApplicationTitleSubtitle.sizeToFit()
        
        labelApplicationTitleSubtitle.textAlignment = NSTextAlignment.Center
        
        labelApplicationTitleSubtitle.layer.cornerRadius = labelCornerRadius
        labelApplicationTitleSubtitle.layer.borderColor = labelBorderColor
        labelApplicationTitleSubtitle.layer.borderWidth = labelBorderWidth

        // =====
        // Subtitle label is 60% percent of screen width
        // height is 10% of screen width
        var labelApplicationTitleSubtitleWidth = screenWidth * 0.50
        var labelApplicationTitleSubtitleHeight = screenWidth * 0.08

        labelApplicationTitleSubtitle.frame = CGRectMake(labelApplicationTitleSubtitle.frame.origin.x, labelApplicationTitleSubtitle.frame.origin.y,
            labelApplicationTitleSubtitleWidth, labelApplicationTitleSubtitleHeight)
        
        //labelApplicationTitleSubtitle.layer.backgroundColor = UIColor.brownColor().CGColor
        labelApplicationTitleSubtitle.layer.backgroundColor = UIColor.clearColor().CGColor
        
        //labelApplicationTitleSubtitle.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelApplicationTitleSubtitle.center = CGPointMake(screenWidth * consLabelApplicationTitleSubtitleCenterX_MainScreen,
            screenHeight * consLabelApplicationTitleSubtitleCenterY_MainScreen)

        self.view.addSubview(labelApplicationTitleSubtitle)
        
        // ================================================================================
        // LABEL VERSION

        //var versionString = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as String
        var versionString = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleVersion") as String
        
        labelVersion = UILabel()
        labelVersion.attributedText = objCommon.attributedTextForText(versionString, fontSize:fontsize_Small)
        labelVersion.sizeToFit()
        
        labelVersion.textAlignment = NSTextAlignment.Center
        
        labelVersion.layer.cornerRadius = labelCornerRadius
        labelVersion.layer.borderColor = labelBorderColor
        labelVersion.layer.borderWidth = labelBorderWidth
        
        // =====
        // Version label is 30% of screen width and height 10% of screen width
        var labelVersionWidth = screenWidth * 0.30
        var labelVersionHeight = screenWidth * 0.10
        labelVersion.frame = CGRectMake(labelVersion.frame.origin.x, labelVersion.frame.origin.y, labelVersionWidth, labelVersionHeight)
        
        labelVersion.layer.backgroundColor = UIColor.brownColor().CGColor
        labelVersion.center = CGPointMake(offscreenXValue, offscreenYValue)
        labelVersion.hidden = true
        self.view.addSubview(labelVersion)
        
        
    }
    
    
    func createGamePlayElements()->() {
        
        // Testing
        //self.make222()
        
        // ================================================================================
        makeCountdownTimerView()
        self.view.addSubview(uiviewCountdownTimerView)
        
        // ================================================================================
        buttonCountdownTimer = UIButton()
        
        //buttonCountdownTimer.setTitle("\(intGameLoopDuration-timerCount)", forState: UIControlState.Normal)
        
        buttonCountdownTimer.sizeToFit()
        //buttonCountdownTimer.backgroundColor = UIColor.blueColor()
        buttonCountdownTimer.backgroundColor = UIColor.clearColor()
        
        var objCommon = CommonFunctions()
        //buttonCountdownTimer.titleLabel?.attributedText = objCommon.attributedTextForText("\(intGameLoopDuration-timerCount)", fontSize:fontsize_Small)
        buttonCountdownTimer.setAttributedTitle(objCommon.attributedTextForText("\(intGameLoopDuration-timerCount)",
            fontSize:fontsize_CountdownTimerButton,
            fontForeGroundColor: fontForeGroundColor_CountdownTimerButton),
            
            forState: UIControlState.Normal)

        
//        buttonCountdownTimer.frame = CGRectMake(buttonCountdownTimer.frame.origin.x, buttonCountdownTimer.frame.origin.y,
//            buttonCountdownTimer.frame.width * 1.50, buttonCountdownTimer.frame.height * 1.00)
        buttonCountdownTimer.frame = CGRectMake(uiviewCountdownTimerView.frame.origin.x, uiviewCountdownTimerView.frame.origin.y,
            uiviewCountdownTimerView.frame.width, uiviewCountdownTimerView.frame.height)

        
        buttonCountdownTimer.layer.cornerRadius = 5.00
        buttonCountdownTimer.center = CGPointMake(-offscreenXValue, offscreenYValue)
//        buttonCountdownTimer.addTarget(self, action: "tapCountdownTimerEvent:", forControlEvents: UIControlEvents.TouchUpInside)

        buttonCountdownTimer.alpha = 1.00
        self.view.addSubview(buttonCountdownTimer)
        
        // ================================================================================
        
        labelGameStats1 = makeGameStatsLabel()
        self.labelGameStats1.center = CGPointMake(self.screenWidth * self.consLabelGameStats1CenterX, self.screenHeight * self.consLabelGameStats1CenterY + movementGameStatsLabel)
        self.view.addSubview(labelGameStats1)
        
        labelGameStats2 = makeGameStatsLabel()
        self.labelGameStats2.center = CGPointMake(self.screenWidth * self.consLabelGameStats2CenterX, self.screenHeight * self.consLabelGameStats2CenterY + movementGameStatsLabel)
        self.view.addSubview(labelGameStats2)
        
        labelGameStats3 = makeGameStatsLabel()
        self.labelGameStats3.center = CGPointMake(self.screenWidth * self.consLabelGameStats3CenterX, self.screenHeight * self.consLabelGameStats3CenterY + movementGameStatsLabel)
        self.view.addSubview(labelGameStats3)
        
        labelGameStats4 = makeGameStatsLabel()
        self.labelGameStats4.center = CGPointMake(self.screenWidth * self.consLabelGameStats4CenterX, self.screenHeight * self.consLabelGameStats4CenterY + movementGameStatsLabel)
        self.view.addSubview(labelGameStats4)
    }
    
    func createGamePausedElements()->() {
        // ================================================================================
        // LABEL game paused
        labelGamePaused = createLabelGameOver()
        
        var objCommon = CommonFunctions()
        labelGamePaused.attributedText = objCommon.attributedTextForText("Game Paused", fontSize:25)

        // =====
        // label is 60% percent of screen width
        // height of label is 10% of screen width
        var labelGamePausedWidth = screenWidth * 0.60
        var labelGamePausedHeight = screenWidth * 0.10
        labelGamePaused.frame = CGRectMake(labelGamePaused.frame.origin.x, labelGamePaused.frame.origin.y,
            labelGamePausedWidth, labelGamePausedHeight)
        
        labelGamePaused.center = CGPointMake(offscreenXValue, offscreenYValue)
        self.view.addSubview(labelGamePaused)

        // ================================================================================
        // Button game resume
        buttonResume = UIButton()
        buttonResume.backgroundColor = buttonBackgroundColor
        
        buttonResume.setAttributedTitle(objCommon.attributedTextForText("R E S U M E", fontSize:fontsize_Medium), forState: UIControlState.Normal)
        buttonResume.sizeToFit()
        
        // ====
        // Resume button width is 50% of width and height is 50% of the width of the button which looks nice
        var buttonResumeWidth = screenWidth * 0.50
        var buttonResumeHeight = buttonResumeWidth * 0.50
        buttonResume.frame = CGRectMake(buttonResume.frame.origin.x, buttonResume.frame.origin.y, buttonResumeWidth, buttonResumeHeight)
        
        buttonResume.layer.cornerRadius = buttonCornerRadius
        buttonResume.layer.borderWidth = buttonBorderWidth
        buttonResume.layer.borderColor = buttonBorderColor
        
        buttonResume.center = CGPointMake(offscreenXValue, offscreenYValue)
        buttonResume.addTarget(self, action: "tapResumeEvent:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonResume)
    }
    
    func createGameOverElements()->() {

        var objCommon = CommonFunctions()

//        // ================================================================================
//        // LABEL game over
//        
//        labelGameOver = createLabelGameOver()
//        
//        labelGameOver.attributedText = objCommon.attributedTextForText("Game Over", fontSize:fontsize_Medium)
//        
//        labelGameOver.sizeToFit()
//        
//        labelGameOver.frame = CGRectMake(labelGameOver.frame.origin.x, labelGameOver.frame.origin.y, labelGameOver.frame.width * 2.00, labelGameOver.frame.height * 1.10)
//        
//        labelGameOver.center = CGPointMake(offscreenXValue, offscreenYValue)
//        
//        self.view.addSubview(labelGameOver)
//        
        
        // ================================================================================
        // LABEL Objects touched
        
        labelObjectsTouched = createLabelGameOver()

        labelObjectsTouched.attributedText = objCommon.attributedTextForText("Dots Collected", fontSize:fontsize_Medium)

        labelObjectsTouched.sizeToFit()
        
        labelObjectsTouched.frame = CGRectMake(labelObjectsTouched.frame.origin.x, labelObjectsTouched.frame.origin.y,
            labelObjectsTouched.frame.width * 1.20, labelObjectsTouched.frame.height * 1.10)
        
        labelObjectsTouched.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelObjectsTouched)
        
        // ================================================================================
        // LABEL objects touched value
        
        labelObjectsTouchedValue = createLabelGameOver()
        
        labelObjectsTouchedValue.attributedText = objCommon.attributedTextForText("0", fontSize:fontsize_Medium)

        labelObjectsTouchedValue.sizeToFit()
        
        labelObjectsTouchedValue.frame = CGRectMake(labelObjectsTouchedValue.frame.origin.x, labelObjectsTouchedValue.frame.origin.y,
            screenWidth * 0.20, labelObjectsTouchedValue.frame.height * 1.10)
        
        labelObjectsTouchedValue.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelObjectsTouchedValue)
        
        
        // ================================================================================
        // LABEL speed
        labelSpeed = createLabelGameOver()

        labelSpeed.attributedText = objCommon.attributedTextForText("Average Time", fontSize:fontsize_Medium)

        labelSpeed.sizeToFit()
        
        // using label objects touched's width
        labelSpeed.frame = CGRectMake(labelSpeed.frame.origin.x, labelSpeed.frame.origin.y, labelObjectsTouched.frame.width, labelSpeed.frame.height * 1.10)
        
        labelSpeed.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelSpeed)
        
        // ================================================================================
        labelSpeedValue = createLabelGameOver()

        labelSpeedValue.attributedText = objCommon.attributedTextForText("0", fontSize:fontsize_Medium)

        labelSpeedValue.sizeToFit()
        
        labelSpeedValue.frame = CGRectMake(labelSpeedValue.frame.origin.x, labelSpeedValue.frame.origin.y,
            screenWidth * 0.20, labelSpeedValue.frame.height * 1.10)
        
        labelSpeedValue.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelSpeedValue)
        
        
        // ================================================================================
        labelScore = createLabelGameOver()
        
        labelScore.attributedText = objCommon.attributedTextForText("Score", fontSize:fontsize_Medium)

        labelScore.sizeToFit()
        
        labelScore.frame = CGRectMake(labelScore.frame.origin.x, labelScore.frame.origin.y, labelObjectsTouched.frame.width, labelScore.frame.height * 1.10)
        
        labelScore.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelScore)
        
        // ================================================================================
        labelScoreValue = createLabelGameOver()

        labelScoreValue.attributedText = objCommon.attributedTextForText("0", fontSize:fontsize_Medium)

        labelScoreValue.sizeToFit()
        
        labelScoreValue.frame = CGRectMake(labelScoreValue.frame.origin.x, labelScoreValue.frame.origin.y, screenWidth * 0.20, labelScoreValue.frame.height * 1.10)
        
        labelScoreValue.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        self.view.addSubview(labelScoreValue)
        
        // ================================================================================
        buttonTryAgain = createButtonGameOver()
        
        buttonTryAgain.setAttributedTitle(objCommon.attributedTextForText("Try Again", fontSize:fontsize_Medium), forState: UIControlState.Normal)
        
        buttonTryAgain.sizeToFit()

        // i am using screenwidth to estimate the height also. NOT A BUG.
        buttonTryAgain.frame = CGRectMake(buttonTryAgain.frame.origin.x, buttonTryAgain.frame.origin.y,
            screenWidth * sizeButtonWidthSmall, screenWidth * sizeButtonHeightSmall)
        
        buttonTryAgain.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        buttonTryAgain.addTarget(self, action: "tapTryAgainEvent:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(buttonTryAgain)
        
        // ================================================================================
        buttonQuit = createButtonGameOver()
        
        buttonQuit.setAttributedTitle(objCommon.attributedTextForText("Quit", fontSize:fontsize_Medium), forState: UIControlState.Normal)

        buttonQuit.sizeToFit()
        
        // Width is taken from button try again
        buttonQuit.frame = CGRectMake(buttonQuit.frame.origin.x, buttonQuit.frame.origin.y,
            screenWidth * sizeButtonWidthSmall, screenWidth * sizeButtonHeightSmall)
        
        buttonQuit.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        buttonQuit.addTarget(self, action: "tapQuitEvent:", forControlEvents: UIControlEvents.TouchUpInside)

        self.view.addSubview(buttonQuit)
    }
    
    
    func createGameOverView () -> () {
        
        var sizeOfGameOverView_Width : CGFloat = screenWidth * 0.70
        var sizeOfGameOverView_Height : CGFloat = screenWidth * 0.18

        // All Time
        uiviewGameOverView_AllTime = UIView(frame: CGRectMake(0, 0, sizeOfGameOverView_Width, sizeOfGameOverView_Height))
        
        //uiviewGameOverView.backgroundColor = colorAppBackground
        uiviewGameOverView_AllTime.backgroundColor = UIColor.redColor()
        uiviewGameOverView_AllTime.alpha = 1.0
        
        // Attributes for the Return View
        //uiviewCountdownTimerView.layer.borderWidth = 0
        //uiviewCountdownTimerView.layer.borderColor = UIColor.blackColor().CGColor
        
        //uiviewCountdownTimerView.center = CGPointMake(offscreenXValue, offscreenYValue)
        uiviewGameOverView_AllTime.center = CGPointMake(
            self.screenWidth * 0.50,
            self.screenHeight * 0.71)
        
        self.view.addSubview(uiviewGameOverView_AllTime)

        // Last Game
        uiviewGameOverView_LastGame = UIView(frame: CGRectMake(0, 0, sizeOfGameOverView_Width, sizeOfGameOverView_Height))
        
        uiviewGameOverView_LastGame.backgroundColor = UIColor.redColor()
        uiviewGameOverView_LastGame.alpha = 1.0
        
        uiviewGameOverView_LastGame.center = CGPointMake(
            self.screenWidth * 0.50,
            self.screenHeight * 0.85)
        
        self.view.addSubview(uiviewGameOverView_LastGame)
        
        // ================================================================================
        // LABEL game over
        
        var objCommon = CommonFunctions()

        labelGameOver = createLabelGameOver()
        
        labelGameOver.attributedText = objCommon.attributedTextForText("Game Over", fontSize:fontsize_Medium)
        
        labelGameOver.sizeToFit()
        
        labelGameOver.frame = CGRectMake(labelGameOver.frame.origin.x, labelGameOver.frame.origin.y, labelGameOver.frame.width * 2.00, labelGameOver.frame.height * 1.10)
        
        labelGameOver.layer.backgroundColor = UIColor.greenColor().CGColor
        
        //labelGameOver.center = CGPointMake(offscreenXValue, offscreenYValue)
        
        uiviewGameOverView_AllTime.addSubview(labelGameOver)
        
    }
    
    
    // ################################################################################
    // ################################################################################
    // ################################################################################

    func createButtonGameOver()->(UIButton) {
        
        var buttonTemp = UIButton()
        buttonTemp.setTitle("Temp", forState: UIControlState.Normal)
        buttonTemp.sizeToFit()
        buttonTemp.backgroundColor = buttonBackgroundColor
        
        buttonTemp.layer.cornerRadius = buttonCornerRadius
        buttonTemp.layer.borderWidth = buttonBorderWidth
        buttonTemp.layer.borderColor = buttonBorderColor

        return buttonTemp
    }
    
    func createLabelGameOver()->(UILabel) {
        var labelReturnObject = UILabel()
        labelReturnObject.textAlignment = NSTextAlignment.Center
        labelReturnObject.layer.cornerRadius = labelCornerRadius
        labelReturnObject.layer.borderColor = labelBorderColor
        labelReturnObject.layer.borderWidth = labelBorderWidth
        //labelReturnObject.layer.backgroundColor = UIColor.brownColor().CGColor
        labelReturnObject.layer.backgroundColor = UIColor.clearColor().CGColor
        return labelReturnObject
    }
    
    func makeGameStatsLabel() -> (UILabel) {
        var tempLabel = UILabel()
        var objCommon = CommonFunctions()

        tempLabel.attributedText = objCommon.attributedTextForText("0", fontSize:fontsize_GameStatsLabel, fontForeGroundColor:fontForeGroundColor_GameStatsLabel)
        
        tempLabel.sizeToFit()
        
        tempLabel.textAlignment = NSTextAlignment.Center
        tempLabel.layer.cornerRadius = 5
        
//        tempLabel.frame = CGRectMake(tempLabel.frame.origin.x, tempLabel.frame.origin.y,
//            tempLabel.frame.size.width * 3.0, tempLabel.frame.size.height * 1.3)
        tempLabel.frame = CGRectMake(
            tempLabel.frame.origin.x, tempLabel.frame.origin.y,
            screenWidth * 1.50 * sizeSquareObjectsSmall, screenWidth * sizeSquareObjectsSmall)
        
        tempLabel.layer.backgroundColor = UIColor.redColor().CGColor
        
        tempLabel.alpha = 1.0
        return tempLabel
    }

    
    func make222()->() {
        
        var sizeOfTimer : CGFloat = 60.00

        // Bigger Circle
        let uiviewShape = CAShapeLayer()

        uiviewShape.path = UIBezierPath(ovalInRect: CGRectMake(0, 0, sizeOfTimer, sizeOfTimer)).CGPath
        uiviewShape.lineWidth = 8
        uiviewShape.lineCap = kCALineCapRound
        
        uiviewShape.strokeColor = UIColor.greenColor().CGColor
        
        uiviewShape.fillColor = UIColor.clearColor().CGColor
        
        uiviewShape.strokeStart    = 0.00

        uiviewShape.strokeEnd      = 0.20

        
        UIView.animateWithDuration(5, animations: {
            //uiviewShape.strokeEnd      = 1.00
        })

        UIView.animateWithDuration(5.0, delay: 5.0, options: nil, animations: {
            //uiviewShape.strokeEnd = 1.00
            }, completion: {_ in
        })

        // Smaller Circle
        let uiviewShape2 = CAShapeLayer()
        
        uiviewShape2.path = UIBezierPath(ovalInRect: CGRectMake(0, 0, sizeOfTimer, sizeOfTimer)).CGPath
        uiviewShape2.lineWidth = 12
        uiviewShape2.lineCap = kCALineCapRound
        
        uiviewShape2.strokeColor = UIColor.blueColor().CGColor
        
        uiviewShape2.fillColor = UIColor.clearColor().CGColor
        
        uiviewShape2.strokeStart    = 0.00
        
        uiviewShape2.strokeEnd      = 0.40
        
        
//        UIView.animateWithDuration(5, animations: {
//            //uiviewShape.strokeEnd      = 1.00
//        })
//        
//        UIView.animateWithDuration(5.0, delay: 5.0, options: nil, animations: {
//            //uiviewShape.strokeEnd = 1.00
//            }, completion: {_ in
//                
//        })

        // ================================================================================
        // VIEW
        let uiviewView = UIView(frame: CGRectMake(0, 0, sizeOfTimer, sizeOfTimer))
        
        uiviewView.backgroundColor = UIColor.redColor()
        
        uiviewView.alpha = 1.0
        uiviewView.layer.borderWidth = 0
        uiviewView.layer.borderColor = UIColor.blackColor().CGColor
        
        uiviewView.center = CGPointMake(self.screenWidth * 0.10, self.screenHeight * 0.10)

        // Add both the Shapes
        uiviewView.layer.addSublayer(uiviewShape2)
        uiviewView.layer.addSublayer(uiviewShape)
        
        // translate it 90 degress anticlockwise to start the look at 12 o clock
        uiviewView.transform = CGAffineTransformMakeRotation(-1.57)

        self.view.addSubview(uiviewView)

    }
    
    func makeCountdownTimerView()->() {

        // =====
        // UIView Timer has a size of 10% of screen width, for both width and height
        var sizeOfTimer : CGFloat = screenWidth * sizeSquareObjectsSmall

        // ================================================================================
        // SHAPE
        uiviewCountdownTimerViewLayer = CAShapeLayer()
        
        var point = CGPointMake(sizeOfTimer/2, sizeOfTimer/2)
        
        var pi : CGFloat = 3.14

        var localLineWidth : CGFloat = sizeOfTimer / 2
        
        //uiviewCountdownTimerViewLayer.path = UIBezierPath(arcCenter:point, radius: (sizeOfTimer-localLineWidth)/2, startAngle: 0, endAngle: 2 * pi, clockwise: true).CGPath
        uiviewCountdownTimerViewLayer.path = UIBezierPath(ovalInRect: CGRectMake(0, 0, sizeOfTimer, sizeOfTimer)).CGPath
        
        // Attributes for the Shape
        //uiviewCountdownTimerViewLayer.lineWidth = localLineWidth
        uiviewCountdownTimerViewLayer.lineWidth = 8
        //uiviewCountdownTimerViewLayer.lineCap = kCALineCapButt
        //uiviewCountdownTimerViewLayer.lineCap = kCALineCapSquare
        uiviewCountdownTimerViewLayer.lineCap = kCALineCapRound
        
        uiviewCountdownTimerViewLayer.strokeColor = UIColor.greenColor().CGColor
        
        //oneLayer.fillColor = UIColor.blueColor().CGColor
        //uiviewCountdownTimerViewLayer.fillColor = colorAppBackground.CGColor
        //uiviewCountdownTimerViewLayer.fillColor = UIColor.blueColor().CGColor
        uiviewCountdownTimerViewLayer.fillColor = UIColor.clearColor().CGColor
        
        uiviewCountdownTimerViewLayer.strokeStart    = 0.00
        uiviewCountdownTimerViewLayer.strokeEnd      = 0.00
        
        // ================================================================================
        // VIEW
        // UIView for the Countdown Timer (making a filling circle as time progresses)
        // frame is x value offset, y value offset, width and then height
        uiviewCountdownTimerView = UIView(frame: CGRectMake(0, 0, sizeOfTimer, sizeOfTimer))

        //uiviewCountdownTimerView.backgroundColor = UIColor.redColor()
        uiviewCountdownTimerView.backgroundColor = colorAppBackground
        uiviewCountdownTimerView.alpha = 1.0
        
        // Attributes for the Return View
        uiviewCountdownTimerView.layer.borderWidth = 0
        uiviewCountdownTimerView.layer.borderColor = UIColor.blackColor().CGColor

        //uiviewCountdownTimerView.center = CGPointMake(offscreenXValue, offscreenYValue)
        uiviewCountdownTimerView.center = CGPointMake(
            self.screenWidth * consUIViewCountdownTimerCenterX + movementCountdownTimerView,
            self.screenHeight * consUIViewCountdownTimerCenterY)
        
        uiviewCountdownTimerView.layer.addSublayer(uiviewCountdownTimerViewLayer)

        // translate it 90 degress anticlockwise to start the look at 12 o clock
        self.uiviewCountdownTimerView.transform = CGAffineTransformMakeRotation(-1.57)
        
    }
    
    
    func animateCountdownTimer () -> () {
    
        
    }
    
    
    // ################################################################################
    // ################################################################################
    // ################################################################################
    // Animation Functions - START
    
    func animateIntoMainScreen () -> () {
        println(__FUNCTION__)
        
        labelApplicationTitle.alpha = 1.00
        
        //buttonPlay.alpha = 1.0
        buttonPlay.alpha = 0.00
        buttonPlay.center = CGPointMake(screenWidth * consButtonPlayCenterX, screenHeight * consButtonPlayCenterY)
        
        //labelApplicationTitleSubtitle.alpha = 1.0
        labelApplicationTitleSubtitle.alpha = 0.00
        labelApplicationTitleSubtitle.center = CGPointMake(screenWidth * consLabelApplicationTitleSubtitleCenterX_MainScreen,
            screenHeight * consLabelApplicationTitleSubtitleCenterY_MainScreen)
        
        //labelVersion.alpha = 1.00
        labelVersion.alpha = 0.00
        labelVersion.center = CGPointMake(screenWidth * consLabelVersionCenterX, screenHeight * consLabelVersionCenterY)
        
        self.uiviewGameOverView_AllTime.alpha = 0.00
        self.uiviewGameOverView_LastGame.alpha = 0.00
        
        //self.uiviewGameOverView.center
        
        UIView.animateWithDuration(animateIntoMainScreenDuration, animations: {
            
            self.labelApplicationTitle.transform = CGAffineTransformIdentity
            self.labelApplicationTitle.center = CGPointMake(self.screenWidth * self.consLabelApplicationTitleCenterX_MainScreen,
                self.screenHeight * self.consLabelApplicationTitleCenterY_MainScreen)

            self.buttonPlay.alpha = 1.00
            self.labelApplicationTitleSubtitle.alpha = 1.00
            self.labelVersion.alpha = 1.00
            self.uiviewGameOverView_AllTime.alpha = 1.00
            self.uiviewGameOverView_LastGame.alpha = 1.00
            
            }, completion: {_ in
                NSLog("CAME TO MAIN SCREEN")
                
                // ONLY FOR TESTING
                //self.tapPlayEvent(UIView)
            })
    }
    
    func animateOutofMainScreen () -> () {
        println(__FUNCTION__)

        UIView.animateWithDuration(animateOutofMainScreenDuration, animations: {
            
            self.buttonPlay.alpha = 0.00
            self.labelApplicationTitleSubtitle.alpha = 0.00
            self.labelVersion.alpha = 0.00
            self.uiviewGameOverView_AllTime.alpha = 0.00
            self.uiviewGameOverView_LastGame.alpha = 0.00
            
            //self.labelApplicationTitle.alpha = 0.00
            self.labelApplicationTitle.transform = CGAffineTransformMakeScale(0.50, 0.50)
            self.labelApplicationTitle.center = CGPointMake(self.screenWidth * self.consLabelApplicationTitleCenterX_GamePlayScreen,
                self.screenHeight * self.consLabelApplicationTitleCenterY_GamePlayScreen)
            

            }, completion: {_ in

                self.removeMainScreenElements()
                NSLog("OUT OF MAIN SCREEN")
        })
    }
    
    
    
    func animateIntoGamePlayScreen () -> () {
        println(__FUNCTION__)

//        // not visible at 0.00 alpha
        var objCommon = CommonFunctions()
        buttonCountdownTimer.alpha = 1.00
        buttonCountdownTimer.center = CGPointMake(screenWidth * consButtonCountdownTimerCenterX + movementCountdownTimerView, screenHeight * consButtonCountdownTimerCenterY)
        
        buttonCountdownTimer.setAttributedTitle(objCommon.attributedTextForText("\(intGameLoopDuration-timerCount)",
            fontSize:fontsize_CountdownTimerButton,
            fontForeGroundColor: fontForeGroundColor_CountdownTimerButton),
            
            forState: UIControlState.Normal)

        self.uiviewCountdownTimerView.alpha = 1.00
        uiviewCountdownTimerView.center = CGPointMake(
            screenWidth * consUIViewCountdownTimerCenterX + movementCountdownTimerView,
            screenHeight * consUIViewCountdownTimerCenterY)
        self.uiviewCountdownTimerViewLayer.strokeStart = 0.00
        self.uiviewCountdownTimerViewLayer.strokeEnd = 0.00

        labelGameStats1.alpha = 1.00
        labelGameStats2.alpha = 1.00
        labelGameStats3.alpha = 1.00
        labelGameStats4.alpha = 1.00
        
        
        var dampingValue : CGFloat = 0.60
        
        // SECOND TRY
        
        UIView.animateWithDuration(animateIntoGamePlayScreenDuration, delay: 0.00, usingSpringWithDamping: dampingValue, initialSpringVelocity: 0.00, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.uiviewCountdownTimerView.center = CGPointMake(
                self.uiviewCountdownTimerView.center.x - movementCountdownTimerView,
                self.uiviewCountdownTimerView.center.y)
            
            self.buttonCountdownTimer.center = CGPointMake(self.buttonCountdownTimer.center.x - movementCountdownTimerView, self.buttonCountdownTimer.center.y)
            
            }, completion: {_ in
                NSLog("11111 Completed animation: \(__FUNCTION__)")
        })

        
//        UIView.animateWithDuration(animateIntoGamePlayScreenDuration, delay: Double(1) * animateGameStats_InAndOut, options: UIViewAnimationOptions.CurveLinear, animations: {
//            
//            self.labelGameStats1.center = CGPointMake(self.labelGameStats1.center.x, self.labelGameStats1.center.y - movementGameStatsLabel)
//            
//            }, completion: {_ in
//                NSLog("22222 Completed animation: \(__FUNCTION__)")
//        })

        UIView.animateWithDuration(animateIntoGamePlayScreenDuration, delay: Double(1) * animateGameStats_InAndOut, usingSpringWithDamping: dampingValue, initialSpringVelocity: 0.00, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.labelGameStats1.center = CGPointMake(self.labelGameStats1.center.x, self.labelGameStats1.center.y - movementGameStatsLabel)
            
            }, completion: { _ in
                NSLog("22222 Completed animation: \(__FUNCTION__)")
        })
        
        
//        UIView.animateWithDuration(animateIntoGamePlayScreenDuration, delay: Double(2) * animateGameStats_InAndOut, options: UIViewAnimationOptions.CurveLinear, animations: {
//            
//            self.labelGameStats2.center = CGPointMake(self.labelGameStats2.center.x, self.labelGameStats2.center.y - movementGameStatsLabel)
//
//            }, completion: {_ in
//                NSLog("33333 Completed animation: \(__FUNCTION__)")
//        })

        UIView.animateWithDuration(animateIntoGamePlayScreenDuration, delay: Double(2) * animateGameStats_InAndOut, usingSpringWithDamping: dampingValue, initialSpringVelocity: 0.00, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.labelGameStats2.center = CGPointMake(self.labelGameStats2.center.x, self.labelGameStats2.center.y - movementGameStatsLabel)
            
            }, completion: {_ in
                NSLog("33333 Completed animation: \(__FUNCTION__)")
        })
        
//        UIView.animateWithDuration(animateIntoGamePlayScreenDuration, delay: Double(3) * animateGameStats_InAndOut, options: UIViewAnimationOptions.CurveLinear, animations: {
//            
//            self.labelGameStats3.center = CGPointMake(self.labelGameStats3.center.x, self.labelGameStats3.center.y - movementGameStatsLabel)
//            
//            }, completion: {_ in
//                NSLog("44444 Completed animation: \(__FUNCTION__)")
//        })

        UIView.animateWithDuration(animateIntoGamePlayScreenDuration, delay: Double(3) * animateGameStats_InAndOut, usingSpringWithDamping: dampingValue, initialSpringVelocity: 0.00, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.labelGameStats3.center = CGPointMake(self.labelGameStats3.center.x, self.labelGameStats3.center.y - movementGameStatsLabel)
            
            }, completion: {_ in
                NSLog("44444 Completed animation: \(__FUNCTION__)")
        })
        
//        UIView.animateWithDuration(animateIntoGamePlayScreenDuration, delay: Double(4) * animateGameStats_InAndOut, options: UIViewAnimationOptions.CurveLinear, animations: {
//            
//            self.labelGameStats4.center = CGPointMake(self.labelGameStats4.center.x, self.labelGameStats4.center.y - movementGameStatsLabel)
//            
//            }, completion: {_ in
//                NSLog("55555 Completed animation: \(__FUNCTION__)")
//        })

        UIView.animateWithDuration(animateIntoGamePlayScreenDuration, delay: Double(4) * animateGameStats_InAndOut, usingSpringWithDamping: dampingValue, initialSpringVelocity: 0.00, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.labelGameStats4.center = CGPointMake(self.labelGameStats4.center.x, self.labelGameStats4.center.y - movementGameStatsLabel)
            
            }, completion: {_ in
                NSLog("55555 Completed animation: \(__FUNCTION__)")
        })

        // FIRST TRY
        
//        UIView.animateWithDuration(animateIntoGamePlayScreenDuration, delay: 0.00, options: UIViewAnimationOptions.CurveLinear, animations: {
//
//            self.labelGameStats1.center = CGPointMake(self.labelGameStats1.center.x, self.labelGameStats1.center.y - movementGameStatsLabel)
//            self.labelGameStats2.center = CGPointMake(self.labelGameStats2.center.x, self.labelGameStats2.center.y - movementGameStatsLabel)
//            self.labelGameStats3.center = CGPointMake(self.labelGameStats3.center.x, self.labelGameStats3.center.y - movementGameStatsLabel)
//            self.labelGameStats4.center = CGPointMake(self.labelGameStats4.center.x, self.labelGameStats4.center.y - movementGameStatsLabel)
//            
//            self.uiviewCountdownTimerView.center = CGPointMake(
//                self.uiviewCountdownTimerView.center.x - movementCountdownTimerView,
//                self.uiviewCountdownTimerView.center.y)
//
//            self.buttonCountdownTimer.center = CGPointMake(self.buttonCountdownTimer.center.x - movementCountdownTimerView, self.buttonCountdownTimer.center.y)
//
//            }, completion: {_ in
//                NSLog("Completed animation: \(__FUNCTION__)")
//        })
    }
    
    func animateOutofGamePlayScreen () -> () {
        println(__FUNCTION__)
    }
    
    func animateIntoGamePlayElements()->() {
        println(__FUNCTION__)

        // THIRD TRY
        
        for iCount in 0..<self.arrayGameElements.count {
            self.arrayGameElements[iCount].alpha = 0.00
        }
        
        UIView.animateWithDuration(animateIntoGamePlayElementsDuration, delay: 0.00, options: .CurveEaseOut, animations: {
            for iCount in 0..<self.arrayGameElements.count {
                self.arrayGameElements[iCount].alpha = 1.00
            }
            }, completion: {_ in
                println("Animation completed animateIntoGamePlayElements")
                self.animationInProgressGamePlayElements = false
                self.touchTimeStartAt = CFAbsoluteTimeGetCurrent()
                
                // add the touch gestures
                self.addTapGestureToElements()
                
                self.timerMaxDurationToTouch = NSTimer.scheduledTimerWithTimeInterval(Double(3), target: self, selector: Selector("eventMaxDurationToTouch"), userInfo: nil, repeats: true)
            }
        )

        // SECOND TRY
        
//        for iCount in 0..<self.arrayGameElements.count {
//            self.arrayGameElements[iCount].center = CGPointMake(self.arrayGameElements[iCount].center.x + 2*animationElementsToOffScreen_XValue, self.arrayGameElements[iCount].center.y)
//            self.arrayGameElements[iCount].alpha = 1.00
//        }
//        
//        UIView.animateWithDuration(animateIntoGamePlayElementsDuration, delay: 0.00, options: .CurveEaseOut, animations: {
//                for iCount in 0..<self.arrayGameElements.count {
//                    self.arrayGameElements[iCount].center = CGPointMake(self.arrayGameElements[iCount].center.x - animationElementsToOffScreen_XValue, self.arrayGameElements[iCount].center.y)
//                }
//            }, completion: {_ in
//                println("Animation completed animateIntoGamePlayElements")
//                self.animationInProgressGamePlayElements = false
//                self.touchTimeStartAt = CFAbsoluteTimeGetCurrent()
//            }
//        )
//        
        
        // FIRST TRY
        
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

        // THIRD TRY
        
        UIView.animateWithDuration(animateOutofGamePlayElementsDuration, delay: 0.00, options: .CurveEaseOut, animations: {
            
            for iCount in 0..<self.arrayGameElements.count {
                self.arrayGameElements[iCount].alpha = 0.00
            }
            
            }, completion: {_ in
                println("animateOutofGamePlayElements - Animation completed.")
        })
        
        
//        // SECOND TRY
//        UIView.animateWithDuration(animateOutofGamePlayElementsDuration, delay: 0.00, options: .CurveEaseOut, animations: {
//            
//            for iCount in 0..<self.arrayGameElements.count {
//                self.arrayGameElements[iCount].center = CGPointMake(self.arrayGameElements[iCount].center.x - animationElementsToOffScreen_XValue, self.arrayGameElements[iCount].center.y)
//            }
//            
//            }, completion: {_ in
//                println("out of game elements Animation completed.")
//        })

        
        // FIRST TRY
        
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
        
        UIView.animateWithDuration(animateOutofGamePlayElementsDuration, delay: 0.00, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.uiviewCountdownTimerView.center = CGPointMake(
                self.uiviewCountdownTimerView.center.x + movementCountdownTimerView,
                self.uiviewCountdownTimerView.center.y)
            
            self.buttonCountdownTimer.center = CGPointMake(
                self.buttonCountdownTimer.center.x + movementCountdownTimerView,
                self.buttonCountdownTimer.center.y)
            
            }, completion: {_ in
                NSLog("1111")
        })

        UIView.animateWithDuration(animateOutofGamePlayElementsDuration, delay: Double(4) * animateGameStats_InAndOut, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.labelGameStats1.center = CGPointMake(self.screenWidth * self.consLabelGameStats1CenterX,
                self.screenHeight * self.consLabelGameStats1CenterY + movementGameStatsLabel)
            
            }, completion: {_ in
                NSLog("2222")
        })

        UIView.animateWithDuration(animateOutofGamePlayElementsDuration, delay: Double(3) * animateGameStats_InAndOut, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.labelGameStats2.center = CGPointMake(self.screenWidth * self.consLabelGameStats2CenterX,
                self.screenHeight * self.consLabelGameStats2CenterY + movementGameStatsLabel)
            
            }, completion: {_ in
                NSLog("33333")
        })

        UIView.animateWithDuration(animateOutofGamePlayElementsDuration, delay: Double(2) * animateGameStats_InAndOut, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.labelGameStats3.center = CGPointMake(self.screenWidth * self.consLabelGameStats3CenterX,
                self.screenHeight * self.consLabelGameStats3CenterY + movementGameStatsLabel)
            
            }, completion: {_ in
                NSLog("44444")
        })

        UIView.animateWithDuration(animateOutofGamePlayElementsDuration, delay: Double(1) * animateGameStats_InAndOut, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.labelGameStats4.center = CGPointMake(self.screenWidth * self.consLabelGameStats4CenterX,
                self.screenHeight * self.consLabelGameStats4CenterY + movementGameStatsLabel)
            
            }, completion: {_ in
                NSLog("55555")
        })
    }

    
    func animateIntoGamePausedElements()->() {
        println(__FUNCTION__)

        var animationDelay :Double = 0.00
        var animationDuration : Double = 0.50

        // i have removed quit button from this screen
        buttonQuit.alpha = 0.00
        
        labelGamePaused.alpha = 0.00
        buttonResume.alpha = 0.00
        
        labelGamePaused.center = CGPointMake(screenWidth * consLabelGamePausedCenterX, screenHeight * consLabelGamePausedCenterY)
        buttonResume.center = CGPointMake(screenWidth * consButtonResumeCenterX, screenHeight * consButtonResumeCenterY)
        buttonQuit.center = CGPointMake(screenWidth * consButtonQuitCenterX, screenHeight * consButtonQuitCenterY)
        
        UIView.animateWithDuration(animationDuration, delay: animationDelay, options: .CurveEaseOut, animations: {
            
            self.labelGamePaused.alpha  = 1.00
            self.buttonResume.alpha     = 1.00
            
            }, completion: {_ in
                println("Animation Game Paused Completed!")
        })
    }
    
    func animateOutofGamePausedElements()->() {
        println(__FUNCTION__)
        UIView.animateWithDuration(animateOutofGamePausedElementsDuration, delay: 0.00, options: .CurveEaseOut, animations: {
            self.labelGamePaused.alpha = 0.00
            self.buttonResume.alpha = 0.00
            self.buttonQuit.alpha = 0.00
            }, completion: {_ in
                self.labelGamePaused.center = CGPointMake(self.offscreenXValue, self.offscreenYValue)
                self.buttonResume.center = CGPointMake(self.offscreenXValue, self.offscreenYValue)
                self.buttonQuit.center = CGPointMake(self.offscreenXValue, self.offscreenYValue)
        })
    }
    
    
    func animateIntoGameOverElements()->() {
        println(__FUNCTION__)

        // Game Over Elements
        
        labelGameOver.alpha = 0.00
        labelObjectsTouched.alpha = 0.00
        labelObjectsTouchedValue.alpha = 0.00
        labelSpeed.alpha = 0.00
        labelSpeedValue.alpha = 0.00
        labelScore.alpha = 0.00
        labelScoreValue.alpha = 0.00
        buttonTryAgain.alpha = 0.00
        buttonQuit.alpha = 0.00
        
        
        labelGameOver.center = CGPointMake(screenWidth * consLabelGameOverCenterX, screenHeight * consLabelGameOverCenterY)
        labelObjectsTouched.center = CGPointMake(screenWidth * consLabelObjectsTouchedCenterX, screenHeight * consLabelObjectsTouchedCenterY)
        labelObjectsTouchedValue.center = CGPointMake(screenWidth * consLabelObjectsTouchedValueCenterX, screenHeight * consLabelObjectsTouchedValueCenterY)
        labelSpeed.center = CGPointMake(screenWidth * consLabelSpeedCenterX, screenHeight * consLabelSpeedCenterY)
        labelSpeedValue.center = CGPointMake(screenWidth * consLabelSpeedValueCenterX, screenHeight * consLabelSpeedValueCenterY)
        labelScore.center = CGPointMake(screenWidth * consLabelScoreCenterX, screenHeight * consLabelScoreCenterY)
        labelScoreValue.center = CGPointMake(screenWidth * consLabelScoreValueCenterX, screenHeight * consLabelScoreValueCenterY)
        buttonTryAgain.center = CGPointMake(screenWidth * consButtonTryAgainCenterX, screenHeight * consButtonTryAgainCenterY)
        buttonQuit.center = CGPointMake(screenWidth * consButtonQuitCenterX, screenHeight * consButtonQuitCenterY)
        
        
        // ################################################################################

        UIView.animateWithDuration(animateIntoGameOverElementsDuration, delay: 0.00, options: .CurveEaseOut, animations: {

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
    
    func animateOutOfGameOverElements_Quit()->() {
        println(__FUNCTION__)
        
        UIView.animateWithDuration(animateOutOfGameOverElementsDuration, delay: 0.00, options: .CurveEaseOut, animations: {
            
            self.labelApplicationTitle.transform = CGAffineTransformIdentity
            self.labelApplicationTitle.center = CGPointMake(self.screenWidth * self.consLabelApplicationTitleCenterX_MainScreen, self.screenHeight * self.consLabelApplicationTitleCenterY_MainScreen)

            self.labelGameOver.alpha = 0.00
            self.labelObjectsTouched.alpha = 0.00
            self.labelObjectsTouchedValue.alpha = 0.00
            self.labelSpeed.alpha = 0.00
            self.labelSpeedValue.alpha = 0.00
            self.labelScore.alpha = 0.00
            self.labelScoreValue.alpha = 0.00
            self.buttonTryAgain.alpha = 0.00
            self.buttonQuit.alpha = 0.00

            }, completion: {_ in
                println("")
                //self.buttonCountdownTimer.setTitle("\(self.timerCount)", forState: UIControlState.Normal)
        })
    }
    
    func animateOutOfGameOverElements_TryAgain()->() {
        println(__FUNCTION__)
        UIView.animateWithDuration(animateOutOfGameOverElementsDuration, delay: 0.00, options: .CurveEaseOut, animations: {
            self.labelGameOver.alpha = 0.00
            self.labelObjectsTouched.alpha = 0.00
            self.labelObjectsTouchedValue.alpha = 0.00
            self.labelSpeed.alpha = 0.00
            self.labelSpeedValue.alpha = 0.00
            self.labelScore.alpha = 0.00
            self.labelScoreValue.alpha = 0.00
            self.buttonTryAgain.alpha = 0.00
            self.buttonQuit.alpha = 0.00
            }, completion: {_ in
                println("completed an animation")
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
        self.labelVersion.center = CGPointMake(self.offscreenXValue, self.offscreenYValue)
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
        
        // Hide the Quit button also so that there is only option to RESUME
        buttonQuit.alpha = 0.00
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
        // UnHide the Quit button
        buttonQuit.alpha = 1.00
    }
    
    func removeGamePlayElements_EverythingElse()->() {
//        println(__FUNCTION__)
//        // These elements are only moved offscreen
//        // and not actually deleted/removed from the view
//        labelGameStats1.center = CGPointMake(offscreenXValue, offscreenYValue)
//        labelGameStats2.center = CGPointMake(offscreenXValue, offscreenYValue)
//        labelGameStats3.center = CGPointMake(offscreenXValue, offscreenYValue)
//        labelGameStats4.center = CGPointMake(offscreenXValue, offscreenYValue)
//
//        buttonCountdownTimer.center = CGPointMake(offscreenXValue, offscreenYValue)
//        uiviewCountdownTimerView.center = CGPointMake(offscreenXValue, offscreenYValue)
        
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
        
//        let sizeElement01_Width : CGFloat = 100.0 / CGFloat(numberRowsOrColumns)
//        let sizeElement01_Height : CGFloat = 100.0 / CGFloat(numberRowsOrColumns)
        
        // how to choose the correct height and width where elements will go
        // 60 % of height will be used 
        // or width will be used if 60% of height is more than width
        
        println("ratio of width to height currently: \(screenWidth) and \(screenHeight)")
        
        var usableHeightTotal : CGFloat = 0.40 * screenHeight
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
        
        //println("randomWinningElementPlacementInt is \(randomWinningElementPlacementInt)")
        
        var randomNumberForColor : CGFloat = CGFloat(Float(arc4random()) / 0xFFFFFFFF)

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

                
                // Check whether you are at the winning element, if yes it is a different scenario
                if ((i*numberRowsOrColumns + j) == randomWinningElementPlacementInt) {

                    //if ((i*numberRowsOrColumns + j) == arrayGameElements_WinningElement) {
                    //elementDetailsObj.fillColor = arrayColors[arrayGameElements_WinningElement]
                    elementDetailsObj.fillColor = UIColor.blackColor()
                    
                } else {

                    elementDetailsObj.fillColor = returnColorFromArray()

                    // try 1
                    //elementDetailsObj.fillColor = returnOtherColor(1.0, inGreen: 0.0, inBlue: 0.0)

//                    // try 2
//                    if (randomNumberForColor >= 0.0 && randomNumberForColor <= 0.33) {
//                        println("Red")
//                        elementDetailsObj.fillColor = returnColor_RedShades()
//                    }
//                    else if (randomNumberForColor > 0.33 && randomNumberForColor <= 0.66) {
//                        println("Green")
//                        elementDetailsObj.fillColor = returnColor_GreenShades()
//                    }
//                    else if (randomNumberForColor > 0.66 && randomNumberForColor <= 1.00) {
//                        println("Blue")
//                        elementDetailsObj.fillColor = returnColor_BlueShades()
//                    }
//                    else {
//                        // just in case
//                        println("Default")
//                        elementDetailsObj.fillColor = returnColor_BlueShades()
//                    }
                    
                }
                
                // elementtype parameter is not used, can be cleaned up from the function
                var tempViewToAddToArray = makeGameElementWithDetails(elementDetailsObj, ElementType:0)
                
                //arrayGameElements[i * numberRowsOrColumns + j] = tempViewToAddToArray
                arrayGameElements.insert(tempViewToAddToArray, atIndex: i * numberRowsOrColumns + j)
                
                // following should be used when you are moving game elements
                //tempViewToAddToArray.center = CGPointMake(tempViewToAddToArray.center.x - animationElementsToOffScreen_XValue, tempViewToAddToArray.center.y)

                // following should be used when you are changing alpha for game elements
                //tempViewToAddToArray.center = center need not change
                tempViewToAddToArray.alpha = 1.0
                
                self.view.addSubview(tempViewToAddToArray)
                
            }
        }
        
        animateIntoGamePlayElements()
        
    }
    
    func makeGameElementWithDetails (e_details: ElementDetails, ElementType:Int) -> (UIView) {
        
        var tempElement = UIView(frame: CGRectMake(e_details.x_offset, e_details.y_offset, e_details.width, e_details.height))
        
        //tempElement.backgroundColor = UIColor(red: 204.0, green: 204.0, blue: 153.0, alpha: 1.0)
        tempElement.backgroundColor = UIColor.clearColor()
        
        tempElement.alpha = 1.0
        
        
        // MAKING the LAYER
        // create and add Shape to the UI, can be circle square or triangle
        let oneLayer = CAShapeLayer()
        
//        var randomX = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
//        //println("randomX is \(randomX)")
//        
//        if randomX < 0.05 {
//            randomX = 0.05
//        }
        
        // width is used twice with intention
        // the RECT passed gives the top left and size of the Shape inside the superview
        
//        oneLayer.path = UIBezierPath(ovalInRect: CGRectMake(
//            (e_details.width  - randomX * e_details.width )/2,
//            (e_details.height - randomX * e_details.height)/2,
//            randomX * e_details.width,
//            randomX * e_details.height)).CGPath
//        
        
//        randomX = blackDotSize
        
        oneLayer.path = UIBezierPath(ovalInRect: CGRectMake(
            (e_details.width  - blackDotSize * e_details.width )/2,
            (e_details.height - blackDotSize * e_details.height)/2,
            blackDotSize * e_details.width,
            blackDotSize * e_details.height)).CGPath

        
        // attributes
        //oneLayer.lineWidth = 4
        //oneLayer.strokeColor = UIColor.whiteColor().CGColor
        //oneLayer.strokeColor = UIColor.magentaColor().CGColor
        
        //oneLayer.fillColor = UIColor.blueColor().CGColor
        oneLayer.fillColor = e_details.fillColor.CGColor
//        // HARDCODING the fill color to BLACK
//        oneLayer.fillColor = UIColor.blackColor().CGColor
        
        // Adding the Current Element
        tempElement.layer.addSublayer(oneLayer)
        
        // Element attributes
//        tempElement.layer.borderWidth = 5
//        tempElement.layer.borderColor = UIColor.yellowColor().CGColor
        
        return tempElement
        
    }

    
    func returnPassedColor(UIColor)->(UIColor) {
        var someColor : UIColor
        someColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        return someColor
    }
    
    func returnColorFromArray()->(UIColor) {
        
        // One Color From Array At Random
        // More the number of colors in Array, the better it may look
        
        var randomForColor = CGFloat(Float(arc4random()) / 0xFFFFFFFF)

        var randomForColorHigher = randomForColor * CGFloat(arrayColors.count)
        var randomForColorHigherInt = Int(randomForColorHigher)
        
        return arrayColors[randomForColorHigherInt]
    }

    func returnOtherColor(inRed: CGFloat, inGreen: CGFloat, inBlue: CGFloat)->(UIColor) {

        return UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.00)
//        // THIS PICKS THE COLOR FROM THE ARRAYCOLOR AT RANDOM
//        var randomForColor = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
//        var randomForColorHigher = randomForColor * CGFloat(arrayColors.count)
//        var randomForColorHigherInt = Int(randomForColorHigher)
//        
//        return arrayColors[randomForColorHigherInt]
    }
    
    func returnColor_RedShades() -> (UIColor) {
        var randomForColor1 = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        var randomForColor2 = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        // Red shades
        return UIColor(red: 255/255, green: (randomForColor1 * 64)/255, blue: (randomForColor2 * 64)/255, alpha: 1.00)
    }
    
    func returnColor_GreenShades() -> (UIColor) {
        var randomForColor1 = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        var randomForColor2 = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        // Green Shades
        return UIColor(red: (randomForColor1 * 128 )/255, green: 255/255, blue: (randomForColor2 * 128)/255, alpha: 1.00)
    }
    func returnColor_BlueShades() -> (UIColor) {
        var randomForColor1 = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        var randomForColor2 = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        // Blue Shades
        return UIColor(red: (randomForColor1 * 128 )/255, green: (randomForColor2 * 128 )/255, blue: 255 / 255, alpha: 1.00)
    }
    
    
    func addTapGestureToElements()->(){
        for iCount in 0..<arrayGameElements.count {
            //println("Working on Element \(iCount)")
            var tapGestureRecognizer = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
            tapGestureRecognizer.numberOfTapsRequired = 1
            tapGestureRecognizer.numberOfTouchesRequired = 1
            arrayGameElements[iCount].addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    
    
    func handleTap(recognizer: UITapGestureRecognizer) {
        println(__FUNCTION__)

        // The Game loop is over and we are just waiting for the animation to get over
        // So don't handle this tap and the next loop will make everything right.
//        if true == boolElementsDisabled {
//            // this will ignore the current touch
//            return
//        }
        
        if true == animationInProgressGamePlayElements {
            // this will ignore the current touch
            println("A Touch was ignored")
            return
        }
        
        
        // Attention timer invalidate
        timerGetAttention.invalidate()
        timerMaxDurationToTouch.invalidate()

        for iCount in 0..<arrayGameElements.count {
            
            if recognizer.view === arrayGameElements[iCount] {
                //println("User has tapped Element \(iCount)")
                
                // things need to be done here... like whether the user was right or wrong
         
                if iCount == randomWinningElementPlacementInt {
                //if iCount == arrayGameElements_WinningElement {
                    println("You Win")

                    // =============================================
                    // Calculation of avergage time
                    objectsTouchedInThisGameLoop += 1
                    
                    println(CFAbsoluteTimeGetCurrent() - touchTimeStartAt)
                    
                    var numerator = (averageTimePerTouch * (objectsTouchedInThisGameLoop - 1)) + CGFloat(CFAbsoluteTimeGetCurrent() - touchTimeStartAt)
                    var denominator = objectsTouchedInThisGameLoop
                    
                    averageTimePerTouch =  numerator / denominator
                    
                    //println(averageTimePerTouch)
                    
                    cubeTransition(labelGameStats2, text: returnFloatFormattedDecimals(averageTimePerTouch),
                        fontColor: fontForeGroundColor_GameStatsLabel,
                        direction: AnimationDirection.Negative)
                    // =============================================
                    
                    handleOneRoundWin()
                    
                } else {
                    println("You Lose")
                    handleOneRoundLose()
                    
                }
            }
        }
        
        handleGamePlayElementsInAndOut()
        
    }
    
    
    func handleGamePlayElementsInAndOut()->() {
        println(__FUNCTION__)

        animationInProgressGamePlayElements = true
        
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
//                
////                self.timerMaxDurationToTouch = NSTimer.scheduledTimerWithTimeInterval(Double(3), target: self, selector: Selector("eventMaxDurationToTouch"), userInfo: nil, repeats: true)
//    
//                
////                self.timerGetAttention =
////                    NSTimer.scheduledTimerWithTimeInterval(
////                        bringAttentionToWinningElement_EveryXSeconds,
////                        target: self,
////                        selector: Selector("bringAttentionToWinningElement"),
////                        userInfo: nil,
////                        repeats: true)
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
        
        cubeTransition(labelGameStats1, text: "\(intScore)", fontColor: fontForeGroundColor_GameStatsLabel, direction: AnimationDirection.Negative)
        
//        cubeTransition(labelGameStats2, text: "\(intScore)", direction: AnimationDirection.Negative)
//        cubeTransition(labelGameStats3, text: "\(intScore)", direction: AnimationDirection.Negative)
//        cubeTransition(labelGameStats4, text: "\(intScore)", direction: AnimationDirection.Negative)

//        labelGameStats2.text = "\(intScore)"
//        labelGameStats3.text = "\(intScore)"
//        labelGameStats4.text = "\(intScore)"

        //buttonCountdownTimer.setTitle("\(timerCount)", forState: UIControlState.Normal)
        // update all other game statistics
    }
    
    
    func cubeTransition(label: UILabel, text: String, fontColor: UIColor = UIColor.blackColor(), direction: AnimationDirection) {
        
        let originalFrame = label.frame
        
        var newLabel = UILabel(frame: originalFrame)
        
        var objCommon = CommonFunctions()
        
        //newLabel.text = text
        newLabel.attributedText = objCommon.attributedTextForText(text, fontSize:fontsize_GameStatsLabel, fontForeGroundColor:fontColor)
        
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
                CGAffineTransformMakeScale(1.00, 0.001),
                CGAffineTransformMakeTranslation(0, -newLabelOffset)
            )
            
            }, completion: { _ in
                
                label.attributedText = objCommon.attributedTextForText(text, fontSize:fontsize_GameStatsLabel, fontForeGroundColor:fontColor)
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

        // these invalidation should not be required
        // quit is always only shown after invalidation
//        timerCount = 0
//        timerGameLoopCountdown.invalidate()
//        timerRunning = false
        
        animateOutOfGameOverElements_Quit()

        delay(seconds:animateOutOfGameOverElementsDuration, completion: {
            // remove from visible region all the game over elements
            self.removeGameOverElements()
            self.removeGamePausedElements()
        })
        
        //removeGameOverElements_EverythingElse()
        // get into the main screen now
        delay(seconds:animateOutOfGameOverElementsDuration, completion: {
            self.animateIntoMainScreen()
        })
    }
    
    func tapTryAgainEvent(sender: AnyObject) {
        println(__FUNCTION__)
        
        animateOutOfGameOverElements_TryAgain()
        
        delay(seconds:animateOutOfGameOverElementsDuration, completion: {
            // remove from visible region all the game over elements
            self.removeGameOverElements()
        })
        
        self.tapPlayEvent(UIView)
    }
    
//    func tapCountdownTimerEvent(sender: AnyObject) {
//        println(__FUNCTION__)
//        
//        timerGameLoopCountdown.invalidate()
//        timerRunning = false
//        self.hideForPausedGamePlayElements()
//        animateIntoGamePausedElements()
//    }
    
    func tapResumeEvent(sender: AnyObject) {
        println(__FUNCTION__)

        self.touchTimeStartAt = CFAbsoluteTimeGetCurrent()
        
        animateOutofGamePausedElements()

        delay(seconds:animateOutofGamePausedElementsDuration, completion: {

            //self.unhideForPausedGamePlayElements()
            UIView.animateWithDuration(0.40, delay: 0.00, options: .CurveEaseOut, animations: {
                
                for iCount in 0..<self.arrayGameElements.count {
                    self.arrayGameElements[iCount].alpha = 1.0
                }
                self.labelGameStats1.alpha = 1.0
                self.labelGameStats2.alpha = 1.0
                self.labelGameStats3.alpha = 1.0
                self.labelGameStats4.alpha = 1.0
                // UnHide the Quit button
                self.buttonQuit.alpha = 1.00

                }, completion: {_ in
                    println("completed an animation")
            })

            // Create and Add the timer Again
            self.startAllTimers()
        })
    }
    
    /*
    when play button is touched, main screen elements need to disappear and then
    game play elements need to animate in after the finish of the main screen OUT animation.
    there would be a delay for second animation which has to be appropriate...
    */
    
    func tapPlayEvent(sender: AnyObject) {
        
        var objCommon = CommonFunctions()
        objCommon.playBackgroundMusic("dfd") // this parameter is not used....

        //
//        // testing
//        
//        return
//            
        
        resetGameStatsLabels()
        
        animateOutofMainScreen()
        
        delay(seconds:animateOutofMainScreenDuration, completion: {
            println("delay animateOutofMainScreenDuration introduced here!")

            self.animateIntoGamePlayScreen()
            
            self.createGameElementsForNextRound()
            
            self.delay(seconds:animateIntoGamePlayScreenDuration+(4*animateGameStats_InAndOut)+animateIntoGamePlayElementsDuration, completion: {
                
                self.startAllTimers()
                
            })
            
        })
    }
    
    // Tap Events - END
    // ######################################################################
    // ######################################################################
    // ######################################################################
}






