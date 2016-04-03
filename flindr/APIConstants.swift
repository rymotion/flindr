//
//  APIConstants.swift
//  flindr
//
//  Created by Jordan Ishii on 4/2/16.
//  Copyright © 2016 RyanPaglinawan. All rights reserved.
//

import Foundation

class APIConstants {
    // Constants to build URL for API
    // Example use: let url = NSURL(URLBase + movieGet + (random number) + ? + apiKey)
    static let URLBase = "https://api.themoviedb.org/3/"
    static let movieGet = "movie/"
    static let apiKey = "api_key=954d7909c4c641cbf030293a45924bf9"
    static var latestMovie = "" // Must be updated when opens
    
    
    
    

    
    static func updateLatestMovie() {
        let url = NSURL(fileURLWithPath: "http://api.themoviedb.org/3/movie/latest?" + apiKey)
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
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
            var dataAsJSON: [AnyObject]!
            var movieTitle = ""
            do {
                dataAsJSON = try NSJSONSerialization.JSONObjectWithData(data!, options:[]) as! [AnyObject]
                print(dataAsJSON)
                //let latestMovie = try NSJSONSerialization.JSONObjectWithData(dataAsJSON[0] as! NSData, options:[]) as! [String: AnyObject]!
            } catch let myJSONError {
                print(myJSONError)
            }
            
            // Save data to latestMovie
            print(dataAsJSON[0])
            //latestMovie = dataAsJSON
            
            
            
            //latestMovie = latestMovieID
        }
        task.resume()
    }
    
    
}