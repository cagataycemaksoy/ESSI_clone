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
  @State private var sheetShown = false
  
    var body: some View {
      NavigationStack {
        List {
          ForEach(snacks) { snack in
            NavigationLink {
              SnackDetailView(snack: snack)
            } label: {
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
            .swipeActions {
              Button("Delete", role: .destructive) {
                modelContext.delete(snack)
              }
            }

          }
        }
        .listStyle(.plain)
        .navigationTitle("Snacks on Hand:")
        .sheet(isPresented: $sheetShown) {
          let newSnack = Snack()
          NavigationStack {
            SnackDetailView(snack: newSnack)
          }
        }
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Button {
              sheetShown = true
            } label: {
              Image(systemName: "plus")
            }

          }
        }
      }
    }
}

#Preview {
    SnackListView()
    .modelContainer(Snack.preview)
}
