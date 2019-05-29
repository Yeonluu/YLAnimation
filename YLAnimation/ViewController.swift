//
//  ViewController.swift
//  YLAnimation
//
//  Created by Yeonluu on 2019/3/13.
//  Copyright © 2019 Yeonluu. All rights reserved.
//

import UIKit

struct YLAnimationData {
    var title = ""
    var values = [String]()
}

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private let dataList = [
        YLAnimationData.init(title: "基础动画", values: ["位移", "变形", "缩放", "旋转", "圆角", "背景色", "透明度"]),
        YLAnimationData.init(title: "关键帧动画", values: ["位移", "路径", "抖动"]),
        YLAnimationData.init(title: "其他动画", values: ["比心"]),
        YLAnimationData.init(title: "转场动画", values: ["淡入", "推入", "移入", "显出", "立方翻转", "水平翻转", "旋转", "收缩抽走", "水纹", "向上翻页", "向下翻页", "相机镜头", "相机镜头打开", "相机镜头关闭"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "YLAnimationDemo"
        tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AnimationCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44
        tableView.sectionHeaderHeight = 30
        view.addSubview(tableView)
        view.backgroundColor = .white
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList[section].values.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataList[section].title
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimationCell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = dataList[indexPath.section].values[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            if let animationType = YLBasicAnimationType(rawValue: indexPath.row) {
                let demoVC = YLBasicAnimationViewController()
                demoVC.animationType = animationType
                navigationController?.pushViewController(demoVC, animated: true)
            }
        case 1:
            if let animationType = YLKeyframeAnimationType(rawValue: indexPath.row) {
                let demoVC = YLKeyframeAnimationViewController()
                demoVC.animationType = animationType
                navigationController?.pushViewController(demoVC, animated: true)
            }
        case 2:

            navigationController?.pushViewController(YLOtherAnimationViewController(), animated: false)
        case 3:
            let animation = YLTransitionViewController.transitionForType(indexPath.row)
            navigationController?.view.layer.add(animation, forKey: "transition")
            navigationController?.pushViewController(YLTransitionViewController(), animated: false)
        default:
            break
        }
    }
}


