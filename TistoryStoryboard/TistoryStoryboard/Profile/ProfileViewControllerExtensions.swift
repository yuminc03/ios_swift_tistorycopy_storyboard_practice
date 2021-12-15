//
//  ProfileViewControllerExtensions.swift
//  TistoryStoryboard
//
//  Created by LS-NOTE-00106 on 2021/12/03.
//

import UIKit

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileModel.profileCategory[selectedCategoryIndex].profileCategoryCell.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyBlogPostTableViewHeader") as! MyBlogPostTableViewHeader
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 ? 10 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = profileModel.profileCategory[selectedCategoryIndex].profileCategoryCell[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyBlogPostTableViewCell", for: indexPath) as! MyBlogPostTableViewCell
        cell.setPostImageViewColor(index: indexPath.row)
        cell.setData(title: data.cellTitle, likeNum: data.cellLikeNum, commentNum: data.cellCommentNum, date: data.cellDate)
        return cell
    }
    
//    @objc private func categoryChangeButtonDidTapped(button: UIButton) {
//        tabBarController?.tabBar.isHidden = true
//
//        let storyboard = UIStoryboard(name: "ProfileCategoryViewController", bundle: Bundle.main)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "ProfileCategoryViewController")
//        self.present(viewController, animated: true)
//    }
}
