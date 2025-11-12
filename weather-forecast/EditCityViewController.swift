//
//  EditCityViewController.swift
//  weather-forecast
//
//  Created by open-meadow on 2025-11-12.
//

import UIKit

class EditCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let cityName = cityNameTextField.text, !cityName.isEmpty else {
            return
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
