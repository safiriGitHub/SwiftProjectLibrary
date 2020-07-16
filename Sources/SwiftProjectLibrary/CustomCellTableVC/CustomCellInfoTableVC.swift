//
//  CustomCellInfoTableVC.swift
//  LogisticsDriver
//
//  Created by pengpai on 2019/12/11.
//  Copyright © 2019 qiluys. All rights reserved.
//

import UIKit

public protocol CustomInfoCellProtocol {
    var customInfoTitleLabel: UILabel { get }
    var customInfoContentLabel: UILabel { get }
}

extension UITableViewCell: CustomInfoCellProtocol {
    public var customInfoTitleLabel: UILabel {
        UILabel()
    }
    
    public var customInfoContentLabel: UILabel {
        UILabel()
    }
    
    
}

public class CustomCellInfoTableVC<T>: UIViewController, CustomCellTableVCDelegate where T:UITableViewCell&RegisterCellFromNib  {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    func configUI() {
        
        tableViewVC.cellCount = titleArray.count
        tableViewVC.headerHeight = headerHeight
        tableViewVC.changeHeightCallback = changeHeightCallback
        
        view.addSubview(tableViewVC.view)
        tableViewVC.view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tableViewVC.customCellDelegate = self
        tableViewVC.registerCell(cellType: CustomInfoCellT.self)
        
    }
    
    public func customCellTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, tagString: String) -> UITableViewCell {
        let cell = tableView.zs_dequeueReusableCell(indexPath: indexPath) as T
        if indexPath.row < titleArray.count {
            cell.customInfoTitleLabel.text = titleArray[indexPath.row]
            cell.customInfoContentLabel.text = contentArray[indexPath.row]
        }
        return cell
    }
    
    public func customCellTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    public func customCellTableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let cb = viewForHeaderInSectionCallback {
            return cb()
        }
        return createCustomHeaderView()
    }
    
    public func createCustomHeaderView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: CGFloat(headerHeight)))
        let color = UIColor(hex: "5E2ADC")
        view.backgroundColor = color.alpha(0.2)
        let label = UILabel()
        label.text = sectionHeaderTitle
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
        return view
    }
    
    public func reloadData() {
        tableViewVC.tableView.reloadData()
    }
    
    public var titleArray: [String?] = []{
        willSet {
            tableViewVC.cellCount = newValue.count
        }
    }
    public var contentArray: [String?] = []
    public var headerHeight: Float = 38
    public var sectionHeaderTitle = ""
    public var CustomInfoCellT: T.Type = ShowDefaultCell.self as! T.Type
    
    public var changeHeightCallback:((_ height: Float)->Void)?
    public var viewForHeaderInSectionCallback:(()->UIView)?
    public let tableViewVC: CustomCellTableVC = CustomCellTableVC()
    
}
