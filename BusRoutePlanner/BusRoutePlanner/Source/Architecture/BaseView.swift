//
//  BaseView.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import SwiftUI

protocol BaseView: View {
    associatedtype ViewModel: BaseViewModel
    var viewModel: ViewModel { get }
}
