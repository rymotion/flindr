//
//  APIConstantsUtil.swift
//  flindr
//
//  Created by Jeffrey Ishii on 4/2/16.
//  Copyright © 2016 RyanPaglinawan. All rights reserved.
//

import Foundation

class APIConstantsUtil {
    static let URLBase = "https://api.themoviedb.org/3/"
    static let movieGet = "movie/"
    static let apiKey = "api_key=954d7909c4c641cbf030293a45924bf9"
    static var latestMovieID = 0 // Must be updated when opens
    
    static func updateLatestMovie() {
        let url = NSURL(string:"https://api.themoviedb.org/3/movie/latest?api_key=954d7909c4c641cbf030293a45924bf9")
        let request = NSURLRequest(URL: url!)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil
                else {
                    // check for fundamental networking error
                    print("error=\(error)")
                    return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            // Save Data as a JSON Dictionary
            var dataAsJSON: [String: AnyObject]!
            do {
                dataAsJSON = try NSJSONSerialization.JSONObjectWithData(data!, options:[]) as! [String : AnyObject]
            } catch let myJSONError {
                print(myJSONError)
            }
            
            // Save data to latestMovie
            let id = dataAsJSON["id"]!
            latestMovieID = Int(id as! String)!
            
        }
        task.resume()
    }
}