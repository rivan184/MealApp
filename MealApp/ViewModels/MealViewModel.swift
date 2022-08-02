//
//  MealViewModel.swift
//  MealApp
//
//  Created by Muhammad Rivan Rayhan on 02/08/22.
//

import Foundation
import FetchMealData


class MealViewModel{
    
    private var apiService = ApiService()
    private var mealList = [Meal]()
    
    func fetchMealData(completion: @escaping ()->()) {
        
        apiService.getMealData { [weak self](result) in
            
            switch result{
            case .success(let listOf):
                self?.mealList = listOf.meals
                completion()
            case.failure(let error):
                print("Error: \(error)")
            }
              
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int{
        if mealList.count != 0 {
            return mealList.count
        }
        return 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Meal{
        return mealList[indexPath.row]
    }
    
    
}
