<!DOCTYPE html>
<html>
<head>
  <title>OpenConnect device - {{device}}</title>
  <meta http-equiv="refresh" content="60" />

  <link rel="stylesheet" href="/styles.css">
  </head>
<body>
<h2>OpenConnect device details</h2>

<p>
[<a href="/">OpenConnect device inventory</a>] [<a href="/log">Log</a>]
</p>

<h3>Details for device {{device}}</h3>
<table border="1">
<thead>
<tr>
  <th>key</th><th>value</th>
</tr>
</thead>
%for item in data:
<tr>
  <td class="detailkey">{{item}}</td>
  <td class="detailvalue">{{ data[item] }}</td>
</tr>
%end
</table>

<h3>Sensor data for device {{device}}</h3>
<table border="1">
<thead>
<tr>
  <th>key</th><th>value</th>
</tr>
</thead>
%for item in sensor:
<tr>
  <td class="detailkey">{{item}}</td>
  <td class="detailvalue">{{ sensor[item] }}</td>
</tr>
%end
</table>
</body>
</html>
