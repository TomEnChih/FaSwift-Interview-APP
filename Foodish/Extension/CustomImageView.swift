//
//  CustomImageView.swift
//  Foodish
//
//  Created by 董恩志 on 2021/7/28.
//

import UIKit

class CustomImageView: UIImageView {

    private let loadingView = UIActivityIndicatorView()
    
    static var cache = NSCache<AnyObject, UIImage>()
    //判斷圖片 url 是否相同
    var url: URL?
    
    func loadingImage(url: URL,completion: @escaping(String)->Void){
        
        setLoadingView()
        
        self.url = url
        //如果 cache，不網路請求
        if let cachedImage = CustomImageView.cache.object(forKey: self.url as AnyObject) {
            
            self.image = cachedImage
            self.loadingView.stopAnimating()
            print("You get image from cache")
            
        }else{
            //如果沒有 cache，網路請求
            URLSession.shared.dataTask(with: url){(data,response,error) in
                if let error = error {
                    completion("Error: \(error.localizedDescription)")
                    self.loadingView.stopAnimating()

                } else if let data = data,let response = response as? HTTPURLResponse {
                    
                    DispatchQueue.main.async {
                        //判斷式
                        if url == self.url {
                            
                            guard let cachedImage = UIImage(data: data) else {
                                completion("image取得錯誤,Status Code: \(response.statusCode)")
                                self.loadingView.stopAnimating()
                                return
                            }
                            
                            self.image = cachedImage
                            CustomImageView.cache.setObject(cachedImage, forKey: url as AnyObject)
                            self.loadingView.stopAnimating()
                            print("You get image from \(url)")
                            
                        }else{
                            
                            guard let cachedImage = UIImage(data: data) else { return }
                            CustomImageView.cache.setObject(cachedImage, forKey: url as AnyObject)
                            print("儲存 other image")
                        }
                    }
                    
                }
            }.resume()
            
        }
    }
    
    private func setLoadingView() {
        loadingView.color = .black
        loadingView.hidesWhenStopped = true
        self.addSubview(loadingView)
        loadingView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
        self.loadingView.isHidden = false
        self.loadingView.startAnimating()
    }

}
