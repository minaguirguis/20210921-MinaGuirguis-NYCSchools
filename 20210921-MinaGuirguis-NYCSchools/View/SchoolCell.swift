//
//  SchoolCell.swift
//  20210921-MinaGuirguis-NYCSchools
//
//  Created by Mina Guirguis on 9/22/21.
//

import UIKit

class SchoolCell: UITableViewCell {
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var borough: UILabel!
    
    var school: School!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configureCell(school: School) {
        
        self.school = school
        self.schoolName.text = school.schoolName
        self.address.text = school.address
        self.borough.text = school.borough
    }

}
