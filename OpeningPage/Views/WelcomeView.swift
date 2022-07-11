//
//  WelcomeView.swift
//  OpeningPage
//
//  Created by Chen Jin on 7/10/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing : 20){
                Text("Welcome to the Weather")
                    .bold().font(.title)
                Text("Share you current location to get more info").padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            //LocationButton is imported from CoreLocation UI
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

