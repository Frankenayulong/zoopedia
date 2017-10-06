//
//  Requester.swift
//  zoopedia
//
//  Created by Kendrick on 6/10/17.
//  Copyright © 2017 Nadya. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
enum Requester{
    public static func getAnimals(callback: @escaping (_ animals:[SAnimal]) -> ()){
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                var ans:[SAnimal] = []
                let body = JSON(json)
                let animals: JSON = JSON(body["body"].arrayValue)
                for (_,animal):(String, JSON) in animals {
                    var contribution: Double = 0
                    ans.append(SAnimal(name: animal["name"].stringValue, image:animal["image_url"].stringValue, desc: animal["description"].stringValue))
                }
                callback(ans)
            }
        }
    }
}
