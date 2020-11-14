//
//  TraiingsDetailScreenViewController.swift
//  Breeds
//
//  Created by Sergey on 11/14/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//


import SafariServices
import UIKit

class TraiingsDetailScreenViewController: UIViewController {

    @IBOutlet weak var descriptionOfTrainingLabel: UILabel!
    @IBOutlet weak var watchVideoButtonOutlet: UIButton!
    
    var object: Training?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
        
    }
    
    func setUpUI () {
        watchVideoButtonOutlet.layer.cornerRadius = 10
        descriptionOfTrainingLabel.text = object?.text
    }
    
    @IBAction func watchVideoButtonIsTapped(_ sender: Any) {
        showSafariVC(for: object?.url ?? "")
    }
    

}
