//
//  SchoolDetailViewModel.swift
//  NYCHighSchools
//
//  Created by Nguyen, Allen on 1/7/23.
//

import Foundation

protocol SchoolDetailViewModelProtocol {
	var school: School { get }
}

struct SchoolDetailViewModel: SchoolDetailViewModelProtocol {
	let school: School
}
