//
//  YLTransitionViewController.swift
//  YLAnimation
//
//  Created by Yeonluu on 2019/5/29.
//  Copyright © 2019 Yeonluu. All rights reserved.
//
import UIKit

// 完整属性参考：http://iphonedevwiki.net/index.php/CATransition

enum YLTransitionType: String, CaseIterable {
    case cube = "cube"                 // 立方体翻转
    case flip = "flip"                 // 水平翻转
    case rotate = "rotate"             // 旋转
    case suckEffect = "suckEffect"     // 收缩抽走
    case rippleEffect = "rippleEffect" // 水纹
    case pageCurl = "pageCurl"         // 向上翻页
    case pageUnCurl = "pageUnCurl"     // 向下翻页
    case cameraIris = "cameraIris"     // 相机镜头
    case cameraIrisHollowOpen = "cameraIrisHollowOpen"  // 相机镜头打开
    case cameraIrisHollowClose = "cameraIrisHollowClose"// 相机镜头关闭
}

class YLTransitionViewController: YLBaseViewController {
    
    class func transitionForType (_ index: Int) -> CATransition {
        
        let transition = CATransition()
        transition.duration = 1.0
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.subtype = CATransitionSubtype.fromRight
        transition.repeatCount = 1
        if index < 4 {
            let typeList: [CATransitionType] = [.fade, .moveIn, .push, .reveal]
            transition.type = typeList[index]
        }
        else {
            transition.type = CATransitionType.init(rawValue: YLTransitionType.allCases[index-4].rawValue)
        }
        return transition
    }
 
}
