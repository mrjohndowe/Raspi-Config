<?php
  require_once '.global/extra/functions.php';
  
  echo 'To activate license, put in form any value (example. xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx) <br>';
  echo 'Activation License: '. randCode(8) . '-'. randCode(4) . '-'. randCode(4) . '-' . randCode(12); 

?>