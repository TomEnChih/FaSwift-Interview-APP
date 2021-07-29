//
//  HomeView.swift
//  Foodish
//
//  Created by 董恩志 on 2021/7/28.
//

import UIKit

class HomeView: UIView {

    // MARK: - Properties
    
    var didTapRandomButton: (()->Void)?
    var didTapProducedButton: (()->Void)?
    
    // MARK: - IBOutlets
    
    private let instructionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18.8)
        label.text = "請輸入欲產生食物數量"
        label.textColor = .black
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    let foodAmountField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "數量"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("亂數", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.8)
        button.backgroundColor = .white
        button.layer.cornerRadius = 14.9
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    private let producedButton: UIButton = {
        let button = UIButton()
        button.setTitle("產生", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.8)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14.9
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [randomButton,producedButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private let separateView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let bottomImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.loadingImage(url: URL(string: "https://foodish-api.herokuapp.com/images/dessert/dessert18.jpg")!)
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    // MARK: - Autolayout
    
    private func autoLayout() {
        
        instructionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.topMargin).offset(75)
            make.centerX.equalTo(self)
            make.height.equalTo(20) ///不知為何不設會消失
        }
        
        foodAmountField.snp.makeConstraints { (make) in
            make.top.equalTo(instructionLabel.snp.bottom).offset(10)
            make.centerX.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.78)
            make.height.equalTo(37)
        }
        
        buttonStackView.snp.makeConstraints { (make) in
            make.top.equalTo(foodAmountField.snp.bottom).offset(10)
            make.centerX.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.56)
            make.height.equalTo(98)
        }
        
        separateView.snp.makeConstraints { (make) in
            make.top.equalTo(buttonStackView.snp.bottom).offset(10)
            make.width.equalTo(self)
            make.height.equalTo(1)
        }
        
        bottomImageView.snp.makeConstraints { (make) in
            make.top.equalTo(separateView.snp.bottom)
            make.width.equalTo(self)
            make.bottom.equalTo(self)
        }
        
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(instructionLabel)
        addSubview(foodAmountField)
        addSubview(buttonStackView)
        addSubview(separateView)
        addSubview(bottomImageView)
        
        autoLayout()
        
        randomButton.addTarget(self, action: #selector(handleRandom), for: .touchUpInside)
        producedButton.addTarget(self, action: #selector(handleProduce), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    @objc func handleRandom() {
        didTapRandomButton?()
    }
    
    @objc func handleProduce() {
        didTapProducedButton?()
    }

}
