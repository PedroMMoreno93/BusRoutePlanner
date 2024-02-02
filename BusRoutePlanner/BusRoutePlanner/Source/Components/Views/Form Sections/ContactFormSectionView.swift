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
    var warningMessage: String = "Required Field"
    var showBoxStroke: Bool = true
    var cornerRadius: CGFloat = 10
    var strokeWidth: CGFloat = 2
    var horizontalPadding: CGFloat = 20
    var verticalSpacing: CGFloat = 12
    var verticalPadding: CGFloat = 12

    @ViewBuilder var sectionContent: SectionContent

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
        ContactFormSectionView(sectionTitle: "Name", placeholder: "Name", isMandatory: true, shouldShowWarning: true) {
            Text("Name")
        }
    }
}
#endif
