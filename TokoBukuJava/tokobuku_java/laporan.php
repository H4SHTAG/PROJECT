<!DOCTYPE html>
<html>
<head>
	<title>Laporan Penjualan</title>
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
				<td>ID Pelanggan</td>
				<td>Judul</td>
				<td>ID Buku</td>
				<td>Tanggal</td>
				<td>Total</td>
				<td>Uang</td>
				<td>Kembalian</td>
				<td>Jumlah Beli</td>
			</tr>
			<?php 
				$sql = "SELECT * FROM tb_jual";
				$query = mysqli_query($con, $sql);
				while($data = mysqli_fetch_array($query)){
			 ?>
			 <tr>
			 	<td><?php echo $data['id_pelanggan'] ?></td>
			 	<td><?php echo $data['judul'] ?></td>
			 	<td><?php echo $data['id_novel'] ?></td>
			 	<td><?php echo $data['tanggal'] ?></td>
			 	<td><?php echo $data['total'] ?></td>
			 	<td><?php echo $data['uang'] ?></td>
			 	<td><?php echo $data['kembalian'] ?></td>
			 	<td><?php echo $data['stok'] ?></td>
			 </tr>
			 <?php } ?>
		</table>
		<br>
		<table align="center">
			<tr>
			 	<td colspan="7">Jumlah Buku Yang Terjual : </td>
			 	<?php 
			 		$sql = "SELECT SUM(stok) AS jumlah FROM tb_jual";
			 		$jumlah = mysqli_query($con,$sql);
			 		@$data = mysqli_fetch_array($jumlah);
			 	 ?>
			 	<td><?php echo  $data['jumlah']; ?></td>
			 </tr>
		</table>
	</form>

</body>
</html>
<script>
	window.onload=function(){
		window.print();
	}
</script>