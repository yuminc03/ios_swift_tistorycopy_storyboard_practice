//
//  ProfileCategoryView.swift
//  TistoryStoryboard
//
//  Created by LS-NOTE-00106 on 2021/12/08.
//


import UIKit

protocol ProfileCategoryViewDelegate: AnyObject {
    func profileCategoryDidTapped(index: Int)
}
//@IBDesignable
class ProfileCategoryView: UIView {
    
    @IBOutlet weak var profileCategoryStackView: UIStackView!
    var profileCategory: [ProfileCategory] = []
    weak var delegate: ProfileCategoryViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        setViewCorners()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initView()
    }
    
    private func initView() {
        let bundle = Bundle(for: ProfileCategoryView.self)
        if let view = bundle.loadNibNamed("ProfileCategoryView", owner: self)?.first as? UIView {
            addSubview(view)
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    
    private func setViewCorners() {
        self.layer.cornerRadius = 15
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func setStackView() {
        for i in 0 ..< profileCategory.count {
            let textColor = profileCategory[i].isSelected ? UIColor.red : UIColor.black
            let categoryView = ProfileCategoryStackCellView()
            let gesture = UITapGestureRecognizer(target: self, action: #selector(categoryViewDidTapped))
            categoryView.addGestureRecognizer(gesture)
            categoryView.categoryNameLabel.textColor = textColor
            categoryView.categoryNameLabel.text = profileCategory[i].profileCategoryName
            categoryView.categoryNumLabel.textColor = textColor
            categoryView.categoryNumLabel.text = String(profileCategory[i].profileCategoryCell.count)
            
            if i < profileCategory.count - 1 {
                categoryView.CategorySeparatorView.isHidden = true
            }
    
        }
    }
    
    @objc private func categoryViewDidTapped(gesture: UITapGestureRecognizer) {
        guard let tag = gesture.view?.tag else { return }
        delegate?.profileCategoryDidTapped(index: tag)
    }
}
