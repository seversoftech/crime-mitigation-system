<html>

<head>
	<title>

	</title>

	<?php
	require_once('auth.php');
	?>
	<link href="css/bootstrap.css" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="css/DT_bootstrap.css">

	<link rel="stylesheet" href="css/font-awesome.min.css">
	<style type="text/css">
		body {
			padding-top: 60px;
			padding-bottom: 40px;
		}

		.sidebar-nav {
			padding: 9px 0;
		}
	</style>
	<link href="css/bootstrap-responsive.css" rel="stylesheet">

	<link href="../style.css" media="screen" rel="stylesheet" type="text/css" />
	<!--sa poip up-->
	<script src="jeffartagame.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/application.js" type="text/javascript" charset="utf-8"></script>
	<link href="src/facebox.css" media="screen" rel="stylesheet" type="text/css" />
	<script src="lib/jquery.js" type="text/javascript"></script>
	<script src="src/facebox.js" type="text/javascript"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$('a[rel*=facebox]').facebox({
				loadingImage: 'src/loading.gif',
				closeImage: 'src/closelabel.png'
			})
		})
	</script>
</head>



<script language="javascript" type="text/javascript">
	//

	var timerID = null;
	var timerRunning = false;

	function stopclock() {
		if (timerRunning)
			clearTimeout(timerID);
		timerRunning = false;
	}

	function showtime() {
		var now = new Date();
		var hours = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds()
		var timeValue = "" + ((hours > 12) ? hours - 12 : hours)
		if (timeValue == "0") timeValue = 12;
		timeValue += ((minutes < 10) ? ":0" : ":") + minutes
		timeValue += ((seconds < 10) ? ":0" : ":") + seconds
		timeValue += (hours >= 12) ? " P.M." : " A.M."
		document.clock.face.value = timeValue;
		timerID = setTimeout("showtime()", 1000);
		timerRunning = true;
	}

	function startclock() {
		stopclock();
		showtime();
	}
	window.onload = startclock;
	// End -->
</script>

<body>
	<?php include('navfixed.php'); ?>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2">
				<div class="well sidebar-nav">
					<ul class="nav nav-list">
						<li><a href="index.php"><i class="icon-dashboard icon-2x"></i> Dashboard </a></li>
						<li class="active"><a href="users.php"><i class="icon-group icon-2x"></i>Manage Users</a></li>
						<li><a href="adduser.php"><i class="icon-user icon-2x"></i>Add User</a></li>
						<li><a href="managereports.php"><i class="icon-laptop icon-2x"></i>Manage Reports</a></li>

						<br><br>
						<li>
							<div class="hero-unit-clock">

								<form name="clock">
									<font color="white">Time: <br></font>&nbsp;<input style="width:150px;" type="submit" class="trans" name="face" value="">
								</form>
							</div>
						</li>

					</ul>
				</div><!--/.well -->
			</div><!--/span-->
			<div class="span10">
				<div class="contentheader">
					<i class="icon-table"></i> Users
				</div>
				<ul class="breadcrumb">
					<li><a href="index.php">Dashboard</a></li> /
					<li class="active">Users</li>
				</ul>


				<div style="margin-top: -19px; margin-bottom: 21px;">
					<a href="users.php"><button class="btn btn-default btn-large" style="float: left;"><i class="icon icon-circle-arrow-left icon-large"></i> Back</button></a>

					<?php
					include('../connect.php');
					$id = $_GET['id'];
					$result = $db->prepare("SELECT * FROM  users WHERE id= :userid");
					$result->bindParam(':userid', $id);
					$result->execute();
					for ($i = 0; $row = $result->fetch(); $i++) {
					?>
						<link href="../style.css" media="screen" rel="stylesheet" type="text/css" />
						<center>
							<h4><i class="icon-edit icon-large"></i> User Details</h4>
						</center>
						<hr>
						<center><img src="../images/icon.png" class="roundimage2" alt="icon image" />
							<br><br>

							<table>
								<tr>
									<td> User ID. : </td>
									<td style="padding: 10px;
				border-top: 1px solid #fafafa;
				background-color: #f4f4f4;
				text-align: center;
				color: #7d7d7d;"> <?php echo $row['id']; ?></td>
								</tr>
								<tr>
									<td> Full Name : </td>
									<td style="padding: 10px;
				border-top: 1px solid #fafafa;
				background-color: #f4f4f4;
				text-align: center;
				color: #7d7d7d;"> <?php echo $row['fullname']; ?></td>
								</tr>
								<tr>
									<td> Email: </td>
									<td style="padding: 10px;
				border-top: 1px solid #fafafa;
				background-color: #f4f4f4;
				text-align: center;
				color: #7d7d7d;"> <?php echo $row['email']; ?></td>
								</tr>
								<tr>
									<td> Address: </td>
									<td style="padding: 10px;
				border-top: 1px solid #fafafa;
				background-color: #f4f4f4;
				text-align: center;
				color: #7d7d7d;"> <?php echo $row['address']; ?></td>
								</tr>
								<tr>
									<td> Phone : </td>
									<td style="padding: 10px;
				border-top: 1px solid #fafafa;
				background-color: #f4f4f4;
				text-align: center;
				color: #7d7d7d;"> <?php echo $row['phone']; ?></td>
								</tr>
								<tr>
									<td> Total Reports: </td>
									<td style="padding: 10px;
				border-top: 1px solid #fafafa;
				background-color: #f4f4f4;
				text-align: center;
				color: #7d7d7d;">
										<!-- <?php echo $row['']; ?> -->
										<?php echo "Number of reports will appear here"; ?>
									</td>
								</tr>
								<tr>


							</table>
							<br>

						</center>

				</div>
			<?php
					}
			?>


</body>


</html>