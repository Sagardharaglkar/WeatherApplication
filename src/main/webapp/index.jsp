<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather App</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Ubuntu", sans-serif;
        }
        body {
            display: flex;
            height: 100vh;
            align-items: center;
            justify-content: center;
            background: #0a192f;
            color: white;
        }
        .mainContainer {
            width: 22rem;
            padding: 1rem;
            border-radius: 1rem;
            background: #1c2b45;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .searchInput {
            display: flex;
            justify-content: center;
            margin-bottom: 1rem;
        }
        .searchInput input {
            width: 80%;
            padding: 0.5rem;
            border-radius: 20px;
            border: none;
            outline: none;
        }
        .searchInput button {
            background: #ffcc00;
            border: none;
            padding: 0.5rem;
            border-radius: 50%;
            margin-left: 0.5rem;
            cursor: pointer;
        }
        .weatherIcon img {
        	margin-top: 23px;
            width: 80px;
        }
        .temperature {
            font-size: 2.5rem;
            font-weight: bold;
        }
        .cityDetails {
            font-size: 1.5rem;
        }
        .weatherStats {
            display: flex;
            justify-content: space-between;
            margin-top: 1rem;
        }
        .statBox {
            background: #112240;
            padding: 0.5rem;
            border-radius: 8px;
            text-align: center;
            width: 45%;
        }
    </style>
</head>
<body>
    <div class="mainContainer">
        <form action="MyServlet" method="post" class="searchInput">
            <input type="text" placeholder="Enter City Name" name="city" />
            <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
        </form>
        <div class="weatherDetails">
        	<div>${date}</div>

            <div class="weatherIcon">
                <img src="" alt="${weatherCondition}" id="weather-icon">
            </div>
            <div class="temperature">${temperature}°</div>
            <div class="cityDetails" id ="nameplace">${name }</div>
            <div class="weatherStats">
                <div class="statBox">
                    <p>Humidity</p>
                    <strong>${humidity}%</strong>
                </div>
                <div class="statBox">
                    <p>Wind</p>
                    <strong>${windSpeed} km/h</strong>
                </div>
            </div>
        </div>
    </div>


    <script>
    var val = ${weatherCondition};
	
	var weatherIcon = document.getElementById("weather-icon");

	  switch (val) {
      case 'Clouds':
          weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiwFTkt5z_dxU6w1UnS1PxiZV3HDiPGsAW5Lrsp09MnlCmkQre9GzO8MnGytaaY1eZoqBN6SMJ4U578_uDtiuXswovr1T3o-Kt5KK0mlN_zC0RDodJFaKHQ3Uk-HIZ3vuMvAKNJi8DDFwWA7F6BOxz78Oh-UePwJTuc3PG0ZIZypPE1xlMPl5z46joaEw/s320/Clouds.png";
          break;
      case 'Clear':
          weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj7pmzNCftryAfpa1YBSzVeYtjgxDQnw09Ug0HVV47J8GEtHPYTH9hJgZ2M1k0YgE0pcZ1qekr4C14zyPCiVuQAfXLClK8Ww3hYB6v77yElP7Lo5BnUKo4n-w6yB17FAbw51WST6YKS0GMwyA4fYNxOZxEyNL6HhUfFRgVhOW0GyRdBRriMHFQ-qfh4cA/s320/sun.png";
          break;
      case 'Rain':
          weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgDW_NdwvxV796rkFf43qmUDiTQePn5dg7PDfn1SijfpjtB0AWJMBcifU6LWyW7iOtjZhfqIJnKEGQ1PwbbXS7NoKMSAmvy7i2ljWXMYLue3EBIBBR2qTFbs6QCe5eoFr2CU9WzCVJ8u0J3z3eAo3Ajv1LXamZASFtbj9sA_gD-Kp3hfgAk17Xh17RoLQ/s320/rainy.png";
          break;
      case 'Mist':
          weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgVpL23l0t1U_ibWi01TFcHMF6J_t-9Ada5PavGlwG4M_mKIcx0pV1md9SN9ip1d84NaVowml5Do16XO3nsuttnM2-Ov05d-wCjEYjdzaOYfKvijw8k6Hfj9pOiPyEZTp2W20EPbTeONTgJE2Rdxs4KZUfg6f2PmbMF1094NcqJ7DwSFUQwYiRmVCNvuA/s320/mist.png";
          break;
      case 'Snow':
          weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj-P3iT_uQK95qFY4h7QGdEtbRc1aVQo9BZy0ZWyPBvCNrP-4wnRStw0xYj9e4xa4ZlYISeNZqVJ33UP4YukR4jBennDD_obIN4QxYNZHdzG_z6_MNL2U08wMXwdFhtfvitW5LGiHgrwMJFC8QJFqbSO3woGSBqOdagGxaEQ20_S31Gc-GYL4vYzPzaPw/s320/snow.png";
          break;
      case 'Haze':
          weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjld66Ia5g_hpBn3Impi3zzOBHqWkjQInGLxTb2uXksuCsrkQU8HjlVyLobEJEGg8fRSIxeFzldGEHUmWcaiZBwAcRy4dGDpFX1BjTSB56qmBjW5tEW3RSC9_mCuLU_a8RuXchxGY7Oc8HLLl-IfaDW19Z0ZJJfNae9tECXRIyEu7rmJ3da08z8cI-phw/s320/haze.png";
          break;
  }
	  </script>
	  
</body>

</html>