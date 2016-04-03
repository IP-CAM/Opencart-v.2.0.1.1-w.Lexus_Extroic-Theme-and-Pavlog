<?php 

$query['pavmegamenu'][]  = "DELETE FROM `".DB_PREFIX ."setting` WHERE `code`='pavmegamenu_params' and `key` = 'pavmegamenu_module'";

$query['pavmegamenu'][]  = "DELETE FROM `".DB_PREFIX ."setting` WHERE `code`='pavmegamenu_params' and `key` = 'params'";
$query['pavmegamenu'][] =  "INSERT INTO `".DB_PREFIX ."setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES(0, 0, 'pavmegamenu_params', 'pavmegamenu_params', '[{\"submenu\":1,\"subwidth\":900,\"id\":40,\"align\":\"aligned-left\",\"group\":0,\"cols\":1,\"rows\":[{\"cols\":[{\"widgets\":\"wid-50\",\"colwidth\":3},{\"widgets\":\"wid-43\",\"colwidth\":4},{\"widgets\":\"wid-51\",\"colwidth\":5}]}]},{\"submenu\":1,\"subwidth\":800,\"id\":2,\"align\":\"aligned-fullwidth\",\"group\":0,\"cols\":3,\"rows\":[{\"cols\":[{\"widgets\":\"wid-52\",\"colwidth\":3},{\"widgets\":\"wid-53\",\"colwidth\":3},{\"widgets\":\"wid-54\",\"colwidth\":3}]}]},{\"submenu\":1,\"id\":19,\"align\":\"aligned-left\",\"group\":0,\"cols\":1,\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]},{\"id\":23,\"group\":0,\"cols\":1,\"submenu\":1,\"align\":\"aligned-left\",\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]},{\"id\":29,\"group\":0,\"cols\":1,\"submenu\":1,\"align\":\"aligned-left\",\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]}]', 0);";


$query['pavverticalmenu'][]  = "DELETE FROM `".DB_PREFIX ."setting` WHERE `code`='pavverticalmenu_params' and `key` = 'params'";
$query['pavverticalmenu'][] ="INSERT INTO `".DB_PREFIX ."setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(0, 0, 'pavverticalmenu_params', 'params', '[{\"id\":2,\"group\":0,\"cols\":3,\"subwidth\":300,\"submenu\":1,\"rows\":[{\"cols\":[{\"widgets\":\"wid-19\",\"colwidth\":12,\"colclass\":\"\"}]}]},{\"submenu\":1,\"subwidth\":500,\"id\":5,\"group\":0,\"cols\":1,\"rows\":[{\"cols\":[{\"widgets\":\"wid-20|wid-22|wid-58\",\"colwidth\":6},{\"widgets\":\"wid-21\",\"colwidth\":5,\"colclass\":\"\"}]}]},{\"id\":7,\"group\":0,\"cols\":1,\"subwidth\":700,\"submenu\":1,\"rows\":[{\"cols\":[{\"widgets\":\"wid-55\",\"colwidth\":6},{\"widgets\":\"wid-56\",\"colwidth\":6}]}]}]', 0);
";

$query['pavblog'][] ="
INSERT INTO `".DB_PREFIX ."layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES(67, 14, 0, 'pavblog/%');";
$query['pavblog'][] ="
INSERT INTO `".DB_PREFIX ."layout` (`layout_id`, `name`) VALUES (14, 'Pav Blog');";
?>