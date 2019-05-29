//
//  YLKeyframeAnimationViewController.swift
//  YLAnimation
//
//  Created by Yeonluu on 2019/3/15.
//  Copyright © 2018 Yeonluu. All rights reserved.
//

import UIKit

enum YLKeyframeAnimationType: Int {
    case position  //关键帧
    case path      //路径
    case shake     //抖动
}

class YLKeyframeAnimationViewController: YLBaseViewController {

    public var animationType = YLKeyframeAnimationType.position
    
    override func startAnimation() {
        
        var animation: CAKeyframeAnimation!
        switch animationType {
        case .position:
            animation = CAKeyframeAnimation.init(keyPath: "position")
            let value0 = CGPoint.init(x: 50, y: 200)
            let value1 = CGPoint.init(x: ScreenWidth-50, y: 200)
            let value2 = CGPoint.init(x: 50, y: 500)
            let value3 = CGPoint.init(x: ScreenWidth/2, y: 64+50)
            let value4 = CGPoint.init(x: ScreenWidth-50, y: 500)
            let value5 = CGPoint.init(x: 50, y: 200)
            animation.values = [value0, value1, value2, value3, value4, value5]
            
        case .path:
            animation = CAKeyframeAnimation.init(keyPath: "position")
            let path = UIBezierPath.init(arcCenter: CGPoint.init(x: ScreenWidth/2, y: ScreenHeight/2), radius: ScreenWidth/2-50, startAngle: 0.0, endAngle: .pi*2, clockwise: true)
            animation.path = path.cgPath
            demoView.layer.add(animation, forKey: "pathAnimation")
            
        case .shake:
            animation = CAKeyframeAnimation.init(keyPath: "transform.rotation")
            let value0 = NSNumber.init(value: -Double.pi / 180 * 8)
            let value1 = NSNumber.init(value: Double.pi / 180 * 8)
            animation.values = [value0, value1, value0]
        }
        
        animation.duration = 2.0
        animation.repeatCount = MAXFLOAT
        demoView.layer.add(animation, forKey: "keyframeAnimation")
    }
    
    
}
