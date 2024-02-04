//
//  BaseViewModel.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import Foundation

/* BaseViewModel */
/// Protocol that defines a base view model that uses a BaseModelView and is implemented by the BaseView.
/// For further info, please check ARCHITECTURE.md.
///
/// - Parameters:
///     - model: BaseModelView.
///     - isSheetPesented: Bool.
///     - status: ViewModelStatus.
///     - showAlert: Bool.
protocol BaseViewModel: ObservableObject {
    associatedtype ModelView: BaseModelView

    var model: ModelView { get set }
    var isSheetPresented: Bool { get set }
    var status: ViewModelStatus { get set }
    var showAlert: Bool { get set }
    var alertMessage: String { get set }
}

/* ViewModelStatus */
/// Enum that defines the BaseViewModel possible states:
/// - empty
/// - loading
/// - success
/// - error
enum ViewModelStatus {
    case empty
    case loading
    case success
    case error
}
