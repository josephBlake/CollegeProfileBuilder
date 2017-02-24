//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by ablake on 2/8/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var myTableView: UITableView!
    
    var myCollegeObject:[CollegeClass] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myCollegeObject.append(CollegeClass(Name: "MSOE", Location: "Milwaukee", StudentAmount: "2810", WebAddress: "https://www.msoe.edu/", Image: UIImage(named: "msoe")!))
        myCollegeObject.append(CollegeClass(Name: "Rose Hulman", Location: "Terre Haute", StudentAmount: "1980", WebAddress: "https://www.rose-hulman.edu/", Image: UIImage(named: "rosehulman")!))
        myCollegeObject.append(CollegeClass(Name: "Purdue", Location: "West Lafayette", StudentAmount: "38770", WebAddress: "http://www.purdue.edu/", Image: UIImage(named: "purdue")!))
    }
    //add to the list of colleges
    @IBAction func addButtonTapped(_ sender: Any)
    {
        let alert = UIAlertController(title: "add college", message: nil, preferredStyle: .alert)
        
        alert.addTextField{ (collegeTextField) in collegeTextField.placeholder = "add College"
        }
        
        alert.addTextField{ (locationTextField) in locationTextField.placeholder = "add Location"
        }
        
        alert.addTextField{ (webAddressTextField) in webAddressTextField.placeholder = "add Website URL"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .default)
        {
            (action) in
            let collegeTextField = alert.textFields?[0]
            let locationTextField = alert.textFields?[1]
            let webAddressTextField = alert.textFields?[2]
            self.myCollegeObject.append(CollegeClass(Name: (collegeTextField?.text)!, Location: (locationTextField?.text)!, WebAddress: (webAddressTextField?.text)!))
            
            self.myTableView.reloadData()
            
        }
        alert.addAction(addAction)
        
        present(alert, animated: true, completion: nil)
    }
    // required function - sets number of rows in TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myCollegeObject.count
    }
    // required function - sets the cell in the TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //sets cell indentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = myCollegeObject[indexPath.row].name
        cell.detailTextLabel?.text = myCollegeObject[indexPath.row].location
        
        return cell
        
    }
    // Allows you to delete a row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == .delete)
        {
            myCollegeObject.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailView = segue.destination as! InfoViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        detailView.collegeDetail = myCollegeObject[selectedRow!]
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        myTableView.reloadData()
    }
}

