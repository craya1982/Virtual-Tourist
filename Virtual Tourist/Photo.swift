//
//  Photo.swift
//  Virtual Tourist
//
//  Created by Christopher Luc on 3/27/16.
//  Copyright © 2016 Christopher Luc. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Photo: NSManagedObject {
    
    struct Keys {
        static let Url = "url"
    }
    
    @NSManaged var url: String
    @NSManaged var pin: Pin
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(photoURL: String, pin: Pin, context: NSManagedObjectContext) {
        
        //Core Data
        let entity = NSEntityDescription.entityForName("Photo", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.url = photoURL
        self.pin = pin
    }
    
    var photo: UIImage? {
        
        get {
            return APIClient.Caches.imageCache.imageWithIdentifier(url)
        }
        
        set {
            APIClient.Caches.imageCache.storeImage(newValue, withIdentifier: url)
        }
    }
}