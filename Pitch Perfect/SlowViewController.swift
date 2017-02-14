//
//  SlowViewController.swift
//  Pitch Perfect
//
//  Created by iosapp1 on 02/02/17.
//  Copyright © 2017 iosapp1. All rights reserved.
//

import UIKit
import KYDrawerController

class SlowViewController: UIViewController {

    @IBOutlet weak var imagView: UIImageView!
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
        // change navigation bar back text
        //self.navigationController?.navigationBar.backItem?.title = "abc"
        let tapGestureRecignizer = UITapGestureRecognizer(target: self, action: #selector(imageTaped(img:)))
        imagView.isUserInteractionEnabled = true
        imagView.addGestureRecognizer(tapGestureRecignizer)
        manualSegue()
        
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
        //self.navigationController?.navigationBar.backItem?.title = " "
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //self.navigationItem.title = "Pitch Perfect"
        //self.navigationController?.navigationBar.backItem?.title = " "
    }

    func imageTaped(img: AnyObject) {
        // it pop to startview controller
        self.navigationController?.popToRootViewController(animated: true)
        
        
        // it pop to startview controller
      //self.navigationController?.popToViewController(self.navigationController!.viewControllers[self.navigationController!.viewControllers.count - 2], animated: true)
    }
    
    func manualSegue() {
        sleep(7)
        performSegue(withIdentifier: "slowPitch", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.title = nil
        if segue.identifier == "slowPitch" {
            segue.destination as! ManualSegueViewController
        }
    }
    

}
