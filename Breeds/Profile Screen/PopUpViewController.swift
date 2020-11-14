//
//  PopUpViewController.swift
//  Breeds
//
//  Created by Sergey on 11/14/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

protocol PopUpViewControllerDelegate {
    func didChooseCountry(country: String)
}

class PopUpViewController: UIViewController {

    @IBOutlet weak var countryPickerView: UIPickerView!
    
    let countries: [String] = ["Russia", "USA", "France", "Kazakhstan", "Argentina", "Germany", "China", "Spain"]
    
    var countryDelegate: PopUpViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryPickerView.dataSource = self
        countryPickerView.delegate = self
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesEnded(touches, with: event)
        dismiss(animated: true, completion: nil)
    }
    


}

extension PopUpViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryDelegate?.didChooseCountry(country: countries[row])
    }
    
}
