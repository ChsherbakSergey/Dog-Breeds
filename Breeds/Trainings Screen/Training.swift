//
//  Training.swift
//  Breeds
//
//  Created by Sergey on 11/14/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import Foundation
import UIKit

class Training {
    
    var image: UIImage
    var title: String
    var text: String
    var url: String
    
    init(image: UIImage, title: String, text: String, url: String) {
        self.image = image
        self.title = title
        self.text = text
        self.url = url
    }
}
