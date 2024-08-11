//
//  TeslaAppApp.swift
//
//  Created by Vitaliy Iakushev on 13.05.2024.
//  Измененная строка для теста
//  Вторая новая строка для теста

import SwiftUI

@main
struct TeslaAppApp: App {
    var body: some Scene {
        WindowGroup {
            LockScreen()
                .environment(\.colorScheme, .dark)
                .preferredColorScheme(.dark)
        }
    }
}
