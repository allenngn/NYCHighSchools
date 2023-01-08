//
//  SchoolListView.swift
//  NYCHighSchools
//
//  Created by Nguyen, Allen on 1/7/23.
//

import SwiftUI

struct SchoolListView: View {
	@ObservedObject private var schoolListViewModel = SchoolListViewModel()
	
	var body: some View {
		NavigationStack {
			NavigationView {
				List(schoolListViewModel.schools, id: \.schoolInfo.dbn) { school in
					NavigationLink(school.schoolInfo.school_name) {
						SchoolDetailView(viewModel: SchoolDetailViewModel(school: school))
					}
				}
			}
			.navigationTitle("New York City High Schools")
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}

struct SchoolListView_Previews: PreviewProvider {
	static var previews: some View {
		SchoolListView()
	}
}
