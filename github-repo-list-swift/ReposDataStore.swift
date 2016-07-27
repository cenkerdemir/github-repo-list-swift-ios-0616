//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repositories:[GithubRepository] = []
    
    func getRepositoriesWithCompletion(completion:() -> ()) {
        GithubAPIClient.getRepositoriesWithCompletion({(responseArray) in
            self.repositories.removeAll()
            for repo in responseArray {
                let repoToAdd = GithubRepository(dictionary: repo as! NSDictionary)
                self.repositories.append(repoToAdd)
            }
         completion()
        })
    }
}
