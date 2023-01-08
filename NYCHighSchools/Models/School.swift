//
//  School.swift
//  NYCHighSchools
//
//  Created by Nguyen, Allen on 1/7/23.
//

import Foundation

class School {
	let schoolInfo: SchoolInfo
	var satData: SATData?
	
	init(schoolInfo: SchoolInfo, satData: SATData? = nil) {
		self.schoolInfo = schoolInfo
		self.satData = satData
	}
}
