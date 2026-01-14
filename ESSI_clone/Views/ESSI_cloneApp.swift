//
//  ESSI_cloneApp.swift
//  ESSI_clone
//
//  Created by Cem Aksoy on 14.01.2026.
//

import SwiftUI
import SwiftData

@main
struct ESSI_cloneApp: App {
    var body: some Scene {
        WindowGroup {
            SnackListView()
        }
        .modelContainer(for: Snack.self)
    }
}
