//
//  ManualSegueViewController.swift
//  Pitch Perfect
//
//  Created by iosapp1 on 10/02/17.
//  Copyright © 2017 iosapp1. All rights reserved.
//

import UIKit
import KYDrawerController

class ManualSegueViewController: UIViewController {

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
        
        self.navigationItem.title = "Pitch Perfect"
        
        // change navigationbar color
        self.navigationController?.navigationBar.barTintColor = UIColor.cyan
        
     //   performSegue(withIdentifier: "record", sender: nil)

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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.title = nil
        if segue.identifier == "record" {
            segue.destination as! RecordSoundsViewController
        }
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
