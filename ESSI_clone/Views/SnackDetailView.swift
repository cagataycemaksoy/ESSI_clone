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
  @State private var selectedComfortLevel: Snack.Rating = .one
  @State private var notes = ""
  
  var body: some View {
    VStack(alignment: .leading) {
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
      .padding(.bottom)
      
      HStack {
        Text("Comfort:")
          .bold()
        
        Spacer()
        
        Picker("", selection: $selectedComfortLevel) {
          ForEach(Snack.Rating.allCases, id: \.self) { rating in
            Text("\(rating.rawValue)")
          }
        }
      }
      .padding(.bottom)
      
      Text("Notes")
        .bold()
      
      TextField("Notes...", text: $notes, axis: .vertical)
        .textFieldStyle(.roundedBorder)
      
      
      Spacer()
    }
    .font(.title2)
    .padding()
    .navigationBarBackButtonHidden()
    .toolbar {
      ToolbarItem(placement: .cancellationAction) {
        Button("Cancel") {
          dismiss()
        }
      }
      
      ToolbarItem(placement: .confirmationAction) {
        Button("Save") {
          snack.name = name
          snack.onHand = onHand
          snack.comfortLevel = selectedComfortLevel
          snack.notes = notes
          modelContext.insert(snack)
          guard let _ = try? modelContext.save() else { return }
          dismiss()
        }
      }
    }
    .onAppear {
      name = snack.name
      onHand = snack.onHand
      selectedComfortLevel = snack.comfortLevel
      notes = snack.notes
    }
  }
}

#Preview {
  NavigationStack {
    SnackDetailView(snack: Snack(name: "Lil Swifties", onHand: 3, notes: "Homemade cookies baked by Prof. G. He will bring these for Lunar New Year.", comfortLevel: .five))
  }
}
