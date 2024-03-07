//
//  BaseTableVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/1/20.
//

import UIKit
import SnapKit

@objc(BaseTableVC)
@objcMembers class BaseTableVC: BaseVC {
    
    let cellId = "BaseTableVCCell"
    
    internal var private_data:[TableViewModel]?
    
    var dataSource:[TableViewModel] {
        get{
            return private_data ?? []
        }
        set{
            self.private_data = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupSubView()
    }
    
    func setupSubView(){
        view.addSubview(tableview)
        tableview.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CALength.kNavStatusBarHeight)
            make.left.bottom.right.equalTo(0)
        }
    }
    
    lazy var tableview: UITableView = {
        let tableV:UITableView = UITableView(frame: CGRectZero, style: .plain)
        
//        tableV.separatorStyle = .none
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableV.dataSource = self
        tableV.delegate = self
        return tableV
    }()

}



extension BaseTableVC:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) else{
            return UITableViewCell()
        }
        
        cell.textLabel?.text = dataSource[indexPath.row].title
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let className = self.dataSource[indexPath.row].VCName
        let classT = NSClassFromString(className)
        if let classType = NSClassFromString(className) as? UIViewController.Type{
            let vc = classType.init()
            vc.title = self.dataSource[indexPath.row].title
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
