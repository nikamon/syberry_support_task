<?php
  /*No Input*/
  function ConnectToDB()
  {
    $host = "localhost"; //DB host
    $db = "employees_time_reports"; //DB Name
    $user = "root"; //User name
    $pass = ""; //User password
    //Getting DB handler
    $link = mysqli_connect($host, $user, $pass, $db);
    return $link;
  }
  //DB Connection
  $link = ConnectToDB();
  //Initialization
  $outputBufferArray = array(); //Buffer Data Array
  $daysofweek = array("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"); //Days of week
  $maxBufferLength = 0; //Max length of Data
  //Processing
  for ($i=0; $i < 7; $i++) {
    //Main SQL Query
    $result = mysqli_query($link, "select * from `employees` left join (select ROUND(avg(`hours`),2) as 'avg', `employee_id` from `time_reports` where `time_reports`.`date` in (SELECT DISTINCT(`date`) FROM `time_reports` WHERE WEEKDAY(`date`)=$i) group by `employee_id`) a on `employees`.`id` = a.`employee_id` where a.`avg` is not null order by a.`avg` desc limit 3");
    $result_row = "";
    //Processing the Query Result
    while($row = mysqli_fetch_assoc($result)){
      $name = $row["name"];
      //Deleting final zero's
      $hours = floatval($row["avg"]);
      //Making format
      $result_row = $result_row.", $name ($hours hours)";
    }
    //Generating the final output data array
    $outputBufferArray[] = array('date' => $daysofweek[$i],'value' => trim($result_row, ','));
    //Detecting the max string length
    foreach ($outputBufferArray as $key => $value) {
      if(strlen($value["value"]) >$maxBufferLength)
        $maxBufferLength = strlen($value["value"]);
    }
  }
  //Generating an output format
  $mask = "| %-9s |%-".$maxBufferLength."s |\n";
  //Printing
  foreach ($outputBufferArray as $key => $value) {
    printf($mask, $value["date"], $value["value"]);
  }
?>
