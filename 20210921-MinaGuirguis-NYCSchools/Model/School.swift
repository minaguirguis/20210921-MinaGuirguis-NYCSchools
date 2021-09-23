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
    private var _writingScore: String!
    private var _mathScore: String!
    private var _criticalReadingScore: String!
    
    //wrapping variables
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
    
    var criticalReadingScore: String {
        return _criticalReadingScore ?? "N/A"
    }
    
    var mathScore: String {
        return _mathScore ?? "N/A"
    }
    
    var writingScore: String {
        return _writingScore ?? "N/A"
    }
    
    
    init(schoolName: String, address: String, borough: String, dbn: String) {
        self._schoolName = schoolName
        self._address = address
        self._borough = borough
        self._dbn = dbn
    }
    
    
    func setScores(writingScore: String, mathScore: String, criticalReading: String) {
        self._mathScore = mathScore
        self._writingScore = writingScore
        self._criticalReadingScore = criticalReading
    }
}
