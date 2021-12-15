//
//  ProfileCategoryViewController.swift
//  TistoryStoryboard
//
//  Created by LS-NOTE-00106 on 2021/12/08.
//

import UIKit

protocol ProfileCategoryViewControllerDelegate: AnyObject {
    func profileCategoryDidTapped(viewController: ProfileCategoryViewController, at: Int?)
}
class ProfileCategoryViewController: UIViewController {
    
    var profileCategory: [ProfileCategory] = []
    weak var delegate: ProfileCategoryViewControllerDelegate?
    
    @IBOutlet weak var profileCategoryView: ProfileCategoryView! {
        didSet {
            profileCategoryView.profileCategory = self.profileCategory
            profileCategoryView.setStackView()
        }
    }
    
//    @IBAction func MyBlogCategoryButtonDidTapped(_ sender: Any) {
//        let storyBoard = UIStoryboard(name: "ProfileCategoryViewController", bundle: Bundle.main)
//        let vc = storyBoard.instantiateViewController(withIdentifier: "ProfileCategoryViewController")
//        self.present(vc, animated: true)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(backgroundDidTapped))
        view.addGestureRecognizer(gesture)
        
    }
    
    init(profileCategory: [ProfileCategory]){
        self.profileCategory = profileCategory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func backgroundDidTapped(gesture: UITapGestureRecognizer){
        let location = gesture.location(in: self.view)
        if profileCategoryView.frame.contains(location) {
            return
        }
        else {
            delegate?.profileCategoryDidTapped(viewController: self, at: nil)
        }
    }
    
}
