<?php include 'conexion.php'; 

$rol = $_GET['rol'] ?? 'solicitante';

// Obtener lenguas
$sqlLenguas = "SELECT * FROM lengua ORDER BY nombre ASC";
$resultLenguas = mysqli_query($conn, $sqlLenguas);

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>INTERVOZ - Crear Cuenta</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="assets/img/icono.ico">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
<main class="register-page">

    <section class="register-card">

        <div class="register-lines register-lines-top"></div>
        <div class="register-dots"></div>

        <img src="assets/img/Intervoz.png" alt="Intervoz" class="logo">

        <h1>Crear cuenta</h1>

        <p class="register-subtitle">
            <?= $rol == 'interprete' ? 'Registro de intérprete' : 'Registro de solicitante' ?>
        </p>

        <form method="POST" enctype="multipart/form-data" class="register-form">

            <div class="register-field">
                <i class="fa-regular fa-user"></i>
                <div>
                    <label>Nombre(s)</label>
                    <input type="text" name="nombre" placeholder="Escribe tu nombre(s)" required>
                </div>
            </div>

            <div class="register-two-columns">
                <div class="register-field">
                    <i class="fa-regular fa-user"></i>
                    <div>
                        <label>Apellido paterno</label>
                        <input type="text" name="ape_pat" placeholder="Escribe tu apellido paterno" required>
                    </div>
                </div>

                <div class="register-field">
                    <i class="fa-regular fa-user"></i>
                    <div>
                        <label>Apellido materno</label>
                        <input type="text" name="ape_mat" placeholder="Escribe tu apellido materno" required>
                    </div>
                </div>
            </div>

            <div class="register-field">
                <i class="fa-regular fa-envelope"></i>
                <div>
                    <label>Correo electrónico</label>
                    <input type="email" name="correo" placeholder="ejemplo@correo.com" required>
                </div>
            </div>

            <div class="register-field password-register-field">
                <i class="fa-solid fa-lock"></i>
                <div>
                    <label>Contraseña</label>
                    <input type="password" name="pass" id="pass" placeholder="Mínimo 8 caracteres" minlength="8" maxlength="16" required>
                </div>

                <button type="button" class="register-eye" onclick="toggleRegisterPassword()">
                    <i class="fa-regular fa-eye-slash"></i>
                </button>
            </div>

            <?php if($rol == 'interprete'){ ?>

                <div class="register-field">
                    <i class="fa-solid fa-phone"></i>
                    <div>
                        <label>Teléfono</label>
                        <input type="tel" name="telefono" placeholder="(951) 123 4567" required>
                    </div>
                </div>

                <div id="contenedor-lenguas">
                    <div class="bloque-lengua">
                        <div class="register-field register-select-field">
                            <i class="fa-solid fa-globe"></i>
                            <div>
                                <label>Lengua</label>
                                <select name="lenguas[]" class="lengua-select" required>
                                    <option value="">Selecciona tu lengua</option>
                                    <?php
                                    mysqli_data_seek($resultLenguas, 0);
                                    while($lengua = mysqli_fetch_assoc($resultLenguas)){
                                    ?>
                                        <option value="<?= $lengua['id_lengua'] ?>">
                                            <?= htmlspecialchars($lengua['nombre']) ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>

                        <div class="register-field register-select-field">
                            <i class="fa-solid fa-location-dot"></i>
                            <div>
                                <label>Municipio</label>
                                <select name="municipios[]" class="municipio-select" required>
                                    <option value="">Selecciona tu municipio</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <button type="button" id="btnAgregarLengua" class="btn-add-language">
                    <i class="fa-solid fa-plus"></i>
                    Agregar otra lengua
                </button>

                <div class="documents-title">
                    <span></span>
                    <p>Documentos requeridos</p>
                    <span></span>
                </div>

                <div class="documents-grid-register">
                    <div class="document-upload blue-doc">
                        <input id="ine" type="file" name="INE" accept=".jpg,.jpeg,.png,.pdf" hidden>
                        <label for="ine">
                            <div class="doc-icon">
                                <i class="fa-solid fa-cloud-arrow-up"></i>
                            </div>

                            <h3>INE</h3>
                            <p>Formato PDF o imagen</p>

                            <strong>Subir documento</strong>
                        </label>
                    </div>

                    <div class="document-upload green-doc">
                        <input id="certificado" type="file" name="documento" accept=".jpg,.jpeg,.png,.pdf" hidden>

                        <label for="certificado">
                            <div class="doc-icon">
                                <i class="fa-solid fa-cloud-arrow-up"></i>
                            </div>

                            <h3>Certificado de intérprete</h3>
                            <p>Formato PDF o imagen</p>

                            <strong>Subir documento</strong>
                        </label>
                    </div>
                </div>

            <?php }?>


            <label class="privacy-check">
                <input type="checkbox" name="avisoPrivacidad" required>
                <span>
                    He leído y acepto el 
                    <a href="avisoPrivacidad.php" target="_blank">aviso de privacidad</a>
                </span>
            </label>

            <button type="submit" name="registrar" class="btn-register-account">
                <i class="fa-solid fa-user-plus"></i>
                Registrarse
            </button>

        </form>

        <div class="register-divider">
            <span></span>
            <p>o</p>
            <span></span>
        </div>

        <a href="registroOpciones.html" class="register-back">
            <i class="fa-solid fa-arrow-left"></i>
            Volver
        </a>

        <?php
        if(isset($_POST['registrar'])){
            // Limpiamos los datos para evitar errores básicos
            $nombre  = mysqli_real_escape_string($conn, $_POST['nombre']);
            $ape_pat = mysqli_real_escape_string($conn, $_POST['ape_pat']);
            $ape_mat = mysqli_real_escape_string($conn, $_POST['ape_mat']);
            $correo  = mysqli_real_escape_string($conn, $_POST['correo']);
            $pass    = mysqli_real_escape_string($conn, $_POST['pass']);

            //$tel     = $_POST['telefono'] ?? '';


            // Query basado exactamente en las columnas de tu tabla 'Usuario'
            $sql = "INSERT INTO usuario
                    (nombre, ape_pat, ape_mat, correo, password) 
                    VALUES
                    ('$nombre', '$ape_pat', '$ape_mat', '$correo', '$pass')";

            if(mysqli_query($conn, $sql)){
                $id_usuario = mysqli_insert_id($conn);
                $sqlPerfil = "INSERT INTO perfil
                                (rol, estado, fecha_creacion, id_usuario)
                                VALUES
                                ('$rol', 1, NOW(), '$id_usuario')";

                mysqli_query($conn, $sqlPerfil);

                if($rol == 'interprete'){
                    $telefono   = mysqli_real_escape_string($conn, $_POST['telefono']);
                    $lenguas = $_POST['lenguas'];
                    $municipios = $_POST['municipios'];

                    // =========================
                    // TABLA interprete
                    // =========================

                    $sqlInterprete = "INSERT INTO interprete
                                        (id_usuario, telefono)
                                        VALUES
                                        ('$id_usuario', '$telefono')";


                    if(mysqli_query($conn, $sqlInterprete)){
                        $id_interprete = mysqli_insert_id($conn);

                        for($i = 0; $i < count($lenguas); $i++){
                            $id_lengua = intval($lenguas[$i]);
                            $id_municipio = intval($municipios[$i]);

                            $sqlILM = "
                                INSERT INTO interprete_lengua_municipio
                                (id_interprete, id_lengua, id_municipio)
                                VALUES
                                ('$id_interprete', '$id_lengua', '$id_municipio')
                            ";

                            mysqli_query($conn, $sqlILM);
                        }
                    
                    // =========================
                    // TABLA disponibilidad
                    // =========================

                        $sqlDisponibilidad = "INSERT INTO disponibilidad
                                                (id_interprete, disponible, fecha)
                                                VALUES
                                                ('$id_interprete', 1, NOW())";

                        mysqli_query($conn, $sqlDisponibilidad);
                    }
                }

                echo "<script>
                    alert('Cuenta creada con éxito. Ya puedes iniciar sesión.');
                    window.location='index.php';
                </script>";
            } else {
                echo "<p class='register-error'>Error al registrar: " . mysqli_error($conn) . "</p>";
            }
        }
        ?>
    </section>
</main>

<script src="assets/js/config.js"></script>
<script src="assets/js/registro.js"></script>
<script>
function toggleRegisterPassword() {
    const pass = document.getElementById('pass');
    pass.type = pass.type === 'password' ? 'text' : 'password';
}
</script>

</body>
</html>