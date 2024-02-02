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

    var body: some View {
        TextEditor(text: $inputText)
            .focused($focusField)
            .scrollContentBackground(.hidden)
            .onAppear {
                UITextView.appearance().backgroundColor = .clear
            }
            .background(content: {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.boxStroke, lineWidth: 2)
            })
            .frame(height: 400)
            .onReceive(Just(inputText)) { _ in
                guard let textLimit = textLimit else {
                    return
                }
                limitText(textLimit)
            }
            .toolbar {
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
