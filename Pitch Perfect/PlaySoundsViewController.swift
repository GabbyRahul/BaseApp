//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by iosapp1 on 02/02/17.
//  Copyright © 2017 iosapp1. All rights reserved.
//

import UIKit
import KYDrawerController

class PlaySoundsViewController: UIViewController {
    
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var recordedAudioURL: URL!

    override func viewDidLoad() {
        super.viewDidLoad()
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
        self.navigationController?.navigationBar.backItem?.title = ""
        
        //hides navigation bar
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        
        // Do any additional setup after loading the view.
    }
    
    func didTapOpenButton(_ sender: UIBarButtonItem) {
        if let drawerController = navigationController?.parent as? KYDrawerController {
            drawerController.setDrawerState(.opened, animated: true)
        }
    }
    
    func didTapButton(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear Called")
        self.navigationItem.title = "Pitch Perfect"
        //self.navigationController?.navigationBar.backItem?.title = " "
    }
    
    override func viewDidAppear(_ animated: Bool) {
     super.viewDidAppear(animated)
    // self.navigationItem.title = "Pitch Perfect"
     //self.navigationController?.navigationBar.backItem?.title = " "
     }
    
    @IBAction func stopandBackPressed(_ sender: Any) {
        //backPressed code
        _ = navigationController?.popViewController(animated: true)
    }
    
    /*override func didMove(toParentViewController parent: UIViewController?) {
        
        if !(parent?.isEqual(self.parent))! {
            print("back Pressed")
        }
    }*/
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.title = nil
    }
    
}
