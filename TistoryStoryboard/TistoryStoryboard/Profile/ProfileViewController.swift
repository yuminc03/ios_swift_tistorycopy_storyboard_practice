//
//  ProfileViewControllerr.swift
//  TistoryStoryboard
//
//  Created by LS-NOTE-00106 on 2021/12/03.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileModel = ProfileModel()
    var selectedCategoryIndex: Int = 0
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var profileInfoHeaderView: ProfileInfoHeaderView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configulations()
        setTableView()
        setProfileInfoHeader()
    }
    
    private func configulations() {
        let model = ProfileModel(
            profileTitle: "천천히 해도 괜찮아",
            profileUrl: "dpffldk.tistory.com",
            profileImageName: "backgroundImage1.png",
            subscribeNumber: 1,
            profileCategory: [
                ProfileCategory(
                    profileCategoryName: "분류 전체보기",
                    profileCategoryNum: 8,
                    isSelected: true,
                    profileCategoryCell: [
                        ProfileCell(
                            cellTitle: "Photoshop으로 할로윈 토끼 그림 그리기",
                            cellImageName: "image1.png",
                            cellLikeNum: 0,
                            cellCommentNum: 0,
                            cellDate: "2021.10.31."
                        ),
                        ProfileCell(
                            cellTitle: "이번 생은 틀렸다고 느껴질 때를 읽어보았습니다",
                            cellImageName: "image2.png",
                            cellLikeNum: 1,
                            cellCommentNum: 0,
                            cellDate: "2021.9.20."
                        ),
                        ProfileCell(
                            cellTitle: "코로나 백신 1차, 2차 접종완료했습니다",
                            cellImageName: "image3.png",
                            cellLikeNum: 0,
                            cellCommentNum: 0,
                            cellDate: "2021.8.14."
                        ),
                        ProfileCell(
                            cellTitle: "일의 기쁨과 슬픔을 읽어보았습니다",
                            cellImageName: "image4.png",
                            cellLikeNum: 1,
                            cellCommentNum: 2,
                            cellDate: "2021.8.9."
                        ),
                        ProfileCell(
                            cellTitle: "Photoshop으로 우주의 소녀 그림그리기",
                            cellImageName: "image5.png",
                            cellLikeNum: 1,
                            cellCommentNum: 0,
                            cellDate: "2021.7.25."
                        ),
                        ProfileCell(
                            cellTitle: "보석느낌 펜던트 만들기",
                            cellImageName: "image6.png",
                            cellLikeNum: 1,
                            cellCommentNum: 2,
                            cellDate: "2021.7.11."
                        ),
                        ProfileCell(
                            cellTitle: "화양연화 THE NOTES 1을 읽어보았습니다",
                            cellImageName: "image7.png",
                            cellLikeNum: 1,
                            cellCommentNum: 0,
                            cellDate: "2021.7.10."
                        )
                    ]
                ),
                ProfileCategory(
                    profileCategoryName: "책",
                    profileCategoryNum: 3,
                    isSelected: false,
                    profileCategoryCell: [
                        ProfileCell(
                            cellTitle: "이번 생은 틀렸다고 느껴질 때를 읽어보았습니다",
                            cellImageName: "image2.png",
                            cellLikeNum: 1,
                            cellCommentNum: 0,
                            cellDate: "2021.9.20."
                        ),
                        ProfileCell(
                            cellTitle: "일의 기쁨과 슬픔을 읽어보았습니다",
                            cellImageName: "image4.png",
                            cellLikeNum: 1,
                            cellCommentNum: 2,
                            cellDate: "2021.8.9."
                        ),
                        ProfileCell(
                            cellTitle: "화양연화 THE NOTES 1을 읽어보았습니다",
                            cellImageName: "image7.png",
                            cellLikeNum: 1,
                            cellCommentNum: 0,
                            cellDate: "2021.7.10."
                        )
                    ]
                ),
                ProfileCategory(
                    profileCategoryName: "레진아트",
                    profileCategoryNum: 1,
                    isSelected: false,
                    profileCategoryCell: [
                        ProfileCell(
                            cellTitle: "보석느낌 펜던트 만들기",
                            cellImageName: "image6.png",
                            cellLikeNum: 1,
                            cellCommentNum: 2,
                            cellDate: "2021.7.11."
                        )
                    ]
                ),
                ProfileCategory(
                    profileCategoryName: "그림",
                    profileCategoryNum: 2,
                    isSelected: false,
                    profileCategoryCell: [
                        ProfileCell(
                            cellTitle: "Photoshop으로 할로윈 토끼 그림 그리기",
                            cellImageName: "image1.png",
                            cellLikeNum: 0,
                            cellCommentNum: 0,
                            cellDate: "2021.10.31."
                        ),
                        ProfileCell(
                            cellTitle: "Photoshop으로 우주의 소녀 그림그리기",
                            cellImageName: "image5.png",
                            cellLikeNum: 1,
                            cellCommentNum: 0,
                            cellDate: "2021.7.25."
                        )
                    ]
                ),
                ProfileCategory(
                    profileCategoryName: "일상",
                    profileCategoryNum: 1,
                    isSelected: false,
                    profileCategoryCell: [
                        ProfileCell(
                            cellTitle: "코로나 백신 1차, 2차 접종완료했습니다",
                            cellImageName: "image3.png",
                            cellLikeNum: 0,
                            cellCommentNum: 0,
                            cellDate: "2021.8.14."
                        )
                    ]
                )
            ]
        )
        
        profileModel = model
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setTableView() {
        profileTableView.backgroundColor = .clear
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.register(UINib(nibName: "MyBlogPostTableViewCell", bundle: nil), forCellReuseIdentifier: "MyBlogPostTableViewCell")
        profileTableView.register(UINib(nibName: "MyBlogPostTableViewHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "MyBlogPostTableViewHeader")
    }
    
    private func setProfileInfoHeader() {
        profileInfoHeaderView.setProfileModel(model: self.profileModel)
        profileInfoHeaderView.setData()
        profileInfoHeaderView.blogUrlButton.addTarget(self, action: #selector(blogUrlButtonDidTapped), for: .touchUpInside)
    }
    
    @objc private func blogUrlButtonDidTapped(button: UIButton) {
        print("tapped")
        
    }
    
}
