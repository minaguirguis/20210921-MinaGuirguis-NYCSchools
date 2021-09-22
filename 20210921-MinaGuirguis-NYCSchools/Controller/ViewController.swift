//
//  ViewController.swift
//  20210921-MinaGuirguis-NYCSchools
//
//  Created by Mina Guirguis on 9/21/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let requestURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"

    var schools = [School]()
    
    @IBOutlet weak var schoolList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        schoolList.delegate = self
        schoolList.dataSource = self
        
        
        loadNYCSchools(url: requestURL)
       
    }
    
    //Download School list
    
    func loadNYCSchools(url: String) {
        let urlToRequest = URLRequest(url: URL(string: requestURL)!)
        
        let dataTask = URLSession.shared.dataTask(with: urlToRequest) { data, response, error in
            if error != nil {
                print("DEBUG: There was an error with your request")
            } else {
                let schoolsResponse = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                guard let schoolArr = schoolsResponse as? NSArray else {return}
                if let schoolsList = schoolArr as? [[String:String]] {
                    for school in schoolsList {
                        let dbn = school["dbn"]!
                        let address = school["location"]!
                        let borough = school["borough"] ?? "Uknown"
                        let name = school["school_name"]!
                        let newSchool = School(schoolName: name, address: address, borough: borough, dbn: dbn)
                        self.schools.append(newSchool)
                    }
                }
                DispatchQueue.main.async {
                    self.schoolList.reloadData()//to refresh after getting data
                }
                
            }
        }
       
        dataTask.resume()
        
    }
    
    
    
    //TableView protocol methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let school = schools[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: SCHOOLCELL_REF) as? SchoolCell {
            cell.configureCell(school: school)
            
            return cell
        } else {
            return SchoolCell()
        }
        
        
        
    }
    

    
    

}

