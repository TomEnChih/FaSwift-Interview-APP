//
//  HomeModel.swift
//  Foodish
//
//  Created by 董恩志 on 2021/7/29.
//

import UIKit

class Home {
    
    // MARK: - Singleton
    static let share = Home()

    // MARK: - Init
    private init() {
    }
    
    //MARK: - Properties

    /// Label
    let title = "FaSwift Interview Project"
    let instructionLabel = "請輸入欲產生食物數量"
    let foodAmountFieldPlaceHolder = "數量"
    let randomButtonTitle = "亂數"
    let producedButtonTitle = "產生"
    
}
