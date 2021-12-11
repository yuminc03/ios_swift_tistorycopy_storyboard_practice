//
//  ProfileCategoryStackCellView.swift
//  TistoryStoryboard
//
//  Created by LS-NOTE-00106 on 2021/12/08.
//

import UIKit

//@IBDesignable
class ProfileCategoryStackCellView: UIView {
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryNumLabel: UILabel!
    @IBOutlet weak var CategorySeparatorView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    private func initView() {
        let bundle = Bundle(for: ProfileCategoryStackCellView.self)
        if let view = bundle.loadNibNamed("ProfileCategoryStackCellView", owner: self)?.first as? UIView {
            addSubview(view)
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
}
