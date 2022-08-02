//
//  MealDetailViewController.swift
//  MealApp
//
//  Created by Muhammad Rivan Rayhan on 02/08/22.
//

import UIKit

class MealDetailViewController: UIViewController {

    @IBOutlet weak var mealDetailThumbnail: UIImageView!
    @IBOutlet weak var mealDetailName: UILabel!
    @IBOutlet weak var mealDetailArea: UILabel!
    @IBOutlet weak var mealDetailInstruction: UILabel!
    @IBOutlet weak var mealDetailIngredients: UILabel!
    @IBOutlet weak var mealDetailTags: UILabel!
    @IBOutlet weak var mealDetailSource: UILabel!
    @IBOutlet weak var mealDetailYoutube: UILabel!
    
    private var viewModel = MealDetailViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchMealDetailData { [weak self] in
            
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
