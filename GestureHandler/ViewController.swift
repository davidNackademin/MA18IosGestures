//
//  ViewController.swift
//  GestureHandler
//
//  Created by Björn Åhström on 2019-02-01.
//  Copyright © 2019 Björn Åhström. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gestureName: UILabel!
    @IBOutlet var singelTapRecognizer: UITapGestureRecognizer!
    @IBOutlet var doubleTapRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        singelTapRecognizer.require(toFail: doubleTapRecognizer)
    }

    @IBAction func singelTap(_ sender: Any) {
        showGestureName(name: "Tap")
    }
    
   
    @IBAction func doubleTap(_ sender: UITapGestureRecognizer) {
        showGestureName(name: "Double Tap")
    }
    
    func showGestureName(name: String) {
        gestureName.text = name
        //gestureName.isHidden = false
        
        //UIView.animate(withDuration: 1.0, animations: makeLabelViseble)
        
        UIView.animate(withDuration: 1.0, animations: {self.gestureName.alpha = 1.0}, completion: makeLabelIncisable)
    }
    
    func makeLabelIncisable(finished: Bool) {
        //self.gestureName.alpha = 0
        UIView.animate(withDuration: 1.0, animations: {self.gestureName.alpha = 0})
    }
    
    //    func makeLabelViseble() -> Void {
    //        gestureName.alpha = 1.0
    //    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake {
            showGestureName(name: "Shake")
        }
    }
    
    
    
    
    
    

    
}

