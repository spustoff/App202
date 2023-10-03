//
//  AddBudgetViewModel.swift
//  App202
//
//  Created by IGOR on 26/09/2023.
//

import SwiftUI
import CoreData

final class AddBudgetViewModel: ObservableObject {
    
    @Published var budgetSum: String = ""
    @Published var budgetName: String = ""
    @Published var invSum: String = ""
    @Published var invName: String = ""

    func addToHistory(completion: @escaping () -> (Void)) {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let flight = NSEntityDescription.insertNewObject(forEntityName: "HistoryModel", into: context) as! HistoryModel
        
        flight.budgetSum = Int32(budgetSum) ?? 0
        flight.budgetName = budgetName
        flight.invSum = Int32(invSum) ?? 0
        flight.invName = invName

        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func addToHistory2(completion: @escaping () -> (Void)) {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let flight = NSEntityDescription.insertNewObject(forEntityName: "HistoryModel", into: context) as! HistoryModel

        flight.invSum = Int32(invSum) ?? 0
        flight.invName = invName

        CoreDataStack.shared.saveContext()
        
        completion()
    }
}

