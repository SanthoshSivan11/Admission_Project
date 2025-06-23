<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Forgot Password</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f5f5f5;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .container {
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: black;
      width: 300px;
    }
    h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    input[type="email"],
    input[type="text"],
    button {
      width: 100%;
      padding: 10px;
      margin: 8px 0;
      box-sizing: border-box;
    }
    button {
      background-color: #4CAF50;
      color: white;
      border: none;
      cursor: pointer;
    }
    button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Forgot Password</h2>
    <form>
      <label for="email">Enter Email:</label>
      <input type="email" id="email" placeholder="you@example.com" required>

      <button type="button" onclick="sendOTP()">Send OTP</button>

      <label for="otp">Enter OTP:</label>
      <input type="text" id="otp" placeholder="Enter OTP" required>

      <button type="submit">Submit</button>
    </form>
  </div>

  <script>
    function sendOTP() {
      const email = document.getElementById("email").value;
      if (!email) {
        alert("Please enter your email first.");
      } else {
        alert("OTP sent to " + email);
      }
    }
  </script>
</body>
</html>
