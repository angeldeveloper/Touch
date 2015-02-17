//
//  CommonFunctions.swift
//  Touch
//
//  Created by Sunil Variar on 2/11/15.
//  Copyright (c) 2015 Random Chaos Studios. All rights reserved.
//

import Foundation
import UIKit

class CommonFunctions : UIViewController {
    
    func attributedTextForText(inString: String, fontSize : CGFloat) -> (NSMutableAttributedString) {
        println(__FUNCTION__)
        
        //return NSMutableAttributedString(string: inString)
        
        var attributedstringReturn = NSMutableAttributedString()
        attributedstringReturn = NSMutableAttributedString(string: inString, attributes: [
            NSFontAttributeName:UIFont(name: "Georgia", size: fontSize)!,
            NSTextEffectAttributeName : NSTextEffectLetterpressStyle,
            ])
        return attributedstringReturn
    }
}