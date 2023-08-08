//
//  URLProtocolMock.swift
//  BandemapTests
//
//  Created by Lloret López álvaro on 8/8/23.
//

import Foundation
@testable import Bandemap

final class URLProtocolMock: URLProtocol {
    
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data?))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func stopLoading() {}
    
    override func startLoading() {
        
        guard let handler = URLProtocolMock.requestHandler else {
            fatalError("Hay que inicializar el handler para inyector el url protocol mock")
        }
        
        do {
            let (response, data) = try handler(request)
           
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
           
            if let data = data {
                client?.urlProtocol(self, didLoad: data)
            }
            
            client?.urlProtocolDidFinishLoading(self)
            
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
}
