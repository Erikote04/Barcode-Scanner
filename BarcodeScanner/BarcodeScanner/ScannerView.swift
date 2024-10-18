//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Erik Sebastian de Erice Jerez on 19/10/24.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var barcode: String
    @Binding var alertItem: AlertItem?
    
    func makeUIViewController(context: Context) -> ScannerViewController {
        ScannerViewController(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {
        
    }
}

extension ScannerView {
    final class Coordinator: NSObject, ScannerViewControllerDelegate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.barcode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
}
