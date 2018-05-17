//
//  Constants.swift
//  Muzik
//
//  Created by Silvia Rodriguez on 5/9/18.
//  Copyright © 2018 Silvia Rodriguez. All rights reserved.
//

import Firebase

struct Constants
{
    struct refs
    {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
        
        static let databaseMarketPosts = databaseRoot.child("posts")
        
        static let databaseTutorPosts = databaseRoot.child("tutorPosts")
    }
}
