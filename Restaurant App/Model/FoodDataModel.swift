//
//  FoodDataModel.swift
//  Restaurant App
//
//  Created by Adwait Barkale on 10/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import Foundation

class FoodDataModel
{
    var categories: [Category] = []
}

class Category
{
    var name: String?
    var items: [Product] = []
}

class Product
{
    var name: String?
    var price: String?
    var img: String?
    var product_id: String?
    var isVeg: Bool?
}

class combineFoodModel
{
    var categoryName: String?
    var productName: String?
    var price: String?
    var img: String?
    var product_id: String?
    var isVeg: Bool?
    var quantity:Int = 1
}
