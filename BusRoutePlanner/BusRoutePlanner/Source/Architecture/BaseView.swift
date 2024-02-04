//
//  BaseView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI

/* BaseView */
/// Protocol that defines a base view that uses a BaseViewModel.
/// For further info, please check ARCHITECTURE.md.
protocol BaseView: View {
    associatedtype ViewModel: BaseViewModel
    var viewModel: ViewModel { get }
}
