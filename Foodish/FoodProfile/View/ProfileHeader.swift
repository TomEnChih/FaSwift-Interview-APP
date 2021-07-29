//
//  ProfileHeader.swift
//  Foodish
//
//  Created by 董恩志 on 2021/7/27.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
        
    // MARK: - Properties
    
    static let id = "ProfileHeader"
    
    private let imageSize: CGFloat = 85
    
    // MARK: - IBOutlets
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: FoodProfile.share.profileImage)
        iv.clipsToBounds = true
        return iv
    }()
    
    private let postLabel: UILabel = {
        let label = UILabel()
        label.setText(String1: FoodProfile.share.post.number, String2: FoodProfile.share.post.type)
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    private let followsLabel: UILabel = {
        let label = UILabel()
        label.setText(String1: FoodProfile.share.followers.number, String2: FoodProfile.share.followers.type)
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    private let followingLabel: UILabel = {
        let label = UILabel()
        label.setText(String1: FoodProfile.share.following.number, String2: FoodProfile.share.following.type)
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postLabel,followsLabel,followingLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    private let followButton: UIButton = {
        let button = UIButton()
        button.setTitle(FoodProfile.share.followButtonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 3
        return button
    }()
    
    private let optionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        
        let config = UIImage.SymbolConfiguration(pointSize: 10, weight: .thin)
        let image = UIImage(systemName: FoodProfile.share.optionImage, withConfiguration: config)
        
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 3
        return button
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15.4)
        label.text = FoodProfile.share.email
        label.textColor = .black
        return label
    }()
    
    private let gridButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: FoodProfile.share.gridImage), for: .normal)
        button.imageView?.layer.transform = CATransform3DMakeScale(0.6, 0.6, 0.6)
        return button
    }()
    
    private let listButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: FoodProfile.share.listImage), for: .normal)
        button.imageView?.layer.transform = CATransform3DMakeScale(0.6, 0.6, 0.6)
        return button
    }()
    
    private let taggedButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: FoodProfile.share.taggedImage), for: .normal)
        button.imageView?.layer.transform = CATransform3DMakeScale(0.6, 0.6, 0.6)
        return button
    }()
    
    private lazy var tabsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [gridButton,listButton,taggedButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    private let separateView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    // MARK: - Autolayout
    
    private func autoLayout() {
        
        profileImageView.layer.cornerRadius = imageSize/2
        
        profileImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(13)
            make.left.equalTo(self).offset(13)
            make.size.equalTo(imageSize)
        }
        
        labelStackView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(13)
            make.left.equalTo(profileImageView.snp.right).offset(25)
            make.right.equalTo(self).offset(-14)
            make.height.equalTo(40)
        }

        followButton.snp.makeConstraints { (make) in
            make.top.equalTo(labelStackView.snp.bottom).offset(5)
            make.left.equalTo(profileImageView.snp.right).offset(25)
            make.right.equalTo(optionButton.snp.left).offset(-5)
            make.height.equalTo(31)
        }
        
        optionButton.snp.makeConstraints { (make) in
            make.top.equalTo(labelStackView.snp.bottom).offset(5)
            make.right.equalTo(self).offset(-14)
            make.height.equalTo(31)
            make.width.equalTo(35)
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageView.snp.bottom).offset(32)
            make.left.equalTo(self).offset(13)
            make.bottom.equalTo(separateView.snp.top).offset(-35)
        }
        
        tabsStackView.snp.makeConstraints { (make) in
            make.right.left.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(50)
        }
        
        separateView.snp.makeConstraints { (make) in
            make.right.left.equalTo(self)
            make.height.equalTo(0.5)
            make.top.equalTo(tabsStackView)
        }
        
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(profileImageView)
        addSubview(labelStackView)
        addSubview(followButton)
        addSubview(optionButton)
        addSubview(emailLabel)
        addSubview(tabsStackView)
        addSubview(separateView)
        
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    
}
