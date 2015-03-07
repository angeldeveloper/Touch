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
    
//    var audioPlayer = AVAudioPlayer()
    
    func attributedTextForText(inString: String, fontSize : CGFloat = fontsize_Small, fontForeGroundColor : UIColor = UIColor.redColor()) -> (NSMutableAttributedString) {
        println(__FUNCTION__)
        
        //return NSMutableAttributedString(string: inString)
        
        var attributedstringReturn = NSMutableAttributedString()
        attributedstringReturn = NSMutableAttributedString(string: inString, attributes: [
            NSFontAttributeName:UIFont(name: "Georgia", size: fontSize)!,
            NSTextEffectAttributeName : NSTextEffectLetterpressStyle,
            ])
        
        attributedstringReturn.addAttribute(NSForegroundColorAttributeName, value: fontForeGroundColor, range: NSRange(location:0,length:countElements(inString)))
        
        return attributedstringReturn
    }
    
    func music2 () {
        

    }
    
    func playBackgroundMusic (inMusicFile : String) {

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