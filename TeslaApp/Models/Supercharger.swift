//
//  Supercharger.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 17.05.2024.
//

import Foundation

///Data for Supercharger Locations
struct SuperchargerCity: Identifiable {
    /// ID
    var id = UUID()
    /// Location
    var city: String
    /// Number of currently available superchargers at this location
    var availableChargers: Int
    /// Total number of superchargers at this location
    var totalChargers: Int
    /// Dostance to closest supercharger for user at this location
    var distanceToClosestCharger: Double
}
