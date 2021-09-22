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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configureCell(schoolName: String, address: String, borough: String) {
        self.schoolName.text = schoolName
        self.address.text = address
        self.borough.text = borough
    }

}
