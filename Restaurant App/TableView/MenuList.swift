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
    
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
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
        }else if section == 2 {
            return 4
        }else {
            return 4
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
        } else // Section 2 Onward's Dish Cell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DishCell") as! DishCell
            
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
    
}
