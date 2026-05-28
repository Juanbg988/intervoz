<?php include '../../conexion.php'; 
session_start();

if(!isset($_SESSION['id_usuario'])){
    header("Location: ../../index.php");
    exit();
}

if($_SESSION['rol'] != 'interprete'){
    header("Location: index.php");
    exit();
}

$sqlInterprete = "
SELECT id_interprete
FROM interprete
WHERE id_usuario = '".$_SESSION['id_usuario']."'
";

$resultInterprete = mysqli_query($conn, $sqlInterprete);

if(mysqli_num_rows($resultInterprete) <= 0){
  die("Interprete no encontrado");
}

$interprete = mysqli_fetch_assoc($resultInterprete);
$id_interprete = $interprete['id_interprete'];

$nombreUsuario = !empty($_SESSION['nombre']) ? $_SESSION['nombre'] : 'Intérprete';
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Intervoz - Intérprete</title>
    <link rel="icon" type="image/png" href="../../assets/img/icono.ico">
    <link rel="stylesheet" href="../../assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>
<!-- ============================================================
    PAGE: INICIO INTÉRPRETE
    ============================================================ -->

<main class="interprete-page">

    <section class="interprete-card">

        <img src="../../assets/img/Intervoz-logo.png" alt="Intervoz" class="logo">

        <header class="interprete-header">
            <div class="interprete-user">
                <div class="interprete-avatar">
                    <i class="fa-solid fa-headset"></i>
                </div>

                <div>
                    <h1><?= htmlspecialchars($nombreUsuario) ?></h1>
                    <p>Intérprete</p>
                </div>
            </div>

            <button 
                class="interprete-logout" 
                onclick="window.location.href='../../logout.php'" 
                title="Cerrar sesión"
            >
                <i class="fa-solid fa-xmark"></i>
            </button>
        </header>

        <!-- Toggle disponibilidad -->
        <section class="availability-card" onclick="toggleAvailability()">
            <div class="availability-info">
                <div class="availability-icon">
                    <i class="fa-solid fa-phone"></i>
                </div>

                <div>
                    <h2>Disponibilidad</h2>
                    <p id="avail-label">Estoy disponible para recibir llamadas</p>
                </div>
            </div>

            <div class="toggle-track on" id="avail-toggle">
                <div class="toggle-thumb"></div>
            </div>
        </section>

        <!-- Estado -->
        <section class="waiting-card">
            <div class="waiting-icon" id="status-pulse">
                <i class="fa-regular fa-clock"></i>
            </div>

            <div class="waiting-content">
                <h2 id="status-text">En espera</h2>
                <p id="status-sub">para recibir llamadas</p>

            </div>
        </section>

        <section class="languages-section">
            <div class="languages-title">
                <i class="fa-solid fa-globe"></i>
                <h2>TUS LENGUAS</h2>
            </div>

            <div class="languages-line"></div>

            <div class="langs-display" id="interp-langs"></div>
        </section>

        <div class="interpreter-info-box">
            <i class="fa-solid fa-info"></i>
            <p>Mantén tu disponibilidad actualizada para brindar el mejor servicio.</p>
        </div>
    </section>
</main>
<script src="../../assets/js/config.js"></script>
<script src="../../assets/js/script.js"></script>
<script src="https://cdn.socket.io/4.7.2/socket.io.min.js"></script>
<script>
const socket = io('https://intervoz-socket.onrender.com', {
    transports: ['websocket'],
    secure: true
});

// VARIABLES
const ID_INTERPRETE = <?= $id_interprete ?>;

localStorage.setItem('rol', 'interprete');

/*
========================================
REGISTRAR INTERPRETE
========================================
*/
async function registrarInterprete(){
    try{
        const response = await fetch(`${API_URL}/api/obtenerVariantesInterprete.php`);
        const data = await response.json();

        console.log(data);

        localStorage.setItem('id_interprete',ID_INTERPRETE);
        localStorage.setItem('lenguas_interprete',JSON.stringify(data.lenguas));

        const contenedor = document.getElementById('interp-langs');
        contenedor.innerHTML = '';

        if (!data.lenguas || data.lenguas.length === 0) {
            contenedor.innerHTML = `
                <div class="empty-languages">
                    No tienes lenguas registradas.
                </div>
            `;
            return;
        }

        data.lenguas.forEach((item, index) => {
            const iniciales = item.lengua.substring(0, 2).toUpperCase();
            contenedor.innerHTML += `
                <div class="language-card">
                    <div class="language-initials">${iniciales}</div>

                    <div class="language-data">
                        <h3>${item.lengua}</h3>
                        <p>${item.municipio}</p>
                    </div>
                </div>
            `;
        });

        socket.emit('registrarInterprete', {
            id_interprete: ID_INTERPRETE,
            lenguas: data.lenguas
        });

    } catch(error){
      console.error(error);
    }
}

registrarInterprete();

socket.on('llamadaEntrante', (data) => {
    localStorage.setItem('solicitud_actual', JSON.stringify(data));
    window.location.href = '../call/llamadaEntrante.html';
});

async function toggleAvailability() {
    const toggle = document.getElementById('avail-toggle');
    const label = document.getElementById('avail-label');
    const statusText = document.getElementById('status-text');
    const statusSub = document.getElementById('status-sub');

    const activo = toggle.classList.contains('on');
    const nuevoEstado = !activo;

    toggle.classList.toggle('on');

    if (nuevoEstado) {
        label.textContent = 'Estoy disponible para recibir llamadas';
        statusText.textContent = 'En espera';
        statusSub.textContent = 'para recibir llamadas';
    } else {
        label.textContent = 'No estoy disponible para recibir llamadas';
        statusText.textContent = 'No disponible';
        statusSub.textContent = 'activa tu disponibilidad';
    }

    try{
      await fetch(`${API_URL}/api/disponibilidad.php`, {

          method:'POST',

          headers:{
              'Content-Type':'application/json'
          },

          body: JSON.stringify({
              disponible: nuevoEstado ? 1 : 0
          })
        }
      );

      socket.emit('cambiarDisponibilidad', {
          id_interprete: ID_INTERPRETE,
          disponible: nuevoEstado
      });
    } catch(error){
        console.error(error);
    }
}

</script>
</body>
</html>