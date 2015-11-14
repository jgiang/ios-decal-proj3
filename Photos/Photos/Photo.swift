//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var thumbnailUrl : String!
    /* The username of the photographer. */
    var username : String!
    
    var thumbnailHeight : Int!
    var thumbnailWidth : Int!
    var standardUrl : String!
    var date : NSDate!
    var liked : Bool!
    
    
    
    
    
    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
        likes = data.valueForKey("likes")?.valueForKey("count") as! Int
        thumbnailUrl = data.valueForKey("images")?.valueForKey("thumbnail")?.valueForKey("url") as! String
        username = data.valueForKey("user")?.valueForKey("username") as! String
        thumbnailHeight = data.valueForKey("images")?.valueForKey("thumbnail")?.valueForKey("height") as! Int
        thumbnailWidth = data.valueForKey("images")?.valueForKey("thumbnail")?.valueForKey("width") as! Int
        standardUrl = data.valueForKey("images")?.valueForKey("standard_resolution")?.valueForKey("url") as! String
        
        date = NSDate(timeIntervalSince1970: (data.valueForKey("created_time") as! NSString).doubleValue)
        liked = false
    }

}