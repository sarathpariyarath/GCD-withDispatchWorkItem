//
//  HttpUtility.swift
//  ios-grand-central-dispatch
//
//  Created by Sarath P on 31/12/22.
//

import Foundation


class HttpUtility {
    static let sharedInstance = HttpUtility()
    
    func postData<T: Decodable>(urlString: String, requestData: Data, responseModel: T.Type, method: String, completion: @escaping(_ result: T) -> Void) {
        guard let url = URL(string: urlString) else {return}
        
        var request = URLRequest(url: url)
        request.httpBody = requestData
        request.httpMethod = "\(method)"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { responseData, httpUrlResponse, error in
            
            if error == nil {
                
                
                //Parse data
                if let responseData = responseData {
                    do {
                        let decodedData = try JSONDecoder().decode(responseModel, from: responseData)
                        
                        _=completion(decodedData)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
                
              
            } else {
                print(error?.localizedDescription)
            }
        }.resume()
    }
}
