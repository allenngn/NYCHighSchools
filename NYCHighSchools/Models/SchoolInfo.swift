//
//  SchoolInfo.swift
//  NYCHighSchools
//
//  Created by Nguyen, Allen on 1/7/23.
//

import Foundation

struct SchoolInfo: Decodable {
	let dbn: String
	let location: String?
	let phone_number: String?
	let school_email: String?
	let school_name: String
	let website: String?
	
}
