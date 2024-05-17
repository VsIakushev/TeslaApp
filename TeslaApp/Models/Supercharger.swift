//
//  Supercharger.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 17.05.2024.
//

import Foundation

struct SuperchargerCity: Identifiable {
    var id = UUID()
    var city: String
    var availableChargers: Int
    var totalChargers: Int
    var distanceToClosestCharger: Double
}
