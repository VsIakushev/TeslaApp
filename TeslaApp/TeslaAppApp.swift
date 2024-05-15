//
//  TeslaAppApp.swift
//  TeslaApp
//
//  Created by Vitaliy Iakushev on 13.05.2024.
//

import SwiftUI

@main
struct TeslaAppApp: App {
    var body: some Scene {
        WindowGroup {
            LockScreen()
                .environment(\.colorScheme, .dark)
        }
    }
}
