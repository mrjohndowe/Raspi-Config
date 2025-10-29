<?php
	include_once 'mysql2i.class.php';
	$db_host = 'localhost:3306';
	$db_user = 'root';
	$db_password = '$2y$10$GtBxI7r1/ThCj3fPVkx/y.pxUOyosAXVqePxzYN0/CS/9UoDyW9Ni';
	$db_password = base64_decode('T2N0b2Jlck9uZTQ=');
	
	$connections = [
		'db_user' => $db_user,
		'db_pass' => $db_password,
		'db_host' => $db_host
	];
	
	foreach($connections as $name => $value){
		define ( strtoupper( $name) , $value );
	}
	
	$connect = mysql_connect(DB_HOST , DB_USER , DB_PASS);
	
	if(!$connect){
		die( ' Could not connect: ' . mysql_error());
	}
	
	$dbNames = [
		'localhost_security',
		
	];
	
	$tableNames = [
		'psec_bad-words',
		'psec_bans',
		'psec_bans-country',
		'psec_bans-other',
		'psec_bans-ranges',
		'psec_dnsbl-databases',
		'psec_file-whitelist',
		'psec_ip-whitelist',
		'psec_live-traffic',
		'psec_logins',
		'psec_logs',
		'psec_pages-layolt',
	];
	foreach($tableNames as $name){
		$backupFile = 'db_backup/localhost_security/'.$name.'.sql';
		$sql = "SELECT * INTO OUTFILE '$backupFile' FROM $name";
		mysql_select_db( 'localhost_security' );
		$retval = mysql_query( $sql, $connect);
		
		if(!$retval){
			die(' Could not take data backup: ' .mysql_error());
		}
		echo "Backedup $name - data successfully </br>";
		mysql_close($connect);
		
	}


?>