//
//  CartDetailsViewController.swift
//  Restaurant App
//
//  Created by Adwait Barkale on 10/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class CartDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var lblTotalBill: UILabel!
    @IBOutlet var imgEmptyCart: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    
    var currentCell:CartDetailViewCell?
    var currentSection: Int?
    
    var cartData:[combineFoodModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func btnRemoveAllItemsTapped()
    {
        let alertVC = UIAlertController(title: "Confirm Deletion", message: "Do you really want to delete all items from Cart", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            
        }
        
        let cancleAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertVC.addAction(confirmAction)
        alertVC.addAction(cancleAction)
        
        present(alertVC,animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if Singleton.shared.arrCartData.count > 0
        {
            cartData = Singleton.shared.arrCartData
            lblTotalBill.text = "Total Rs. \(Singleton.shared.totalBill)"
            scrollView.isHidden = false
        }else{
            scrollView.isHidden = true
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartDetailViewCell") as! CartDetailViewCell
        let price = Int(cartData![indexPath.row].price!)! * cartData![indexPath.row].quantity
        //cell.lblPrice.text = cartData?[indexPath.row].price
        cell.lblPrice.text = "\(price)"
        cell.lblProductName.text = cartData?[indexPath.row].productName
        cell.btnDeleteItem.layer.cornerRadius = cell.btnDeleteItem.frame.size.height / 2
        cell.btnDeleteItem.tag = indexPath.row
        cell.btnDeleteItem.addTarget(self, action: #selector(btnDeleteItemTapped(sender:)), for: .touchUpInside)
        cell.stackViewQuantity.layer.borderWidth = 1
        cell.stackViewQuantity.layer.borderColor = UIColor.systemGreen.cgColor
        cell.btnInc.tag = indexPath.row
        cell.btnDec.tag = indexPath.row
        cell.btnInc.addTarget(self, action: #selector(btnIncrementQuantityTapped(Sender:)), for: .touchUpInside)
        cell.btnDec.addTarget(self, action: #selector(btnDecrementQuantityTapped(Sender:)), for: .touchUpInside)
        //self.currentCell = cell
        self.currentSection = indexPath.section
        cell.lblQuantity.text = String(cartData?[indexPath.row].quantity ?? 0)
        return cell
    }
    
    @objc func btnIncrementQuantityTapped(Sender: UIButton)
    {
        currentCell = tableView.cellForRow(at: NSIndexPath(row: Sender.tag, section: currentSection!) as IndexPath) as? CartDetailViewCell
        let currentProduct = cartData![Sender.tag]
        currentProduct.quantity = currentProduct.quantity + 1
        Singleton.shared.totalBill += Int(currentProduct.price!)!
        self.currentCell?.lblQuantity.text = "\(currentProduct.quantity)"
        let price = Int(currentProduct.price!)! * Int(currentProduct.quantity)
        self.currentCell?.lblPrice.text = "\(price)"
        currentCell?.lblQuantity.text = "\(currentProduct.quantity)"
        self.lblTotalBill.text = "Total Rs. \(Singleton.shared.totalBill)"
    }
    
    @objc func btnDecrementQuantityTapped(Sender:UIButton)
    {
        currentCell = tableView.cellForRow(at: NSIndexPath(row: Sender.tag, section: currentSection!) as IndexPath) as? CartDetailViewCell
        let currentProduct = cartData![Sender.tag]
        if currentProduct.quantity > 1
        {
            currentProduct.quantity = currentProduct.quantity - 1
            Singleton.shared.totalBill -= Int(currentProduct.price!)!
            self.currentCell?.lblQuantity.text = "\(currentProduct.quantity)"
            let price = Int(currentProduct.price!)! * Int(currentProduct.quantity)
            self.currentCell?.lblPrice.text = "\(price)"
            currentCell?.lblQuantity.text = "\(currentProduct.quantity)"
            self.lblTotalBill.text = "Total Rs. \(Singleton.shared.totalBill)"
        }
    }
    
    @objc func btnDeleteItemTapped(sender: UIButton)
    {
        let currentProduct = cartData?[sender.tag]
        
        let alertVC = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to remove \(String(describing: currentProduct?.productName)) from you Cart", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            let selectedProductQuantity = currentProduct?.quantity
            let currentProductPrice = Int((currentProduct?.price!)!)
            Singleton.shared.totalBill -= selectedProductQuantity! * currentProductPrice!
            //Singleton.shared.totalBill -= Int(currentProduct!.price!)!
            Singleton.shared.arrCartData.remove(at: sender.tag)

            self.cartData?.remove(at: sender.tag)
            self.lblTotalBill.text = "Total Rs. \(Singleton.shared.totalBill)"
            
            if Singleton.shared.totalBill > 0
            {
                self.tableView.reloadData()
            }else{
                self.scrollView.isHidden = true
            }
            
        }
        
        let cancleAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertVC.addAction(confirmAction)
        alertVC.addAction(cancleAction)
        
        present(alertVC,animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
    }
    
}
