//
//  ViewController.swift
//  Touch
//
//  Created by Sunil Variar on 1/27/15.
//  Copyright (c) 2015 Random Chaos Studios. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var buttonPlay: UIButton!
    
    var view1, view2, view3 : UIView!

    var view4 : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        view.backgroundColor = UIColor.greenColor()
    }

    @IBAction func playTouched(sender: AnyObject) {
    
        fadeOutView(buttonPlay)
    
    }
    
    func removeMainScreenElements () -> () {
        buttonPlay.enabled = false
        buttonPlay.hidden = true
        buttonPlay.alpha = 1.0
    }

    func fadeInGamePlayElements () -> () {

        view1 = UIView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height/10))
        
        view1.backgroundColor = UIColor.redColor()
        view1.alpha = 0.0

        view2 = UIView(frame: CGRectMake(0, self.view.bounds.height/10, self.view.bounds.width, 8*self.view.bounds.height/10))
        
        view2.backgroundColor = UIColor.blueColor()
        view2.alpha = 0.0
        
        view3 = UIView(frame: CGRectMake(0, 9*self.view.bounds.height/10, self.view.bounds.width, self.view.bounds.height/10))
        
        view3.backgroundColor = UIColor.magentaColor()
        view3.alpha = 0.0

        self.view.addSubview(view1)
        self.view.addSubview(view2)
        self.view.addSubview(view3)

        
        
        UIView.animateWithDuration(3.0, animations: {
            self.view1.alpha = 1.0
            self.view2.alpha = 1.0
            self.view3.alpha = 1.0
            
            }, completion: {_ in
                NSLog("completed the second animation.")

                NSThread.sleepForTimeInterval(4.0)
                NSLog("Slept for 4 seconds")

                self.fadeOutGamePlayScreen()
                
                self.fadeInEndGameScreen()
                
                
        })

        
        
        
    }
    
    func fadeOutGamePlayScreen() -> () {
        
        self.view1.hidden = true
        self.view2.hidden = true
        self.view3.hidden = true
        
    
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






