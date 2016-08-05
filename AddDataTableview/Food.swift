//
//  Food.swift
//  AddDataTableview
//
//  Created by sky on 2016/8/5.
//  Copyright © 2016年 sky. All rights reserved.
//

import Foundation

class Food{
    var name = ""
    var location = ""
    var match = ""
    
    init(name:String, location:String, match:String){
        self.name = name //self.name指的是Food類別裡name的屬性名稱,等號後的name則為參數
        self.location = location
        self.match = match
        
    }
}
//var Newfood:[Foodgood] = [Food(name: "牛肉麵",location: "西門町", match:"奶茶"),Food(name: "餃子",location: "三重區", match:"玉米濃湯")]
