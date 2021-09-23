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
            
        schoolName.text = school.schoolName
        criticalReadingScore.text = school.criticalReadingScore
        mathScore.text = school.mathScore
        writingScore.text = school.writingScore
        
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
