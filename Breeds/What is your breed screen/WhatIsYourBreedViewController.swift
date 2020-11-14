//
//  WhatIsYourBreedViewController.swift
//  Breeds
//
//  Created by Sergey on 11/13/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import SCLAlertView
import UIKit

class WhatIsYourBreedViewController: UIViewController {
    
    @IBOutlet weak var apartmentButtonOutlet: UIButton!
    @IBOutlet weak var houseButtonOutlet: UIButton!
    @IBOutlet weak var parkYesButtonOutlet: UIButton!
    @IBOutlet weak var parkNoButtonOutlet: UIButton!
    @IBOutlet weak var childrenYesButtonOutlet: UIButton!
    @IBOutlet weak var childrenNoButtonOutlet: UIButton!
    @IBOutlet weak var lessThanTwoHoursButtonOutlet: UIButton!
    @IBOutlet weak var moreThanTwoHoursButtonOutlet: UIButton!
    @IBOutlet weak var hadDogYesButtonOutlet: UIButton!
    @IBOutlet weak var hadDogNoButtonOutlet: UIButton!
    @IBOutlet weak var intelegenceYesButtonOutlet: UIButton!
    @IBOutlet weak var intelegenceNoButtonOutlet: UIButton!
    @IBOutlet weak var companionYesButtonOutlet: UIButton!
    @IBOutlet weak var companionNoButtonOutlet: UIButton!
    @IBOutlet weak var trainYesButtonOutlet: UIButton!
    @IBOutlet weak var trainNoButtonOutlet: UIButton!
    @IBOutlet weak var transportYesButtonOutlet: UIButton!
    @IBOutlet weak var transportNoButtonOutlet: UIButton!
    @IBOutlet weak var careYesButtonOutlet: UIButton!
    @IBOutlet weak var careNoButtonOutlet: UIButton!
    
    @IBOutlet weak var checkTheResultButtonOutlet: UIButton!
    
