//
//  CoordinatePoint.swift
//  PoseDetection
//
//  Created by Igboanyika Nnaemeka on 25/10/2025.
//
import Foundation

struct CoordinatePoint: Identifiable {
	let id = UUID()
	let x: Double
	let y: Double
	let timestamp: Date
}
