<!DOCTYPE html>
<html>
<head>
  <title>OpenConnect firmware</title>
  <meta http-equiv="refresh" content="60" />
  <script type="text/javascript" src="jquery.min.js"></script>
  <link rel="stylesheet" href="styles.css">
  </head>
<body>
<h2>OpenConnect device firmware</h2>

<p>
[<a href="/">OpenConnect device inventory</a>] [<a href="/log">Log</a>]
</p>

<h3>Existing Firmware</h3>
<table border="1">
<thead>
<tr>
  <th>firmware</th><th>version</th><th>filename</th><th>size</th><th>description</th><th>delete</th>
</tr>
</thead>
%for path in sorted(fw):
<tr>
%for item in ['firmware', 'version', 'filename', 'size', 'description']:
  %if item in fw[path]:
    <td>{{fw[path][item]}}</td>
  %else:
    <td></td>
  %end
%end
   <td class="delete"><a href="#delete" data-file="/firmware/{{fw[path]["filename"]}}">delete</a></td>
</tr>
%end
</table>

<br>

<h3>Firmware upload</h3>
<form action="/upload" method="post" enctype="multipart/form-data">
  <table border="0">
    <tr><td>Firmware Binary:</td><td><input type="file" name="upload"></td></tr>
    <tr><td>Description:</td><td><input type="text" name="description"></td></tr>
    <tr><td>Upload:</td><td><input type="submit" value="GO!"></td></tr>
  </table>
</form>
<script type="application/javascript">
$('.delete a').bind('click', function (e){
  e.preventDefault();
  var elem = $(this);
  if (confirm("Are you sure to delete the file?")) {
    $.ajax({
      url: $(this).data('file'),
      type: 'DELETE',
      async: true
    })
    .done(function() {
      $(elem).closest('tr').remove();
    })
    .fail(function(e) {
      alert('Error: ' + e.statusText);
    })
  }
  return false;
})
</script>
</body>
</html>
