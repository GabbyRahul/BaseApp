//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by iosapp1 on 01/02/17.
//  Copyright © 2017 iosapp1. All rights reserved.
//

import UIKit
import AVFoundation
import Alamofire
import KYDrawerController

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var tapToRecord: UILabel!
    
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    var audioRecorder : AVAudioRecorder!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        view.backgroundColor = UIColor.white
//        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Open",
            style: UIBarButtonItemStyle.plain,
            target: self,
            action: #selector(didTapOpenButton)
        )
        
        stopButton.isEnabled = false
        self.navigationItem.title = "Pitch Perfect"
        
        // change navigationbar color
        self.navigationController?.navigationBar.barTintColor = UIColor.cyan
        
        
        let user = "sbi_rupee"
        let pass = "sbi_rupee"
//        let data = (user + ":" + pass).data(using: String.Encoding.utf8)
//        let base64 = data!.base64EncodedString()
        
        let parameters: Parameters = [
            "RPRequest": ["Authentication": ["Screen": "1"]]
        ]
        
        var headers: HTTPHeaders = [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: pass) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }

        
//        let headers: HTTPHeaders = [
//            "Authorization": "Basic \(base64)",
//            "Accept": "application/json"
//        ]
        
        Alamofire.request("http://uat-sbi.rupeepower.com/uat_mobile_api/services/HL_getSiteContent", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { response in
            debugPrint(response)
        }
        
       // sleep(3)
        //performSegue(withIdentifier: "manuals", sender: nil)
        
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


    @IBAction func recordAudio(_ sender: AnyObject) {
        tapToRecord.text = "Recording in Progress"
        recordButton.isEnabled = false
        stopButton.isEnabled = true
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: AVAudioSessionCategoryOptions.defaultToSpeaker)
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: AnyObject) {
        recordButton.isEnabled = true
        stopButton.isEnabled = false
        tapToRecord.text = "Tap to Record"
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)


    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("some error occur recording not succesful")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        navigationItem.title = nil
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }

    
    
}

