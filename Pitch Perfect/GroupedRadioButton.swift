//
//  GroupedRadioButton.swift
//  Pitch Perfect
//
//  Created by iosapp1 on 08/02/17.
//  Copyright © 2017 iosapp1. All rights reserved.
//

import UIKit
@IBDesignable
class GroupedRadioButton: UIButton {
    
    public var groupRadioButtons: Array<GroupedRadioButton>?

    @IBInspectable
    public var cornerRadius: CGFloat = 6.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor = UIColor.lightGray {
        didSet {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat = 1.0 {
        didSet {
            self.layer.borderWidth = self.borderWidth
        }
    }
    @IBInspectable
    public var maskToBounds: Bool = true {
        didSet {
            self.layer.masksToBounds = self.maskToBounds
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        customInitialization()
    }
    // MARK: Initialization
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInitialization()
    }
    
   
    private func customInitialization() {
        self.addTarget(self, action: #selector(unSelectAlternateButton(sender:)), for: UIControlEvents.touchUpInside)
       // self.isSelected = true
        setFillState()
    }

    
    // MARK: Custom
    private func setFillState() {
        if self.isSelected {
            self.setTitleColor(UIColor.white ,for: UIControlState.selected)
            self.backgroundColor = UIColor.orange
            self.borderWidth = 0
        } else {
            self.setTitleColor(UIColor.black ,for: UIControlState.normal)
            self.backgroundColor = UIColor.white
            self.borderWidth = 1.0
        }
    }
    // Overriden methods.
    override public func prepareForInterfaceBuilder() {
        customInitialization()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    func unSelectAlternateButton(sender: GroupedRadioButton) {
        if groupRadioButtons != nil {
            sender.isSelected = true
            for button: GroupedRadioButton in groupRadioButtons! {
                button.isSelected = false
            }
        } else {
            toggleButton()
        }
    }
    
    func toggleButton() {
            self.isSelected = !isSelected
    }

    
    override public var isSelected: Bool {
        didSet {
            setFillState()
        }
    }

}
