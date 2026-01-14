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
      NavigationStack {
        List {
          ForEach(snacks) { snack in
            VStack(alignment: .leading) {
              Text(snack.name)
                .font(.title)
                .lineLimit(1)
              
              HStack {
                Text("Qty: \(snack.onHand)")
                Text(snack.notes)
                  .italic()
                  .foregroundStyle(.secondary)
                  .lineLimit(1)
              }
              .font(.body)
            }
          }
        }
        .listStyle(.plain)
        .navigationTitle("Snacks on Hand:")
      }
    }
}

#Preview {
    SnackListView()
    .modelContainer(Snack.preview)
}
