<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" href="style.css">
    <style>
        .container { width: 80%; margin: auto; background: white; padding: 20px; border-radius: 10px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #2c3e50; color: white; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Panel de Gestión INTERVOZ</h1>
        <h3>Solicitudes Recientes</h3>
        <table>
            <tr>
                <th>ID Solicitud</th>
                <th>Tipo</th>
                <th>Estado</th>
                <th>Acción</th>
            </tr>
            <tr>
                <td>001</td>
                <td>Interpretación Zapoteco</td>
                <td><span style="color: green;">Pendiente</span></td>
                <td><button style="width: auto; padding: 5px 10px;">Asignar</button></td>
            </tr>
        </table>
        <br>
        <a href="index.php">Cerrar Sesión</a>
    </div>
</body>
</html>