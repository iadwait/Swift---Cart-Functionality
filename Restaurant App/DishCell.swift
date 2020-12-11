//
//  DishCell.swift
//  Restaurant App
//
//  Created by Adwait Barkale on 10/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class DishCell: UITableViewCell {
    
    @IBOutlet var symbol: UIImageView!
    @IBOutlet var lblDishName: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var btnAdd: UIButton!
    @IBOutlet var btnInc: UIButton!
    @IBOutlet var btnDec: UIButton!
    @IBOutlet var lblQuantity: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
