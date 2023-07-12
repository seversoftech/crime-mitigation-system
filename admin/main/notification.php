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
      loadingImage : 'src/loading.gif',
      closeImage   : 'src/closelabel.png'
    })
  })
</script>
</head>
 


 <script language="javascript" type="text/javascript">
//

var timerID = null;
var timerRunning = false;
function stopclock (){
if(timerRunning)
clearTimeout(timerID);
timerRunning = false;
}
function showtime () {
var now = new Date();
var hours = now.getHours();
var minutes = now.getMinutes();
var seconds = now.getSeconds()
var timeValue = "" + ((hours >12) ? hours -12 :hours)
if (timeValue == "0") timeValue = 12;
timeValue += ((minutes < 10) ? ":0" : ":") + minutes
timeValue += ((seconds < 10) ? ":0" : ":") + seconds
timeValue += (hours >= 12) ? " P.M." : " A.M."
document.clock.face.value = timeValue;
timerID = setTimeout("showtime()",1000);
timerRunning = true;
}
function startclock() {
stopclock();
showtime();
}
window.onload=startclock;
// End -->
</SCRIPT>	

<body>
<?php include('navfixed.php');?>
<div class="container-fluid">
      <div class="row-fluid">
	<div class="span2">
          <div class="well sidebar-nav">
              <ul class="nav nav-list">
              <li><a href="index.php"><i class="icon-dashboard icon-2x"></i> Dashboard </a></li> 
			<li ><a href="users.php"><i class="icon-group icon-2x"></i>Manage Users</a>  </li>
			<li><a href="adduser.php"><i class="icon-user icon-2x"></i>Add User</a>     </li>
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
			<i class="icon-table"></i> Notification
			</div>
			<ul class="breadcrumb">
			<li><a href="index.php">Dashboard</a></li> /
			<li class="active">Notification</li>
			</ul>


<div style="margin-top: -19px; margin-bottom: 21px;">
<a  href="index.php"><button class="btn btn-default btn-large" style="float: left;"><i class="icon icon-circle-arrow-left icon-large"></i> Back</button></a>
<center><?php
	include('../connect.php');
	$id=$_GET['id'];
  $result = $db->prepare("SELECT * FROM  users WHERE id= :userid");
	$result->bindParam(':userid', $id);
	$result->execute();
	for($i=0; $row = $result->fetch(); $i++){
?>
<link href="../style.css" media="screen" rel="stylesheet" type="text/css" />
<form action="notification.php" method="post" enctype="multipart/form-data">
<center><h4><i class="icon-bell icon-large"></i> Notify User</h4></center>
<hr>
<div id="ac">
<input type="hidden" name="memi" value="<?php echo $id; ?>" />
<span>User ID. : </span><input type="text" style="width:265px; height:30px;"  name="id" value="<?php echo $row['id']; ?>" readonly Required/><br>
<span>Full Name : </span><input type="text" style="width:265px; height:30px;"  name="fullname" value="<?php echo $row['fullname']; ?>" readonly Require/><br>
<span>Email : </span><input type="text" style="width:265px; height:30px;"  name="email" value="<?php echo $row['email']; ?>" readonly Require/><br>

<span>Phone : </span><input type	="text" style="width:265px; height:30px;" value="<?php echo $row['phone']; ?>" name="phone" required readonly Require/><br>
<span>Title: </span>
<input type="text" style="width:265px; height:30px;" value = "New Message" name="title" required/><br>

<span>Notification Message: </span>
<textarea style="width:265px; height:50px;" name="message" onfocus="this.value='Your report has been received...'" required></textarea><br><br>


<div >

<button class="btn btn-success btn-block btn-large" style="width:267px;"><i class="icon icon-bell icon-large"></i> Send Notification</button>
</div>
</div>
</form>
<?php
}
?>
</center>


</body>
  <!-- //<?php include('footer.php');?> -->

</html>