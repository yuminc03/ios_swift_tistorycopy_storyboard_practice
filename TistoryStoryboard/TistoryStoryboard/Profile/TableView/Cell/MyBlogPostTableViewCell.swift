//
//  MyBlogPostTableViewCell.swift
//  TistoryStoryboard
//
//  Created by LS-NOTE-00106 on 2021/12/06.
//

import UIKit

class MyBlogPostTableViewCell: UITableViewCell {
 
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var likeNumLabel: UILabel!
    @IBOutlet weak var commentNumLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    //imageView의 높이는 꼭 정해주도록 하자..
    //storyboard 하단에 Content Hugging Priority는 따로 공부해보자(우선순위 결정)
    //우선순위는 정말 신중하게 결정해야할 필요가 있다
    
    func setData(title: String, likeNum: Int, commentNum: Int, date: String) {
//        print(title)
        postTitleLabel.text = title
        likeNumLabel.text = String(likeNum)
        commentNumLabel.text = String(commentNum)
        postDateLabel.text = date
    }
    
    func setPostImageViewColor(index: Int) {
        postImageView.backgroundColor = .systemBlue.withAlphaComponent(CGFloat((index + 1)) * 0.05)
    }
}
