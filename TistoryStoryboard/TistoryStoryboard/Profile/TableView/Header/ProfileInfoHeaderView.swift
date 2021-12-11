//
//  ProfileInfoHeaderView.swift
//  TistoryStoryboard
//
//  Created by LS-NOTE-00106 on 2021/12/06.
//

import UIKit

//@IBDesignable
class ProfileInfoHeaderView: UIView {
    //File's Owner - 여러번 사용하는 View
    //View - 한 번만 사용하는 View
    
    var profileModel = ProfileModel()
   
    @IBOutlet weak var blogBackgroundImageView: UIImageView! {
        didSet {
            blogBackgroundImageView.layer.maskedCorners = [.layerMaxXMaxYCorner]
            //이건 왜 밑에 @IBInspectable var image에 설정해주면 안될까??
        }
    }
    @IBOutlet weak var blogNameLabel: UILabel!
    @IBOutlet weak var blogUrlButton: UIButton!
    @IBOutlet weak var subscribeNumLabel: UILabel!
    @IBOutlet weak var blogSettingButton: UIButton!
    
    @IBInspectable var image: UIImage? {
        didSet {
            blogBackgroundImageView.image = image
        }
    }

    @IBInspectable var subscribeNum: String? {
        didSet {
            let text = "구독자  " + "\(subscribeNum!)"
            let mutable = NSMutableAttributedString(string: text)
            let range = (text as NSString).range(of: "\(subscribeNum!)")
            mutable.addAttribute(.foregroundColor, value: UIColor.black, range: range)
            subscribeNumLabel.attributedText = mutable
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    override func prepareForInterfaceBuilder() { //@IBDesignable사용에 필요
        super.prepareForInterfaceBuilder()
        initView()
    }
    
    private func initView() {
        let bundle = Bundle(for: ProfileInfoHeaderView.self)
        if let view = bundle.loadNibNamed("ProfileInfoHeaderView", owner: self)?.first as? UIView {
            addSubview(view)
            view.frame = bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    
    func setProfileModel(model: ProfileModel) {
        self.profileModel = model
    }
    
    func setData() {
        blogNameLabel.text = profileModel.profileTitle
        blogUrlButton.setTitle(profileModel.profileUrl, for: .normal)
        subscribeNum = String(profileModel.subscribeNumber)
    }
}
