<?php
$conn = new mysqli("localhost", "root", "", "admission_db");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch group list
$group_result = $conn->query("SELECT group_name FROM courses");

// Fetch course list
$course_result = $conn->query("SELECT course_name FROM courses");
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Student Registration Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f4f8;
      padding: 20px;
    }

    h2 {
      text-align: center;
      color: #333;
    }

    form {
      max-width: 60%;
      margin: auto;
      background-color: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    .form-group {
      margin-bottom: 15px;
    }

    label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    input[type="text"],
    input[type="email"],
    input[type="tel"],
    input[type="number"],
    select,
    textarea {
      width: 95%;
      resize : none;
      padding: 10px;
      border-radius: 4px;
      border: 1px solid #ccc;
      font-size: 14px;
    }

    input[type="radio"] {
      margin-right: 5px;
    }

    input[type="file"] {
      border: none;
      font-size: 14px;
    }

    button {
      background-color: #007bff;
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 4px;
      font-size: 16px;
      cursor: pointer;
      width: 100%;
    }

    button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>

  <h2>UnderGraduate Application Form</Form></h2>


<div class="shadow-md">

    <form action="submit.php" method="post" enctype="multipart/form-data">

    <div class="form-group">
      <label for="fname">First Name:</label>
      <input type="text" id="fname" name="first_name" required>
    </div>

    <div class="form-group">
      <label for="lname">Last Name:</label>
      <input type="text" id="lname" name="last_name" required>
    </div>

    <div class="form-group">
      <label>Gender:</label>
      <input type="radio" id="male" name="gender" value="Male" required>
      <label for="male" style="display: inline;">Male</label>
      <input type="radio" id="female" name="gender" value="Female">
      <label for="female" style="display: inline;">Female</label>
    </div>

    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required>
    </div>

    <div class="form-group">
      <label for="phone">Phone Number:</label>
      <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" required>
    </div>

    <div class="form-group">
  <label for="dob">Date of Birth:</label>
  <input type="date" id="dob" name="dob" required>
</div>

    <div class="form-group">
      <label for="address">Address:</label>
      <textarea id="address" name="address" rows="3" required></textarea>
    </div>

    <div class="form-group">
 <label for="group">Group:</label>
  <select id="group" name="group" required>
    <option value="">--Select Group--</option>
    <?php while ($row = $group_result->fetch_assoc()): ?>
      <option value="<?= $row['group_name']; ?>"><?= $row['group_name']; ?></option>
    <?php endwhile; ?>
  </select>

    </div>

    <div class="form-group">
      <label for="totalMarks">Total Marks (12th):</label>
      <input type="number" id="totalMarks" name="total_marks" min="0" required>
    </div>

    <div class="form-group">
  <label for="course">Select Course:</label>
  <select id="course" name="course" required>
    <option value="">--Select Course--</option>
    <?php while ($row = $course_result->fetch_assoc()): ?>
      <option value="<?= $row['course_name']; ?>"><?= $row['course_name']; ?></option>
    <?php endwhile; ?>
  </select>


    </div>

    <div class="form-group">
      <label for="marksheet">Upload 12th Marksheet:</label>
      <input type="file" id="marksheet" name="marksheet" accept=".pdf,.jpg,.png" required>
    </div>

    <div class="form-group">
      <label for="photo">Upload Photo:</label>
      <input type="file" id="photo" name="photo" accept="image/*" required>
    </div>

    <button type="submit">Submit</button>
  </form>

</div>

</body>
</html>
