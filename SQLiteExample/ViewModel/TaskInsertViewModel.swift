//
//  TaskInsertViewModel.swift
//  SQLiteExample
//
//  Created by Amisha I on 26/07/22.
//

import UIPilot
import Foundation

class TaskInsertViewModel: ObservableObject {

    @Published var taskName: String = ""
    @Published var startDate: Date = Date()

    private let appPilot: UIPilot<AppRoute>

    init(pilot: UIPilot<AppRoute>) {
        self.appPilot = pilot
    }

    func onAddButtonClick() {
        if taskName != "" {
            let id = TaskDataStore.shared.insert(name: taskName, date: startDate)
            if id != nil {
                appPilot.pop()
            }
        }
    }
}
