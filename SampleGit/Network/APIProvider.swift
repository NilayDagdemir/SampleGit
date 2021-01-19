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
    typealias OnError = ((WSError?) -> Void)

    private override init() {
        super.init()
        session = Session()
    }

    @discardableResult
    func performRequest<T: Decodable>(route: APIRouter,
                                      decoder: DataDecoder = JSONDecoder(),
                                      onSuccess: OnSuccess<T>,
                                      onError: OnError? = nil) -> DataRequest {
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
                switch requestResponse.result {
                case .success:
                    onSuccess?(WSResponse(requestResponse.value))
                case .failure:
                    guard let onError = onError else {
                        onSuccess?(WSResponse(nil))
                        return
                    }
                    print("here res is: \(requestResponse) and route: \(route)")
                    let statusCode = requestResponse.response?.statusCode ?? 500
                    if statusCode < 500 {
                        //Client type errors, cast body to Error Class
                        //HTTP 401 case handled in retry block
                        do {
                            guard let data = requestResponse.data else { return onError(nil) }
                            let wsError = try JSONDecoder().decode(WSError.self, from: data)
                            onError(wsError)
                        } catch let error {
                            print("An error occured: \(error.localizedDescription)")
                            // Same as HTTP 500 case
                            onError(nil)
                        }
                    } else {
                        onError(nil)
                    }
                }
        }
    }
}
