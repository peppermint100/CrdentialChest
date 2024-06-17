//
//  PreviewMockData.swift
//  CredentialChest
//
//  Created by peppermint100 on 6/15/24.
//

import SwiftUI

enum PreviewMockData {
    static let basicCredentialItem = BasicCredentialItem(
        id: UUID(), title: "집 비밀번호", memo: "집 공동 현관 비밀번호", symbolString: "gear",
        symbolColor: Color.blue, images: [], isPinned: true, password: "123123")
    
    static let credentialItems: [BasicCredentialItem] = [
        BasicCredentialItem(id: UUID(), title: "Email", memo: "Personal email account", symbolString: "envelope", symbolColor: .blue, images: [Image(systemName: "envelope")], isPinned: false, password: "password123"),
        BasicCredentialItem(id: UUID(), title: "Bank", memo: "Checking account", symbolString: "banknote", symbolColor: .green, images: [Image(systemName: "banknote")], isPinned: true, password: "bankpassword"),
        BasicCredentialItem(id: UUID(), title: "Social Media", memo: "Facebook account", symbolString: "book", symbolColor: .blue, images: [Image(systemName: "book")], isPinned: false, password: "facebook123"),
        BasicCredentialItem(id: UUID(), title: "Work Email", memo: "Company email account", symbolString: "envelope.fill", symbolColor: .red, images: [Image(systemName: "envelope.fill")], isPinned: true, password: "workemail123"),
        BasicCredentialItem(id: UUID(), title: "Shopping", memo: "Amazon account", symbolString: "cart", symbolColor: .orange, images: [Image(systemName: "cart")], isPinned: false, password: "amazonpass"),
        BasicCredentialItem(id: UUID(), title: "Cloud Storage", memo: "Dropbox account", symbolString: "cloud", symbolColor: .gray, images: [Image(systemName: "cloud")], isPinned: true, password: "dropbox123"),
        BasicCredentialItem(id: UUID(), title: "Travel", memo: "Airline miles account", symbolString: "airplane", symbolColor: .purple, images: [Image(systemName: "airplane")], isPinned: false, password: "travelpassword"),
        BasicCredentialItem(id: UUID(), title: "Fitness", memo: "Gym membership", symbolString: "figure.walk", symbolColor: .yellow, images: [Image(systemName: "figure.walk")], isPinned: true, password: "gympass123"),
        BasicCredentialItem(id: UUID(), title: "Streaming", memo: "Netflix account", symbolString: "tv", symbolColor: .red, images: [Image(systemName: "tv")], isPinned: false, password: "netflixpassword"),
        BasicCredentialItem(id: UUID(), title: "Gaming", memo: "Steam account", symbolString: "gamecontroller", symbolColor: .black, images: [Image(systemName: "gamecontroller")], isPinned: true, password: "steampassword"),
        BasicCredentialItem(id: UUID(), title: "Music", memo: "Spotify account", symbolString: "music.note", symbolColor: .green, images: [Image(systemName: "music.note")], isPinned: false, password: "spotifypass"),
        BasicCredentialItem(id: UUID(), title: "News", memo: "New York Times subscription", symbolString: "newspaper", symbolColor: .gray, images: [Image(systemName: "newspaper")], isPinned: true, password: "nytpassword"),
        BasicCredentialItem(id: UUID(), title: "Education", memo: "Online course platform", symbolString: "graduationcap", symbolColor: .blue, images: [Image(systemName: "graduationcap")], isPinned: false, password: "educationpass"),
        BasicCredentialItem(id: UUID(), title: "Photo Storage", memo: "Google Photos account", symbolString: "photo", symbolColor: .yellow, images: [Image(systemName: "photo")], isPinned: true, password: "photospassword"),
        BasicCredentialItem(id: UUID(), title: "Health", memo: "Health insurance account", symbolString: "heart", symbolColor: .red, images: [Image(systemName: "heart")], isPinned: false, password: "healthpass123"),
        BasicCredentialItem(id: UUID(), title: "Utility", memo: "Electricity bill account", symbolString: "bolt", symbolColor: .yellow, images: [Image(systemName: "bolt")], isPinned: true, password: "utilitypass"),
        BasicCredentialItem(id: UUID(), title: "Mobile", memo: "Mobile carrier account", symbolString: "phone", symbolColor: .blue, images: [Image(systemName: "phone")], isPinned: false, password: "mobilepass"),
        BasicCredentialItem(id: UUID(), title: "Calendar", memo: "Google Calendar", symbolString: "calendar", symbolColor: .green, images: [Image(systemName: "calendar")], isPinned: true, password: "calendarpassword"),
        BasicCredentialItem(id: UUID(), title: "Food Delivery", memo: "Uber Eats account", symbolString: "fork.knife", symbolColor: .orange, images: [Image(systemName: "fork.knife")], isPinned: false, password: "fooddeliverypass"),
        BasicCredentialItem(id: UUID(), title: "Ride Sharing", memo: "Uber account", symbolString: "car", symbolColor: .black, images: [Image(systemName: "car")], isPinned: true, password: "ridesharingpass")    ]
}
