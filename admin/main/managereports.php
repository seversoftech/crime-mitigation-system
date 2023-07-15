<html>
<head>
    <title></title>
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
    <script src="jeffartagame.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/application.js" type="text/javascript" charset="utf-8"></script>
    <link href="src/facebox.css" media="screen" rel="stylesheet" type="text/css" />
    <script src="lib/jquery.js" type="text/javascript"></script>
    <script src="src/facebox.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $('a[rel*=facebox]').facebox({
                loadingImage: 'src/loading.gif',
                closeImage: 'src/closelabel.png'
            })
        })
    </script>


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
</script>	
</head>
<body>
<?php include('navfixed.php'); ?>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span2">
            <div class="well sidebar-nav">
                <ul class="nav nav-list">
                    <li><a href="index.php"><i class="icon-dashboard icon-2x"></i> Dashboard </a></li>
                    <li><a href="users.php"><i class="icon-group icon-2x"></i>Manage Users</a></li>
                    <li><a href="adduser.php"><i class="icon-user icon-2x"></i>Add User</a></li>
                    <li class="active"><a href="managereports.php"><i class="icon-laptop icon-2x"></i>Manage
                            Reports</a></li>

                    <br><br>
                    <li>
                        <div class="hero-unit-clock">

                            <form name="clock">
                                <font color="white">Time: <br></font>&nbsp;<input style="width:150px;" type="submit"
                                                                                     class="trans" name="face"
                                                                                     value="">
                            </form>
                        </div>
                    </li>

                </ul>
            </div><!--/.well -->
        </div><!--/span-->
        <div class="span10">
            <div class="contentheader">
                <i class="icon-table"></i>Crime Reports
            </div>
            <ul class="breadcrumb">
                <li><a href="index.php">Dashboard</a></li>
                <li class="active">Reports</li>
            </ul>

            <div style="margin-top: -19px; margin-bottom: 21px;">
                <a href="index.php"><button class="btn btn-default btn-large" style="float: left;"><i
                            class="icon icon-circle-arrow-left icon-large"></i> Back</button></a>
                <?php
                include('../connect.php');
                $result = $db->prepare("SELECT * FROM reports ORDER BY id ASC");
                $result->execute();
                $rowcount = $result->rowcount();
                ?>

                <div style="text-align:center;">
                    Total Number of Crimes Reported: <font color="green"
                                                           style="font:bold 22px 'Aleo';">[<?php echo $rowcount; ?>]</font>
                </div>


            </div>

            <input type="text" style="height:35px; color:#222;" name="filter" value="" id="filter"
                   placeholder="Search Reports..." autocomplete="off"/>
            <table class="hoverTable" id="resultTable" data-responsive="table" style="text-align: left;">
                <thead>
                <tr>
                    <th width="10%">Report ID</th>
                    <th width="15%">Incident</th>
                    <th width="30%">Description</th>
                    <th width="10%">Severity</th>
                    <th width="10%">Location</th>
                    <th width="15%">Date</th>
                    <th width="30%">Image</th>
                    <th width="20%">Reporter</th>
                    <th width="20%">Action</th>
                </tr>
                </thead>
                <tbody>
                <?php
                include('../connect.php');
                $result = $db->prepare("SELECT * FROM reports ORDER BY id DESC");
                $result->execute();
                for ($i = 0; $row = $result->fetch(); $i++) {
                    ?>
                    <tr>
                        <td><?php echo $row['id']; ?></td>
                        <td><?php echo $row['incident']; ?></td>
                        <td><?php echo $row['description']; ?></td>
                        <td><?php echo $row['severity']; ?></td>
                        <td><?php echo $row['location']; ?></td>
                        <td><?php echo $row['date']; ?></td>
                        <td>
                            <?php if (!empty($row['image'])) { ?>
                                <img src="admin/uploads/<?php echo $row['image']; ?>" alt="Crime Scene">
                            <?php } else { ?>
                                No Image
                            <?php } ?>
                        </td>
                        <td><?php echo $row['user_email']; ?></td>
                        <td>
                            <a title="Click to view the report"
                               href="viewreport.php?id=<?php echo $row['id']; ?>">
                                <button class="btn btn-success btn-mini"><i

 class="icon-search"></i> View Report
                                </button>
                            </a>
                            <a title="Click to send notification to user"
                               href="notification.php?id=<?php echo $row['id']; ?>">
                                <button class="btn btn-warning btn-mini"><i class="icon-bell"></i> Send
                                    Notification
                                </button>
                            </a>
                            <a href="#" id="<?php echo $row['id']; ?>" class="delbutton" title="Click to delete">
                                <button class="btn btn-danger btn-mini"><i class="icon-trash"></i> Delete Report
                                </button>
                            </a>
                        </td>
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
    $(function () {
        $(".delbutton").click(function () {
            var element = $(this);
            var del_id = element.attr("id");
            var info = 'id=' + del_id;
            if (confirm("Are you sure you want to delete this report?")) {
                $.ajax({
                    type: "GET",
                    url: "deletereport.php",
                    data: info,
                    success: function () {
                        location.reload();
                        // Handle the success response if needed
                    }
                });
                $(this).parents(".record").animate({backgroundColor: "#fbc7c7"}, "fast")
                    .animate({opacity: "hide"}, "slow");
            }
            return false;
        });
    });
</script>
</body>
</html>
