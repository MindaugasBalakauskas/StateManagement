//
//  Binding+Extension.swift
//  StateManagement
//
//  Created by M Balakauskas on 14/10/2025.
//

import SwiftUI

extension Binding {
    
    func onNewValue(_ sideEffect: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: {wrappedValue},
            set: {wrappedValue = $0
                sideEffect()}
        )
    }
}

