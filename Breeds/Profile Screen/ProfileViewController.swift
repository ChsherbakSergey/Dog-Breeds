//
//  ProfileViewController.swift
//  Breeds
//
//  Created by Sergey on 11/14/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import SCLAlertView
import UIKit

struct Cell {
    var nameLabel: String
    var name: String
    var image: String
}

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cells: [[Cell]] = [
        [
            Cell(nameLabel: "Name Surname", name: "", image: "userProfile"),
            Cell(nameLabel: "", name: "Choose your country", image: "userProfile")
        ],
        [
            Cell(nameLabel: "", name: "Notifications", image: "notification")
        ],
        [
            Cell(nameLabel: "", name: "Rate the App", image: "rating"),
            Cell(nameLabel: "", name: "Help", image: "help"),
//            Cell(nameLabel: "", name: "Notifications", image: UIImage(named: "userProfile")!)
        ]
    ]
    
    var rating: String?
    var country: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "PopUp" {
            let destVC = segue.destination as! PopUpViewController
            destVC.countryDelegate = self
        }
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells[section].count

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.systemGray5
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var heightForSecondCell: CGFloat = 0
        let heightForFirstCell: CGFloat = 100
        let heightForOtherCell: CGFloat = 50
        if indexPath.section == 0 && indexPath.row == 1 {
            heightForSecondCell = 50
        } else if indexPath.section == 0 && indexPath.row == 0 {
            return heightForFirstCell
        } else {
            return heightForOtherCell
        }
        return heightForSecondCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoTableViewCell
            cell.profileImageView.image = UIImage(named: "userProfile")
            cell.profileNameLabel.text = "Name Surname"
            return cell
        } else if indexPath.section == 0 && indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! ChooseCountryTableViewCell
            cell.iconImageView.image = UIImage(named: "country")
            cell.nameLabel.text = "Choose your country"
//            didChooseCountry(country: String) {
//                cell.countryLabel.text = country
//            }
            cell.nameLabel.text = country
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OtherCells", for: indexPath) as! OtherCellsTableViewCell
            let image = cells[indexPath.section][indexPath.row].image
            cell.iconImageView.image = UIImage(named: image)
            cell.nameLabel.text = cells[indexPath.section][indexPath.row].name
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 2 && indexPath.row == 0 {
            let alert = SCLAlertView()
            alert.addButton("1 Star") { [self] in
                rating = "1"
            }
            alert.addButton("2 Stars") { [self] in
                rating = "2"
            }
            alert.addButton("3 Stars") { [self] in
                rating = "3"
            }
            alert.addButton("4 Stars") { [self] in
                rating = "4"
            }
            alert.addButton("5 Stars") { [self] in
                rating = "5"
            }
            alert.showWarning("Rate Us", subTitle: "We would also be happy if you could rate our app in Appstore!", closeButtonTitle: "Done", timeout: .none, circleIconImage: UIImage(named: "numberOne"), animationStyle: .topToBottom)
        } else if indexPath.section == 0 && indexPath.row == 1 {
            performSegue(withIdentifier: "PopUp", sender: nil)
        }
    }
    
}

extension ProfileViewController: PopUpViewControllerDelegate {

    func didChooseCountry(country: String) {
        let cell = tableView.cellForRow(at: IndexPath.init(row: 1, section: 0)) as! ChooseCountryTableViewCell
        cell.countryLabel.text = country
    }

}
