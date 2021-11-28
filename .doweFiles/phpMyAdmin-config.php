/* phpMyAdmin configuration snippet */

/* Paste it to your config.inc.php */

$cfg['LoginCookieValidityDisableWarning'] = true;
$cfg['ReservedWordDisableWarning'] = true;
$cfg['MaxDbList'] = 10;
$cfg['MaxTableList'] = 10;
$cfg['SkipLockedTables'] = true;
$cfg['FirstLevelNavigationItems'] = 20;
$cfg['MaxNavigationItems'] = 25;
$cfg['NumRecentTables'] = 5;
$cfg['NumFavoriteTables'] = 5;
$cfg['NavigationTreeDisplayItemFilterMinimum'] = 50;
$cfg['NavigationTreeDefaultTabTable'] = 'browse';
$cfg['NavigationTreeDefaultTabTable2'] = 'structure';
$cfg['NavigationWidth'] = 120;
$cfg['ShowAll'] = true;
$cfg['GridEditing'] = 'click';
$cfg['TextareaCols'] = 80;
$cfg['TextareaRows'] = 30;
$cfg['CharTextareaCols'] = 80;
$cfg['CharTextareaRows'] = 4;
$cfg['DisableMultiTableMaintenance'] = true;
$cfg['SendErrorReports'] = 'always';
$cfg['Console']['DarkTheme'] = true;
$cfg['Console']['Mode'] = 'collapse';
$cfg['DefaultTabServer'] = 'databases';
$cfg['PDFDefaultPageSize'] = 'letter';
$cfg['Server']['hide_db'] = 'information_schema|mysql|phpmyadmin|test|performance_schema';
$cfg['Server']['only_db'] = '';
$cfg['2fa'] = array (
  'type' => 'db',
  'backend' => '',
  'settings' => 
  array (
  ),
);
