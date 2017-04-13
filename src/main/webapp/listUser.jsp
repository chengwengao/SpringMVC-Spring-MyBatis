<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User list</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/node_modules/GridManager/css/GridManager.css"/>
<script type="text/javascript" src="<%=path %>/node_modules/GridManager/js/GridManager.js"></script>
</head>
<body>
  	<h3>UserList</h3>
  	<a href="<%=path %>/addUser.jsp">Add User</a><br/>
	<table width="70%" grid-manager="test">

   </table>
   
</body>
<script>
	document.querySelector('table[grid-manager="test"]').GM({
		supportRemind: true
		,i18n:'zh-cn'
		,textConfig:{
			'page-go': {
				'zh-cn':'跳转',
				'en-us':'Go '
			}
		}
		,disableCache:false
		,disableOrder:false
		,supportSorting: true
		,isCombSorting: true
		,sortDownText: 'up'
		,sortUpText: 'down'
		,supportDrag:true
		,supportAjaxPage:true
		,ajax_url: 'gridManager/getUserGrid.do'	//ajax后台请求数据url
		,ajax_type: 'POST'
		,pageSize:30
		,query: {pluginId: 1}
		,columnData: [{
			key: 'id',
			remind: 'the id',
			sorting: 'ASC',
			width: '200px',
			text: 'id'
		},{
			key: 'name',
			remind: 'the name',
			sorting: 'ASC',
			width: '200px',
			text: 'name'
		},{
			key: 'age',
			remind: 'the age',
			width: '200px',
			text: 'age'
		},{
			key: 'address',
			remind: 'the address',
			sorting: 'DESC',
			width: '200px',
			text: 'address'
		},{
			key: 'operation',
			remind: 'the operation',
			sorting: '',
			width: '200px',
			text: 'operation',
			template: function(operation, rowObject){  //operation:当前key所对应的单条数据；rowObject：单个一行完整数据
				return "<a onclick='updateUser(\"" + rowObject.id + "\");' style='cursor: pointer;'>Update</a>" +
					" | <a onclick='deleteUser(\"" + rowObject.id + "\");' style='cursor: pointer;'>Delete</a>";
			}
		}
		]
	});
	function updateUser(id){
	    location.href = "<%=path %>/muserController/updateUserUI.do?id="+id;
	}
    function deleteUser(id){
	    if(!confirm('确认删除吗？')) return;
        location.href = "<%=path %>/muserController/deleteUser.do?id="+id;
    }
</script>
</html>