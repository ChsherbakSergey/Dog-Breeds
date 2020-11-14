//
//  SupportViewController.swift
//  Breeds
//
//  Created by Sergey on 11/13/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import SCLAlertView
import SafariServices
import UIKit

class SupportViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {
            //Show an invalid URL Alert
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }

}

extension SupportViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SupportCell", for: indexPath) as! SupportTableViewCell
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InquiryCell", for: indexPath) as! SupportTableViewCell
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! SupportTableViewCell
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SeminarsCell", for: indexPath) as! SupportTableViewCell
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WriteAResponseCell", for: indexPath) as! SupportTableViewCell
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AboutAppCell", for: indexPath) as! SupportTableViewCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactUsCell", for: indexPath) as! SupportTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let alert = SCLAlertView()
            let txt = alert.addTextField("Enter your question")
            txt.placeholder = "Write your question..."
            alert.addButton("Send a question") {
                print("Text value: \(String(describing: txt.text))")
            }
            alert.showSuccess("Question", subTitle: "Send us a message", closeButtonTitle: "Cancel", timeout: .none, circleIconImage: UIImage(named: "letter"), animationStyle: .topToBottom)
        } else if indexPath.row == 5 {
            let alert = SCLAlertView()
            alert.showInfo("About App", subTitle: "Version - 1.0", closeButtonTitle: "Done", timeout: .none, circleIconImage: UIImage(named: "info"), animationStyle: .topToBottom)
        } else if indexPath.row == 6 {
            let alert = SCLAlertView()
            alert.addButton("Call") {
                print("Text value: Calling")
            }
            alert.showWarning("Contact Us", subTitle: "Tel: + 1 (111) 111-11-11", closeButtonTitle: "Done", timeout: .none, circleIconImage: UIImage(named: "complain"), animationStyle: .topToBottom)
        } else if indexPath.row == 1 {
            let alert = SCLAlertView()
            let txt = alert.addTextField("Enter your inquiry")
            txt.placeholder = "Write your inquiry..."
            alert.addButton("Send an inquiry") {
                print("Text value: \(String(describing: txt.text))")
            }
            alert.showSuccess("Inquiry", subTitle: "Send us an inquiry", closeButtonTitle: "Cancel", timeout: .none, circleIconImage: UIImage(named: "inquiry"), animationStyle: .topToBottom)
        } else if indexPath.row == 2 {
            showSafariVC(for: "https://github.com/ChsherbakSergey?tab=repositories")
        } else if indexPath.row == 3 {
            showSafariVC(for: "https://dogsofcourse.com")
        } else if indexPath.row == 4 {
            let alert = SCLAlertView()
            let txt = alert.addTextField("Enter your response")
            txt.placeholder = "Write your response..."
            alert.addButton("Send a response") {
                print("Text value: \(String(describing: txt.text))")
            }
            alert.showSuccess("Response", subTitle: "Send us a response", closeButtonTitle: "Cancel", timeout: .none, circleIconImage: UIImage(named: "response"), animationStyle: .topToBottom)
        }
    }
    
}
