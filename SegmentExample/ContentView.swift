//
//  ContentView.swift
//  SegmentExample
//
//  Created by Troy Sellers on 7/29/20.
//  Copyright © 2020 Troy Sellers. All rights reserved.
//

import SwiftUI
import Analytics

struct ContentView: View {
    @State private var userId = ""
    var body: some View {
        VStack {
            HStack {
              Image(systemName: "person").foregroundColor(.gray)
              TextField("User ID", text: $userId)
                .textFieldStyle(RoundedBorderTextFieldStyle())
              }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            Button(action: {
                let analytics = SEGAnalytics.shared()
                analytics?.track("event 1")
                print("segment action 1")
            }) {
                Text("Track Event")
                .font(.title)
                .padding()
                .background(Color.green)
                .cornerRadius(20)
                .foregroundColor(.white)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.green, lineWidth: 5)
                )
            }
          Button(action: {
            if(self.userId != "") {
                let analytics = SEGAnalytics.shared()
                analytics?.identify(self.userId,traits: ["email":"troy@test.com"])
            }
            print("identify")
          }) {
              Text("Identify")
              .font(.title)
              .padding()
              .background(Color.green)
              .cornerRadius(20)
              .foregroundColor(.white)
              .padding(5)
              .overlay(
                  RoundedRectangle(cornerRadius: 20)
                      .stroke(Color.green, lineWidth: 5)
              )
          }
          Button(action: {
            let analytics = SEGAnalytics.shared()
            analytics?.alias("alias_ios_user")
            print("alias")
          }) {
              Text("Alias")
              .font(.title)
              .padding()
              .background(Color.green)
              .cornerRadius(20)
              .foregroundColor(.white)
              .padding(5)
              .overlay(
                  RoundedRectangle(cornerRadius: 20)
                      .stroke(Color.green, lineWidth: 5)
              )
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
