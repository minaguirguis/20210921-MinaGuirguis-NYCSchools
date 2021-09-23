//
//  SchoolDetailsVC.swift
//  20210921-MinaGuirguis-NYCSchools
//
//  Created by Mina Guirguis on 9/22/21.
//

import UIKit

class SchoolDetailsVC: UIViewController {
    var school: School!
    
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var criticalReadingScore: UILabel!
    @IBOutlet weak var mathScore: UILabel!
    @IBOutlet weak var writingScore: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        //setup view with school details
        schoolName.text = school.schoolName
        criticalReadingScore.text = school.criticalReadingScore
        mathScore.text = school.mathScore
        writingScore.text = school.writingScore
        
      
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
