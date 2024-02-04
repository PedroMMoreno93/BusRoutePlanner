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
    /// ScaledMetric(relativeTo: .body) with value of 2.
    @ScaledMetric(relativeTo: .body) private var strokeWidth = 2
    /// ScaledMetric(relativeTo: .body) with value of 10.
    @ScaledMetric(relativeTo: .body) private var cornerRadius = 10
    /// ScaledMetric(relativeTo: .body) with value of 20.
    @ScaledMetric(relativeTo: .body) private var horizontalPadding = 20
    /// ScaledMetric(relativeTo: .body) with value of 12.
    @ScaledMetric(relativeTo: .body) private var verticalSpacing = 12
    /// ScaledMetric(relativeTo: .body) with value of 12.
    @ScaledMetric(relativeTo: .body) private var verticalPadding = 12

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

    var warning: some View {
        Text(warningMessage)
            .font(.caption)
            .foregroundStyle(.red)
    }

    @ViewBuilder
    var background: some View {
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
            ContactFormSectionView(sectionTitle: "Name", placeholder: "Name", isMandatory: true, shouldShowWarning: true) {
                Text("Jack")
            }
            
            
            ContactFormSectionView(sectionTitle: "Text", placeholder: "Text", isMandatory: true, shouldShowWarning: true) {
                MultilineInputText(inputText: .constant("Message"))
            }
        }
    }
}
#endif
