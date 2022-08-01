//
//  TaskDetailView.swift
//  SQLiteExample
//
//  Created by Amisha I on 26/07/22.
//

import SwiftUI

struct TaskDetailView: View {

    @ObservedObject var viewModel: TaskDetailViewModel
    var status = ["Completed", "Incomplete"]

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Text("Task Name : ")
                TextField("Task Name", text: $viewModel.taskName)
                    .textFieldStyle(.roundedBorder)
            }

            HStack(spacing: 20) {
                Text("Approx Date :")
                DatePicker("", selection: $viewModel.approxDate)
                Spacer()
            }

            HStack {
                Text("Status        :   ")
                Picker("What is your favorite color?", selection: $viewModel.status) {
                    ForEach(status, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                Spacer()
            }

            HStack {
                Button(action: {
                    viewModel.onUpdateClick()
                }) {
                    Text("Update")
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
        .padding(.horizontal)
    }
}
