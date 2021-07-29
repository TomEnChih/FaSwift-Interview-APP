//
//  HomeController.swift
//  Foodish
//
//  Created by 董恩志 on 2021/7/27.
//

import UIKit

class HomeController: UIViewController {

    // MARK: - Properties
    
    private let homeView = HomeView()
    
    enum foodAmountFieldError: String {
        case noText = "請輸入數量"
        case notNumber = "文字錯誤，請輸入數字"
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        setNavigationItem()
        setButtonAction()
        configureGesture()
        setBottomView()
    }

    // MARK: - Methods
    
    private func setNavigationItem() {
        navigationItem.title = Home.share.title
    }
    
    private func setButtonAction() {
        
        homeView.didTapRandomButton = { [weak self] in
            
            let randomNumber = Int.random(in: 1...100)
            
            self?.homeView.foodAmountField.text = String(randomNumber)
        }
        
        homeView.didTapProducedButton = { [weak self] in
            
            guard let text = self?.homeView.foodAmountField.text,text != "" else {
                self?.handleError(error: foodAmountFieldError.noText.rawValue)
                return
            }
            
            guard let number = Int(text) else {
                self?.handleError(error: foodAmountFieldError.notNumber.rawValue)
                return
            }
            
            self?.handleDismisskeyboard()
            self?.homeView.foodAmountField.text = nil
            
            let vc = FoodProfileController(foodCount: number)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func setBottomView() {
        
        homeView.bottomImageView.loadingImage(url: URL(string: "https://foodish-api.herokuapp.com/images/dessert/dessert18.jpg")!) { (error) in
            self.handleError(error: error)
        }
        
    }
    
    //MARK: Gesture
    private func configureGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleDismisskeyboard))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func handleDismisskeyboard() {
        homeView.foodAmountField.resignFirstResponder()
    }
    
    
    //MARK: Error
    private func handleError(error: String) {
        
        let alert = UIAlertController(title: "Error",
                                      message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
