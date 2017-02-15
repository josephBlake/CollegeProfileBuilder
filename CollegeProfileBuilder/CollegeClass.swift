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
    var image = UIImage(named: "default")
    
    init(Name:String, Location:String, StudentAmount:String, Image:UIImage)
    {
        name = Name
        location = Location
        studentAmount = StudentAmount
        image = Image
    }
    
    init(Name:String, Location:String)
    {
        name = Name
        location = Location
    }
}
