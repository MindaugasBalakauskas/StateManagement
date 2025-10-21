//
//  MoreInfoView.swift
//  StateManagement
//
//  Created by M Balakauskas on 21/10/2025.
//

import SwiftUI

struct MoreInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    MoreInfoView()
}
