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
			<li class="active"><a href="users.php"><i class="icon-group icon-2x"></i>Manage Users</a>  </li>
			<li><a href="adduser.php"><i class="icon-group icon-2x"></i>Add User</a>     </li>
			<li><a href="managereports.php"><i class="icon-laptop icon-2x"></i>Manage Reports</a>         </li>

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
			<li><a href="index.php">Dashboard</a></li> 
			<li class="active">Users</li>
			</ul>


<div style="margin-top: -19px; margin-bottom: 21px;">
<a  href="index.php"><button class="btn btn-default btn-large" style="float: left;"><i class="icon icon-circle-arrow-left icon-large"></i> Back</button></a>
			<?php 
			include('../connect.php');
				$result = $db->prepare("SELECT * FROM  users ORDER BY id ASC");
				$result->execute();
				$rowcount = $result->rowcount();
			?>
			
		
				<div style="text-align:center;">
			Total Number of Users:  <font color="green" style="font:bold 22px 'Aleo';">[<?php echo $rowcount;?>]</font>
			</div>
			
			
</div>


<input type="text" style="height:35px; color:#222;" name="filter" value="" id="filter" placeholder="Search Users..." autocomplete="off" />
<!-- <a href="adduser.php"><Button type="submit" class="btn btn-info" style="float:right; width:230px; height:35px;" /><i class="icon-plus-sign icon-large"></i> Add User</button></a><br><br> -->
<table class="hoverTable" id="resultTable" data-responsive="table" style="text-align: left;">
	<thead>
		<tr>
			<th width="5%">  User ID</th>
			<th width="20%"> Full Name </th>
			<th width="10%"> Email </th>
			<th width="10%"> Address </th>
			<th width="10%"> Phone </th>
			<th width="15%"> Action </th>
		</tr>
	</thead>
	<tbody>
		
			<?php
			
				include('../connect.php');
				$result = $db->prepare("SELECT * FROM users ORDER BY id DESC");
				$result->execute();
				for($i=0; $row = $result->fetch(); $i++){
				
			?>
		
<td><?php echo $row['id']; ?></td>
			<td><?php echo $row['fullname']; ?></td>
			<td><?php echo $row['email']; ?></td>
			<td><?php echo $row['address']; ?></td>
			<td><?php echo $row['phone']; ?></td>
			<td><a title="Click to view the user" href="viewuser.php?id=<?php echo $row['id']; ?>"><button class="btn btn-success btn-mini"><i class="icon-search"></i> View</button> </a>
			<a  title="Click to edit the user" href="edituser.php?id=<?php echo $row['id']; ?>"><button class="btn btn-warning btn-mini"><i class="icon-edit"></i> Edit</button> </a>
			<a  title="Click to delete" href="#" id="<?php echo $row['id']; ?>" class="delbutton"><button class="btn btn-danger btn-mini"><i class="icon-trash"></i> Delete</button></a></td>
			</tr>
			<?php
				}
			?>
		
		
		
	</tbody>
</table>
<div class="clearfix"></div>
</div>
</div>
</div>

<script src="js/jquery.js"></script>
<script type="text/javascript">
$(function() {
  $(".delbutton").click(function() {
    var element = $(this);
    var del_id = element.attr("id");
    var info = 'id=' + del_id;
    if (confirm("Are you sure you want to delete this user?")) {
      $.ajax({
        type: "GET",
        url: "deleteuser.php",
        data: info,
        success: function() {
          // Handle the success response if needed
        }
      });
      $(this).parents(".record").animate({ backgroundColor: "#fbc7c7" }, "fast")
        .animate({ opacity: "hide" }, "slow");
    }
    return false;
  });
});
</script>
</body>

</body>
</body>


</html>