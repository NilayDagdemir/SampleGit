//
//  APIClient.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation
import Alamofire

protocol APIClientInterface {

    typealias OnSuccess<T: Decodable> = ((WSResponse<T>) -> Void)
    typealias OnError = ((WSError?) -> Void)?

    func searchRepositories(with searchKeywordQuery: String, perPage: Int, pageNumber: Int, onSuccess: @escaping OnSuccess<RepositoryList>, onError: OnError)
    func getRepositoryDetail(with userName: String, onSuccess: @escaping OnSuccess<Repository>, onError: OnError)
    func getUserDetail(with userName: String, onSuccess: @escaping OnSuccess<UserDetail>, onError: OnError)
}

class APIClient: APIClientInterface {
    func searchRepositories(with searchKeywordQuery: String, perPage: Int, pageNumber: Int, onSuccess: @escaping OnSuccess<RepositoryList>, onError: OnError) {
        APIProvider.shared.performRequest(route: .searchRepositories(searchKeywordQuery, perPage, pageNumber),
                                          onSuccess: onSuccess,
                                          onError: onError)
    }

    func getRepositoryDetail(with searchQuery: String, onSuccess: @escaping OnSuccess<Repository>, onError: OnError) {
        APIProvider.shared.performRequest(route: .getRepositoryDetail(searchQuery),
                                          onSuccess: onSuccess,
                                          onError: onError)
    }

    func getUserDetail(with userName: String, onSuccess: @escaping OnSuccess<UserDetail>, onError: OnError) {
        APIProvider.shared.performRequest(route: .getUserDetail(userName),
                                          onSuccess: onSuccess,
                                          onError: onError)
    }
}
