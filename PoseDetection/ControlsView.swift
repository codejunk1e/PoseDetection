//
//  Controls.swift
//  PoseDetection
//
//  Created by Igboanyika Nnaemeka on 25/10/2025.
//

import SwiftUI

struct ControlsView: View {
	
	@Binding var isTracking: Bool
	
	
	var body: some View {
		HStack {
			Button(action: {
				isTracking = !isTracking
			}, label: {
				let buttonImage = isTracking  ? "pause.circle.fill" : "play.circle.fill"
				
				Image(systemName: buttonImage)
					.font(.system(size: 60))
					.foregroundColor(.green)
			})
		}
	}
}

#Preview {
	ControlsView(
		isTracking: Binding.constant(true)
	)
}
