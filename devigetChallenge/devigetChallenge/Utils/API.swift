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
        if let url = URL(string: Constansts.top){
            let urlSession = URLSession.shared
            urlSession.dataTask(with: url, completionHandler: {data, response, error in
                if let d = data{
                    do{
                        let dataStr = String(data: d, encoding: .utf8)
                        if let str = dataStr{
                            let dt = try Feed(str, using: .utf8)
                            completion(dt)
                        }
                        else{
                            print("no string")
                            completion(nil)
                        }
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
