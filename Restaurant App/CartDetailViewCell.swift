//
//  CartDetailViewCell.swift
//  Restaurant App
//
//  Created by Adwait Barkale on 10/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class CartDetailViewCell: UITableViewCell {
    
   
    @IBOutlet var btnDeleteItem: UIButton!
    @IBOutlet var lblProductName: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var stackViewQuantity: UIStackView!
    @IBOutlet var btnDec: UIButton!
    @IBOutlet var btnInc: UIButton!
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
