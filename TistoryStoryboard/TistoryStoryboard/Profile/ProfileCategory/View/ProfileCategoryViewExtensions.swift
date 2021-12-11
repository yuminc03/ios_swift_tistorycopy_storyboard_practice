//
//  ProfileCategoryViewExtensions.swift
//  TistoryStoryboard
//
//  Created by LS-NOTE-00106 on 2021/12/08.
//

import UIKit

extension ProfileCategoryViewController: ProfileCategoryViewDelegate {
    func profileCategoryDidTapped(index: Int) {
        delegate?.profileCategoryDidTapped(viewController: self, at: index)
    }

}
