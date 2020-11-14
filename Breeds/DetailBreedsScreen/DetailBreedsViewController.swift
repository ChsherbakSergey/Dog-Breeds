//
//  DetailBreedsViewController.swift
//  Breeds
//
//  Created by Sergey on 11/12/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class DetailBreedsViewController: UIViewController {

    var objects: BreedsData?
    var name: String?
    
    @IBOutlet weak var dogImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var breedGroupLabel: UILabel!
    @IBOutlet weak var breedForLabel: UILabel!
    @IBOutlet weak var lifeSpanLabel: UILabel!
    @IBOutlet weak var imperialWeightLabel: UILabel!
    @IBOutlet weak var metricWeightLabel: UILabel!
    @IBOutlet weak var imperialHeightLabel: UILabel!
    @IBOutlet weak var metricHeightLabel: UILabel!
    @IBOutlet weak var temperamentLabel: UILabel!
    
    @IBOutlet weak var readArticlesAboutTheBreedButtonOutlet: UIButton!
    
    @IBOutlet weak var originLeftLabel: UILabel!
    @IBOutlet weak var breedGroupLeftLabel: UILabel!
    @IBOutlet weak var breedForLeftLabel: UILabel!
    @IBOutlet weak var lifeSpanLeftLabel: UILabel!
    @IBOutlet weak var imperialWeightLeftLabel: UILabel!
    @IBOutlet weak var metricWeightLeftLabel: UILabel!
    @IBOutlet weak var imperialHeightLeftLabel: UILabel!
    @IBOutlet weak var metricHeightLeftLabel: UILabel!
    @IBOutlet weak var temperamentCenterLabel: UILabel!
    
    //Constraints
    @IBOutlet weak var originLeftLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var originLabelTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var breedGroupLeftLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var breedGroupLabelTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var breedForLeftLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var breedForLabelTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lifeSpanLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var lifeSpanRightLabelTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imperialWeightLeftLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imperialWeightLabelTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var metricWeightLeftLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var metricWeightLabelTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imperialHeightLeftLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imperialHeightLabelTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var metricHeightLeftLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var metricHeightLabelTopConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(objects)
        setUpLabels()
        setupImage()
        readArticlesAboutTheBreedButtonOutlet.layer.cornerRadius = 10
    }
    
    func setupImage() {
        let dogImagesArray = [UIImage(named: "dog1")!, UIImage(named: "dog-2")!, UIImage(named: "dog-3")!, UIImage(named: "dog-4")!, UIImage(named: "dog-5")! ]
        let randomNumber = Int.random(in: 0...4)
//        dogImageView.image = dogImagesArray[randomNumber]
    }
    
    func setUpLabels() {
        nameLabel.text = objects?.name
        if objects?.origin == nil || objects?.origin == "" {
            originLeftLabel.isHidden = true
            originLabel.isHidden = true
            originLeftLabelTopConstraint.constant = -25
            originLabelTopConstraint.constant = -25
        } else {
            originLabel.text = objects?.origin
        }
        if objects?.breed_group == nil || objects?.breed_group == "" {
            breedGroupLeftLabel.isHidden = true
            breedGroupLabel.isHidden = true
            breedGroupLeftLabelTopConstraint.constant = -25
            breedGroupLabelTopConstraint.constant = -25
        } else {
            breedGroupLabel.text = objects?.breed_group
        }
        if objects?.bred_for == nil || objects?.bred_for == "" {
            breedForLeftLabel.isHidden = true
            breedForLabel.isHidden = true
            breedForLeftLabelTopConstraint.constant = -25
            breedForLabelTopConstraint.constant = -25
        } else {
            breedForLabel.text = objects?.bred_for
        }
        if objects?.life_span == nil || objects?.life_span == "" {
            lifeSpanLeftLabel.isHidden = true
            lifeSpanLabel.isHidden = true
            lifeSpanLabelTopConstraint.constant = -25
            lifeSpanRightLabelTopConstraint.constant = -25
        } else {
            lifeSpanLabel.text = objects?.life_span
        }
        if objects?.weight.imperial == nil || objects?.weight.imperial == "" {
            imperialWeightLeftLabel.isHidden = true
            imperialWeightLabel.isHidden = true
            imperialWeightLeftLabelTopConstraint.constant = -25
            imperialWeightLabelTopConstraint.constant = -25
        } else {
            imperialWeightLabel.text = objects?.weight.imperial
        }
        if objects?.weight.metric == nil || objects?.weight.metric == "" {
            metricWeightLeftLabel.isHidden = true
            metricWeightLabel.isHidden = true
            metricWeightLeftLabelTopConstraint.constant = -25
            metricWeightLabelTopConstraint.constant = -25
        } else {
            metricWeightLabel.text = objects?.weight.metric
        }
        if objects?.height.imperial == nil || objects?.height.imperial == "" {
            imperialHeightLeftLabel.isHidden = true
            imperialHeightLabel.isHidden = true
            imperialHeightLeftLabelTopConstraint.constant = -25
            imperialHeightLabelTopConstraint.constant = -25
        } else {
            imperialHeightLabel.text = objects?.height.imperial
        }
        if objects?.height.metric == nil || objects?.height.metric == "" {
            metricHeightLeftLabel.isHidden = true
            metricHeightLabel.isHidden = true
            metricHeightLeftLabelTopConstraint.constant = -25
            metricHeightLabelTopConstraint.constant = -25
        } else {
            metricHeightLabel.text = objects?.height.metric
        }
        if objects?.temperament == nil || objects?.temperament == "" {
            temperamentCenterLabel.isHidden = true
            temperamentLabel.isHidden = true
        } else {
            temperamentLabel.text = objects?.temperament
        }
    }
    
    @IBAction func readArticlesAboutTheBreedButtonIsTapped(_ sender: Any) {
        
    }
}
