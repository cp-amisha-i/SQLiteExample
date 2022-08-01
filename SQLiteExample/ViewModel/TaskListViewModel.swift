//
//  TaskListViewModel.swift
//  SQLiteExample
//
//  Created by Amisha I on 26/07/22.
//

import Foundation
import UIPilot

class TaskListViewModel: ObservableObject {

    @Published var allTask: [Task] = []
    let appPilot: UIPilot<AppRoute>

    init(pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
    }

    func onAddButtonClick() {
        appPilot.push(.Insert)
    }

    func getTaskList() {
        allTask = TaskDataStore.shared.getAllTasks()
    }

    func deleteTask(at indexSet: IndexSet) {
        let id = indexSet.map { self.allTask[$0].id }.first
        if let id = id {
            let delete = TaskDataStore.shared.delete(id: id)
            if delete {
                getTaskList()
            }
        }
    }
}
