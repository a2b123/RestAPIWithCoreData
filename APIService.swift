//
//  APIService.swift
//  RestAPIWithCoreData
//
//  Created by Amar Bhatia on 7/16/17.
//  Copyright © 2017 AmarBhatia. All rights reserved.
//

import UIKit

class APIService: NSObject {
    
    let query = "dogs"
    
    lazy var endPoint: String = {
        let string: String = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&tags=\(self.query)&nojsoncallback=1#"
        return string
    }()
    
    enum Result<T> {
        case Success(T)
        case Error(String)
    }
    
    func getDataWith(completion: @escaping (Result<[[String: AnyObject]]>) -> Void) {
        
        guard let url = URL(string: endPoint) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    guard let itemsJsonArray = json["items"] as? [[String: AnyObject]] else {
                        return completion(.Error(error?.localizedDescription ?? "There are no new Items to show"))
                    }
                    DispatchQueue.main.async {
                        completion(.Success(itemsJsonArray))
                    }
                }
            } catch let error {
                print(error)
            }
            }.resume()
    }
    
}
