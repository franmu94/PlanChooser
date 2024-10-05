//
//  vistaEjemplo.swift
//  PlanMaker
//
//  Created by Fran Malo on 2/10/24.
//

import SwiftUI
import MapKit

struct vista: View {
    @State private var sliderValue: Double = 0
    @State private var circleRadius: Double = 500  // Radio inicial del círculo
    
    // Inicializamos las coordenadas de Manuel Becerra
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.427063, longitude: -3.669103),
            span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
        )
    )
    
    @State private var autoCameraPosition = MapCameraPosition.automatic
    
    @State  var isFollowingUser = true // Nueva propiedad para controlar si sigue la ubicación del usuario

    
    let distancias: [Double] = [200, 300, 400,  500, 600, 700, 800, 900, 1000, 1500, 2000, 2500]
    
    let centerCoordinate = CLLocationCoordinate2D(latitude: 40.427063, longitude: -3.669103)
    
    var body: some View {
        VStack {
            // Mostrar el mapa con un círculo y el nivel de zoom que cambia según la distancia
            Map(position: $autoCameraPosition) {
                Marker("Manuel Becerra",systemImage: "figure",  coordinate: centerCoordinate)
                    .tint(.blue)
                
                MapCircle(center: centerCoordinate, radius: distanciaSeleccionada())
                    .foregroundStyle(.blue.opacity(0.2))
                

            }
            .mapStyle(.standard)
            .frame(height: 400)
            //.clipShape(RoundedRectangle(cornerRadius: 25))
            
            //            .onChange(of: sliderValue) { _ in
            //                actualizarZoom()
            //            }
            .onChange(of: sliderValue) { _ in
                
                withAnimation(.linear(duration: 0.2)) {
                    circleRadius = distanciaSeleccionada()
                }
                withAnimation(.easeInOut(duration: 40.0)) { // Animación fluida al cambiar el zoom
                    actualizarZoom()
                }
            }
            .onChange(of: autoCameraPosition, { oldValue, newValue in
                isFollowingUser = false
            })
            .overlay(alignment: .bottomTrailing){
                    Button {
                        withAnimation(.linear(duration: 1)) {
                            autoCameraPosition = .userLocation(followsHeading: true, fallback: .automatic)
                            isFollowingUser = true
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
            
            Button("Boton") {
                //cameraPosition = .userLocation(followsHeading: true, fallback: .automatic)
            }
            
            
            VStack {
                // Mostrar la distancia seleccionada, calculada a partir del sliderValue
                HStack{
                    Text("Explora planes en un radio de")
                    Text("\(Int(distanciaSeleccionada())) m")
                }
                
                Slider(value: $sliderValue, in: 0...(Double(distancias.count - 1)), step: 1)
                    .padding(.horizontal, 50)
            }
        }
    }
    
    // Función que retorna la distancia seleccionada según el slider
    func distanciaSeleccionada() -> Double {
        let index = Int(sliderValue)
        return distancias[index]
    }
    
    // Función que actualiza el nivel de zoom (span) basado en la distancia seleccionada
    func actualizarZoom() {
        let distancia = distanciaSeleccionada()
        
        // Calcular latitudeDelta y longitudeDelta de manera proporcional a la distancia
        var  zoomFactor: Double // Puedes ajustar este valor según tu preferencia
        
        if distancia >= 400 {
            zoomFactor = distancia / 45000.0
        } else {
            zoomFactor = 0.008
        }
        
        
        let nuevaRegion = MKCoordinateRegion(
            center: centerCoordinate,
            span: MKCoordinateSpan(latitudeDelta: zoomFactor, longitudeDelta: zoomFactor)
        )
        
        // Actualizamos la posición de la cámara con la nueva región y zoom
        autoCameraPosition = .region(nuevaRegion)
    }
    
    func actualizarRadioCirculo() {
            circleRadius = distanciaSeleccionada()  // Actualizamos el estado del radio
        }
}



#Preview {
    vista()
}
