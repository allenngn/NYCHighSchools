//
//  SchoolDetailView.swift
//  NYCHighSchools
//
//  Created by Nguyen, Allen on 1/7/23.
//

import SwiftUI

struct SchoolDetailView: View {
	let viewModel: SchoolDetailViewModelProtocol
	
	var body: some View {
		VStack(alignment: .leading, spacing: 5.0) {
			Text(viewModel.school.schoolInfo.school_name)
				.dynamicTypeSize(.xxxLarge)
				.bold()
				.underline()
			
			if let location = viewModel.school.schoolInfo.location {
				Text(location)
			}
			if let phoneNumber = viewModel.school.schoolInfo.phone_number {
				Text(phoneNumber)
			}
			if let website = viewModel.school.schoolInfo.website {
				Text(website)
			}
			if let schoolEmail = viewModel.school.schoolInfo.school_email {
				Text(schoolEmail)
			}
			
			scoresView
			
			Spacer()
		}
		.padding(.all)
	}
	
	var scoresView: some View {
		VStack(alignment: .leading) {
			if let numberTestTakers = viewModel.school.satData?.num_of_sat_test_takers {
				spacedTextHStack(withLeftText: "# of SAT test takers:", rightText: numberTestTakers)
			}
			if let averageReadingScore = viewModel.school.satData?.sat_critical_reading_avg_score {
				spacedTextHStack(withLeftText: "Avg SAT Critical Reading score:", rightText: averageReadingScore)
			}
			if let averageMathScore = viewModel.school.satData?.sat_math_avg_score {
				spacedTextHStack(withLeftText: "Avg SAT Math score:", rightText: averageMathScore)
			}
			if let averageWritingScore = viewModel.school.satData?.sat_writing_avg_score {
				spacedTextHStack(withLeftText: "Avg SAT Writing score:", rightText: averageWritingScore)
			}
		}
		// This first padding pads the the inner text from the border
		.padding([.top, .bottom])
		.overlay(
			RoundedRectangle(cornerRadius: 10)
				.stroke(.black, lineWidth: 3)
		)
		// This second padding creates distance between this section and the top VStack containing the school's name & address
		.padding(.top, 70.0)
	}
	
	func spacedTextHStack(withLeftText leftText: String, rightText: String) -> some View {
		HStack {
			Text(leftText)
			Spacer()
			Text(rightText)
		}
		.padding([.leading, .trailing])
	}
}

struct SchoolDetailView_Previews: PreviewProvider {
	static var previews: some View {
		SchoolDetailView(viewModel: MockSchoolDetailViewModel())
	}
}

struct MockSchoolDetailViewModel: SchoolDetailViewModelProtocol {
	var school: School {
		let mockDBN = "123456"
		let mockSchoolInfo = SchoolInfo(
			dbn: mockDBN,
			location: "2865 West 19th Street, Brooklyn, NY 11224 (40.576976, -73.985413)",
			phone_number: "718-946-6812",
			school_email: "scaraway@schools.nyc.gov",
			school_name: "Liberation Diploma Plus High School",
			website: "schools.nyc.gov/schoolportals/21/K728"
		)
		let mockSATData = SATData(
			dbn: mockDBN,
			num_of_sat_test_takers: "647",
			sat_critical_reading_avg_score: "383",
			sat_math_avg_score: "423",
			sat_writing_avg_score: "366"
		)
		let mockSchool = School(schoolInfo: mockSchoolInfo, satData: mockSATData)
		return mockSchool
	}
}

