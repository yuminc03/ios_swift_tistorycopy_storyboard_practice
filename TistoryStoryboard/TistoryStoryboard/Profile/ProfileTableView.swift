//
//  ProfileTableView.swift
//  TistoryStoryboard
//
//  Created by LS-NOTE-00106 on 2021/12/03.
//

import UIKit

class ProfileTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
