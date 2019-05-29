
//
//  YLOtherAnimationViewController.swift
//  YLAnimation
//
//  Created by Yeonluu on 2019/5/29.
//  Copyright © 2019 Yeonluu. All rights reserved.
//

import UIKit

enum YLOtherAnimationType: Int {
    case heart  // 比心
}

class YLOtherAnimationViewController : YLBaseViewController {
    
    override func startAnimation() {
        self.heart()
    }
    
    private func heart() {
        demoView.removeFromSuperview()
        let path = UIBezierPath()
        
        let startPoint = CGPoint.init(x: ScreenWidth/2, y: 250)
        path.move(to: startPoint)
        
        let endPoint = CGPoint.init(x: ScreenWidth/2, y: 250+ScreenWidth-200)
        var point1 = CGPoint.init(x: 100, y: 150)
        var point2 = CGPoint.init(x: 0, y: 300)
        path.addCurve(to: endPoint, controlPoint1: point1, controlPoint2: point2)
        path.move(to: endPoint)
        
        point1 = CGPoint.init(x: ScreenWidth, y: 300)
        point2 = CGPoint.init(x: ScreenWidth-100, y: 150)
        path.addCurve(to: startPoint, controlPoint1: point1, controlPoint2: point2)
        
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        
        let animLayer = CAShapeLayer()
        animLayer.path = path.cgPath
        animLayer.lineWidth = 2
        animLayer.strokeColor = UIColor.black.cgColor
        animLayer.fillColor = UIColor.clear.cgColor
        animLayer.strokeStart = 0
        animLayer.strokeEnd = 1
        view.layer.addSublayer(animLayer)
        
        let animation = CABasicAnimation.init(keyPath: "strokeEnd")
        animation.fromValue = NSNumber.init(value: 0)
        animation.toValue = NSNumber.init(value: 1)
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animLayer.add(animation, forKey: "heart")
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            animLayer.fillColor = UIColor.red.cgColor
            
            let animation = CAKeyframeAnimation.init(keyPath: "transform.scale")
            let value0 = NSNumber.init(value: 1)
            let value1 = NSNumber.init(value: 1.1)
            let value2 = NSNumber.init(value: 1.2)
            
            animation.values = [value0, value1, value0, value1, value0, value2, value0]
            animation.duration = 2
            animation.repeatCount = MAXFLOAT
            animLayer.add(animation, forKey: "heartBreak")
        }
        
    }
    
}

