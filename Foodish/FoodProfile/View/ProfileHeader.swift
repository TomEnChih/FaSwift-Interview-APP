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
    
    private let imageSize: CGFloat = 100
    
    // MARK: - IBOutlets
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .lightGray
        
        return iv
    }()
    
    private let postLabel: UILabel = {
        let label = UILabel()
        label.setText(String1: "1.234", String2: "posts")
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    private let followsLabel: UILabel = {
        let label = UILabel()
        label.setText(String1: "9.999", String2: "follows")
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    private let followingLabel: UILabel = {
        let label = UILabel()
        label.setText(String1: "111", String2: "following")
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postLabel,followsLabel,followingLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
//        stackView.spacing = 0
        return stackView
    }()
    
    private let followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let optionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "tom105485916@gmail.com"
        label.textColor = .black
        return label
    }()
    
    private let gridButton: UIButton = {
        let button = UIButton()
//        button.clipsToBounds = true
//
//        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .semibold)
//        let image = UIImage(systemName: "square.grid.2x2", withConfiguration: config)
//
//        button.tintColor = .lightGray
//        button.setImage(image, for: .normal)
        
        button.setImage(UIImage(named: "gridImage"), for: .normal)
        
        return button
    }()
    
    private let listButton: UIButton = {
        let button = UIButton()
//        button.clipsToBounds = true
//
//        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .semibold)
//        let image = UIImage(systemName: "square.grid.2x2", withConfiguration: config)
//
//        button.tintColor = .lightGray
//        button.setImage(image, for: .normal)
        
        button.setImage(UIImage(named: "listImage"), for: .normal)
        
        return button
    }()
    
    private let taggedButton: UIButton = {
        let button = UIButton()
//        button.clipsToBounds = true
//
//        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .semibold)
//        let image = UIImage(systemName: "tag", withConfiguration: config)
//
//        button.tintColor = .lightGray
//        button.setImage(image, for: .normal)

        button.setImage(UIImage(named: "taggedImage"), for: .normal)

        
        return button
    }()
    
    private lazy var tabsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [gridButton,listButton,taggedButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
//        stackView.spacing = 0
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
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(10)
            make.size.equalTo(imageSize)
        }
        
        labelStackView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(profileImageView.snp.right).offset(20)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(70)
        }

        followButton.snp.makeConstraints { (make) in
            make.top.equalTo(labelStackView.snp.bottom)
            make.left.equalTo(profileImageView.snp.right).offset(10)
            make.right.equalTo(optionButton.snp.left).offset(-10)
            make.height.equalTo(30)
        }
        
        optionButton.snp.makeConstraints { (make) in
            make.top.equalTo(labelStackView.snp.bottom)
            make.right.equalTo(self).offset(-20)
            make.size.equalTo(30)
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.left.equalTo(self).offset(10)
            make.bottom.equalTo(separateView.snp.top).offset(-10)
        }
        
        tabsStackView.snp.makeConstraints { (make) in
            make.right.left.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(50)
        }
        
        separateView.snp.makeConstraints { (make) in
            make.right.left.equalTo(self)
            make.height.equalTo(1)
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
