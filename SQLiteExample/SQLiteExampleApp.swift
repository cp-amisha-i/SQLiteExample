//
//  SQLiteExampleApp.swift
//  SQLiteExample
//
//  Created by Amisha I on 26/07/22.
//

import UIPilot
import SwiftUI

@main
struct SQLiteExampleApp: App {

    private let pilot: UIPilot<AppRoute>

    init() {
        pilot = .init(initial: .List)
    }

    var body: some Scene {
        WindowGroup {
            UIPilotHost(pilot) { route in
                switch route {
                case .List:
                    return AnyView(
                        TaskListView(viewModel: TaskListViewModel(pilot: pilot))
                    )
                case .Insert:
                    return AnyView(
                        TaskInsertView(viewModel: TaskInsertViewModel(pilot: pilot))
                    )
                case .Detail(let id):
                    return AnyView(
                        TaskDetailView(viewModel: TaskDetailViewModel(id: id, pilot: pilot))
                    )
                }
            }
            .onAppear {
                TaskDataStore.shared.createTable()
            }
        }
    }
}


enum AppRoute: Equatable {
    case List
    case Insert
    case Detail(id: Int64)
}
