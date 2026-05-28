<?php
include '../../conexion.php';
session_start();

if (!isset($_SESSION['id_usuario'])) {
    header("Location: ../../index.php");
    exit();
}

if ($_SESSION['rol'] != 'solicitante') {
    header("Location: ../../index.php");
    exit();
}

$sqlLenguas = "SELECT * FROM lengua ORDER BY nombre ASC";
$resultLenguas = mysqli_query($conn, $sqlLenguas);

$nombreUsuario = !empty($_SESSION['nombre']) ? $_SESSION['nombre'] : 'Usuario';
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Intervoz - Solicitante</title>
    <link rel="icon" type="image/png" href="../../assets/img/icono.ico">
    <link rel="stylesheet" href="../../assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

<main class="solicitante-page">

    <section class="solicitante-card">

        <img src="../../assets/img/Intervoz-logo.png" alt="Intervoz" class="logo">

        <header class="solicitante-header">
            <div class="solicitante-user">
                <div class="solicitante-avatar">
                    <i class="fa-solid fa-headset"></i>
                </div>
                
                <div>
                    <h1><?= htmlspecialchars($nombreUsuario) ?></h1>
                    <p>Configura tus preferencias de llamada</p>
                </div>
            </div>

            <button 
                class="solicitante-logout" 
                onclick="window.location.href='../../logout.php'" 
                title="Cerrar sesión"
            >
                <i class="fa-solid fa-xmark"></i>
            </button>
        </header>

        <div class="solicitante-line"></div>

        <section class="call-panel">

            <div class="field-block">
                <div class="field-title">
                    <div class="field-icon">
                        <i class="fa-solid fa-globe"></i>
                    </div>

                    <div>
                        <h2>Lengua</h2>
                        <p>Selecciona el idioma en el que deseas interpretar</p>
                    </div>
                </div>

                <select id="lenguas" name="lenguas" required>
                    <option value="">Selecciona una lengua</option>
                    <?php while ($lengua = mysqli_fetch_assoc($resultLenguas)) { ?>
                        <option value="<?= $lengua['id_lengua'] ?>">
                            <?= htmlspecialchars($lengua['nombre']) ?>
                        </option>
                    <?php } ?>
                </select>
            </div>

            <div class="panel-divider"></div>

            <div class="field-block">
                <div class="field-title">
                    <div class="field-icon">
                        <i class="fa-solid fa-location-dot"></i>
                    </div>

                    <div>
                        <h2>Municipio</h2>
                        <p>Selecciona el municipio desde el que realizarás la llamada</p>
                    </div>
                </div>

                <div class="municipio-row">
                    <select id="municipios" name="municipios" required>
                        <option value="">Selecciona un municipio</option>
                    </select>

                    <button type="button" class="btn-add-municipio">
                        <i class="fa-solid fa-plus"></i>
                    </button>
                </div>
            </div>

            <div class="info-box">
                <i class="fa-solid fa-info"></i>
                <p>Asegúrate de seleccionar la lengua y el municipio correctos para brindar un mejor servicio.</p>
            </div>

        </section>

        <div id="selected-lang-section" style="display:none">
            <div class="selected-lang-display">
                <div class="selected-lang-name" id="selected-lang-name">—</div>
                <span id="interp-avail-count" style="display:none">0</span>
                <button class="btn btn-sm btn-ghost" onclick="clearLangSelection()">✕</button>
            </div>
        </div>

        <div class="call-action">
            <button class="btn-call" id="btn-llamar" onclick="iniciarLlamadaSolicitante()">
                <i class="fa-solid fa-phone"></i>
                Llamar
            </button>
        </div>

        <div class="status-grid" style="display:none;">
            <span id="available-count">0</span>
        </div>

    </section>

</main>
<script src="../../assets/js/config.js"></script>
<script src="../../assets/js/script.js"></script>
<script>

document.getElementById('lenguas').addEventListener('change', async ()=>{

    const idLengua = document.getElementById('lenguas').value;
    const select = document.getElementById('municipios');

    select.innerHTML = '<option value="">Cargando municipios...</option>';

    if (!idLengua) {
        select.innerHTML = '<option value="">Selecciona un municipio</option>';
        return;
    }

    const response = await fetch(`${API_URL}/api/obtenerMunicipios.php?id_lengua=${idLengua}`);
    const municipios = await response.json();


    select.innerHTML =
    '<option value="">Municipio</option>';

    municipios.forEach(m=>{

        select.innerHTML += `
            <option value="${m.id_municipio}">
                ${m.nombre}
            </option>
        `;

    });

});

</script>
<script src="https://cdn.socket.io/4.7.2/socket.io.min.js"></script>

<script>
const socket = io('https://intervoz-socket.onrender.com', {
    transports: ['websocket'],
    secure: true
});

localStorage.setItem('rol','solicitante');

socket.emit('registrarSolicitante', {
    id_usuario: <?= $_SESSION['id_usuario'] ?>
});

</script>
</body>
</html>