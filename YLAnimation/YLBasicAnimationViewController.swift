//
//  YLBasicAnimationViewController.swift
//  YLAnimation
//
//  Created by Yeonluu on 2019/3/15.
//  Copyright © 2018 Yeonluu. All rights reserved.
//


/*
 keyPath list: https://stackoverflow.com/questions/44230796/what-is-the-full-keypath-list-for-cabasicanimation

 属性说明
 - duration 动画的时长
 - repeatCount 重复的次数
 - repeatDuration 设置动画的时间
 - beginTime 指定动画开始的时间
 - timingFunction 设置动画的速度变化
 - autoreverses 动画结束时是否执行逆动画
 - fromValue 所改变属性的起始值
 - toValue 所改变属性的结束时的值
 - byValue 所改变属性相同起始值的改变量
 - removedOnCompletion 动画执行完成是否移除
 - fillMode
 */


import UIKit

enum YLBasicAnimationType: Int {
    case position //位移
    case bounds   //大小
    case scale    //缩放
    case rotation //旋转
    case cornerRadius //圆角
    case backgroundColor //背景色
    case opacity  //透明度
}

class YLBasicAnimationViewController: YLBaseViewController {

    public var animationType = YLBasicAnimationType.position

    override func startAnimation() {
        
        var animation: CABasicAnimation!
        switch animationType {
        case .position:
            animation = CABasicAnimation.init(keyPath: "position")
            animation.fromValue = CGPoint.init(x: 0, y: demoView.frame.minY)
            animation.toValue = CGPoint.init(x: view.frame.maxX, y: demoView.frame.maxY)

        case .bounds:
            animation = CABasicAnimation.init(keyPath: "bounds")
            animation.toValue = CGRect.init(x: 0, y: 0, width: 30, height: 300)

        case .scale:
            animation = CABasicAnimation.init(keyPath: "transform.scale")
            animation.fromValue = NSNumber.init(value: 2)
            animation.toValue = NSNumber.init(value: 0.1)
            
        case .rotation:
            animation = CABasicAnimation.init(keyPath: "transform.rotation.z")
            animation.toValue = NSNumber.init(value: Double.pi)
            
        case .cornerRadius:
            animation = CABasicAnimation.init(keyPath: "cornerRadius")
            animation.toValue = demoView.frame.width/2
            
        case .backgroundColor:
            animation = CABasicAnimation.init(keyPath: "backgroundColor")
            animation.toValue = UIColor.red.cgColor

        case .opacity:
            animation = CABasicAnimation.init(keyPath: "opacity")
            animation.toValue = NSNumber.init(value: 0.0)
        }
        
        animation.duration = 2.0
        animation.repeatCount = MAXFLOAT
        
        // animation.repeatDuration = 2;
        // animation.isRemovedOnCompletion = false
        // animation.fillMode = .forwards
        
        demoView.layer.add(animation, forKey: "basicAnimation")

  
    }
}



