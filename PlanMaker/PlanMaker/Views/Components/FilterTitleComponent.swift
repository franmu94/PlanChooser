//
//  FilterTitle.swift
//  PlanMaker
//
//  Created by Fran Malo on 6/10/24.
//

import SwiftUI

struct FilterTitleComponent: View {
    
    let title: String
    var isEmpty: Bool = true
    var Xaction: () -> Void
    var PanelAction: () -> Void
    
    
    var body: some View {
        
        Button {
            PanelAction()
        } label: {
            Text(title)
                .font(.system(size: 22, weight: .regular, design: .rounded))
                .frame(maxWidth: 200)
                .multilineTextAlignment(.center)
            //.padding(20)
                .padding(.horizontal, 40)
                .padding(.vertical, 8)
                .background() {
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(lineWidth: 2)
                        .padding(2)
                    
                }
        }
        .buttonStyle(PlainButtonStyle())
        .overlay(alignment: .leading) {
            Button {
                Xaction()
            } label: {
                Image(systemName: "x.circle")
                    .opacity(isEmpty ? 0 : 1)
                    .padding(10)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    FilterTitleComponent(title: "Activities", isEmpty: true, Xaction: {}) {}
}
