//
//  Singleton.swift
//  Restaurant App
//
//  Created by Adwait Barkale on 10/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import Foundation
import UIKit

class Singleton{
    
    static let shared = Singleton()
    
    var arrFoodData:[FoodDataModel] = []
    var arrProcducts:[Product] = []
    var arrCombineFoodModel:[combineFoodModel] = []
    var arrCartData:[combineFoodModel] = []
    
    var totalBill = 0
    
    var lblTotalBill:UILabel?
    var vc:UIViewController?
    
    func getAllFoodData() -> [FoodDataModel]
    {
        let product1 = Product()
        product1.name = "Pav Bhaji"
        product1.price = "50"
        product1.img = "pavbhaji"
        product1.product_id = "123"
        product1.isVeg = true
        
        let product2 = Product()
        product2.name = "Veg Thali"
        product2.price = "250"
        product2.img = "vegthali"
        product2.product_id = "556"
        product2.isVeg = true
        
        let product3 = Product()
        product3.name = "Eggs Biryani"
        product3.price = "175"
        product3.img = "eggsbiryani"
        product3.product_id = "778"
        product3.isVeg = false
        
        let product4 = Product()
        product4.name = "Chicken Thali"
        product4.price = "350"
        product4.img = "chickenthali"
        product4.product_id = "449"
        product4.isVeg = false
        
        let category1 = Category()
        category1.name = "Indian"
        category1.items = [product1,product2,product3,product4]
        
        let foodDataModel = FoodDataModel()
        foodDataModel.categories = [category1]
        
        //Chinesse Category
        
        let product5 = Product()
        product5.name = "Maggi"
        product5.price = "65"
        product5.img = "C_Maggie"
        product5.product_id = "115"
        product5.isVeg = true
        
        let product6 = Product()
        product6.name = "Chineese Thali"
        product6.price = "220"
        product6.img = "C_Thali"
        product6.product_id = "668"
        product6.isVeg = true
        
        let product7 = Product()
        product7.name = "Chinesse Biryani"
        product7.price = "175"
        product7.img = "C_Biryani"
        product7.product_id = "661"
        product7.isVeg = false
        
        let product8 = Product()
        product8.name = "Chinese Manchuriyan"
        product8.price = "110"
        product8.img = "C_Maunchuriyan"
        product8.product_id = "773"
        product8.isVeg = false
        
        let category2 = Category()
        category1.name = "Chineese"
        category1.items = [product5,product6,product7,product8]
        
        let foodDataModel1 = FoodDataModel()
        foodDataModel1.categories = [category2]
        
        arrFoodData.append(foodDataModel)
        arrFoodData.append(foodDataModel1)
        
        arrProcducts.append(product1)
        arrProcducts.append(product2)
        arrProcducts.append(product3)
        arrProcducts.append(product4)
        arrProcducts.append(product5)
        arrProcducts.append(product6)
        arrProcducts.append(product7)
        arrProcducts.append(product8)
        
        return arrFoodData
    }
    
    func getCombineFoodModel() -> [combineFoodModel]
    {
        
        let model1 = combineFoodModel()
        model1.categoryName = "Indian"
        model1.productName = "Pav Bhaji"
        model1.price = "50"
        model1.img = "pavbhaji"
        model1.isVeg = true
        model1.product_id = "123"
        model1.quantity = 1
        
        let model2 = combineFoodModel()
        model2.categoryName = "Indian"
        model2.productName = "Veg Thali"
        model2.price = "250"
        model2.img = "vegthali"
        model2.isVeg = true
        model2.product_id = "556"
        model2.quantity = 1
        
        let model3 = combineFoodModel()
        model3.categoryName = "Indian"
        model3.productName = "Eggs Biryani"
        model3.price = "175"
        model3.img = "eggsbiryani"
        model3.isVeg = false
        model3.product_id = "778"
        model3.quantity = 1
        
        let model4 = combineFoodModel()
        model4.categoryName = "Indian"
        model4.productName = "Chicken Thali"
        model4.price = "350"
        model4.img = "chickenthali"
        model4.isVeg = false
        model4.product_id = "449"
        model4.quantity = 1
        
        let model5 = combineFoodModel()
        model5.categoryName = "Chinesse"
        model5.productName = "Maggi"
        model5.price = "65"
        model5.img = "C_Maggie"
        model5.isVeg = true
        model5.product_id = "115"
        model5.quantity = 1
        
        let model6 = combineFoodModel()
        model6.categoryName = "Chinesse"
        model6.productName = "Chineese Thali"
        model6.price = "220"
        model6.img = "C_Thali"
        model6.isVeg = true
        model6.product_id = "668"
        model6.quantity = 1
        
        let model7 = combineFoodModel()
        model7.categoryName = "Chinesse"
        model7.productName = "Chinesse Biryani"
        model7.price = "175"
        model7.img = "C_Biryani"
        model7.isVeg = false
        model7.product_id = "661"
        model7.quantity = 1
        
        let model8 = combineFoodModel()
        model8.categoryName = "Chinesse"
        model8.productName = "Chinese Manchuriyan"
        model8.price = "110"
        model8.img = "C_Maunchuriyan"
        model8.isVeg = false
        model8.product_id = "773"
        model8.quantity = 1
        
        arrCombineFoodModel.append(model1)
        arrCombineFoodModel.append(model2)
        arrCombineFoodModel.append(model3)
        arrCombineFoodModel.append(model4)
        arrCombineFoodModel.append(model5)
        arrCombineFoodModel.append(model6)
        arrCombineFoodModel.append(model7)
        arrCombineFoodModel.append(model8)
        
        return arrCombineFoodModel
    }
    
    func getAllProducts() -> [Product]
    {
        return arrProcducts
    }
    
}

/*
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
 
 */
