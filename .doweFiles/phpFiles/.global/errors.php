<?php



$errorsActive = [
		E_ERROR             => TRUE,
		E_WARNING           => TRUE,
		E_PARSE             => TRUE,
		E_NOTICE            => TRUE,
		E_CORE_ERROR        => TRUE,
		E_CORE_WARNING      => TRUE,
		E_COMPILE_ERROR     => TRUE,
		E_COMPILE_WARNING   => TRUE,
		E_USER_ERROR        => TRUE,
		E_USER_WARNING      => TRUE,
		E_USER_NOTICE       => TRUE,
		E_STRICT            => TRUE,
		E_RECOVERABLE_ERROR => TRUE,
		E_DEPRECATED        => TRUE,
		E_USER_DEPRECATED   => TRUE,
		E_ALL               => TRUE,
	];

	error_reporting(array_sum(array_keys($errorsActive, $search = FALSE)));
	
	//return ini_set('display_errors', TRUE);

?>