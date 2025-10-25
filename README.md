# Real-time Pose Tracker

## Approach

- **SwiftUI with @State** for reactive UI updates
- **Timer-based generation** (500ms intervals) to simulate real-time pose data
- **FIFO queue** - newest points inserted at index 0, oldest removed when count > 10
- **Visual feedback** - green indicator flashes briefly on new data arrival

## Assumptions

- 2D coordinates (x, y) in range 0-100 are sufficient for demonstration
- 10 points provide adequate context without cluttering UI
- 500ms update interval balances visibility with performance
- No persistence needed - data resets on app restart
- Random generation is acceptable placeholder for actual pose detection

## Usage

Press "Start Tracking" to begin data flow. Press "Stop Tracking" to pause.

Replace `addNewPoint()` with real pose detection data to use in production.

## Requirements

iOS 15.0+, SwiftUI, no external dependencies.
