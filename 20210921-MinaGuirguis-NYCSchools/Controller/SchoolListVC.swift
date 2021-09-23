//
//  ViewController.swift
//  20210921-MinaGuirguis-NYCSchools
//
//  Created by Mina Guirguis on 9/21/21.
//

import UIKit

class SchoolListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let schoolListRequestUrl = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    let satResultsRequestUrl = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    
    //array to store all schools
    var schools = [School]()
    
    @IBOutlet weak var schoolList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting tableview delegate and data source
        schoolList.delegate = self
        schoolList.dataSource = self
        
        
        loadNYCSchools(url: schoolListRequestUrl)
        
       
    }
    
    //Download School list and store in array
    func loadNYCSchools(url: String) {
        let urlToRequest = URLRequest(url: URL(string: url)!)
        
        let dataTask = URLSession.shared.dataTask(with: urlToRequest) { data, response, error in
            if error != nil {
                print("DEBUG: There was an error with your request")
            } else {
                let schoolsResponse = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                guard let schoolArr = schoolsResponse as? NSArray else {return}
                if let schoolsList = schoolArr as? [[String:String]] {
                    for school in schoolsList {
                        let dbn = school[DBN_REFERENCE]!
                        let address = school[LOCATION_REFERENCE]!
                        let borough = school[BOROUGH_REFERENCE] ?? "Uknown"
                        let name = school[SCHOOL_NAME_REFERENCE]!
                        let newSchool = School(schoolName: name, address: address, borough: borough, dbn: dbn)
                        self.schools.append(newSchool)
                    }
                }
                DispatchQueue.main.async {
                    self.schoolList.reloadData()//to refresh after getting data
                }
                self.loadSATScores(url: self.satResultsRequestUrl)
                
            }
        }
       
        dataTask.resume()
        
    }
    
    
    //get SAT scores and attach to corresponding school
    func loadSATScores(url: String) {
        let urlToRequest = URLRequest(url: URL(string: url)!)
        
        let dataTask = URLSession.shared.dataTask(with: urlToRequest) { data, response, error in
            if error != nil {
                print("DEBUG: There was an error with your request")
            } else {
                let scoresResponse = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                guard let scoresArr = scoresResponse as? NSArray else {return}
                if let scoresList = scoresArr as? [[String:String]] {
                    for score in scoresList {
                        let dbn = score[DBN_REFERENCE]!
                        let mathScore = score[SAT_MATH_SCORE]!
                        let writingScore = score[SAT_WRITING_SCORE]!
                        let criticalReadingScore = score[SAT_CRITICAL_READING_SCORE]!
                        print(dbn)
                        //attaching scores to corresponding schools
                        for school in self.schools {
                            if(dbn == school.dbn) {
                                school.setScores(writingScore: writingScore, mathScore: mathScore, criticalReading: criticalReadingScore)
                            }
                        }
                        
                    }
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SCHOOL_DETAILS_REFERENCE {
            if let scoresVC = segue.destination as? SchoolDetailsVC {
                if let school = sender as? School {
                    scoresVC.school = school
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var school: School!
        
        school = schools[indexPath.row]
        
        performSegue(withIdentifier:SCHOOL_DETAILS_REFERENCE, sender: school)
    }
    

    
    

}

