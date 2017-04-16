<%--
  Created by IntelliJ IDEA.
  User: chengwengao
  Date: 2017/4/15
  Time: 1:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <title>mmGrid User list</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>mmGrid document</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1">

    <link rel="stylesheet" href="<%=path %>/mmGrid/examples/css/normalize.css">
    <link rel="stylesheet" href="<%=path %>/mmGrid/examples/css/main.css">
    <link rel="stylesheet" href="<%=path %>/mmGrid/examples/css/960.css">
    <link rel="stylesheet" href="<%=path %>/mmGrid/src/mmGrid.css">
    <link rel="stylesheet" href="<%=path %>/mmGrid/src/mmPaginator.css">
    <!--[if lt IE 9]>
    <script src="<%=path %>/mmGrid/examples/js/vendor/html5shiv.js"></script>
    <script src="<%=path %>/mmGrid/examples/js/vendor/css3-mediaqueries.js"></script>
    <![endif]-->
    <script src="<%=path %>/mmGrid/examples/js/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body>
<main class="container_12">
    <div class="grid_6">
        <h3 >例 2：使用AJAX加载数据</h3>
        <table id="userGrid"></table>
    </div>

</main>
<div class="clear"></div>

<div class="grid-100">
    <table id="table11-1"></table>
    <div style="text-align:right;">
        <div id="paginator11-1"></div>
    </div>
</div>

<script src="<%=path %>/mmGrid/examples/js/vendor/jquery-1.9.1.min.js"></script>
<script src="<%=path %>/mmGrid/examples/js/plugins.js"></script>
<script src="<%=path %>/mmGrid/examples/js/vendor/json2.js"></script>
<script src="<%=path %>/mmGrid/src/mmGrid.js"></script>
<script src="<%=path %>/mmGrid/src/mmPaginator.js"></script>
<script>
    //列
    var cols = [
        { title:'id', name:'id' ,width:150, align:'right'},
        { title:'name', name:'name',width:80, align:'right'},
        { title:'age', name:'age' ,width:65, align:'right'},
        { title:'address', name:'address' ,width:100, align:'right'}
    ];
    //AJAX示例
    $('#userGrid').mmGrid({
        fullWidthRows:true,
        cols: cols,
        url: 'mmGridListUserAjax.do',
        method: 'get'
    });

    //分页,目前分页当选择每页显示的总条数小于数据总条数时显示有问题
//    $('#table11-1').mmGrid({
//        indexCol: true,
//        fullWidthRows:true,
//        indexColWidth: 35,
//        cols: cols,
//        url: 'mmGridListUserPager.do',
//        method: 'get',
//        root: 'items',
//        plugins : [
//            $('#paginator11-1').mmPaginator()
//        ]
//    });
</script>
</body>
</html>

