//
//  MealDetailViewModel.swift
//  MealApp
//
//  Created by Muhammad Rivan Rayhan on 02/08/22.
//

import Foundation
import FetchMealData

class MealDetailViewModel {
    
    private var apiService = ApiService()
    private var mealList = [Meal]()
    
    func fetchMealDetailData(completion: @escaping ()->()) {
        
        apiService.getMealDetailData(idMeal: 52777) { [weak self](result) in
            switch result{
            case .success(let listOf):
                self?.mealList = listOf.meals
                completion()
            case.failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
