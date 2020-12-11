//
//  RecommendedViewCell.swift
//  Restaurant App
//
//  Created by Adwait Barkale on 10/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class RecommendedViewCell: UITableViewCell {

    @IBOutlet var recommendedList: RecommendedList! //Collection View
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
