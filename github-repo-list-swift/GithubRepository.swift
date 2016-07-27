//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    var fullName: String?
    var htmlURL: NSURL?
    var repositoryID: String?
    
    init(dictionary: NSDictionary) {
        if let name = dictionary["full_name"] as! String? {
            self.fullName = name
        }
        if let html = dictionary["html_url"] as! String? {
            self.htmlURL = NSURL(string: html)
        }
        if let repositoryID = dictionary["id"] as! NSNumber? {
            self.repositoryID = String(repositoryID)
        }
    }
}
