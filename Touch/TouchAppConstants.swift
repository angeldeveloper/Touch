//
//  TouchAppConstants.swift
//  Touch
//
//  Created by Sunil Variar on 2/5/15.
//  Copyright (c) 2015 Random Chaos Studios. All rights reserved.
//

import Foundation
import UIKit

// ###################
// The Size of the Black Dot as a percentage
let blackDotSize : CGFloat = 0.70 // it is a percentage size

// ###################
// Game Loop Duration
//let intGameLoopDuration : Int = 3 // duration of each game play
//let intGameLoopDuration : Int = 6 // duration of each game play
let intGameLoopDuration : Int = 10 // duration of each game play
//let intGameLoopDuration : Int = 15 // duration of each game play
//let intGameLoopDuration : Int = 60 // duration of each game play
//let intGameLoopDuration : Int = 15000 // duration of each game play

// ###################
let numberRowsOrColumns = 6

// ###################
// Button Attributes
let buttonCornerRadius : CGFloat = 10.0
let buttonBorderWidth : CGFloat = 2.00
//let buttonBorderColor = UIColor.blackColor().CGColor
let buttonBorderColor = UIColor.redColor().CGColor

// ###################
// Color
//let buttonBackgroundColor : UIColor = UIColor(red: 0.00, green: 0.00, blue: 1.00, alpha: 1.00)
let buttonBackgroundColor : UIColor = UIColor.greenColor()
//let buttonBackgroundColor : UIColor = UIColor.clearColor()

// ###################
// Label Attributes
let labelCornerRadius : CGFloat = 3.00
let labelBorderWidth : CGFloat = 0.00
let labelBorderColor = UIColor.blackColor().CGColor

// ###################
// Animation Durations

let animateIntoMainScreenDuration : Double = 0.28
let animateOutofMainScreenDuration : Double = 0.28

let animateIntoGamePlayScreenDuration : Double = 0.20

let animateIntoGamePlayElementsDuration : Double = 0.30
//let animateIntoGamePlayElementsDuration : Double = 2.00
let animateOutofGamePlayElementsDuration : Double = 0.30

let animateGameStats_InAndOut : Double = 0.07

let animateIntoGameOverElementsDuration : Double = 0.20
let animateOutOfGameOverElementsDuration : Double = 0.20

let animateOutofGamePausedElementsDuration : Double = 0.20

let bringAttentionToWinningElement_EveryXSeconds : Double = 10.00

let cubeTransitionDuration : Double = 0.20

// ###################
// Animation Elements Out of Screen by Balue
let animationElementsToOffScreen_XValue : CGFloat = 700

//// Animation Constants - Out of Game Play Elements
//let delay_OutofGamePlayElements : CGFloat = 0.00
//let duration_OutofGamePlayElements : Double = 0.20

// ###################
// Game Stats Label Movement
let movementGameStatsLabel : CGFloat = 260.00

// ###################
let movementCountdownTimerView : CGFloat = 260.00

// ###################
// Width Height of elements
let sizeSquareObjectsSmall : CGFloat = 0.06

let sizeButtonWidthSmall : CGFloat = 0.40
//let sizeButtonWidthSmall : CGFloat = 0.20

let sizeButtonHeightSmall : CGFloat = 0.10

// ###################
// Notifications
let notificationName_applicationDidBecomeActive     = "NotificationapplicationDidBecomeActive"
let notificationName_applicationDidEnterBackground  = "NotificationapplicationDidEnterBackground"

var boolJustLaunched = false

// ###################
// Font Size - Defining the Available sizes - total 9
let fontsize_XXXSmall : CGFloat     =  8.0
let fontsize_XSmall : CGFloat       = 10.0
let fontsize_ExtraSmall : CGFloat   = 12.0
let fontsize_Small : CGFloat        = 14.0
let fontsize_Medium : CGFloat       = 20.0
let fontsize_Large : CGFloat        = 24.0
let fontsize_ExtraLarge : CGFloat   = 30.0
let fontsize_XLarge : CGFloat       = 40.0
let fontsize_XXXLarge : CGFloat     = 50.0

// ###################
// Defining what sizes to use in the actual game
let fontsize_ApplicationTitleLabel : CGFloat    = fontsize_XLarge
let fontsize_PlayButton : CGFloat               = fontsize_XLarge

let fontsize_GameStatsLabel : CGFloat = fontsize_Small
let fontsize_CountdownTimerButton : CGFloat = fontsize_Medium


// ###################
// Defining font foreground color for all ui elements
let fontForeGroundColor_Default : UIColor                   = UIColor.blackColor()

let fontForeGroundColor_ApplicationTitleLabel : UIColor     = fontForeGroundColor_Default
let fontForeGroundColor_ApplicationTitleSubtitleLabel : UIColor     = fontForeGroundColor_Default
let fontForeGroundColor_CountdownTimerButton : UIColor      = fontForeGroundColor_Default
let fontForeGroundColor_GameStatsLabel : UIColor            = fontForeGroundColor_Default












