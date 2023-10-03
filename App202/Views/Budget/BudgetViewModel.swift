//
//  BudgetViewModel.swift
//  App202
//
//  Created by IGOR on 26/09/2023.
//

import SwiftUI
import CoreData

final class BudgetViewModel: ObservableObject {

    @Published var current_budget: HistoryModel?
    @Published var budgets: [HistoryModel] = []
    @Published var current_inv: HistoryModel?
    @Published var invs: [HistoryModel] = []
    @Published var isDetail: Bool = false
    @Published var isFavs: Bool = false
    @Published var isAdd: Bool = false
    
    @AppStorage("saved_budgets") var saved_budgets: [String] = []
    @AppStorage("saved_budgets") var saved_invs: [String] = []

    
    func getItems() -> [HistoryModel] {
        
        switch isFavs {
            
        case true:
            return budgets.filter{saved_budgets.contains($0.budgetName ?? "")}
        case false:
            return budgets
        }
    }
    
    func getItems2() -> [HistoryModel] {
        
        switch isFavs {
            
        case true:
            return invs.filter{saved_invs.contains($0.invName ?? "")}
        case false:
            return invs
        }
    }
    
    func fetchHistory() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<HistoryModel>(entityName: "HistoryModel")

        do {
            
            let persons = try context.fetch(fetchRequest)
            
            self.budgets = persons
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.budgets = []
        }
    }
    
    func fetchHistory2() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<HistoryModel>(entityName: "HistoryModel")

        do {
            
            let persons = try context.fetch(fetchRequest)
            
            self.invs = persons
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.invs = []
        }
    }
}
