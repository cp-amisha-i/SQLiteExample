//
//  TaskDetailViewModel.swift
//  SQLiteExample
//
//  Created by Amisha I on 26/07/22.
//

import UIPilot
import Foundation

class TaskDetailViewModel: ObservableObject {

    var id: Int64
    var task: Task?

    @Published var taskName: String = ""
    @Published var approxDate: Date = Date()
    @Published var status: String = "Incomplete"

    private let appPilot: UIPilot<AppRoute>

    init(id: Int64, pilot: UIPilot<AppRoute>) {
        self.id = id
        self.appPilot = pilot
        getTask()
    }

    func getTask() {
        task = TaskDataStore.shared.findTask(taskId: id)
        taskName = task?.name ?? ""
        approxDate = task?.date ?? Date()
        status = task!.status ? "Completed" : "Incomplete"
    }

    func onUpdateClick() {
        let statusUpdated = TaskDataStore.shared.update(id: id, name: taskName, date: approxDate, status: status == "Completed")
        if statusUpdated {
            appPilot.pop()
        }
    }
}
