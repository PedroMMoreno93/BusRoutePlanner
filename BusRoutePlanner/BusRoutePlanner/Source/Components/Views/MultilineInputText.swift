//
//  MultilineInputText.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 29/01/2024.
//

import SwiftUI
import Combine

/* MultilineInputText */
/// View component that provides a stilyzed multi-line text input.
struct MultilineInputText: View {
    @FocusState private var focusField: Bool

    // MARK: Variables
    @Binding var inputText: String
    var textLimit: Int?
    var strokeColor: Color = Color.boxStroke
    var backgroundColor: UIColor = .clear

    // MARK: Scalable constants
    /// ScaledMetric(relativeTo: .body) with value of 400
    @ScaledMetric(relativeTo: .body) private var frameHeight = 400

    var body: some View {
        TextEditor(text: $inputText)
            .focused($focusField)
            .scrollContentBackground(.hidden)
            .onAppear {
                UITextView.appearance().backgroundColor = backgroundColor
            }
            .frame(height: frameHeight)
            .onReceive(Just(inputText)) { _ in
                guard let textLimit = textLimit else {
                    return
                }
                limitText(textLimit)
            }
            .toolbar {
                /// This is needed due to a SwiftUI bug that
                /// doesn't allow the user to dismiss the keuboard.
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        UIApplication.shared.sendAction(
                            #selector(UIResponder.resignFirstResponder),
                            to: nil,
                            from: nil,
                            for: nil
                        )
                    }
                }
            }
    }

    func limitText(_ upper: Int) {
        if inputText.count > upper {
            inputText = String(inputText.prefix(upper))
        }
    }
}

#if DEBUG
struct MultilineInputText_Previews: PreviewProvider {
    static var previews: some View {
        MultilineInputText(inputText: .constant("Message"))
    }
}
#endif
