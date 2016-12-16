//
//  Interest.swift
//  CarouselEffect
//
//  Created by 陈闯 on 2016/12/16.
//  Copyright © 2016年 CC. All rights reserved.
//

import Foundation
import UIKit


class Interest
{
    // MARK: - Public API
    var title = ""
    var description = ""
    var numberOfMembers: NSNumber
    var numberOfPosts: NSNumber
    var featuredImage: UIImage!
    
    init(title: String, description: String, featuredImage: UIImage!, numberOfMembers: NSNumber, numberOfPosts: NSNumber)
    {
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
        self.numberOfMembers = numberOfMembers
        self.numberOfPosts = numberOfPosts
    }
    
    // MARK: - Private
    // dummy data
    static func createInterests() -> [Interest]
    {
        return [
            Interest(title: "Hello there, i miss u.", description: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hello")!, numberOfMembers: 24, numberOfPosts: 249),
            Interest(title: "🐳🐳🐳🐳🐳", description: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "dudu")!, numberOfMembers: 13, numberOfPosts: 29),
            Interest(title: "Training like this, #bodyline", description: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "bodyline")!, numberOfMembers: 16, numberOfPosts: 270),
            Interest(title: "I'm hungry, indeed.", description: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "wave")!, numberOfMembers: 234, numberOfPosts: 483),
            Interest(title: "Dark Varder, #emoji", description: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "darkvarder")!, numberOfMembers: 23, numberOfPosts: 290),
            Interest(title: "I have no idea, bitch", description: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "hhhhh")!, numberOfMembers: 1323, numberOfPosts: 37),
        ]

    }
}
