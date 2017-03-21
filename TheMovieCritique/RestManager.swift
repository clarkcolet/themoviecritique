//
//  RestManager.swift
//  TheMovieCritique
//
//  Created by nishanth on 15/03/2017.
//  Copyright © 2017 Group3. All rights reserved.
//

import Foundation
import UIKit

class RestManager
{
    let BaseURL = "http://160.153.227.51/theFilmCritique/index.php" //define the url globally
    
    func makeTokenRequest() -> String
    {
        var CallData : String = ""
    
        guard let url = URL(string: BaseURL) else {
            print("cannot create URL")
            return "Invalid URL"
        }
        
        var resp : String = ""
        
        var urlRequest = NSMutableURLRequest(url: url)
        
        
        urlRequest.httpMethod = "POST"
        
        var postString:String = ""
        
        let param = ["Request" : "Login" ]
        
        postString = self.convertToJson(value: param)
        
        
        urlRequest.httpBody = postString.data(using: .utf8)
        
        
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        
        
        // make the request
        let task = session.dataTask(with: urlRequest as URLRequest){
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on /todos/1")
                // print(error ?? <#default value#>)
                
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
            
                return
            }
            // parse the result as JSON, since that's what the API provides
            do {
                guard let returnResponse = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                    print("error trying to convert data to JSON 1 \(responseData)")
                    return
                }
                
                print(returnResponse)
                
                if returnResponse["Status"] as! String == "-1"
                {
                    print("no request")
                }
                else
                {
                    CallData = returnResponse["Data"] as! String;
                }
               
              
                
            } catch  {
                print("error trying to convert data to JSON 2 \(data)")
             
                return
            }
        }
        
        task.resume()
        
        return CallData;
        
    }
    
    func convertToJson(value : Dictionary<String,String>) -> String
    {
        
        if let stringBody = try? JSONSerialization.data(withJSONObject: value, options: []) {
            // here `json` is your JSON data, an array containing the String
            // if you need a JSON string instead of data, then do this:
            if let content = String(data: stringBody, encoding: String.Encoding.utf8) {
                // here `content` is the JSON data decoded as a String
                print(content)
                return content
            }
        }
        return ""
        
    }

    
    
}
