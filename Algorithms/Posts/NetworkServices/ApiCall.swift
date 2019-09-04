//
//  ApiCall.swift
//  Algorithms
//
//  Created by Felix Carao on 04/09/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

//import UIKit
//import Alamofire
//
//func getPosts(handlerBlock: (Data) -> ([Post])){
//    var postList:[Post]=[]
//    Alamofire.request("https://jsonplaceholder.typicode.com/posts").responseJSON { response in
//        var _data = response.data
////        do{
////            postList = try JSONDecoder().decode([Post].self, from: _data!)
////            print(postList)
////        }catch let jsonErr{
////            print("json error", jsonErr)
////        }
//    }
//}
//
//let handlerBlock: (Data) -> ([Post]) = { resultData in
//    return try JSONDecoder().decode([Post].self, from: resultData)
//    } as! (Data) -> [Post]


import UIKit
import Alamofire

class NetworkServices{

    typealias WebServiceResponse = ([[String:Any]]?, Error?) -> Void

    func getPosts(url:String, completion : @escaping WebServiceResponse){
        Alamofire.request(url).validate().responseJSON { response in
            
            if let error=response.error{
                completion(nil,error)
            }else if let jsonArray = response.result.value as? [[String:Any]]?{
                completion(jsonArray,nil)
            }
        }
   }
}

//import UIKit
//import Alamofire
//
//class NetworkServices{
//
//    typealias WebServiceResponse = ([[String:Any]]?, Error?) -> Void
//
//    func execute(url:URL, completion : @escaping WebServiceResponse){
//        Alamofire.request(url).responseJSON { response in
//            if let error=response.error{
//                completion(nil,error)
//            }else if let jsonArray = response.result.value as? [[String:Any]]{
//                completion(jsonArray,nil)
//            }else if let jsonObject = response.result.value as? [String:Any]{
//                completion([jsonObject],nil)
//            }
//        }
//    }
//}

//guard let urlToExecute=URL(string: "https://pokeapi.co/api/v2/pokemon/149") else {return}
//networkServices.execute(url: urlToExecute) { (json, error) in
//    if let error = error{
//        self.jsonTextView.text = error.localizedDescription
//    }else if let json = json{
//        self.jsonTextView.text=json.description
//    }
//}

//networkServices.getPosts(url: urlToExecute) { (json, error) in
//    if let error = error{
//        self.jsonTextView.text = error.localizedDescription
//    }else if let json = json{
//        self.jsonTextView.text=json.description
//    }
//}
