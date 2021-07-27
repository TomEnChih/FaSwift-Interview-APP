//
//  LabelText.swift
//  Foodish
//
//  Created by 董恩志 on 2021/7/27.
//

import UIKit



extension UILabel {
    
    func setText(String1: String, String2: String){
        //applying the line break mode
        self.lineBreakMode = NSLineBreakMode.byWordWrapping;
        let buttonText: NSString = "\(String1)\n\(String2)" as NSString
        
        //getting the range to separate the button title strings
        let newlineRange: NSRange = buttonText.range(of: "\n")
        
        //getting both substrings 為了分成兩個String
        var substring1 = ""
        var substring2 = ""
        
        if(newlineRange.location != NSNotFound) {
            substring1 = buttonText.substring(to: newlineRange.location)
            substring2 = buttonText.substring(from: newlineRange.location)
        }
        
        //assigning diffrent fonts to both substrings
        let font1: UIFont = UIFont.boldSystemFont(ofSize: 18)
        let attributes1 = [NSMutableAttributedString.Key.font: font1,NSMutableAttributedString.Key.foregroundColor: UIColor.black]
        let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)
        
        let font2: UIFont = UIFont.systemFont(ofSize: 15)
        let attributes2 = [NSMutableAttributedString.Key.font: font2,NSMutableAttributedString.Key.foregroundColor: UIColor.lightGray]
        let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)
        
        attrString1.append(attrString2)
        
        self.attributedText = attrString1
    }
}

