//
//  users.swift
//  technoTapp
//
//  Created by MacBook Pro on 1396/6/11 ه‍.ش..
//  Copyright © 1396 ه‍.ش. mohammad. All rights reserved.
//

import UIKit
import CoreData

class users: NSManagedObject {
    
    @NSManaged var username : String
    @NSManaged var email : String
    @NSManaged var password : String
    
}
