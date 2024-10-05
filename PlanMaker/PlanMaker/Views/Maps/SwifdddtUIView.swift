//import SwiftUI
//import MapKit
//
//struct Vista: View {
//    @State private var sliderValue: Double = 0
//    @State private var circleRadius: Double = 500  // Radio inicial del círculo
//    @State private var cameraPosition = MapCameraPosition.region(
//        MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 40.427063, longitude: -3.669103),
//            span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
//        )
//    )
//    
//    @State private var isFollowingUser = false // Nueva propiedad para controlar si sigue la ubicación del usuario
//    
//    // Para manejar la ubicación del usuario
//    @StateObject private var locationManager = LocationManager()
//    
//    let distancias: [Double] = [200, 300, 400,  500, 600, 700, 800, 900, 1000, 1500, 2000, 2500]
//    
//    let centerCoordinate = CLLocationCoordinate2D(latitude: 40.427063, longitude: -3.669103)
//    
//    var body: some View {
//        VStack {
//            Map(position: $cameraPosition) {
//                Marker("Manuel Becerra", systemImage: "figure", coordinate: centerCoordinate)
//                    .tint(.blue)
//                
//                MapCircle(center: centerCoordinate, radius: distanciaSeleccionada())
//                    .foregroundStyle(.blue.opacity(0.3))
//            }
//            .mapStyle(.standard)
//            .frame(height: 400)
//            .onChange(of: sliderValue) { _ in
//                withAnimation(.linear(duration: 0.2)) {
//                    circleRadius = distanciaSeleccionada()
//                }
//                withAnimation(.easeInOut(duration: 40.0)) { // Animación fluida al cambiar el zoom
//                    actualizarZoom()
//                }
//            }
//            .onChange(of: locationManager.userLocation) { location in
//                // Verificamos si el mapa está centrado en la ubicación del usuario
//                verificarSeguimientoUsuario(ubicacion: location)
//            }
//            .overlay(alignment: .bottomTrailing) {
//                Button {
//                    // Si está siguiendo la ubicación, dejar de seguir
//                    if isFollowingUser {
//                        cameraPosition = .region(
//                            MKCoordinateRegion(
//                                center: centerCoordinate,
//                                span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008)
//                            )
//                        )
//                        isFollowingUser = false // Dejar de seguir la ubicación
//                    } else {
//                        // Seguir la ubicación del usuario
//                        withAnimation(.linear(duration: 1)) {
//                            cameraPosition = .userLocation(followsHeading: true, fallback: .automatic)
//                        }
//                        isFollowingUser = true // Comienza a seguir la ubicación
//                    }
//                } label: {
//                    // Cambiar entre `location` y `location.fill` dependiendo del estado
//                    Image(systemName: isFollowingUser ? "location.fill" : "location")
//                        .padding(6)
//                        .background {
//                            Rectangle()
//                                .cornerRadius(4)
//                                .foregroundStyle(.gray)
//                        }
//                }
//                .padding(20)
//            }
//            
//            VStack {
//                // Mostrar la distancia seleccionada, calculada a partir del sliderValue
//                HStack {
//                    Text("Explora planes en un radio de")
//                    Text("\(Int(distanciaSeleccionada())) m")
//                }
//                
//                Slider(value: $sliderValue, in: 0...(Double(distancias.count - 1)), step: 1)
//                    .padding(.horizontal, 50)
//            }
//        }
//    }
//    
//    // Función que retorna la distancia seleccionada según el slider
//    func distanciaSeleccionada() -> Double {
//        let index = Int(sliderValue)
//        return distancias[index]
//    }
//    
//    // Función que actualiza el nivel de zoom (span) basado en la distancia seleccionada
//    func actualizarZoom() {
//        let distancia = distanciaSeleccionada()
//        
//        // Calcular latitudeDelta y longitudeDelta de manera proporcional a la distancia
//        var zoomFactor: Double
//        
//        if distancia >= 400 {
//            zoomFactor = distancia / 45000.0
//        } else {
//            zoomFactor = 0.008
//        }
//        
//        let nuevaRegion = MKCoordinateRegion(
//            center: centerCoordinate,
//            span: MKCoordinateSpan(latitudeDelta: zoomFactor, longitudeDelta: zoomFactor)
//        )
//        
//        // Actualizamos la posición de la cámara con la nueva región y zoom
//        cameraPosition = .region(nuevaRegion)
//    }
//    
//    func actualizarRadioCirculo() {
//        circleRadius = distanciaSeleccionada()  // Actualizamos el estado del radio
//    }
//    
//    // Verifica si el mapa está centrado en la ubicación del usuario
//    func verificarSeguimientoUsuario(ubicacion: CLLocation?) {
//        guard let ubicacion = ubicacion else { return }
//        
//        // Definimos un rango de distancia pequeña para considerar que el mapa está centrado
//        let distancia = cameraPosition.region?.center.distance(from: ubicacion.coordinate) ?? 0
//        
//        if distancia < 50 { // Si la distancia entre el centro del mapa y la ubicación del usuario es menor a 50 metros
//            isFollowingUser = true
//        } else {
//            isFollowingUser = false
//        }
//    }
//}
//
//// LocationManager para manejar la ubicación del usuario
//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//    private let manager = CLLocationManager()
//    
//    @Published var userLocation: CLLocation?
//    
//    override init() {
//        super.init()
//        manager.delegate = self
//        manager.desiredAccuracy = kCLLocationAccuracyBest
//        manager.requestWhenInUseAuthorization()
//        manager.startUpdatingLocation()
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        userLocation = locations.first
//    }
//}
//
//#Preview {
//    Vista()
//}
