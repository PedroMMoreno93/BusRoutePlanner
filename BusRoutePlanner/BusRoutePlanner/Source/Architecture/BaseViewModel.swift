//
//  BaseViewModel.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 21/01/2024.
//

import Foundation

protocol BaseViewModel: ObservableObject {
    associatedtype ModelView: BaseModelView

    var model: ModelView { get set }
}
