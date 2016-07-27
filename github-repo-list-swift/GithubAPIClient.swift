//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    class func getRepositoriesWithCompletion(completionHandler: NSArray -> ()) {
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        if let githubURL = NSURL(string: "https://api.github.com/repositories?client_id=\(Secrets().clientID)&client_secret=\(Secrets().clientSecret)") {
        
            let githubTask = session.dataTaskWithURL(githubURL, completionHandler: {
                (data, response, error) in
                
                if let data = data {
                    do {
                        let responseArray = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSArray
                        
                        NSOperationQueue.mainQueue().addOperationWithBlock({//do this in tvc...?...
                            completionHandler(responseArray)
                        })
                        
                    } catch {
                        print("there was an error: \(error)!")
                    }
                    
                }
            })
            githubTask.resume()
        }
    }
}

