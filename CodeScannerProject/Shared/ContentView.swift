//
//  ContentView.swift
//  Shared
//
//  Created by 仝华帅 on 2021/5/8.
//

import SwiftUI

struct ContentView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = ""
    @State var scanning = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                NextView(scannedCode: scannedCode)
                
                Button(action: {
                    self.isPresentingScanner = true
                }) {
                    Image(systemName: "barcode.viewfinder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                }
                .sheet(isPresented: $isPresentingScanner) {
                    self.scannerSheet
                }
                
                Text("Scan a QR code to begin")
            }
            
        }
    }
    
    var scannerSheet : some View {
        ZStack {
            VStack {
                CodeScannerView(
                    codeTypes: [.ean13, .qr],
                    completion: { result in
                        if case let .success(code) = result {
                            self.scannedCode = code
                            self.isPresentingScanner = false
                        }
                    }
                )
                .frame(height: 400)
                .frame(maxWidth: .infinity)
                Text("请扫描药品码")
                    .font(.title2)
                    .padding(.vertical, 15)
                
                
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "barcode")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                            .foregroundColor(.secondary)
                        Spacer()
                        Image(systemName: "qrcode")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    .padding(15)
                    Text("支持 13 位条形码和二维码")
                        .font(.body)
                        .padding(.vertical, 15)
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.scanning = true
                }
            })
            .onDisappear(perform: {
                self.scanning = false
            })
            
            VStack {
                VStack {
                    Rectangle()
                        .frame(height: 6)
                        .foregroundColor(.green.opacity(0.3))
                        .animation(
                            .linear(duration: 1.5)
                                .repeatForever()
                        )
                        .offset(y: self.scanning && self.isPresentingScanner ? -150 : 150)
                }
                .frame(height: 400)
                .frame(maxWidth: .infinity)
                Spacer()
            }
        }
    }
}

struct NextView: View {
    var scannedCode: String
    
    var body: some View {
        VStack {
            Text(scannedCode).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
