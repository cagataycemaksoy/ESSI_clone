//
//  SnackDetailView.swift
//  ESSI_clone
//
//  Created by Cem Aksoy on 14.01.2026.
//

import SwiftUI
import SwiftData

struct SnackDetailView: View {
  @State var snack: Snack
  @Environment(\.modelContext) private var modelContext
  @Environment(\.dismiss) private var dismiss
  
  @State private var name = ""
  @State private var onHand = 0
  @State private var notes = ""
  
    var body: some View {
      Form {
        TextField("Snack name", text: $name)
          .font(.largeTitle)
          .textFieldStyle(.roundedBorder)
          .listRowSeparator(.hidden)
        
        HStack{
          Text("QTY:")
            .bold()
          
          Spacer()
          Text("\(onHand)")
          Stepper("", value: $onHand, in: 0...Int.max)
            .labelsHidden()
        }
        .font(.title2)
      }
      .onAppear {
        name = snack.name
        onHand = snack.onHand
        notes = snack.notes
      }
    }
}

#Preview {
  SnackDetailView(snack: Snack(name: "Lil Swifties", onHand: 3, notes: "Homemade cookies baked by Prof. G. He will bring these for Lunar New Year.", comfortLevel: .five))
}
