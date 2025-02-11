//
//  Alerts.swift
//  olofoofo-ios
//
//  Created by Macbook on 05/12/2024.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title:Text
    let message: Text
    let dissmissButton: Alert.Button
}

struct AlertContext{
    //MARK: - Network Alerts
    static let invalidData =  AlertItem(title: Text("Server Error"), message: Text("the data recieved from the server is invalid, please contact support !"), dissmissButton: .default(Text("OK")))
    static let invalidResponse =  AlertItem(title: Text("Server Error"), message: Text("Invalid response from server, please try again later"), dissmissButton: .default(Text("OK")))
    static let invalidURL =  AlertItem(title: Text("There was an issue connecting with the server"), message: Text("sefece"), dissmissButton: .default(Text("OK")))
    static let unableToComplete =  AlertItem(title: Text("Server Error"), message: Text("Unable to complete your request, please try again later"), dissmissButton: .default(Text("OK")))
    //MARK: - Account Alerts
    static let invalidForm =  AlertItem(title: Text("Invalid Form"), message: Text("please ensure all fields are full"), dissmissButton: .default(Text("OK")))
    static let invalidEmail =  AlertItem(title: Text("Invalid Email"), message: Text("please make sure your email is correct"), dissmissButton: .default(Text("OK")))
    
    static let invalidUserData =  AlertItem(title: Text("Profile Error"), message: Text("there was an error saving or retrieveing your profile data."), dissmissButton: .default(Text("OK")))
}
