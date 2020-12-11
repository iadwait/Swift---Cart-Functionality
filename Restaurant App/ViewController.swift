//
//  ViewController.swift
//  Restaurant App
//
//  Created by Adwait Barkale on 10/12/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var tableMenuList: MenuList!
    @IBOutlet var lblTotalPrice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Singleton.shared.lblTotalBill = lblTotalPrice
        Singleton.shared.vc = self
        lblTotalPrice.text = "₹0"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblTotalPrice.text = "₹\(Singleton.shared.totalBill)"
    }


}

