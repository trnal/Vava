<!DOCTYPE html>

<html>
<head>
<title>Title</title>
</head>
<body>

<h2>HTML Forms</h2>

<form method="POST" action="/order/store">
  Name:<br>
  <input type="text" name="name" value="Title">
  <br>
  Description:<br>
  <input type="text" name="description" value="Description">
  <br><br>
  <input type="submit" value="Submit">
</form> 

<p>If you click the "Submit" button, the form-data will be sent to a page called "/action_page.php".</p>

</body>
</html>