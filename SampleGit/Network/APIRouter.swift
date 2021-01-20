//
//  APIRouter.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {

    case searchRepositories(_ searchKeywordQuery: String, _ perPage: Int, _ pageNumber: Int)
    case getUserDetail(_ userName: String)
    case getUserRepos(_ userName: String)

    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .searchRepositories, .getUserRepos, .getUserDetail:
            return .get
        }
    }

    // MARK: - Path
    private var path: String {
        switch self {
        case .searchRepositories:
            return "search/repositories"
        case .getUserRepos(let userName):
            return "users/\(userName)/repos"
        case .getUserDetail(let userName):
            return "users/\(userName)"
        }
    }

    // MARK: - baseURL
    private var baseURL: String {
        return Config.baseURL
    }

    // MARK: - ParameterEncoding
    private var encoder: ParameterEncoding {
        return URLEncoding()
    }

    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .searchRepositories(let searchKeywordQuery, let perPage, let pageNumber):
            return ["q": searchKeywordQuery,
                    "per_page": perPage,
                    "page": pageNumber]
        default:
            return nil
        }
    }

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {

        // Request URL
        let url = try baseURL.asURL().appendingPathComponent(path).absoluteString.removingPercentEncoding!.asURL()
        var urlRequest = URLRequest(url: url)

        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        // Common Headers
        let jsonHeader = "application/json"
        urlRequest.setValue(jsonHeader, forHTTPHeaderField: "Accept")
        urlRequest.setValue(jsonHeader, forHTTPHeaderField: "Content-Type")

        // Parameters
        do {
            urlRequest = try encoder.encode(urlRequest, with: parameters)
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }
        return urlRequest
    }

}
