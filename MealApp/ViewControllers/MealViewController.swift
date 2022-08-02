//
//  MealViewController.swift
//  MealApp
//
//  Created by Muhammad Rivan Rayhan on 01/08/22.
//

import UIKit
import FetchMealData
 
class MealViewController: UIViewController {
    
        
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = MealViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.fetchMealData { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.delegate = self
            self?.tableView.reloadData()
        }
        
    }


}

extension MealViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! MealListTableViewCell
        
        let meal = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(meal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toMealDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.description as? MealDetailViewController {
            
        }
    }
}
