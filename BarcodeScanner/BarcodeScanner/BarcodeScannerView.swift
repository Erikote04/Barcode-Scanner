//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Erik Sebastian de Erice Jerez on 19/10/24.
//

import SwiftUI

struct BarcodeScannerView: View {
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(barcode: $scannedCode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 60)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(scannedCode .isEmpty ? "Not Yet Scanned" : scannedCode )
                    .font(.largeTitle.bold())
                    .foregroundStyle(scannedCode .isEmpty ? .red : .green)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $alertItem) { alert in
                Alert(
                    title: Text(alert.title),
                    message: Text(alert.message),
                    dismissButton: alert.dismissButton
                )
            }
        }
    }
}

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(
        title: "Invalid Device Input",
        message: "Something is wrong with the camera. We are enable to capture the input.",
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidScannedType = AlertItem(
        title: "Invalid Scan Type",
        message: "The scanned value is invalid. This app scans EAN-8 and EAN-13 barcodes.",
        dismissButton: .default(Text("OK"))
    )
}

#Preview {
    BarcodeScannerView()
}
