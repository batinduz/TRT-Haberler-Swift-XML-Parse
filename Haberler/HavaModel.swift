//
//  HavaModel.swift
//  Haberler
//
//  Created by Batin DUZ on 23.12.2014.
//  Copyright (c) 2014 Batin DUZ. All rights reserved.
//

import Foundation

struct HavaModel {
    var sehir : String
    var gun: GunModel
}
struct GunModel {
    var tarih : String
    var endusuk: String
    var enyuksek: String
    var durum: String
}