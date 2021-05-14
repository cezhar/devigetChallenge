//
//  API.swift
//  devigetChallenge
//
//  Created by Cezhar Arévalo on 10-05-21.
//

import Foundation
import UIKit

class API {
    
    class func getTop(completion: @escaping(_ response:Feed?) -> Void){
        if let url = URL(string: Constants.top){
            let urlSession = URLSession.shared
            urlSession.dataTask(with: url, completionHandler: {data, response, error in
                if let d = data{
                    do{
                        let dt = try Feed(data: d)
                        completion(dt)
                    }catch{
                        print("error: at creating Feed object")
                        completion(nil)
                    }
                } else {
                    print("no data")
                    completion(nil)
                }
            }).resume()
        }else {
            print("no url")
            completion(nil)
        }
        
    }
    
}
