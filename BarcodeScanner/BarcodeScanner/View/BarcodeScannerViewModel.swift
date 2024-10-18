//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Erik Sebastian de Erice Jerez on 19/10/24.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var textStatus: String {
        scannedCode .isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var textColor: Color {
        scannedCode .isEmpty ? .red : .green
    }
}
