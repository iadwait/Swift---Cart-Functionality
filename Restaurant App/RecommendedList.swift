//
//  RecommendedList.swift
//  Restaurant App
//
//  Created by Adwait Barkale on 10/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class RecommendedList: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var names = ["","","","",""]
    var arrFoodData:[FoodDataModel] = []
    var arrAllProducts:[Product] = []
    var arrCombineFoodModel:[combineFoodModel] = []
    var isItemAdded = false
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
        arrFoodData = Singleton.shared.getAllFoodData()
        arrAllProducts = Singleton.shared.getAllProducts()
        arrCombineFoodModel = Singleton.shared.getCombineFoodModel()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrAllProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedDishCell", for: indexPath) as! RecommendedDishCell
   
        let data = arrCombineFoodModel[indexPath.row]
        cell.dishImage.image = UIImage(named: data.img!)
        cell.lblDishCategory.text = data.categoryName
        cell.lblDishName.text = data.productName
        cell.lblPrice.text = "₹\(data.price!)"
        cell.stackViewQuantity.isHidden = true
        cell.btnAdd.tag = indexPath.row
        cell.btnAdd.addTarget(self, action: #selector(btnAddTapped(sender:)), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item Selected - \(indexPath.row)")
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

extension RecommendedList: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = self.frame.size.width
        return CGSize(width: screenWidth / 2, height: screenWidth / 2)
    }
}
