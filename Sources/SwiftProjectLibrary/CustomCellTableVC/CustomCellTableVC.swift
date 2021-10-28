//
//  CustomCellTableVC.swift
//  LogisticsCargoOwner
//
//  Created by pengpai on 2020/1/13.
//  Copyright © 2020 qiluys. All rights reserved.
//

import UIKit

public protocol CustomCellTableVCDelegate: NSObjectProtocol {
    
    func customCellTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, tagString: String) -> UITableViewCell
    func customCellTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    func customCellTableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
}

public class CustomCellTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    // MARK: - UI
    public func configTableView() {
        
        tableView.tag = tableTag
        tableView.dataSource = self
        tableView.delegate = self
        tableView.bounces = tableViewBounces
        tableView.isScrollEnabled = tableViewScrollEnabled
        tableView.separatorStyle = tableViewSeparatorStyle
        tableView.separatorColor = tableViewSeparatorColor
        tableView.separatorInset = tableViewSeparatorInset
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.edges.equalTo(view.safeAreaInsets)
            } else {
                make.top.equalTo(topLayoutGuide.snp.top)
                make.left.right.equalToSuperview()
                make.bottom.equalTo(bottomLayoutGuide.snp.bottom)
            }
        }
    }
    
    public func registerCell<T: UITableViewCell>(cell: T.Type) where T:RegisterCellFromNib {
        tableView.zs_registerCell(cell: cell)
    }
    
    public func registerCell<T: UITableViewCell>(cellType: T.Type) where T:RegisterCellFromNib {
        tableView.zs_registerCell(cellType: cellType)
    }
    
    public func reloadData() {
        tableView.reloadData()
    }
    
    //MARK: - delegate
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        changeHeightCallback?(allHeight)
        return cellCount
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var tag = ""
        if indexPath.row < cellTagArray.count {
            tag = cellTagArray[indexPath.row]
        }
        if let cell = customCellDelegate?.customCellTableView(tableView, cellForRowAt: indexPath, tagString: tag) {
            return cell
        }else {
            return UITableViewCell()
        }
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        customCellDelegate?.customCellTableView(tableView, didSelectRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if cellHeightArray.count > 0 && cellHeightArray.count == cellTagArray.count {
            return CGFloat(cellHeightArray[indexPath.row])
        }
        return CGFloat(cellHeight)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(headerHeight)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return customCellDelegate?.customCellTableView(tableView, viewForHeaderInSection: section)
    }
    
    
    //MARK: - params
    /// 数据行数
    public var cellCount: Int = 0
    /// 每个cell的标记
    public var cellTagArray: [String] = []
    /// 每个cell的高度
    public var cellHeightArray: [CGFloat] = []
    /// 设置tableView的tag
    public var tableTag: Int = 0 {
        willSet {
            tableView.tag = newValue
        }
    }
    /// 统一设置cell高度，默认为50
    public var cellHeight: Float = 50
    /// cell header 高度，默认为0
    public var headerHeight: Float = 0
    /// 计算所有高度
    public var allHeight: Float {
        get {
            if cellHeightArray.count > 0 && cellHeightArray.count == cellTagArray.count {
                var height: CGFloat = 0
                cellHeightArray.forEach { (f) in
                    height += f
                }
                return Float(height) + headerHeight
            }else {
                return cellHeight * Float(cellCount) + headerHeight
            }
            
        }
    }
    /// 刷新tableView时高度回调
    public var changeHeightCallback:((_ height: Float)->Void)?
    
    
    public let tableView: UITableView = UITableView()
    
    public weak var customCellDelegate: CustomCellTableVCDelegate?
    
    /// tableView config
    public var tableViewBounces = false
    public var tableViewScrollEnabled = false
    public var tableViewSeparatorStyle: UITableViewCell.SeparatorStyle = .singleLine
    public var tableViewSeparatorColor = UIColor(hex: "E8E8E8")
    public var tableViewSeparatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
}
