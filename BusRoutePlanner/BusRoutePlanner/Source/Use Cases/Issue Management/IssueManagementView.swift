//
//  IssueManagementView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 31/01/2024.
//

import SwiftUI
import SwiftData

struct IssueManagementView: View {
    @Environment(\.modelContext) private var context
    @Query private var issues: [Issue]

    var body: some View {
        //        ScrollView(.vertical, showsIndicators: true) {
        VStack {
            HStack {
                title

                Spacer()
                Text("\(issues.count)")
            }

            issueList
        }
        .padding(.horizontal, 20)
//    }

    }
    /*
     VStack {
         Text("Issues")
         issueList
     }
     */
    var title: some View {
        Text("Issues")
            .font(.largeTitle)
            .bold()
    }

    var issueList: some View {
        List {
            ForEach(issues) { issue in
                NavigationLink {
                    // TODO: nav to Detail
                } label: {
                    Section {
                        Text("Issue form \(issue.issuedDate.stringFromDate(format: "dd/MM/yy"))")
                    }
                }
            }
            .onDelete { indexSet in
                for index in indexSet {
                    context.delete(issues[index])
                }
            }
//            .background {
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.boxStroke, lineWidth: 2)
//            }
        }
    }
}

// swiftlint:disable force_try
#if DEBUG
struct IssueManagementView_Previews: PreviewProvider {

    static var previews: some View {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Issue.self, configurations: config)

        container.mainContext.insert(Issue.mock)

        return IssueManagementView()
            .modelContainer(container)
    }
}
#endif
// swiftlint:enable force_try
