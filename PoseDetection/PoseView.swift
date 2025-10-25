//
//  PoseData.swift
//  PoseDetection
//
//  Created by Igboanyika Nnaemeka on 25/10/2025.
//

import SwiftUI

struct PoseView: View {
	// Normally would be in a viewModel
	@Binding var isTracking: Bool
	@State private var points: [CoordinatePoint] = []
	@State private var timer: Timer?
	@State private var showNewDataIndicator = false
	
	var body: some View {
		VStack {
			Text("Real-time Pose Tracker")
				.font(.title)
				.fontWeight(.bold)
			
			ZStack {				
				HStack {
					Circle()
						.fill(showNewDataIndicator ? Color.green : Color.gray.opacity(0.3))
						.frame(width: 12, height: 12)
						.animation(.easeInOut(duration: 0.3), value: showNewDataIndicator)
					
					Text(showNewDataIndicator ? "New Data Received" : "Waiting...")
						.font(.subheadline)
						.foregroundColor(showNewDataIndicator ? .green : .gray)
				}
				.padding(.vertical, 8)
				
				VStack(alignment: .leading, spacing: 10) {
					Text("Recent Points (\(points.count)/10)")
						.font(.headline)
						.padding(.horizontal)
					
					if points.isEmpty {
						Text("No data yet. Press Start to begin tracking.")
							.foregroundColor(.gray)
							.italic()
							.frame(maxWidth: .infinity)
							.padding()
					} else {
						ScrollView {
							VStack(spacing: 8) {
								ForEach(points) { point in
									HStack {
										VStack(alignment: .leading, spacing: 4) {
											HStack {
												Text("X:")
													.fontWeight(.semibold)
													.foregroundColor(.blue)
												Text(String(format: "%.2f", point.x))
													.fontWeight(.medium)
											}
											
											HStack {
												Text("Y:")
													.fontWeight(.semibold)
													.foregroundColor(.orange)
												Text(String(format: "%.2f", point.y))
													.fontWeight(.medium)
											}
										}
										
										Spacer()
										
										Text(timeString(from: point.timestamp))
											.font(.caption)
											.foregroundColor(.gray)
									}
									.padding()
									.background(Color.gray.opacity(0.1))
									.cornerRadius(8)
								}
							}
							.padding(.horizontal)
						}
					}
				}
			}
		}.onChange(of: isTracking) { oldValue, newValue in
			if newValue {
				startTracking()
			} else {
				stopTracking()
			}
		}
	}
	
	private func startTracking() {
		timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
			addNewPoint()
		}
	}
	
	private func stopTracking() {
		timer?.invalidate()
		timer = nil
	}
	
	private func addNewPoint() {
		let newPoint = CoordinatePoint(
			x: Double.random(in: 0...100),
			y: Double.random(in: 0...100),
			timestamp: Date()
		)
		
		points.insert(newPoint, at: 0)
		
		if points.count > 10 {
			points.removeLast()
		}
		
		showNewDataIndicator = true
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
			showNewDataIndicator = false
		}
	}
	
	private func timeString(from date: Date) -> String {
		let formatter = DateFormatter()
		formatter.timeStyle = .medium
		return formatter.string(from: date)
	}
}


#Preview {
	PoseView(
		isTracking: Binding.constant(true)
	)
}
