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
    /// Default value set to Colors.secondaryColor.
    var backgroundColor: Color = Colors.secondaryBackgroundColor

    // MARK: Scalable constants
    /// ScaledMetric(relativeTo: .body) with value of DesignSystem.Radius.cornerRadius.
    @ScaledMetric(relativeTo: .body) private var cornerRadius = DesignGuide.Radius.cornerRadius
    /// ScaledMetric(relativeTo: .body) with value of DesignSystem.Basics.titleVerticalPadding.
    @ScaledMetric(relativeTo: .body) private var titlePadding = DesignGuide.Basics.titleVerticalPadding

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

    private var title: some View {
        Text(field.key.capitalized)
            .font(.title3)
            .bold()
            .padding(titlePadding)
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundStyle(backgroundColor)
            }
    }

    private var value: some View {
        Text(field.valueString.capitalized)
            .font(.body)
    }
}

#Preview {
    IssueManagementField(field: NameField(value: "Jack"), layout: .horizontal)
}
