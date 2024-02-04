//
//  ContactFormView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 28/01/2024.
//
import SwiftUI
import SwiftData

/* ContactFormView */
/// View that displays a contact form made by several fields,
/// such as name, surname, email, and a message to be written by the user.
struct ContactFormView<
    ViewModel: ContactFormViewModelProtocol
>: BaseView {
    // MARK: Environment
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @Query private var issues: [Issue]

    @EnvironmentObject var badgeManager: AppAlertBadgeManager

    @StateObject var viewModel: ViewModel

    // MARK: Constants
    /// Default set to 15.
    private let horizontalPadding: CGFloat = 15
    /// Default set to 10.
    private let sectionsTopPadding: CGFloat = 10
    /// Default set to 24.
    private let sectionsVerticalSpacing: CGFloat = 24

    init(viewModel: ViewModel = ContactFormViewModel()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                HStack {
                    title

                    Spacer()

                    saveButton
                }

                sections
                    .padding(.top, sectionsTopPadding)
            }
            .padding(.horizontal, horizontalPadding)
        }
        .alert(
            viewModel.alertMessage,
            isPresented: $viewModel.showAlert) {
                Button("OK", role: .cancel) {
                    dismiss()
                }

                Button("Cancel", role: .destructive) {
                    viewModel.deleteIssue(context: context)
                }
              }
            .onChange(of: issues) { _, newValue in
                badgeManager.setAlertBadge(number: newValue.count)
            }

    }

    var title: some View {
        Text("Contact")
            .font(.largeTitle)
            .bold()
    }

    var saveButton: some View {
        Button {
            viewModel.saveIssue(context: context)
        } label: {
            StylizedSystemImage(
                systemName: "square.and.arrow.down.fill",
                font: .title2,
                primaryStyle: .blue,
                secondaryStyle: .blue,
                tertiaryStyle: .blue
            )
        }
    }

    var sections: some View {
        VStack(spacing: sectionsVerticalSpacing) {
            userNameSection
                .id(1)
            surnameSection
                .id(2)
            emailSection
                .id(3)
            phoneNumerSection
                .id(4)
            inputTextSection
                .id(5)
        }
    }

    private var userNameSection: some View {
        TextFieldSection(
            field: viewModel.model.name,
            inputText: $viewModel.model.name.value,
            isValidationTriggered: viewModel.isValidationTriggered
        )
    }

    private var surnameSection: some View {
        TextFieldSection(
            field: viewModel.model.surname,
            inputText: $viewModel.model.surname.value,
            isValidationTriggered: viewModel.isValidationTriggered
        )
    }

    private var emailSection: some View {
        TextFieldSection(
            field: viewModel.model.email,
            inputText: $viewModel.model.email.value,
            isValidationTriggered: viewModel.isValidationTriggered
        )
    }

    func isValidField<Field: ContactFormField>(_ field: Field) -> Bool {
        return viewModel.isValidationTriggered && field.validateStategy()
    }

    private var phoneNumerSection: some View {
        TextFieldSection(
            field: viewModel.model.phone,
            inputText: $viewModel.model.phone.value,
            isValidationTriggered: viewModel.isValidationTriggered
        )
    }

    private var inputTextSection: some View {
        MultilineTextSection(
            field: viewModel.model.inputText,
            inputText: $viewModel.model.inputText.value,
            isValidationTriggered: viewModel.isValidationTriggered,
            textLimit: viewModel.model.inputText.characterNumberLimit
        )
    }
}

#if DEBUG
struct ContactFormView_Previews: PreviewProvider {
    static var previews: some View {
        ContactFormView()
    }
}
#endif
