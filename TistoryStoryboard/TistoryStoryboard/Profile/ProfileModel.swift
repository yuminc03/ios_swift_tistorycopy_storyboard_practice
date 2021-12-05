//
//  ProfileModel.swift
//  TistoryStoryboard
//
//  Created by LS-NOTE-00106 on 2021/12/03.
//

struct ProfileModel {
    var profileTitle: String = ""
    var profileUrl: String = ""
    var profileImageName: String? = ""
    var subscribeNumber: Int = 0
    var profileCategory: [ProfileCategory] = []
}

struct ProfileCategory {
    var profileCategoryName: String = ""
    var profileCategoryNum: Int = 0
    var isSelected: Bool = false
    var profileCategoryCell: [ProfileCell] = []
}

struct ProfileCell {
    var cellTitle: String = ""
    var cellImageName: String? = ""
    var cellLikeNum: Int = 0
    var cellCommentNum: Int = 0
    var cellDate: String = ""
}
