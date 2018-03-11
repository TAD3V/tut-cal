//
//  RoundButton.swift
//  TutCal
//
//  Created by Jasper Avtarovski on 9/3/18.
//  Copyright © 2018 PPYazi. All rights reserved.
//

import UIKit
@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var roundButton:Bool = false{
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}
