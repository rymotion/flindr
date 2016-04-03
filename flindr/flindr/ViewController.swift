//
//  ViewController.swift
//  flindr
//
//  Created by Ryan Paglinawan on 4/2/16.
//  Copyright © 2016 RyanPaglinawan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.c
        let LeftSwipe = UISwipeGestureRecognizer(target: self, action: "swipeHandle:")
        let RightSwipe = UISwipeGestureRecognizer(target: self, action: "swipeHandle:")
        
        LeftSwipe.direction = .Left
        RightSwipe.direction = .Right
        
        view.addGestureRecognizer(LeftSwipe)
        view.addGestureRecognizer(RightSwipe)
        
        updateLatestMovie()    // Starts the UI Update Process
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipeHandle(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Left) {
            print("Swipe left")
            nextMovie()
        }
        if (sender.direction == .Right) {
            print("Swipe right")
            //also save to a database later
            database().setData(APIConstantsUtil.title, name: APIConstantsUtil.description, name: APIConstantsUtil.tagline, name: APIConstantsUtil.imgURL)
            nextMovie()
        }
    }
    
    func nextMovie(){
        //this should load up another movie random if it has to
        findRandomMovie()
    }
    
    // Updates the variable that contains the id of the latest movie in api
    func updateLatestMovie() {
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
            APIConstantsUtil.latestMovieID = Int((id as! NSNumber))
            
            self.findRandomMovie()
        }
        task.resume()
    }
    
    // Finds random movie in API and updates the UI
    func findRandomMovie() {
        let randomMovieID = arc4random_uniform(UInt32(500) + 1) + 1 // Between 1 and latestMovieID
        
        // Load random movie
        let url = NSURL(string:"https://api.themoviedb.org/3/movie/\(randomMovieID)?api_key=954d7909c4c641cbf030293a45924bf9")
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
                
                // Start over search
                self.findRandomMovie()
            } else {
                
                // Save Data as a JSON Dictionary
                var dataAsJSON: [String: AnyObject]!
                do {
                    dataAsJSON = try NSJSONSerialization.JSONObjectWithData(data!, options:[]) as! [String : AnyObject]
                } catch let myJSONError {
                    print(myJSONError)
                }
                
                // Get the information from the returned Object
                let posterPath = dataAsJSON["poster_path"]!
                APIConstantsUtil.title = dataAsJSON["title"]! as! String    //name of the movie
                APIConstantsUtil.description = dataAsJSON["overview"]! as! String // description
                APIConstantsUtil.tagline = dataAsJSON["tagline"]! as! String
                APIConstantsUtil.imdbID = dataAsJSON["imdb_id"] as! String
                APIConstantsUtil.imgURL = NSURL(string: "http://image.tmdb.org/t/p/w300\(posterPath)")! //image URL for the movie poster
                
                // Update the UI
                dispatch_async(dispatch_get_main_queue()){
                    /*self.txtView.text = description as! String
                     self.lblTitle.text = title as! String
                     self.imgView.image = UIImage(data: NSData(contentsOfURL: imageURL)!)*/
                    // UPDATE UI HERE
                }
            }
            }.resume()
    }

    
    
    @IBOutlet weak var information: UITextView!//   this is the film info

    @IBOutlet weak var Marquee: UIImageView!
}

