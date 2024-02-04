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
    /// Default value se to .gray.opacity(0.6)
    var backgroundColor: Color = .gray.opacity(0.6)

    // MARK: Scalable constants
    /// ScaledMetric(relativeTo: .body) with value of 10
    @ScaledMetric(relativeTo: .body) private var cornerRadius = 10
    /// ScaledMetric(relativeTo: .body) with value of 8
    @ScaledMetric(relativeTo: .body) private var titlePadding = 8

    /// Layout variants definitio
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
            .padding(titlePadding)
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundStyle(backgroundColor)
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
