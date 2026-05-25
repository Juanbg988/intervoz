<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Intervoz | Conectando Lenguas, Derribando Barreras</title>
    <style>
        /* --- VARIABLES DE DISEÑO INTERVOZ --- */
        :root {
            --primary-color: #007A87;       /* Azul turquesa/té de impacto social */
            --primary-hover: #005F69;
            --accent-color: #E26D5C;        /* Color cálido para llamadas a la acción */
            --text-dark: #2D3748;
            --text-light: #718096;
            --bg-light: #FFF9F6;            /* Fondo sutilmente cálido */
            --font-main: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: var(--font-main);
            color: var(--text-dark);
            background-color: #ffffff;
            overflow-x: hidden;
        }


        /* --- HEADER & NAVEGACIÓN --- */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 8%;
            background: #ffffff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: var(--primary-color);
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .logo span {
            color: var(--accent-color);
        }

        .nav-links {
            display: flex;
            list-style: none;
            gap: 30px;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--text-dark);
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: var(--primary-color);
        }

        .nav-actions {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .btn-login {
            background-color: var(--primary-color);
            color: white;
            padding: 10px 24px;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: background-color 0.3s;
        }

        .btn-login:hover {
            background-color: var(--primary-hover);
        }

        .lang-select {
            font-weight: bold;
            cursor: pointer;
            border: none;
            background: transparent;
            font-size: 14px;
        }

        /* --- HERO SLIDER SECTION --- */
        .hero-container {
            background: linear-gradient(135deg, #ffffff 60%, var(--bg-light) 100%);
            padding: 60px 8% 40px 8%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            min-height: 450px;
            gap: 40px;
        }

        .hero-content {
            flex: 1;
            max-width: 550px;
        }

        .hero-content h1 {
            font-size: 48px;
            line-height: 1.15;
            margin-bottom: 20px;
            color: var(--text-dark);
        }

        .hero-content p {
            font-size: 16px;
            color: var(--text-light);
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .btn-cta {
            background-color: var(--primary-color);
            color: white;
            padding: 14px 32px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: transform 0.2s, background-color 0.3s;
        }

        .btn-cta:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
        }

        .hero-image-container {
            flex: 1;
            display: flex;
            justify-content: flex-end;
            position: relative;
        }

        .hero-image {
            width: 100%;
            max-width: 520px;
            height: 340px;
            object-fit: cover;
            border-top-left-radius: 120px;
            border-bottom-right-radius: 120px;
            border-top-right-radius: 20px;
            border-bottom-left-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }

        /* --- SLIDER CONTROLS --- */
        .slider-controls {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 15px;
            margin-top: 20px;
            margin-bottom: 60px;
        }

        .arrow {
            background: none;
            border: none;
            font-size: 20px;
            color: var(--primary-color);
            cursor: pointer;
            font-weight: bold;
        }

        .dots {
            display: flex;
            gap: 8px;
        }

        .dot {
            width: 8px;
            height: 8px;
            background-color: #cbd5e0;
            border-radius: 50%;
            cursor: pointer;
            transition: all 0.3s;
        }

        .dot.active {
            background-color: var(--primary-color);
            width: 24px;
            border-radius: 4px;
        }

        /* --- SECCIÓN INFERIOR: PROPUESTA VALOR --- */
        .value-section {
            text-align: center;
            padding: 40px 8%;
            max-width: 900px;
            margin: 0 auto;
        }

        .value-section h2 {
            font-size: 32px;
            color: var(--text-dark);
            margin-bottom: 20px;
            font-weight: 600;
        }

        .value-section p {
            color: var(--text-light);
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 40px;
        }

        /* --- TABS DE FILTRO --- */
        .tabs-container {
            display: inline-flex;
            background-color: #edf2f7;
            padding: 6px;
            border-radius: 30px;
            margin-bottom: 40px;
        }

        .tab-btn {
            padding: 10px 35px;
            border: none;
            background: transparent;
            font-size: 15px;
            font-weight: 600;
            color: var(--text-light);
            cursor: pointer;
            border-radius: 25px;
            transition: all 0.3s;
        }

        .tab-btn.active {
            background-color: #ffffff;
            color: var(--primary-color);
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>

    <!-- NAV BAR -->
    <header class="navbar">
        <div class="logo">
            inter<span>voz</span>
        </div>
        <nav>
            <ul class="nav-links">
                <li><a href="#">Explora lenguas</a></li>
                <li><a href="#">Impacto</a></li>
                <li><a href="#">Quiénes somos</a></li>
                <li><a href="#">Ayuda</a></li>
            </ul>
        </nav>
        <div class="nav-actions">
            <button class="lang-select">ES ▾</button>
            <a href="#" class="btn-login">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                Acceder
            </a>
        </div>
    </header>

    <!-- HERO SLIDER SECTION -->
    <main>
        <section class="hero-container">
            <div class="hero-content" id="hero-text-container">
                <!-- El contenido se actualizará dinámicamente mediante JS basándose en la estructura de image_929f9f.jpg -->
                <h1 id="slider-title">Conexión en tiempo real con intérpretes</h1>
                <p id="slider-desc">Garantizamos el acceso a la salud, justicia y educación traduciendo en vivo variantes lingüísticas indígenas con total fidelidad profesional.</p>
                <a href="#" class="btn-cta" id="slider-btn">
                    Solicitar intérprete ➔
                </a>
            </div>
            <div class="hero-image-container">
                <!-- Se emula la asimetría y el diseño curvo orgánico del contenedor de la imagen de referencia -->
                <img src="image_929f9f.jpg" alt="Gráfica de comunicación e interpretación intervoz" class="hero-image" id="slider-img">
            </div>
        </section>

        <!-- CONTROLES DEL SLIDER -->
        <div class="slider-controls">
            <button class="arrow" id="prev-btn">⟨</button>
            <div class="dots">
                <div class="dot active" data-index="0"></div>
                <div class="dot" data-index="1"></div>
                <div class="dot" data-index="2"></div>
            </div>
            <button class="arrow" id="next-btn">⟩</button>
        </div>

        <!-- SECCIÓN DE PROPUESTA DE VALOR -->
        <section class="value-section">
            <h2>Comunícate, colabora y genera oportunidades reales</h2>
            <p>Unimos instituciones y profesionales con comunidades originarias mediante una red confiable de intérpretes certificados, asegurando el respeto cultural y la precisión técnica.</p>
            
            <!-- Selectores de pestañas similares al estilo del sitio original -->
            <div class="tabs-container">
                <button class="tab-btn active" onclick="switchTab(this)">Salud y Justicia</button>
                <button class="tab-btn" onclick="switchTab(this)">Educación y Desarrollo</button>
            </div>
        </section>
    </main>

    <!-- SCRIPT DE INTERACCIÓN (SLIDER & TABS) -->
    <script>
        // Datos para simular el carrusel de la página principal adaptada a Intervoz
        const sliderData = [
            {
                title: "Conexión en tiempo real con intérpretes",
                desc: "Garantizamos el acceso a la salud, justicia y educación traduciendo en vivo variantes lingüísticas indígenas con total fidelidad profesional.",
                btnText: "Solicitar intérprete ➔"
            },
            {
                title: "Inclusión sin perder las variantes nativas",
                desc: "Registramos y filtramos con precisión milimétrica cada variante regional para asegurar que el mensaje técnico o médico se entienda perfectamente.",
                btnText: "Ver variantes soportadas ➔"
            },
            {
                title: "Sé parte de nuestra red de intérpretes",
                desc: "Si dominas una lengua originaria y quieres generar un impacto social directo en entornos públicos o privados, únete al equipo.",
                btnText: "Postularse como intérprete ➔"
            }
        ];

        let currentIndex = 0;

        const titleEl = document.getElementById('slider-title');
        const descEl = document.getElementById('slider-desc');
        const btnEl = document.getElementById('slider-btn');
        const dots = document.querySelectorAll('.dot');

        function updateSlider(index) {
            currentIndex = index;
            
            // Actualizar textos
            titleEl.textContent = sliderData[currentIndex].title;
            descEl.textContent = sliderData[currentIndex].desc;
            btnEl.innerHTML = sliderData[currentIndex].btnText;

            // Actualizar estados de los puntos indicativos (dots)
            dots.forEach((dot, i) => {
                if(i === currentIndex) {
                    dot.classList.add('active');
                } else {
                    dot.classList.remove('active');
                }
            });
        }

        document.getElementById('next-btn').addEventListener('click', () => {
            let next = (currentIndex + 1) % sliderData.length;
            updateSlider(next);
        });

        document.getElementById('prev-btn').addEventListener('click', () => {
            let prev = (currentIndex - 1 + sliderData.length) % sliderData.length;
            updateSlider(prev);
        });

        dots.forEach((dot, i) => {
            dot.addEventListener('click', () => updateSlider(i));
        });

        // Control básico de pestañas (Tabs)
        function switchTab(element) {
            document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
            element.classList.add('active');
        }
    </script>
</body>
</html>