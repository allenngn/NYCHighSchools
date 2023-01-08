//
//  NetworkService.swift
//  NYCHighSchools
//
//  Created by Nguyen, Allen on 1/7/23.
//

import Foundation

class NetworkService {
	static func fetch<T>(type: T.Type, fromURL urlString: String) async throws -> T where T: Decodable {
		guard let url = URL(string: urlString) else {
			throw URLError(.badURL)
		}
		let (data, _) = try await URLSession.shared.data(from: url)
		let object = try JSONDecoder().decode(type, from: data)
		return object
	}
}
