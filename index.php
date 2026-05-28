<?php 
session_start();
include 'conexion.php';

if (isset($_SESSION['id_usuario'])) {
    if ($_SESSION['rol'] == 'interprete') {
        header("Location: pages/interprete/dashboard.php");
        exit();
    } else if ($_SESSION['rol'] == 'solicitante') {
        header("Location: pages/solicitante/dashboard.php");
        exit();
    } else {
        header("Location: index.php");
        exit();
    }
}

$error = "";

if (isset($_POST['ingresar'])) {
    $correo = mysqli_real_escape_string($conn, $_POST['correo']);
    $pass = mysqli_real_escape_string($conn, $_POST['pass']);

    $query = "
        SELECT usuario.*, perfil.rol
        FROM usuario
        INNER JOIN perfil ON usuario.id_usuario = perfil.id_usuario
        WHERE correo='$correo'
        AND password='$pass'
    ";

    $resultado = mysqli_query($conn, $query);

    if (mysqli_num_rows($resultado) > 0) {
        $usuario = mysqli_fetch_assoc($resultado);

        $_SESSION['id_usuario'] = $usuario['id_usuario'];
        $_SESSION['nombre'] = $usuario['nombre'];
        $_SESSION['rol'] = $usuario['rol'];

        if ($usuario['rol'] == 'interprete') {
            echo "<script>
                alert('¡Bienvenido intérprete!');
                window.location='pages/interprete/dashboard.php';
            </script>";
        } else {
            echo "<script>
                alert('¡Bienvenido solicitante!');
                window.location='pages/solicitante/dashboard.php';
            </script>";
        }
    } else {
        $error = "Correo o contraseña incorrectos";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>INTERVOZ - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="assets/img/icono.ico">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>

<main class="login-page">

    <section class="login-container">

        <div class="top-lines"></div>

        <div class="login-card">

            <img src="assets/img/Intervoz-logo.png" alt="Intervoz" class="logo">

            <h1>Plataforma de Intérpretes</h1>
            <p class="subtitle">Accede a tu cuenta para continuar</p>

            <form id="loginForm" method="POST">

                <div class="form-group">
                    <label>
                        <i class="fa-solid fa-envelope"></i>
                        Correo electrónico
                    </label>
                    <input 
                        type="email" 
                        name="correo" 
                        placeholder="Ingresa tu correo electrónico" 
                        required
                    >
                </div>

                <div class="form-group">
                    <label>
                        <i class="fa-solid fa-lock"></i>
                        Contraseña
                    </label>

                    <div class="password-box">
                        <input 
                            type="password" 
                            name="pass" 
                            id="password" 
                            placeholder="Ingresa tu contraseña" 
                            required
                        >
                        <button type="button" class="eye-btn" onclick="togglePassword()">
                            <i class="fa-solid fa-eye"></i>
                        </button>
                    </div>
                </div>
<!--
                <div class="login-options">
                    <label class="remember">
                        <input type="checkbox" name="recordarme">
                        <span>Recordarme</span>
                    </label>

                    <a href="#" class="forgot">¿Olvidaste tu contraseña?</a>
                </div> -->

                <?php if ($error != ""): ?>
                    <p class="error-message"><?php echo $error; ?></p>
                <?php endif; ?>

                <button type="submit" name="ingresar" class="btn-login">
                    Entrar
                    <i class="fa-solid fa-arrow-right"></i>
                </button>

            </form>

            <div class="divider">
                <span></span>
                <p>o</p>
                <span></span>
            </div>

            <div class="register-area">
                <p>¿Aún no tienes una cuenta?</p>

                <a href="registroOpciones.html" class="btn-register">
                    <i class="fa-solid fa-user-plus"></i>
                    Crear cuenta
                </a>
            </div>

        </div>

    </section>

    <div class="bar-bottom">
        <img src="assets/img/bar-intervoz.jpeg" alt="Barra Intervoz">
    </div>

</main>

<script>
function togglePassword() {
    const password = document.getElementById("password");
    password.type = password.type === "password" ? "text" : "password";
}
</script>

</body>
</html>