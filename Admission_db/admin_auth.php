<?php
// session_start(); is a built-in PHP function that either:
// Starts a new session, or Resumes an existing session
session_start();



// Connection to the database
$conn = new mysqli("localhost", "root", "", "admission_db");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}



// 1. Get the Form Data
$username = $_POST['user'];
$password = $_POST['pass'];



// 2. Query to check admin login
$sql = "SELECT * FROM admin WHERE username = '$username' AND password = '$password'";
//Runs the SQL query against the database using the $conn database connection.
$result = $conn->query($sql);  




// $result->num_rows counts how many rows were returned by the SQL query Check if a matching user exists.
if ($result->num_rows === 1) {
    //fetch_assoc() retrieves the row as an associative array.
    $row = $result->fetch_assoc();
    


    // Store session data
    $_SESSION['admin'] = $username;          // store the actual username from form
    $_SESSION['admin_name'] = $row['name'];  // Store admin name in session


//    $row = [
//   'id' => 2,
//   'username' => 'santhosh',
//   'password' => 'sivan',
//   'name' => 'Santhosh',
//   'email' => 'shuffysanthosh@gmail.com',
//   'otp' => '239883',
//   'otp_expiry' => '2025-06-22 11:16:14'
// ];


// +----+----------+----------+----------+--------------------------+--------+---------------------+
// | id | username | password | name     | email                    | otp    | otp_expiry          |
// +----+----------+----------+----------+--------------------------+--------+---------------------+
// |  1 | username | password | NULL     | shuffysanthosh@gmail.com | 239883 | 2025-06-22 11:16:14 |
// |  2 | santhosh | sivan    | Santhosh | shuffysanthosh@gmail.com | 239883 | 2025-06-22 11:16:14 |
// +----+----------+----------+----------+--------------------------+--------+---------------------+

    // Redirect to dashboard
    header("Location: admin_dashboard.php");
    exit();
} else {
    echo "Invalid username or password. <a href='admin_login.php'>Try again</a>";
}

$conn->close();
?>
