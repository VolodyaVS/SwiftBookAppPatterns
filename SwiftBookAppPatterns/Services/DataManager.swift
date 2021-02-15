//
//  DataManager.swift
//  SwiftBookAppPatterns
//
//  Created by Vladimir Stepanchikov on 18.12.2020.
//  Copyright (c) 2021 Vladimir Stepanchikov. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    private init() {}
    
    func saveFavoriteStatus(for courseName: String, with status: Bool) {
        userDefaults.set(status, forKey: courseName)
    }
    
    func loadFavoriteStatus(for courseName: String) -> Bool {
        userDefaults.bool(forKey: courseName)
    }
}
