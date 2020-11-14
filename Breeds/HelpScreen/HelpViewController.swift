//
//  HelpViewController.swift
//  Breeds
//
//  Created by Sergey on 11/13/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import SCLAlertView
import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var sendQuestionButton: UIButton!
    
    var question: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendQuestionButton.layer.cornerRadius = 10
    }

    @IBAction func sendQuestionButton(_ sender: Any) {
        question = questionTextField.text
        guard let finalQuestion = question else {
            return
        }
        if finalQuestion == "" {
            let alert = SCLAlertView()
            alert.showWarning("Ooops...", subTitle: "Guess You forgot to write a question!", closeButtonTitle: "Done", animationStyle: .bottomToTop)
        } else {
            let alert = SCLAlertView()
            alert.showSuccess("Sent", subTitle: "Thank you for your question. We will contact you within a day!", closeButtonTitle: "Got it", animationStyle: .bottomToTop)
            questionTextField.text = ""
            print(question)
        }
    }
}
