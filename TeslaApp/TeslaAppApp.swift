//
//  TeslaAppApp.swift
//
//  Created by Vitaliy Iakushev on 13.05.2024.
//  Измененная строка для теста
//  Добавлена еще одна строка для теста rebase

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
