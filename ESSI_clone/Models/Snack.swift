//
//  Snack.swift
//  ESSI_clone
//
//  Created by Cem Aksoy on 14.01.2026.
//

import Foundation
import SwiftData

@Model
class Snack {
  enum Rating : Int, CaseIterable, Codable {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
  }
  var name: String
  var onHand: Int
  var notes: String
  var comfortLevel: Rating
  
  public init(name: String = "", onHand: Int = 0, notes: String = "", comfortLevel: Rating = .one) {
    self.name = name
    self.onHand = onHand
    self.notes = notes
    self.comfortLevel = comfortLevel
  }
}

extension Snack {
  @MainActor
  static var preview: ModelContainer {
    guard let container = try? ModelContainer(for: Snack.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true)) else {
      fatalError("Failed to create preview container!")
    }
    
    container.mainContext.insert(Snack(name: "Cheddar Goldfish", onHand: 3, notes: "Best eaten by the handful while doomscrolling.", comfortLevel: .one))
    container.mainContext.insert(Snack(name: "Spicy Takis", onHand: 1, notes: "Left lips numb last time. No regrets.", comfortLevel: .two))
    container.mainContext.insert(Snack(name: "Frozen Thin Mints", onHand: 3, notes: "A classy cold snack. Seasonal, like depression.", comfortLevel: .one))
    container.mainContext.insert(Snack(name: "Trader Joe’s Scandinavian Swimmers", onHand: 2, notes: "Pretends to be healthy. Not fooling anyone.", comfortLevel: .three))
    container.mainContext.insert(Snack(name: "Mom's Cookies", onHand: 1, notes: "Nothing better. Like a warm blanket", comfortLevel: .five))
    
    return container
  }
}
