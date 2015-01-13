//
//  HavaModel.swift
//  Haberler
//
//  Created by Batin DUZ on 23.12.2014.
//  Copyright (c) 2014 Batin DUZ. All rights reserved.
//


import Foundation
import CoreData

class HavaDetayModel: NSManagedObject {

    @NSManaged var tarih: String
    @NSManaged var sehir: String
    @NSManaged var endusuk: String
    @NSManaged var enyuksek: String
    @NSManaged var durum: String

    
}
