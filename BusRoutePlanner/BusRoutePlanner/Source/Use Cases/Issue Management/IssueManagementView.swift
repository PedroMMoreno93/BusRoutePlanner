//
//  IssueManagementView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 31/01/2024.
//

import SwiftUI
import SwiftData
/* IssueManagementView */
/// View that displays a list of issues, that can be deleted
/// and clicked to see the detail.
struct IssueManagementView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var badgeManager: AppAlertBadgeManager

    // MARK: Variables
    @Query private var issues: [Issue]

    // MARK: Constants
    private let horizontalPadding: CGFloat = DesignGuide.List.horizontalPadding

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                title

                Spacer()
                Text("\(issues.count)")
            }

            issueList
        }
        .padding(.horizontal, horizontalPadding)
    }

    private var title: some View {
        Text(LocalizedKeys.IssueManagement.issueListTitle)
            .font(.largeTitle)
            .bold()
    }

    private var issueList: some View {
        List {
            ForEach(issues) { issue in
                NavigationLink {
                    IssueDetailView(model: issue)
                } label: {
                    HStack {
                        Image.Icons.issueListRowIcon
                        Text(LocalizedKeys.IssueManagement.issueTitleLabel.stringValue() +
                             "\(issue.issuedDate.stringFromDate(format: "dd/MM/yy hh:mm"))")
                    }
                }
            }
            .onDelete { indexSet in
                for index in indexSet {
                    context.delete(issues[index])
                    badgeManager.setAlertBadge(number: issues.count)
                }
            }
        }
        .listRowSpacing(0)
        .listStyle(.grouped)
    }
}

// swiftlint:disable force_try
#if DEBUG
struct IssueManagementView_Previews: PreviewProvider {
    static var previews: some View {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Issue.self, configurations: config)
        container.mainContext.insert(Issue.mock)
        return NavigationView {
            IssueManagementView()
                .modelContainer(container)
        }
    }
}
#endif
// swiftlint:enable force_try
