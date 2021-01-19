//
//  WSResponse.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation

// MARK: - GitAPIServiceResponse
struct WSResponse<T: Decodable> {
    let items: T?
//    let error: WSError?

    init(_ items: T? = nil) {
        self.items = items
//        self.error = error
    }
}

// MARK: - GitAPIServiceError
struct WSError: Codable {
    let statusCode: Int?
    let statusMessage: String?
    let success: Bool?

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }
}
