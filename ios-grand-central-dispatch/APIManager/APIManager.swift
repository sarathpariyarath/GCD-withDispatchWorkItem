//
//  APIManager.swift
//  ios-grand-central-dispatch
//
//  Created by Sarath P on 31/12/22.
//

import Foundation


struct SearchInputModel: Encodable {
    let keyword: String
    
    enum CodingKeys: String, CodingKey {
        case keyword = "keyword"
    }
}

struct SearchOutputModel: Decodable {
    let success: Bool
    let data: [String]
}

class APIManagerClass {
    static let sharedInstance = APIManagerClass()
    
    func sortAnimals(keyword: String, completion: @escaping(_ result: SearchOutputModel) -> Void) {
        
        let urlString = "http://localhost:3000/getAnimals"
        let model = SearchInputModel(keyword: keyword)
        
        do {
            let inputData = try JSONEncoder().encode(model)
            
            HttpUtility.sharedInstance.postData(urlString: urlString, requestData: inputData, responseModel: SearchOutputModel.self, method: "post") { result in
                _=completion(result)
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        
        
    }
}
