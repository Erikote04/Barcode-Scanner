//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Erik Sebastian de Erice Jerez on 19/10/24.
//

import SwiftUI

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
