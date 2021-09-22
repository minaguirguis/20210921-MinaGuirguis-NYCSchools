//
//  School.swift
//  20210921-MinaGuirguis-NYCSchools
//
//  Created by Mina Guirguis on 9/22/21.
//

import Foundation


class School {
    private var _schoolName: String!
    private var _address: String!
    private var _borough: String!
    private var _dbn: String!
    
    
    var schoolName: String {
        return _schoolName
    }
    
    var address: String {
        return _address
    }
    
    var borough: String {
        return _borough
    }
    
    var dbn: String {
        return _dbn
    }
    
    
    init(schoolName: String, address: String, borough: String, dbn: String) {
        self._schoolName = schoolName
        self._address = address
        self._borough = borough
        self._dbn = dbn
    }
}
