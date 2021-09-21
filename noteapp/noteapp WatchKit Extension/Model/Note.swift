//
//  Note.swift
//  noteapp WatchKit Extension
//
//  Created by paige on 2021/09/21.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String 
}
