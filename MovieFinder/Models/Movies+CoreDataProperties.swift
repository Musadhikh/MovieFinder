//
//  Movies+CoreDataProperties.swift
//  MovieFinder
//
//  Created by Musadhikh Muhammed K on 09/03/18.
//  Copyright © 2018 musadhikh. All rights reserved.
//
//

import Foundation
import CoreData


extension Movies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movies> {
        return NSFetchRequest<Movies>(entityName: "Movies")
    }

    @NSManaged public var title: String?
    

}
