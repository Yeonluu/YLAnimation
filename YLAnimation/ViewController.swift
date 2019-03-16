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
        YLAnimationData.init(title: "基础动画", values: ["位移", "变形", "缩放", "旋转", "圆角", "背景色", "透明度", ])
                            ]
    
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
        default:
            break
        }
    }
}


