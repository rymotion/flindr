//
//  APIConstantsUtil.swift
//  flindr
//
//  Created by Jordan Ishii on 4/2/16.
//  Copyright © 2016 RyanPaglinawan. All rights reserved.
//

import Foundation
import UIKit

class APIConstantsUtil {
    // Variables for MovieDb API calls
    static let URLBase = "https://api.themoviedb.org/3/"
    static let imageURLBase = "image.tmdb.org/t/p/w300/"
    static let movieGet = "movie/"
    static let apiKey = "api_key=954d7909c4c641cbf030293a45924bf9"
    static var latestMovieID = 0 // Must be updated when opens
    
    // Variables for GuideBox API calls
    static let gbURLBase = "https://api-public.guidebox.com/v1.43/US/"
    static let gbApiKey = "8EkTqrXQUiVwJsoyBnJHnQ2UzKrHUY"  // TEMPORARY (250 LIMIT)
    static let searchByGBKey = "/movie/"    // URL piece for finding based on GuideBox info
    static let searchByMDBKey = "/search/movie/id/imdb/"    // URL piece for finding based on MovieDb
    
    // Data from latest random movie
    static var imgURL = NSURL()
    static var title = ""    //name of the movie
    static var description = "" // description
    static var tagline = ""
    static var imdbID = ""
}