//
//  ProfileInfoHeader.swift
//  TistoryStoryboard
//
//  Created by LS-NOTE-00106 on 2021/12/03.
//

import UIKit

class ProfileInfoTableViewHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var subscribeNumLabel: UILabel!
    @IBOutlet weak var blogSettingButton: UIButton!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setComponents() {
        profileImageView.backgroundColor = .black;
        profileImageView.layer.maskedCorners = .layerMaxXMaxYCorner
        profileImageView.layer.cornerRadius = 50
        
    }
}
