//
//  HeloViewController.swift
//  Pitch Perfect
//
//  Created by iosapp1 on 03/02/17.
//  Copyright © 2017 iosapp1. All rights reserved.
//

import UIKit
import KYDrawerController

class HeloViewController: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var checkBox: CustomCheckbox!
    @IBOutlet weak var checkBox2: CustomCheckbox!
    @IBOutlet weak var male: GroupedRadioButton!
    @IBOutlet weak var female: GroupedRadioButton!
    
    var group1: GroupedRadioButton?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftItemsSupplementBackButton = true
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: " Open",
            style: UIBarButtonItemStyle.plain,
            target: self,
            action: #selector(didTapOpenButton)
        )
        
        // Do any additional setup after loading the view.
        // set navigation bar title text
        self.navigationItem.title = "Pitch Perfect"
        //checkBox.labelText = "Please Accpt Disclaimer"
        //checkBox2.labelText = "Please Accept Disclaimer"
        
    }
    func didTapOpenButton(_ sender: UIBarButtonItem) {
        if let drawerController = navigationController?.parent as? KYDrawerController {
            drawerController.setDrawerState(.opened, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear Called")
        self.navigationItem.title = "Pitch Perfect"
        // self.navigationController?.navigationBar.backItem?.title = " "
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //self.navigationItem.title = "Pitch Perfect"
        // self.navigationController?.navigationBar.backItem?.title = " "
    }
    @IBAction func ManualAction(_ sender: CustomCheckbox) {
        //sender.isChecked = !sender.isChecked
        if sender.isChecked {
            firstLabel.text = "Checked"
        } else {
        
            firstLabel.text = "Not Checked"
        }
    }
    @IBAction func popTwoController(_ sender: CustomCheckbox) {
        if sender.isChecked {
        firstLabel.text = "\u{2611}"
        let unchecked = "\u{2610}"
        firstLabel.text = "\(unchecked)  \u{2611}"
        print(firstLabel)
        } else {
            firstLabel.text = "hi"
       //sleep(7)
       // self.navigationController?.popToViewController(self.navigationController!.viewControllers[self.navigationController!.viewControllers.count - 3], animated: true)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.title = nil
    }
}
