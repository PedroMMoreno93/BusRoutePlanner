//
//  StopsVisualizer.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 28/01/2024.
//

import SwiftUI
// TODO:
struct StopsVisualizer: View {
    var model: TripModelView = .prewviewMock1

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(self.model.stops, id: \.id) { stop in
                HStack {
                    circle()
                    getDistanceToOriginLabel(from: stop)
                }

                if !model.isLastStop(stop) {
                    rectangle()
                        .frame(width: 30)
                }
            }
        }
    }

    private func getDistanceToOriginLabel(
        from stop: StopModelView
    ) -> some View {
        let distance = self.model.getDistanceToOrigin(from: stop.location)
        let distanceString = String(format: "%.2f", distance)
        let textLabel = distanceString + " Km away from origin"
        return Text(textLabel)
    }

    private func circle() -> some View {
        Circle()
            .fill(model.status.color)
            .overlay {
                Circle()
                    .fill(.background)
                    .frame(width: 12)
            }
            .frame(width: 30)
    }

    private func rectangle() -> some View {
        Rectangle()
            .fill(model.status.color)
            .frame(width: 8, height: 40)
    }
}

#Preview {
    StopsVisualizer()
}