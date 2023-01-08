//
//  SchoolListViewModel.swift
//  NYCHighSchools
//
//  Created by Nguyen, Allen on 1/7/23.
//

import Foundation

private let schoolListURLString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
private let schoolSATScoresURLString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"

@MainActor
class SchoolListViewModel: ObservableObject {
	@Published private(set) var schools: [School] = []
	/// Map for connecting the results of the 2 requests
	private var dbnMap: [String: School] = [:]
	
	init() {
		Task {
			do {
				// Use async let to fire off these 2 requests asynchronously
				async let schoolInfos = NetworkService.fetch(type: [SchoolInfo].self, fromURL: schoolListURLString)
				async let satScores = NetworkService.fetch(type: [SATData].self, fromURL: schoolSATScoresURLString)
				
				// We'll await the list of schools first since the initial screen requires listing all possible schools.
				// The actual SAT scores infos can come later whenever the second request finishes since it's not even required until the user views the details for a specific school.
				self.schools = try await schoolInfos.map { School(schoolInfo: $0) }.sorted { $0.schoolInfo.school_name < $1.schoolInfo.school_name }
				
				// Use dbn (which looks like some sort of primary ID) to match a school in the SAT scores response with the corresponding school in the list of schools response
				for school in self.schools {
					self.dbnMap[school.schoolInfo.dbn] = school
				}
				
				for satScore in try await satScores {
					self.dbnMap[satScore.dbn]?.satData = satScore
				}
			} catch let decodingError as DecodingError {
				print("Could not decode school list JSON: \(decodingError.localizedDescription)")
			} catch let generalError {
				print("Could not fetch school list JSON \(generalError.localizedDescription)")
			}
		}
	}
}
