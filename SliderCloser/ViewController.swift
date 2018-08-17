//
//  ViewController.swift
//  SliderCloser
//
//  Created by Chang Sophia on 2018/8/16.
//  Copyright © 2018年 Chang Sophia. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
     var player: AVPlayer?
    @IBOutlet weak var reconcileSlider: UISlider!
    @IBOutlet weak var babysisterImageView: UIImageView!
    @IBOutlet weak var eldersisterImageView: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
   
    
    
    @IBAction func reconcileSidlerChange(_ sender: UISlider) {
        if sender.value <= Float(0.5){
            babysisterImageView.frame.origin.x = CGFloat(0+30*sender.value)
            eldersisterImageView.frame.origin.x = CGFloat(492-30*sender.value)
        }else {
            babysisterImageView.frame.origin.x = CGFloat(0+124*sender.value)
            eldersisterImageView.frame.origin.x = CGFloat(492-124*sender.value)
        }
        sender == reconcileSlider
            distanceLabel.text = String(format:"%.f", reconcileSlider.value*100)
        
        if distanceLabel.text == String(100){
            if let url = Bundle.main.url(forResource: "voice", withExtension: "m4a"){
                player = AVPlayer(url: url)
                player?.play()
            }
        }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
