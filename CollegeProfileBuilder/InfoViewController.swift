//
//  InfoViewController.swift
//  CollegeProfileBuilder
//
//  Created by ablake on 2/8/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController
{

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var studentAmountTextField: UITextField!
    
    var collegeDetail:CollegeClass!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myImageView.image = collegeDetail.image
        nameTextField.text = collegeDetail.name
        locationTextField.text = collegeDetail.location
        studentAmountTextField.text = collegeDetail.studentAmount
    }
    
    @IBAction func saveButtonTapped(_ sender: Any)
    {
        collegeDetail.name = nameTextField.text!
        collegeDetail.location = locationTextField.text!
        collegeDetail.studentAmount = studentAmountTextField.text!
    }
    
}
