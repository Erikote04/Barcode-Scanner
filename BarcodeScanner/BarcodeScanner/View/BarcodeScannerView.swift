//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Erik Sebastian de Erice Jerez on 19/10/24.
//

import SwiftUI

struct BarcodeScannerView: View {
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(barcode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 60)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.textStatus)
                    .font(.largeTitle.bold())
                    .foregroundStyle(viewModel.textColor)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alert in
                Alert(
                    title: Text(alert.title),
                    message: Text(alert.message),
                    dismissButton: alert.dismissButton
                )
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
