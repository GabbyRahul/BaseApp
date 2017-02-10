//
//  DrawerViewController.swift
//  Pitch Perfect
//
//  Created by iosapp1 on 10/02/17.
//  Copyright © 2017 iosapp1. All rights reserved.
//

import UIKit
import KYDrawerController

class DrawerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view. // Do any additional setup after loading the view.
        let closeButton    = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close", for: UIControlState())
        closeButton.addTarget(self,
                              action: #selector(didTapCloseButton),
                              for: .touchUpInside
        )
        closeButton.sizeToFit()
        closeButton.setTitleColor(UIColor.blue, for: UIControlState())
        view.addSubview(closeButton)
        view.addConstraint(
            NSLayoutConstraint(
                item: closeButton,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            )
        )
        view.addConstraint(
            NSLayoutConstraint(
                item: closeButton,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerY,
                multiplier: 1,
                constant: 0
            )
        )
        view.backgroundColor = UIColor.white
    }
    
    func didTapCloseButton(_ sender: UIButton) {
        if let drawerController = parent as? KYDrawerController {
            drawerController.setDrawerState(.closed, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
