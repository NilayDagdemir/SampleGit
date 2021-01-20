//
//  APIProvider.swift
//  SampleGit
//
//  Created by Eda Nilay DAĞDEMİR on 18.01.2021.
//  Copyright © 2021 Eda Nilay DAĞDEMİR. All rights reserved.
//

import Alamofire
import Foundation

class APIProvider: NSObject {

    static var shared: APIProvider = APIProvider()
    fileprivate var session = AF

    typealias OnSuccess<T: Decodable> = ((WSResponse<T>) -> Void)?
    typealias OnError = (() -> Void)

    private override init() {
        super.init()
        session = Session()
    }

    @discardableResult
    func performRequest<T: Decodable>(route: APIRouter,
                                      decoder: DataDecoder = JSONDecoder(),
                                      onSuccess: OnSuccess<T>,
                                      onError: OnError? = nil) -> DataRequest {
        print("here route is: \(route)")
        return getRequest(route, decoder, onSuccess, onError)
    }

    func getRequest<T: Decodable>(_ route: URLRequestConvertible,
                                  _ decoder: DataDecoder = JSONDecoder(),
                                  _ onSuccess: OnSuccess<T>,
                                  _ onError: OnError? = nil) -> DataRequest {
        return session.request(route)
            .validate(statusCode: 200..<400)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: T.self, decoder: decoder) { (requestResponse) in
                print("here is res :\(requestResponse) and result: \(requestResponse.result)")
                switch requestResponse.result {
                case .success:
                    onSuccess?(WSResponse(results: requestResponse.value))
                case .failure:
                    guard onError != nil else {
                        onSuccess?(WSResponse(results: nil))
                        return
                    }
                }
            }
        }
}
