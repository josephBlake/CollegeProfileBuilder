//
//  InfoViewController.swift
//  CollegeProfileBuilder
//
//  Created by ablake on 2/8/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import SafariServices

class InfoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var studentAmountTextField: UITextField!
    
    @IBOutlet weak var websiteTextField: UITextField!
    
    var collegeDetail:CollegeClass!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myImageView.image = collegeDetail.image
        nameTextField.text = collegeDetail.name
        locationTextField.text = collegeDetail.location
        studentAmountTextField.text = collegeDetail.studentAmount
        websiteTextField.text = collegeDetail.webAddress
        
        imagePicker.delegate = self
    }
    
    @IBAction func saveButtonTapped(_ sender: Any)
    {
        collegeDetail.name = nameTextField.text!
        collegeDetail.location = locationTextField.text!
        collegeDetail.studentAmount = studentAmountTextField.text!
        collegeDetail.webAddress = websiteTextField.text!
        collegeDetail.image = myImageView.image!
    }
    

    @IBAction func screenTap(_ sender: Any)
    {
        if myImageView.frame.contains((sender as AnyObject).location(in: self.view))
        {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
            {
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            present(imagePicker, animated: true, completion: nil)
            }
            else
            {
                getPhotoLibrary()
            }
        }
    }
    
    func getPhotoLibrary()
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        imagePicker.dismiss(animated: true)
        {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.myImageView.image = selectedImage
        }
    }
    
    @IBAction func goToWebsite(_ sender: Any)
    {
        let urlString = URL(string: websiteTextField.text!)!
        UIApplication.shared.openURL(urlString)
    }
}
