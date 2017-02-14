//
//  FastViewController.swift
//  Pitch Perfect
//
//  Created by iosapp1 on 02/02/17.
//  Copyright © 2017 iosapp1. All rights reserved.
//

import UIKit
import KYDrawerController

class FastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.leftItemsSupplementBackButton = true
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: " Open",
            style: UIBarButtonItemStyle.plain,
            target: self,
            action: #selector(didTapOpenButton)
        )
        
        // set navigation bar title text
        
        
        self.navigationItem.title = "Pitch Perfect"
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.title = nil
    }
}
