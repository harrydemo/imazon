<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Imazon back-end management system</title>
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.5.4.5/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.5.4.5/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="css/imazon.css" />
<script type="text/javascript" src="js/jquery-easyui-1.5.4.5/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.5.4.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.5.4.5/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<style type="text/css">
	.content {
		padding: 10px 10px 10px 10px;
	}
</style>
</head>
<body class="easyui-layout">
    <div data-options="region:'west',title:'Main',split:true" style="width:180px;">
    	<ul id="menu" class="easyui-tree" style="margin-top: 10px;margin-left: 5px;">
         	<li>
         		<span>Inventory</span>
         		<ul>
	         		<li data-options="attributes:{'url':'item-add'}">Add</li>
	         		<li data-options="attributes:{'url':'item-list'}">Inventory List</li>
	         		<li data-options="attributes:{'url':'item-param-list'}">Parameter</li>
	         	</ul>
         	</li>
         	<li>
         		<span>Web Content Management</span>
         		<ul>
	         		<li data-options="attributes:{'url':'content-category'}">Content Category</li>
	         		<li data-options="attributes:{'url':'content'}">Content</li>
	         	</ul>
         	</li>
         </ul>
    </div>
    <div data-options="region:'center',title:''">
    	<div id="tabs" class="easyui-tabs">
		    <div title="Home" style="padding:20px;">
		        	
		    </div>
		</div>
    </div>
    
<script type="text/javascript">
$(function(){
	$('#menu').tree({
		onClick: function(node){
			if($('#menu').tree("isLeaf",node.target)){
				var tabs = $("#tabs");
				var tab = tabs.tabs("getTab",node.text);
				if(tab){
					tabs.tabs("select",node.text);
				}else{
					tabs.tabs('add',{
					    title:node.text,
					    href: node.attributes.url,
					    closable:true,
					    bodyCls:"content"
					});
				}
			}
		}
	});
});
</script>
</body>
</html>