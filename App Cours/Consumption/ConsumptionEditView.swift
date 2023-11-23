//
//  ConsumptionEditView.swift
//  App Cours
//
//  Created by Axel Blanchard on 23/11/2023.
//

import SwiftUI

struct ConsumptionEditView: View {
    @ObservedObject var consumptionListViewModel: ConsumptionListViewModel
    var consumption: Consumption

    @State private var editedQuantity: String = ""

    var body: some View {
        Form {
            Section {
                TextField("Quantity", text: $editedQuantity)
                    .keyboardType(.decimalPad)
            }

            Section {
                Button("Save") {
                    saveEditedConsumption()
                }
            }
        }
        .onAppear {
            // Set initial values when the view appears
            editedQuantity = "\(consumption.quantity)"
        }
        .navigationTitle("Edit Consumption")
    }

    private func saveEditedConsumption() {
        guard let editedQuantityFloat = Float(editedQuantity) else {
            // Handle validation or show an alert if needed
            return
        }

        var editedConsumption = consumption
        editedConsumption.quantity = editedQuantityFloat
        consumptionListViewModel.updateConsumption(editedConsumption)
    }
}
