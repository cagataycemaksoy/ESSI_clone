//
//  SnackListView.swift
//  ESSI_clone
//
//  Created by Cem Aksoy on 14.01.2026.
//

import SwiftUI
import SwiftData

struct SnackListView: View {
  @Query private var snacks: [Snack]
  @Environment(\.modelContext) private var modelContext
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    SnackListView()
    .modelContainer(Snack.preview)
}
