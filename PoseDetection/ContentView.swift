//
//  ContentView.swift
//  PoseDetection
//
//  Created by Igboanyika Nnaemeka on 25/10/2025.
//

import SwiftUI

struct ContentView: View {
	// Normally would be in a viewModel
	@State private var isTracking = false
	
    var body: some View {
		VStack {
			PoseView(isTracking: $isTracking)
			Spacer()
			ControlsView(isTracking: $isTracking)
		}
    }
}

#Preview {
    ContentView()
}
