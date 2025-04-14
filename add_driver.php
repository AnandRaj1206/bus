<?php
include('config.php'); // Or use your existing DB connection include file

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $phone = $_POST['phone'];
    $license = $_POST['license'];
    $bus_number = $_POST['bus_number'];
    $experience = $_POST['experience'];

    $query = "INSERT INTO bus_driver (name, phone, license_number, assigned_bus_number, experience_years)
              VALUES ('$name', '$phone', '$license', '$bus_number', '$experience')";
    
    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Driver added successfully');</script>";
    } else {
        echo "<script>alert('Error: " . mysqli_error($conn) . "');</script>";
    }
}
?>

<h2>Add Bus Driver</h2>
<form method="post">
    <label>Name:</label><input type="text" name="name" required><br>
    <label>Phone:</label><input type="text" name="phone" required><br>
    <label>License Number:</label><input type="text" name="license" required><br>
    <label>Assigned Bus Number:</label><input type="text" name="bus_number"><br>
    <label>Experience (Years):</label><input type="number" name="experience" min="0"><br>
    <input type="submit" value="Add Driver">
</form>
