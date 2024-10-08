//
//  vistaEjemplo.swift
//  PlanMaker
//
//  Created by Fran Malo on 2/10/24.
//

import SwiftUI
import MapKit
import CoreLocation


struct RangeMapView: View {
    @EnvironmentObject var vm: PlanMakerVM
    @StateObject private var locationManager = LocationManager()
    
    
    @State var sliderValue: Double = 0
    @State var autoCameraPosition = MapCameraPosition.automatic
    @State var isFollowingUser = true
    
    let rangos: [RangosMapa] =  Array(RangosMapa.allCases.dropFirst())
        
    
    var body: some View {
        VStack {
            if let coordinate = locationManager.lastKnownLocation {
                
                Map(position: $autoCameraPosition) {
                    MapCircle(center: coordinate, radius: vm.radius.metros)
                        .foregroundStyle(.blue.opacity(0.2))
                    UserAnnotation()
                }
                .frame(height: UIDevice.width)
                .onChange(of: sliderValue) {
                        actualizarZoom()
                }
                .onChange(of: autoCameraPosition) {
                    isFollowingUser = false
                }
                .overlay(alignment: .bottomTrailing){
                    Button {
                        withAnimation(.linear(duration: 1)) {
                            //autoCameraPosition = .userLocation(followsHeading: true, fallback: .automatic)
                            actualizarZoom()
                            Task {
                                try? await Task.sleep(nanoseconds: 200_000_000)
                                isFollowingUser = true
                            }
                        }
                    } label: {
                        Image(systemName: isFollowingUser ? "location.fill" : "location")
                            .padding(6)
                            .background {
                                Rectangle()
                                    .cornerRadius(4)
                                    .foregroundStyle(.gray)
                            }
                    }
                    .padding(20)
                    
                }
                VStack {
                    HStack{
                        Text("Explora planes en: ")
                            .padding(.leading, UIDevice.width * 0.1)
                        Text("\(Int(vm.radius.metros)) m")
                    }
                    .font(.system(size: 20, weight: .regular, design: .rounded))


                    Slider(value: $sliderValue, in: 0...Double((rangos.count)-1), step: 1)
                        .padding(.horizontal, 50)
                }
            }
        }.onAppear {
            locationManager.checkLocationAuthorization()
            if vm.radius == .nivel0 {
                actualizarZoom()
            } else {
                sliderValue = vm.radius.sliderValue
            }
        }
    }
    
    func actualizarZoom() {
        let index = Int(sliderValue)
        vm.radius = rangos[index]
        
        let nuevaRegion = MKCoordinateRegion(
            center: locationManager.lastKnownLocation ?? LocationManager.defaultLocation,
            span: MKCoordinateSpan(latitudeDelta: vm.radius.zoom, longitudeDelta: vm.radius.zoom)
        )
        
        withAnimation(.easeInOut(duration: 0.5)) {
            autoCameraPosition = .region(nuevaRegion)
        }
    }
}



#Preview {
    RangeMapView()
        .environmentObject(PlanMakerVM())
}
