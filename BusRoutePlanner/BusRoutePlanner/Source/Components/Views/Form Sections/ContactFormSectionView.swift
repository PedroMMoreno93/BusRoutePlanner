//
//  ContactFormSectionView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import SwiftUI

/* ContactFormSectionView */
/// View component that provides a stilyzed 
/// generic contact form section.
struct ContactFormSectionView<
    SectionContent: View
>: View {
    // MARK: Variables
    var sectionTitle: String
    var placeholder: String
    var isMandatory: Bool
    var shouldShowWarning: Bool
    var warningMessage: String = "Required"
    /// Default set to true.
    var showBoxStroke: Bool = true
    @ViewBuilder var sectionContent: SectionContent

    // MARK: Scalable constants
    /// ScaledMetric(relativeTo: .body) with value of DesignSystem.Card.strokeWidth.
    @ScaledMetric(relativeTo: .body) private var strokeWidth = DesignGuide.Card.strokeWidth
    /// ScaledMetric(relativeTo: .body) with value of DesignSystem.Radius.cornerRadius.
    @ScaledMetric(relativeTo: .body) private var cornerRadius = DesignGuide.Radius.cornerRadius
    /// ScaledMetric(relativeTo: .body) with value of DesignSystem.List.horizontalPadding.
    @ScaledMetric(relativeTo: .body) private var horizontalPadding = DesignGuide.List.horizontalPadding
    /// ScaledMetric(relativeTo: .body) with value of DesignSystem.List.verticalSpacing.
    @ScaledMetric(relativeTo: .body) private var verticalSpacing = DesignGuide.List.verticalSpacing
    /// ScaledMetric(relativeTo: .body) with value of DesignSystem.List.verticalPadding.
    @ScaledMetric(relativeTo: .body) private var verticalPadding = DesignGuide.List.verticalPadding

    // MARK: Computed properties
    private var sectionTitleText: String {
        return isMandatory ? sectionTitle + "*" : sectionTitle
    }

    var body: some View {
        VStack(alignment: .leading, spacing: verticalSpacing) {
            HStack {
                Text(sectionTitleText)
                    .bold()

                Spacer()

                if shouldShowWarning {
                    warning
                }
            }

            sectionContent
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical, verticalPadding)
                .background(content: {
                    background
                })
                .onAppear(perform: {
                    UITextView.appearance().backgroundColor = .clear
                })
        }
    }

    private var warning: some View {
        Text(warningMessage)
            .font(.caption)
            .foregroundStyle(.red)
    }

    @ViewBuilder
    private var background: some View {
        if showBoxStroke {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.boxStroke, lineWidth: strokeWidth)
        } else {
            EmptyView()
        }
    }
}

#if DEBUG
struct ContactFormSectionView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ContactFormSectionView(
                sectionTitle: "Name",
                placeholder: "Name",
                isMandatory: true,
                shouldShowWarning: true
            ) {
                Text("Jack")
            }

            ContactFormSectionView(
                sectionTitle: "Text",
                placeholder: "Text",
                isMandatory: true,
                shouldShowWarning: true
            ) {
                MultilineInputText(inputText: .constant("Message"))
            }
        }
    }
}
#endif
