//
//  YLBaseViewController.swift
//  YLAnimation
//
//  Created by Yeonluu on 2019/3/15.
//  Copyright © 2019 Yeonluu. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

class YLBaseViewController: UIViewController {
    
    public let demoView = UIView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        demoView.backgroundColor = .blue
        demoView.center = view.center
        view.addSubview(demoView)
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.startAnimation()
    }
    
    
    public func startAnimation() {
        
    }
    
}
