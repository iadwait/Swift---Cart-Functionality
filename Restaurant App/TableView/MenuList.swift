//
//  MenuList.swift
//  Restaurant App
//
//  Created by Adwait Barkale on 10/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class MenuList: UITableView,UITableViewDelegate,UITableViewDataSource {

    
    var dataSourceArray = [String]()
    var isItemAdded = false
    
    var allFoodData: [combineFoodModel] = []
    var indianCategoryFoodData = [combineFoodModel]()
    var chinesseCategoryFoodData = [combineFoodModel]()
    var arrCombineFoodModel:[combineFoodModel] = []
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
        allFoodData = Singleton.shared.getCombineFoodModel()
        arrCombineFoodModel = Singleton.shared.getCombineFoodModel()
        indianCategoryFoodData = getSpecificCategoryFoodData(CategoryName: "Indian")
        chinesseCategoryFoodData = getSpecificCategoryFoodData(CategoryName: "Chinesse")
        self.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return 2
        }else if section == 1
        {
            return 1
        }else if section == 2 //Indian Category
        {
        return indianCategoryFoodData.count
        }
        else if section == 3 //Chinesse Category
        {
        return chinesseCategoryFoodData.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 //Show Recommended Item Collection View
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendedViewCell") as! RecommendedViewCell
            
            return cell
        }
        
        if indexPath.section == 0 //Show Row Summary/Rating Cell and Veg/Switch Cell
        {
            if indexPath.row == 0 //Summary/Rating Cell
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCell")
                
                return cell!
            }else // Veg/Switch Cell row 1
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell")
                               
                return cell!
            }
        }
        
        //Indian Section
        if indexPath.section == 2
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DishCell") as! DishCell
            cell.stackViewQuantity.isHidden = true
            cell.lblDishName.text = indianCategoryFoodData[indexPath.row].productName!
            cell.lblPrice.text = "₹\(indianCategoryFoodData[indexPath.row].price ?? "")"
            cell.btnAdd.tag = indexPath.row
            cell.btnAdd.addTarget(self, action: #selector(btnAddTapped(sender:)), for: .touchUpInside)
            return cell
        }
    
        //Chinesse Section
        if indexPath.section == 3
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DishCell") as! DishCell
            cell.stackViewQuantity.isHidden = true
            cell.lblDishName.text = chinesseCategoryFoodData[indexPath.row].productName!
            cell.lblPrice.text = "₹\(chinesseCategoryFoodData[indexPath.row].price ?? "")"
            cell.btnAdd.tag = indexPath.row + 4
            cell.btnAdd.addTarget(self, action: #selector(btnAddTapped(sender:)), for: .touchUpInside)
            return cell
        }
            
        //Else
        
        else // Section 2 Onward's Dish Cell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DishCell") as! DishCell
            print(indexPath.section)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
     
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0
        {
            return nil
        }else if section == 1 {
            return "Recommended"
        }else if section == 2 {
            return "Indian"
        }else {
            return "Chinesse"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0
        {
            return 65
        }else if indexPath.section == 1
        {
            return 180 * 2
        }else {
            return 65
        }
        
    }
    
    
    func getSpecificCategoryFoodData(CategoryName: String) -> [combineFoodModel]
    {
        var filteredCategoryArray = [combineFoodModel]()
        
        filteredCategoryArray.removeAll()
        
        if CategoryName == "Indian"
        {
            for item in allFoodData
            {
                if item.categoryName == "Indian"
                {
                    filteredCategoryArray.append(item)
                }
            }
        }
        
        if CategoryName == "Chinesse"
        {
            for item in allFoodData
            {
                if item.categoryName == "Chinesse"
                {
                    filteredCategoryArray.append(item)
                }
            }
        }
        return filteredCategoryArray
    }
    
    @objc func btnAddTapped(sender: UIButton)
    {
        for item in Singleton.shared.arrCartData
        {
            //Check if item is Already Added
            if item.productName! == arrCombineFoodModel[sender.tag].productName!
            {
                self.isItemAdded = true
            }
        }
        
        if isItemAdded{
            print("This item is Already Added to you Cart")
            let alert = UIAlertController(title: "Already Added", message: "This Food Item is Already Added to your Cart!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            alert.addAction(okAction)
            Singleton.shared.vc!.present(alert,animated: true)
        }else {
            var totalPrice = Singleton.shared.totalBill
            arrCombineFoodModel[sender.tag].quantity = 1
            totalPrice = totalPrice + Int(arrCombineFoodModel[sender.tag].price!)!
            print("Total Bill = \(totalPrice)")
            Singleton.shared.totalBill = totalPrice
            Singleton.shared.lblTotalBill?.text = "₹\(Singleton.shared.totalBill)"
            //Add to Cart Data
            Singleton.shared.arrCartData.append(arrCombineFoodModel[sender.tag])
        }
        isItemAdded = false
      
    }
    
    
}
