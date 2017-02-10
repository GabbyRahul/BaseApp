//
//  CustomCheckbox.swift
//  Pitch Perfect
//
//  Created by iosapp1 on 02/02/17.
//  Copyright © 2017 iosapp1. All rights reserved.
//

import UIKit
@IBDesignable
class CustomCheckbox: UIButton {
   
    @IBInspectable let checked = "\u{2611}"
    @IBInspectable let unchecked = "\u{2610}"
    var title = " "
    
//    public var labelText: String = ""//{
//        get {
//            return self.labelText
//        }
//        set {
//            self.labelText = newValue
//        }
//    }

    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    // Bool

    var isChecked: Bool = false{
        didSet{
      setFillState()
        }
    }
    
    private func setFillState() {
        if self.isChecked {
            //  self.setImage(checked, for: .Normal)
            
            self.setTitle(checked + title, for: UIControlState.normal)
        } else {
            //self.setImage(unchecked, for: .Normal)
            self.setTitle(unchecked + title, for: UIControlState.normal)
        }
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
        customInitialization()
    }
    // MARK: Initialization
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        title = " " + self.currentTitle!
        customInitialization()
    }
    
    private func customInitialization() {
        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        self.isChecked = false
        setFillState()
    }
    
  
    // Overriden methods.
    override public func prepareForInterfaceBuilder() {
        customInitialization()
    }
    
    func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }

}
