//
//  TaskInsertView.swift
//  SQLiteExample
//
//  Created by Amisha I on 26/07/22.
//

import SwiftUI

struct TaskInsertView: View {

    @ObservedObject var viewModel: TaskInsertViewModel

    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("Task Name : ")
                TextField("Task Name", text: $viewModel.taskName)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()

            HStack(spacing: 20) {
                Text("Start Date  :")
                DatePicker("", selection: $viewModel.startDate)
                Spacer()
            }
            .padding()

            HStack {
                Button(action: {
                    viewModel.onAddButtonClick()
                }) {
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                }
                .background(.blue)
                .cornerRadius(.infinity)
                .padding()
            }
            Spacer()
        }
    }
}
