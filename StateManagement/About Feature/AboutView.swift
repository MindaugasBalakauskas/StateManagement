//
//  AboutView.swift
//  StateManagement
//
//  Created by M Balakauskas on 21/10/2025.
//

import SwiftUI

struct AboutView: View {
    @State var isMoreInfoPresented: Bool = false
    var body: some View {
        VStack {
            Text("This app was made during \na my learning journey.🧑‍🎓")
                .multilineTextAlignment(.center)
                .padding()
            Button("More info?") {
                isMoreInfoPresented = true
            }
        }
        .sheet(isPresented: $isMoreInfoPresented) {
            MoreInfoView()
        }
    }
}
#Preview {
    AboutView()
}
