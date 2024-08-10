//
//  BaseTableViewCell.swift
//  AppstoreProject
//
//  Created by 박성민 on 8/10/24.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setUpHierarchy()
        setUpLayout()
        setUpView()
    }
    
    func setUpHierarchy() {}
    func setUpLayout() {}
    func setUpView() {}
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
