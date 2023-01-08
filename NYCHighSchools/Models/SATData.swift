//
//  SATData.swift
//  NYCHighSchools
//
//  Created by Nguyen, Allen on 1/7/23.
//

import Foundation

struct SATData: Decodable {
	let dbn: String
	let num_of_sat_test_takers: String
	let sat_critical_reading_avg_score: String
	let sat_math_avg_score: String
	let sat_writing_avg_score: String
}