    var whereDoYouLiveProperty = ""
    var parkProperty = ""
    var hasChildren = ""
    var time = ""
    var hadDog = ""
    var intelegence = ""
    var companion = ""
    var train = ""
    var transport = ""
    var care = ""
    var result = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtons()
    }
    
    func setUpButtons() {
        let buttonsOutlets: [UIButton] = [apartmentButtonOutlet, houseButtonOutlet, parkYesButtonOutlet, parkNoButtonOutlet, childrenYesButtonOutlet, childrenNoButtonOutlet, lessThanTwoHoursButtonOutlet, moreThanTwoHoursButtonOutlet, hadDogYesButtonOutlet, hadDogNoButtonOutlet, intelegenceYesButtonOutlet, intelegenceNoButtonOutlet, companionYesButtonOutlet, companionNoButtonOutlet, trainYesButtonOutlet, trainNoButtonOutlet, transportYesButtonOutlet, transportNoButtonOutlet, careYesButtonOutlet, careNoButtonOutlet, checkTheResultButtonOutlet]
        for i in buttonsOutlets {
            i.layer.cornerRadius = 10
        }
    }
    
    func checkVariation() {
        if whereDoYouLiveProperty == "Apartment" && parkProperty == "Yes" && hasChildren == "No" && time == "Less than 2 hours" && hadDog == "No" && intelegence == "Yes" && companion == "Yes" && train == "Yes" && transport == "No" && care == "Yes" {
            result = "The most suitable breed for you is: Irish Terrier. You can also peer at breeds like: Affenpinscher, Welsh terrier, Dachshund or Bouledogue français."
        }
        let alert = SCLAlertView()
        alert.showSuccess("Congratulations!", subTitle: result, closeButtonTitle: "Done", circleIconImage: UIImage(named: "dogIcon"), animationStyle: .bottomToTop)
    }
    
    @IBAction func apartmentButtonIsTapped(_ sender: Any) {
        apartmentButtonOutlet.backgroundColor = UIColor.systemGreen
        apartmentButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        houseButtonOutlet.backgroundColor = UIColor.systemGray5
        houseButtonOutlet.titleLabel?.textColor = UIColor.black
        whereDoYouLiveProperty = "Apartment"
        print(whereDoYouLiveProperty)
    }
    
    @IBAction func houseButtonIsTapped(_ sender: Any) {
        houseButtonOutlet.backgroundColor = UIColor.systemGreen
        houseButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        apartmentButtonOutlet.backgroundColor = UIColor.systemGray5
        apartmentButtonOutlet.titleLabel?.textColor = UIColor.black
        whereDoYouLiveProperty = "House"
        print(whereDoYouLiveProperty)
    }
    
    @IBAction func parkYesButtonIsTapped(_ sender: Any) {
        parkYesButtonOutlet.backgroundColor = UIColor.systemGreen
        parkYesButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        parkNoButtonOutlet.backgroundColor = UIColor.systemGray5
        parkNoButtonOutlet.titleLabel?.textColor = UIColor.black
        parkProperty = "Yes"
        print(parkProperty)
    }
    
    @IBAction func parkNoButtonIsTapped(_ sender: Any) {
        parkNoButtonOutlet.backgroundColor = UIColor.systemGreen
        parkNoButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        parkYesButtonOutlet.backgroundColor = UIColor.systemGray5
        parkYesButtonOutlet.titleLabel?.textColor = UIColor.black
        parkProperty = "No"
        print(parkProperty)
    }
    
    @IBAction func childrenYesButtonIsTapped(_ sender: Any) {
        childrenYesButtonOutlet.backgroundColor = UIColor.systemGreen
        childrenYesButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        childrenNoButtonOutlet.backgroundColor = UIColor.systemGray5
        childrenNoButtonOutlet.titleLabel?.textColor = UIColor.black
        hasChildren = "Yes"
        print(hasChildren)
    }
    
    @IBAction func childrenNoButtonIsTapped(_ sender: Any) {
        childrenNoButtonOutlet.backgroundColor = UIColor.systemGreen
        childrenNoButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        childrenYesButtonOutlet.backgroundColor = UIColor.systemGray5
        childrenYesButtonOutlet.titleLabel?.textColor = UIColor.black
        hasChildren = "No"
        print(hasChildren)
    }
    
    @IBAction func lessThanTwoHoursButtonIsTapped(_ sender: Any) {
        lessThanTwoHoursButtonOutlet.backgroundColor = UIColor.systemGreen
        lessThanTwoHoursButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        moreThanTwoHoursButtonOutlet.backgroundColor = UIColor.systemGray5
        moreThanTwoHoursButtonOutlet.titleLabel?.textColor = UIColor.black
        time = "Less than 2 hours"
        print(time)
    }
    
    @IBAction func moreThanTwoHoursButtonIsTapped(_ sender: Any) {
        moreThanTwoHoursButtonOutlet.backgroundColor = UIColor.systemGreen
        moreThanTwoHoursButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        lessThanTwoHoursButtonOutlet.backgroundColor = UIColor.systemGray5
        lessThanTwoHoursButtonOutlet.titleLabel?.textColor = UIColor.black
        time = "More than 2 hours"
        print(time)
    }
    
    @IBAction func hadDogYesButtonIsTapped(_ sender: Any) {
        hadDogYesButtonOutlet.backgroundColor = UIColor.systemGreen
        hadDogYesButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        hadDogNoButtonOutlet.backgroundColor = UIColor.systemGray5
        hadDogNoButtonOutlet.titleLabel?.textColor = UIColor.black
        hadDog = "Yes"
        print(hadDog)
    }
    
    @IBAction func hadDogNoButtonIsTapped(_ sender: Any) {
        hadDogNoButtonOutlet.backgroundColor = UIColor.systemGreen
        hadDogNoButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        hadDogYesButtonOutlet.backgroundColor = UIColor.systemGray5
        hadDogYesButtonOutlet.titleLabel?.textColor = UIColor.black
        hadDog = "No"
        print(hadDog)
    }
    
    @IBAction func intelegenceYesButtonIsTapped(_ sender: Any) {
        intelegenceYesButtonOutlet.backgroundColor = UIColor.systemGreen
        intelegenceYesButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        intelegenceNoButtonOutlet.backgroundColor = UIColor.systemGray5
        intelegenceNoButtonOutlet.titleLabel?.textColor = UIColor.black
        intelegence = "Yes"
        print(intelegence)
    }
    
    @IBAction func intelegenceNoButtonIsTapped(_ sender: Any) {
        intelegenceNoButtonOutlet.backgroundColor = UIColor.systemGreen
        intelegenceNoButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        intelegenceYesButtonOutlet.backgroundColor = UIColor.systemGray5
        intelegenceYesButtonOutlet.titleLabel?.textColor = UIColor.black
        intelegence = "No"
        print(intelegence)
    }
    
    @IBAction func companionYesButtonIsTapped(_ sender: Any) {
        companionYesButtonOutlet.backgroundColor = UIColor.systemGreen
        companionYesButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        companionNoButtonOutlet.backgroundColor = UIColor.systemGray5
        companionNoButtonOutlet.titleLabel?.textColor = UIColor.black
        companion = "Yes"
        print(companion)
    }
    
    @IBAction func companionNoButtonIsTapped(_ sender: Any) {
        companionNoButtonOutlet.backgroundColor = UIColor.systemGreen
        companionNoButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        companionYesButtonOutlet.backgroundColor = UIColor.systemGray5
        companionYesButtonOutlet.titleLabel?.textColor = UIColor.black
        companion = "No"
        print(companion)
    }
    
    @IBAction func trainYesButtonIsTapped(_ sender: Any) {
        trainYesButtonOutlet.backgroundColor = UIColor.systemGreen
        trainYesButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        trainNoButtonOutlet.backgroundColor = UIColor.systemGray5
        trainNoButtonOutlet.titleLabel?.textColor = UIColor.black
        train = "Yes"
        print(train)
    }
    
    @IBAction func trainNoButtonIsTapped(_ sender: Any) {
        trainNoButtonOutlet.backgroundColor = UIColor.systemGreen
        trainNoButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        trainYesButtonOutlet.backgroundColor = UIColor.systemGray5
        trainYesButtonOutlet.titleLabel?.textColor = UIColor.black
        train = "No"
        print(train)
    }
    
    @IBAction func transportYesButtonIsTapped(_ sender: Any) {
        transportYesButtonOutlet.backgroundColor = UIColor.systemGreen
        transportYesButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        transportNoButtonOutlet.backgroundColor = UIColor.systemGray5
        transportNoButtonOutlet.titleLabel?.textColor = UIColor.black
        transport = "Yes"
        print(transport)
    }
    
    @IBAction func transportNoButtonIsTapped(_ sender: Any) {
        transportNoButtonOutlet.backgroundColor = UIColor.systemGreen
        transportNoButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        transportYesButtonOutlet.backgroundColor = UIColor.systemGray5
        transportYesButtonOutlet.titleLabel?.textColor = UIColor.black
        transport = "No"
        print(transport)
    }
    
    @IBAction func careYesButtonIsTapped(_ sender: Any) {
        careYesButtonOutlet.backgroundColor = UIColor.systemGreen
        careYesButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        careNoButtonOutlet.backgroundColor = UIColor.systemGray5
        careNoButtonOutlet.titleLabel?.textColor = UIColor.black
        care = "Yes"
        print(care)
    }
    
    @IBAction func careNoButtonIsTapped(_ sender: Any) {
        careNoButtonOutlet.backgroundColor = UIColor.systemGreen
        careNoButtonOutlet.setTitleColor(UIColor.white, for: .normal)
        careYesButtonOutlet.backgroundColor = UIColor.systemGray5
        careYesButtonOutlet.titleLabel?.textColor = UIColor.black
        care = "No"
        print(care)
    }
    
    @IBAction func checkTheResultButtonIsTapped(_ sender: Any) {
        if whereDoYouLiveProperty == "" || parkProperty == "" || hasChildren == "" || time == "" || hadDog == "" || intelegence == "" || companion == "" || train == "" || transport == "" || care == "" {
            let alert = SCLAlertView()
            alert.showWarning("Warning", subTitle: "You did not answer all the questions", closeButtonTitle: "Done", animationStyle: .bottomToTop)
        } else {
            checkVariation()
        }
    }
    
}

