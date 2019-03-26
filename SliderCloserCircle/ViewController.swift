//
//  ViewController.swift
//  SliderCloser
//
//  Created by Chang Sophia on 2019/3/25.
//  Copyright © 2019年 Chang Sophia. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
     var player: AVPlayer?
  
    @IBOutlet weak var circleImageView: UIImageView!
    @IBOutlet weak var reconcileSlider: UISlider!
    @IBOutlet weak var babysisterImageView: UIImageView!
    @IBOutlet weak var eldersisterImageView: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var poolImageView: UIImageView!
 
    let trans = CGAffineTransform(rotationAngle: -CGFloat.pi/5.3)
    var babysisterCenter = CGPoint()
    var eldersisterCenter = CGPoint()
    var poolCenter = CGPoint()
    var circleCenter = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        distanceLabel.clipsToBounds = true
        distanceLabel.layer.cornerRadius = 30
        
        babysisterImageView.transform = trans
        eldersisterImageView.transform = trans
        babysisterImageView.rotate360Degree()
        eldersisterImageView.rotate360Degree()
        babysisterImageView.center = CGPoint(x: 86, y: 300)
        eldersisterImageView.center = CGPoint(x: 596, y: 300)
        babysisterCenter = babysisterImageView.center
        eldersisterCenter = eldersisterImageView.center
        poolCenter = poolImageView.center
        circleCenter = circleImageView.center
    }
    
    @IBAction func reconcileSidlerChange(_ sender: UISlider) {
      
       let radian = Double(5)*Double.pi/180
        babysisterImageView.center = CGPoint(x: Double(circleCenter.x)+30 -
            250*cos(radian*Double(sender.value)), y: Double(circleCenter.y) -
            250*sin(radian*Double(sender.value)))
        eldersisterImageView.center = CGPoint(x: Double(circleCenter.x) +
            250*cos(radian*Double(sender.value)), y: Double(circleCenter.y) -
                250*sin(radian*Double(sender.value)))
    
        
        if sender == reconcileSlider {
        distanceLabel.text = String(format:"%.f", reconcileSlider.value*5)
        if distanceLabel.text == String(70){
            if let url = Bundle.main.url(forResource: "voice", withExtension: "m4a"){
                player = AVPlayer(url: url)
                player?.play()
            }
            babysisterImageView.stopRotate()
            eldersisterImageView.stopRotate()
        }
                    
        }
}
    }


extension UIImageView {
    // 360度旋轉圖片
    func rotate360Degree() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z") // 在z軸旋轉
        rotationAnimation.toValue = NSNumber(value: Double.pi * 3.0) // 旋轉角度
        rotationAnimation.duration = 5.0 // 旋轉周期
        rotationAnimation.isCumulative = true // 旋轉累加角度
        rotationAnimation.repeatCount = 100 // 旋轉次數
        layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    // 停止旋轉
    func stopRotate() {
        layer.removeAllAnimations()
    }
}
