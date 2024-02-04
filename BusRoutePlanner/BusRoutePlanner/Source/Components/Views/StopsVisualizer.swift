//
//  StopsVisualizer.swift
//  BusRoutePlanner
//
//  Created by Pedro Moreno on 28/01/2024.
//

import SwiftUI
/* StopsVisualizer */
/// View to show a trip's stops.
/// - Parameter model: TripModelView
struct StopsVisualizer: View {
    // MARK: Variables
    var model: TripModelView = .prewviewMock1
    /// Value between 0 - 1. Default set to 0.4.
    var circleInnerWidthRatio: CGFloat = 0.4
    /// Value between 0 - 1. Default set to 0.3.
    var lineWidthRatio: CGFloat = 0.3
    /// Default set to .background.
    var circleInnerColor: Color = .systemBackground

    // MARK: Scalable constants
    /// ScaledMetric(relativeTo: .body) with value of DesignSystem.Stops.circleWidth
    @ScaledMetric(relativeTo: .body) private var circleWidth = DesignGuide.Stops.circleWidth
    /// ScaledMetric(relativeTo: .body) with value of DesignSystem.Stops.lineLength
    @ScaledMetric(relativeTo: .body) private var lineLength = DesignGuide.Stops.lineLength

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.model.stops, id: \.id) { stop in
                    HStack {
                        circle()
                        getDistanceToOriginLabel(from: stop)
                    }

                    if !model.isLastStop(stop) {
                        rectangle()
                            .frame(width: circleWidth)
                    }
                }
            }
        }
    }

    private func getDistanceToOriginLabel(
        from stop: StopModelView
    ) -> some View {
        let distanceString = stop.distanceToOriginString
        let textLabel = distanceString + " away from origin"
        return Text(textLabel)
            .font(.body)
    }

    private func circle() -> some View {
        Circle()
            .fill(model.status.color)
            .overlay {
                Circle()
                    .fill(circleInnerColor)
                    .frame(width: circleWidth * circleInnerWidthRatio)
            }
            .frame(width: circleWidth)
    }

    private func rectangle() -> some View {
        Rectangle()
            .fill(model.status.color)
            .frame(width: circleWidth * lineWidthRatio, height: lineLength)
    }
}

#if DEBUG
struct StopsVisualizer_Previews: PreviewProvider {
    static var previews: some View {
        StopsVisualizer()
    }
}
#endif
