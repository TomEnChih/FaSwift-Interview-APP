//
//  ProfileMode.swift
//  Foodish
//
//  Created by 董恩志 on 2021/7/29.
//

import UIKit

class FoodProfile {
    
    // MARK: - Singleton
    static let share = FoodProfile()

    // MARK: - Init
    private init() {
    }
    
    struct LabelText {
        let number: String
        let type: String
    }
    
    //MARK: - Properties
    
    /// label
    let title = "董恩志"
    let post = LabelText(number: "1.234", type: "posts")
    let followers = LabelText(number: "9.999", type: "followers")
    let following = LabelText(number: "111", type: "following")
    let followButtonTitle = "Follow"
    let email = "tom10485916@gmail.com"
    
    /// image
    let leftBarButton = "arrow"
    let profileImage = "DZImage"
    let optionImage = "arrowtriangle.down.fill"
    let gridImage = "gridImage"
    let listImage = "listImage"
    let taggedImage = "taggedImage"
}
