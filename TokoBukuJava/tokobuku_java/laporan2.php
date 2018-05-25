<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<?php 
	$server = "localhost";
	$user   = "root";
	$pass   = "";
	$db     = "db_novel";

	$con    = mysqli_connect($server,$user,$pass,$db);
 ?>
 	<form method="post">
 		<hr>
			<h1 align="center" style="font-family: Segoe UI Semibold;">NOVEL STORE SNI</h1>
			<p style="width: 350px;display: block;margin-right: auto;margin-left: auto;">Jl. Caringin deket mesjid masuk kedalem gang 24 Jam Telp:(08787120xxx) Email:novelstoresni@gmail.com</p>
		<hr>
		<table align="center" border="1">
			<tr>
				<td>ID Novel</td>
				<td>Judul</td>
				<td>Pengarang</td>
				<td>Tanggal</td>
				<td>Stok</td>
				<td>Kategori</td>
				<td>Harga</td>
			</tr>
			<?php 
				$sql = "SELECT * FROM tb_stok";
				$query = mysqli_query($con, $sql);
				while($data = mysqli_fetch_array($query)){
			 ?>
			 <tr>
			 	<td><?php echo $data['id_novel'] ?></td>
			 	<td><?php echo $data['judul'] ?></td>
			 	<td><?php echo $data['pengarang'] ?></td>
			 	<td><?php echo $data['tahun'] ?></td>
			 	<td><?php echo $data['stok'] ?></td>
			 	<td><?php echo $data['kategori'] ?></td>
			 	<td><?php echo $data['harga'] ?></td>
			 </tr>
			 <?php } ?>
		</table>
 	</form>
</body>
</html>