//
//  TeslaAppApp.swift
//
//  Created by Vitaliy Iakushev on 13.05.2024.
//  Измененная строка для теста
//  А тут другие изменения, в тестовой ветке


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
