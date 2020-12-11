//
//  RecommendedDishCell.swift
//  Restaurant App
//
//  Created by Adwait Barkale on 10/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class RecommendedDishCell: UICollectionViewCell {
    
    @IBOutlet var dishImage: UIImageView!
    @IBOutlet var symbol: UIImageView!
    @IBOutlet var lblDishName: UILabel!
    @IBOutlet var lblDishCategory: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var btnAdd: UIButton!
    @IBOutlet var btnInc: UIButton!
    @IBOutlet var btnDec: UIButton!
    @IBOutlet var lblQuantity: UILabel!
    @IBOutlet var stackViewQuantity: UIStackView!
    
    
}
