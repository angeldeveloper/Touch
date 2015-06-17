//
//  CommonFunctions.swift
//  Touch
//
//  Created by Sunil Variar on 2/11/15.
//  Copyright (c) 2015 Random Chaos Studios. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class CommonFunctions : UIViewController {
    
    func userDefaults_createKeys () -> () {
        println(__FUNCTION__)
        let userDefaultsForApplication = NSUserDefaults.standardUserDefaults()
        
        if var dotsCollected = (userDefaultsForApplication.objectForKey(consNSUserDefaultsKey_dotscollected_alltime) as! Int?) {
            println("found something, so skipped")
            
        }
        else {
            println("found nothing, so creating")
            userDefaultsForApplication.setObject(Int(0), forKey: consNSUserDefaultsKey_dotscollected_alltime)
            userDefaultsForApplication.setObject(Int(0), forKey: consNSUserDefaultsKey_gamesplayed_alltime)
            userDefaultsForApplication.setObject(Float(0.00), forKey: consNSUserDefaultsKey_highestscore_alltime)
        }
        
        userDefaultsForApplication.synchronize()
    }
    
    // Dots Collected
    func userDefaults_incrementDotsCollected_AllTime (dots: Int) -> () {
        println(__FUNCTION__)
        let userDefaultsForApplication = NSUserDefaults.standardUserDefaults()
        let dotsCollected = (userDefaultsForApplication.objectForKey(consNSUserDefaultsKey_dotscollected_alltime) as! Int)
        userDefaultsForApplication.setObject(dotsCollected+dots, forKey: consNSUserDefaultsKey_dotscollected_alltime)
        userDefaultsForApplication.synchronize()
    }

    func userDefaults_getDotsCollected_AllTime () -> (Int) {
        println(__FUNCTION__)
        let userDefaultsForApplication = NSUserDefaults.standardUserDefaults()
        let dotsCollected = (userDefaultsForApplication.objectForKey(consNSUserDefaultsKey_dotscollected_alltime) as! Int)
        return dotsCollected
    }
    
    // Games Played
    func userDefaults_incrementGamesPlayed_AllTime () -> () {
        println(__FUNCTION__)
        let userDefaultsForApplication = NSUserDefaults.standardUserDefaults()
        let gamesPlayed = (userDefaultsForApplication.objectForKey(consNSUserDefaultsKey_gamesplayed_alltime) as! Int)
        userDefaultsForApplication.setObject(gamesPlayed+1, forKey: consNSUserDefaultsKey_gamesplayed_alltime)
        userDefaultsForApplication.synchronize()
    }
    
    func userDefaults_getGamesPlayed_AllTime () -> (Int) {
        println(__FUNCTION__)
        let userDefaultsForApplication = NSUserDefaults.standardUserDefaults()
        let gamesPlayed = (userDefaultsForApplication.objectForKey(consNSUserDefaultsKey_gamesplayed_alltime) as! Int)
        return gamesPlayed
    }
    
    // Highest Score
    func userDefaults_updateHighestScore_AllTime (score: Float) -> () {
        println(__FUNCTION__)
        let userDefaultsForApplication = NSUserDefaults.standardUserDefaults()
        let highestScore = (userDefaultsForApplication.objectForKey(consNSUserDefaultsKey_highestscore_alltime) as! Float)
        if score > highestScore {
            userDefaultsForApplication.setObject(score, forKey: consNSUserDefaultsKey_highestscore_alltime)
            userDefaultsForApplication.synchronize()
        }
    }
    
    func userDefaults_getHighestScore_AllTime () -> (Float) {
        println(__FUNCTION__)
        let userDefaultsForApplication = NSUserDefaults.standardUserDefaults()
        let highestScore = (userDefaultsForApplication.objectForKey(consNSUserDefaultsKey_highestscore_alltime) as! Float)
        return highestScore
    }
    
    
    
    
//    var audioPlayer = AVAudioPlayer()
    
    func attributedTextForText(inString: String, fontSize : CGFloat = fontsize_Small, fontForeGroundColor : UIColor = UIColor.redColor()) -> (NSMutableAttributedString) {
        println(__FUNCTION__)
        
        //return NSMutableAttributedString(string: inString)
        
        var attributedstringReturn = NSMutableAttributedString()
        attributedstringReturn = NSMutableAttributedString(string: inString, attributes: [
            NSFontAttributeName:UIFont(name: "Georgia", size: fontSize)!,
            NSTextEffectAttributeName : NSTextEffectLetterpressStyle,
            ])
        
        attributedstringReturn.addAttribute(NSForegroundColorAttributeName, value: fontForeGroundColor, range: NSRange(location:0,length:count(inString)))
        
        return attributedstringReturn
    }
    
    func music2 () {
        

    }
    
    func playBackgroundMusic (inMusicFile : String) {

        // todo
        
        
        // try 4
//        NSString *soundPath = [[NSBundle mainBundle] pathForResource:inputSound ofType:"aif"];
//        SystemSoundID soundID;
//        AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain([NSURL fileURLWithPath:soundPath]), &soundID);


//        var soundPath = NSBundle.mainBundle().pathForResource("", ofType: "")
//
//        var soundID : SystemSoundID
//        
//        AudioServicesCreateSystemSoundID(CFBridgingRetain(NSURL(fileURLWithPath:soundPath!)) as CFURL, &soundID)
//        
//        AudioServicesPlaySystemSound (soundID);
        
        // try 2
//        //var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("party_crowd_1", ofType: "wav")!)
//        var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("DST-10Class", ofType: "mp3")!)
//        
//        println(alertSound)
//        
//        var audioPlayer = AVAudioPlayer()
//        
//        var errorP:NSError?
//        
//        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &errorP)
//        
//        println("\(errorP?.description)")
//        
//        audioPlayer.prepareToPlay()
//        
//        audioPlayer.play()

        
        // try 3
        /*
        var soundFilePath = NSBundle.mainBundle().pathForResource("Wallpaper", ofType: "mp3")
        var soundData = NSData(contentsOfFile: soundFilePath!, options: nil, error: nil)
        
        var errorP : NSError?
        var audioPlayer = AVAudioPlayer()
        audioPlayer = AVAudioPlayer(data: soundData, error: &errorP)
        println("\(errorP?.description)")
        audioPlayer.prepareToPlay()
        audioPlayer.play()
*/
        
        // try 1
        
//        //NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"in-the-storm" ofType:@"mp3"]];
//        var url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("", ofType: "mp3")!)
//        
//        
//        //AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
//        var audioPlayer = AVAudioPlayer.initWithContentsOfURL
        
//        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
//        [[AVAudioSession sharedInstance] setActive: YES error: nil];
//        [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
//        [audioPlayer play];
//        [super viewDidLoad];
        
    }
}