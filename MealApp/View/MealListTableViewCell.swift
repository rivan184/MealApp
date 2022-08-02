//
//  MealListTableViewCell.swift
//  MealApp
//
//  Created by Muhammad Rivan Rayhan on 02/08/22.
//

import UIKit
import FetchMealData

class MealListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mealThumbnail: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    
    private var nilImage:UIImage? = nil
    
    private func updateUI(name:String?, thumbnail:String?){
        self.mealName.text = name
        
        guard let thumbnailString = thumbnail else {return}
        
        guard let thumbnailImageURL = URL(string: thumbnailString
        ) else {
            self.mealThumbnail.image = nilImage
            return
        }
        
        self.mealThumbnail.image = nilImage
        getImageDataFrom(url: thumbnailImageURL)
    }
    
    private func getImageDataFrom(url:URL){
        URLSession.shared.dataTask(with: url){(data,response,error) in
            if let error = error {
                print("DataTask error :\(error.localizedDescription)")
                return
            }
            
            guard let data = data else{
                print("data kosong")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data){
                    self.mealThumbnail.image = image
                }
            }
        }.resume()
    }
    
    func setCellWithValuesOf(_ meal:Meal){
        updateUI(name: meal.strMeal, thumbnail: meal.strMealThumb)
    }
}
