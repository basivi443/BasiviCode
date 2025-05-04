//
//  Trailer.swift
//  Netflix
//
//  Created by Rama Basivi Reddy   on 01/05/25.
//
import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}

