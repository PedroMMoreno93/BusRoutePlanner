//
//  IssueDetailView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 02/02/2024.
//

import SwiftUI
import SwiftData

/* IssueDetailView */
/// View that displays the detailed info of an issue.
struct IssueDetailView: View {
    // MARK: Variables
    var model: Issue = Issue(contactForm: .mock)

    // MARK: Constants
    /// Default value set to 10.
    private let verticalSpacing: CGFloat = DesignGuide.List.verticalSpacing
    /// Default value set to 10.
    private let titleVerticalPadding: CGFloat = DesignGuide.Basics.titleVerticalPadding

    var body: some View {
        VStack(alignment: .leading, spacing: verticalSpacing) {
            Text(Texts.IssueManagement.issueTitleLabel +
                 "\(model.issuedDate.stringFromDate(format: "dd/MM/yy hh:mm"))")
            .bold()
            .font(.title2)
            .frame(maxWidth: .infinity)
            .padding(.vertical, titleVerticalPadding)

            fields
        }
    }

    private var fields: some View {
        List {
            ForEach(model.contactForm.allFields, id: \.id) { field in
                IssueManagementField(
                    field: field,
                    layout: ((field as? MultilineTextField) != nil) ? .vertical : .horizontal
                )
                .multilineTextAlignment(.leading)
            }
        }
        .listStyle(.grouped)
    }
}

// swiftlint:disable force_try
#if DEBUG
struct IssueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Issue.self, configurations: config)

        container.mainContext.insert(Issue.mock)

        return IssueDetailView()
            .modelContainer(container)
    }
}
#endif
// swiftlint:enable force_try
