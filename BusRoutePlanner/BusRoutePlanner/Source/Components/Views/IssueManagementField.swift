//
//  IssueManagementField.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 02/02/2024.
//

import SwiftUI

/* IssueManagementField */
/// View component that displays a generic issue field.
struct IssueManagementField: View {
    // MARK: Variables
    let field: any ContactFormField
    var layout: LayoutTypes

    enum LayoutTypes {
        case horizontal
        case vertical
    }

    var body: some View {
        switch layout {
        case .horizontal:
            HStack {
                title
                value
            }

        case .vertical:
            VStack(alignment: .leading) {
                title
                value
            }
        }
    }

    var title: some View {
        Text(field.key.capitalized)
            .font(.title3)
            .bold()
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.gray.opacity(0.6))
            }
    }

    var value: some View {
        Text(field.valueString.capitalized)
            .font(.body)
    }
}

#Preview {
    IssueManagementField(field: NameField(value: "Jack"), layout: .horizontal)
}
