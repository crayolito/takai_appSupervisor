class Historial {
  String id;
  String fechaInspeccion;
  String estado;
  String comentario;
  String inspector;

  Historial({
    required this.id,
    required this.fechaInspeccion,
    required this.estado,
    required this.comentario,
    required this.inspector,
  });
}

List<Historial> listaHistorial = [
  Historial(
    id: 'H001',
    fechaInspeccion: '2024/01/10',
    estado: 'Aprobado',
    comentario: 'Todo en orden.',
    inspector: 'Inspector Juan Pérez',
  ),
  Historial(
    id: 'H002',
    fechaInspeccion: '2024/02/15',
    estado: 'Pendiente',
    comentario: 'Requiere revisión adicional.',
    inspector: 'Inspector María López',
  ),
  Historial(
    id: 'H003',
    fechaInspeccion: '2024/03/20',
    estado: 'Rechazado',
    comentario: 'No cumple con los requisitos de seguridad.',
    inspector: 'Inspector Carlos Martínez',
  ),
  Historial(
    id: 'H004',
    fechaInspeccion: '2024/04/25',
    estado: 'Aprobado',
    comentario: 'Inspección satisfactoria.',
    inspector: 'Inspector Ana Torres',
  ),
  Historial(
    id: 'H005',
    fechaInspeccion: '2024/05/30',
    estado: 'Aprobado',
    comentario: 'Cumple con todas las normativas.',
    inspector: 'Inspector Luis García',
  ),
];
