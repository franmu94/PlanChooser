import SwiftUI
import MapKit
import CoreLocation

struct vistaMapa: View {
    @State private var sliderValue: Double = 0
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Coordenadas de ejemplo (San Francisco)
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    @State private var userLocation: CLLocationCoordinate2D?

    let distancias: [Double] = [200, 500, 1000, 1500, 3000, 5000, 10000]

    var body: some View {
        VStack {
            Text("Explora planes en un radio de \(Int(distanciaSeleccionada())) m")
                .padding()

            // Mapa con la superposición del círculo geográfico
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, annotationItems: userLocation != nil ? [IdentifiableLocation(coordinate: userLocation!)] : []) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.red)
                        .font(.title)
                }
            }
            .overlay(CircleOverlayView(center: userLocation ?? region.center, radius: distanciaSeleccionada()))
            .onAppear {
                determineUserLocation()
            }
            .frame(height: 300)

            // Slider para ajustar la distancia
            Slider(value: $sliderValue, in: 0...(Double(distancias.count - 1)), step: 1)
                .padding(.horizontal, 50)
        }
    }
    
    // Función para obtener la distancia correspondiente al valor del slider
    func distanciaSeleccionada() -> Double {
        let index = Int(sliderValue)
        return distancias[index]
    }

    // Obtener la ubicación del usuario
    func determineUserLocation() {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            let manager = CLLocationManager()
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.startUpdatingLocation()
            manager.delegate = managerDelegate
        }
    }

    // Delegate para actualizar la ubicación
    var managerDelegate: CLLocationManagerDelegate {
        return LocationManagerDelegate { location in
            userLocation = location.coordinate
            region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )
        }
    }
}

// Clase para conformar CLLocationCoordinate2D a Identifiable
struct IdentifiableLocation: Identifiable {
    var id = UUID()
    var coordinate: CLLocationCoordinate2D
}

// Delegate para gestionar la ubicación del usuario
class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {
    var didUpdateLocation: ((CLLocation) -> Void)
    
    init(didUpdateLocation: @escaping (CLLocation) -> Void) {
        self.didUpdateLocation = didUpdateLocation
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            didUpdateLocation(location)
            manager.stopUpdatingLocation() // Detenemos la actualización de ubicación después de obtener la primera
        }
    }
}

// Vista personalizada para dibujar el círculo en el mapa
struct CircleOverlayView: View {
    var center: CLLocationCoordinate2D
    var radius: Double // Radio en metros
    
    var body: some View {
        GeometryReader { geometry in
            let mapSize = geometry.size
            let regionRadius = radius / 1000 // Ajuste para escalar el círculo
            let circleSize = min(mapSize.width, mapSize.height) * CGFloat(regionRadius)
            
            Circle()
                .stroke(Color.blue, lineWidth: 2)
                .frame(width: circleSize, height: circleSize)
                .position(x: mapSize.width / 2, y: mapSize.height / 2)
        }
    }
}

#Preview {
    vistaMapa()
}
