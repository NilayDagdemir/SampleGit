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
    let results: T?

    enum CodingKeys: String, CodingKey {
        case results
    }
}
