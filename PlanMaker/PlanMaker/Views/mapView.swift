////
////  mapView.swift
////  PlanMaker
////
////  Created by Fran Malo on 2/10/24.
////
//import SwiftUI
//import MapKit
//import CoreLocation
//
//struct MapView: UIViewRepresentable {
//    @Binding var region: MKCoordinateRegion
//    var circleRadius: Double
//    var userLocation: CLLocationCoordinate2D?
//
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView()
//        mapView.delegate = context.coordinator
//        return mapView
//    }
//
//    func updateUIView(_ mapView: MKMapView, context: Context) {
//        mapView.setRegion(region, animated: true)
//        
//        // Eliminar cualquier overlay previo
//        mapView.removeOverlays(mapView.overlays)
//        
//        // Agregar el círculo basado en la ubicación del usuario
//        if let location = userLocation {
//            let circle = MKCircle(center: location, radius: circleRadius)
//            mapView.addOverlay(circle)
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(self)
//    }
//
//    class Coordinator: NSObject, MKMapViewDelegate {
//        var parent: MapView
//
//        init(_ parent: MapView) {
//            self.parent = parent
//        }
//
//        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//            if let circleOverlay = overlay as? MKCircle {
//                let circleRenderer = MKCircleRenderer(circle: circleOverlay)
//                circleRenderer.strokeColor = .blue
//                circleRenderer.lineWidth = 2
//                circleRenderer.fillColor = UIColor.blue.withAlphaComponent(0.2)
//                return circleRenderer
//            }
//            return MKOverlayRenderer(overlay: overlay)
//        }
//    }
//}
//
//
//struct mapView: View {
//    @State private var sliderValue: Double = 0
//    @State private var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Coordenadas de ejemplo (San Francisco)
//        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//    )
//    @State private var userLocation: CLLocationCoordinate2D?
//
//    let distancias: [Double] = [200, 500, 1000, 1500, 3000, 5000, 10000]
//
//    var body: some View {
//        VStack {
//            Text("Explora planes en un radio de \(Int(distanciaSeleccionada())) m")
//                .padding()
//
//            // Mapa con el círculo de radio geográfico
//            MapView(region: $region, circleRadius: distanciaSeleccionada(), userLocation: userLocation)
//                .frame(height: 300)
//                .onAppear {
//                    determineUserLocation()
//                }
//
//            // Slider para ajustar la distancia
//            Slider(value: $sliderValue, in: 0...(Double(distancias.count - 1)), step: 1)
//                .padding(.horizontal, 50)
//        }
//    }
//    
//    // Función para obtener la distancia correspondiente al valor del slider
//    func distanciaSeleccionada() -> Double {
//        let index = Int(sliderValue)
//        return distancias[index]
//    }
//
//    // Obtener la ubicación del usuario
//    func determineUserLocation() {
//        let locationManager = CLLocationManager()
//        locationManager.requestWhenInUseAuthorization()
//        if CLLocationManager.locationServicesEnabled() {
//            let manager = CLLocationManager()
//            manager.desiredAccuracy = kCLLocationAccuracyBest
//            manager.startUpdatingLocation()
//            manager.delegate = managerDelegate
//        }
//    }
//
//    // Delegate para actualizar la ubicación
//    var managerDelegate: CLLocationManagerDelegate {
//        return LocationManagerDelegate { location in
//            userLocation = location.coordinate
//            region = MKCoordinateRegion(
//                center: location.coordinate,
//                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//            )
//        }
//    }
//}
//
//// Clase para conformar CLLocationCoordinate2D a Identifiable
//struct IdentifiableLocation: Identifiable {
//    var id = UUID()
//    var coordinate: CLLocationCoordinate2D
//}
//
//// Delegate para gestionar la ubicación del usuario
//class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {
//    var didUpdateLocation: ((CLLocation) -> Void)
//    
//    init(didUpdateLocation: @escaping (CLLocation) -> Void) {
//        self.didUpdateLocation = didUpdateLocation
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            didUpdateLocation(location)
//            manager.stopUpdatingLocation() // Detenemos la actualización de ubicación después de obtener la primera
//        }
//    }
//}
//
//
//
//#Preview {
//    mapView()
//}
