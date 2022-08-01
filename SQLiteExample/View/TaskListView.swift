//
//  TaskListView.swift
//  SQLiteExample
//
//  Created by Amisha I on 26/07/22.
//

import SwiftUI

struct TaskListView: View {

    @ObservedObject var viewModel: TaskListViewModel

    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                Text("Welcome !!!")
                    .font(.title.bold())

                if viewModel.allTask.isEmpty {
                    Text("You have no task.")
                } else {
                    List {
                        ForEach(viewModel.allTask, id: \.id) { task in
                            Text(task.name)
                                .onTapGesture {
                                    viewModel.appPilot.push(.Detail(id: task.id))
                                }
                        }
                        .onDelete(perform: viewModel.deleteTask(at:))
                    }
                    .listStyle(.plain)
                    .onAppear {
                        UITableView.appearance().backgroundColor = .clear
                        UITableViewCell.appearance().selectionStyle = .none
                        UITableView.appearance().showsVerticalScrollIndicator = false
                    }
                }
            }

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.onAddButtonClick()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                            .padding(20)
                    }
                    .background(.blue)
                    .cornerRadius(.infinity)
                    .padding()
                }
            }
        }
        .onAppear {
            viewModel.getTaskList()
        }
        .navigationBarHidden(true)
    }
}
