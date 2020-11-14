//
//  TrainingsTableViewCell.swift
//  Breeds
//
//  Created by Sergey on 11/14/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit

class TrainingsTableViewCell: UITableViewCell {

    @IBOutlet weak var trainingimageView: UIImageView!
    @IBOutlet weak var trainingNameLabel: UILabel!
    
    func setTraining(training: Training) {
        trainingimageView.image = training.image
        trainingNameLabel.text = training.title
    }
    

}
