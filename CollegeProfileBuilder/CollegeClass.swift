//
//  CollegeClass.swift
//  CollegeProfileBuilder
//
//  Created by ablake on 2/8/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class CollegeClass: NSObject
{
    var name = ""
    var location = ""
    var studentAmount = ""
    var webAddress = ""
    var image = UIImage(named: "default")
    
    init(Name:String, Location:String, StudentAmount:String, WebAddress:String, Image:UIImage)
    {
        name = Name
        location = Location
        studentAmount = StudentAmount
        webAddress = WebAddress
        image = Image
    }
    
    init(Name:String, Location:String, WebAddress:String)
    {
        name = Name
        location = Location
        webAddress = WebAddress
    }
}
