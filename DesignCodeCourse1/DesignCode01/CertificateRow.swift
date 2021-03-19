//
//  CertificateRow.swift
//  DesignCode01
//
//  Created by 仝华帅 on 2021/3/15.
//

import SwiftUI

struct CertificateRow: View {
    var certificates = certificateData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Certificates")
                .font(.system(size: 20))
                .fontWeight(.heavy)
                .padding(.leading, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(certificates) {item in
                        CertificateView(item: item)
                    }
                }
                .padding(20)
                .padding(.leading, 10)
            }
        }
        
        
        
    }
}

struct CertificateRow_Previews: PreviewProvider {
    static var previews: some View {
        CertificateRow()
    }
}


struct Certificate: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var width: CGFloat
    var height: CGFloat
}

let certificateData = [
    Certificate(title: "OC", image: "Certificate1", width: 230, height: 150),
    Certificate(title: "Swift", image: "Certificate2", width: 230, height: 150),
    Certificate(title: "Java", image: "Certificate3", width: 230, height: 150),
    Certificate(title: "GO", image: "Certificate4", width: 230, height: 150),
]
