<%--
  Created by IntelliJ IDEA.
  User: 邓增华
  Date: 2019/3/15
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="static/layui/css/layui.css"/>
    <link rel="stylesheet" href="static/css/jqueryui.css"/>
    <link rel="stylesheet" href="static/css/ui.jqgrid.css"/>
    <title>工作联系函</title>
    <style type="text/css">
        body {
            background-color: #F2F2F2;
        }

        .layui-container div {
            padding: 50px;
        }
    </style>
</head>
<body>
<ul class="layui-nav">
    <li class="layui-nav-item">
        <a href=""></a>
    </li>
    <li class="layui-nav-item layui-this">
        <a href="javascript:;">SSM</a>
    </li>
</ul>
<div class="" style="padding:20px;">
    <div>
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12 layui-col-lg12 layui-col-xs12">
                <div class="layui-card">
                    <div class="layui-card-header">工作联系函</div>
                    <div class="layui-card-body layui-row">
                        <div class="layui-col-md12">
                            <label>搜索区域</label>
                        </div>
                        <form class="layui-form" id="searchByTerm">
                            <div class="layui-col-md3">
                                <label class="layui-form-label">单据编号：</label>
                                <div class="layui-input-block">
                                    <input id="receiptNum" class="layui-input" width="10em" name="receiptNum">
                                </div>
                            </div>
                            <div class="layui-col-md3">
                                <label class="layui-form-label">单据主题：</label>
                                <div class="layui-input-block">
                                    <input id="receipTheme" class="layui-input" width="10em" name="receipTheme">
                                </div>
                            </div>
                            <div class="layui-col-md3">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">工程项目：</label>
                                    <div class="layui-input-block">
                                        <select width="10em" id="project" name="project">
                                            <option value="pro1">项目1</option>
                                            <option value="pro2">项目2</option>
                                            <option value="pro3">项目3</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-col-md3">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">类型：</label>
                                    <div class="layui-input-block">
                                        <select width="10em" id="pattern" name="pattern">
                                            <option value="zcqr">驻场确认</option>
                                            <option value="wlqr">网络确认</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <hr class="layui-bg-gray">
                    <div class="layui-card-body">
                        <div class="layui-btn-group">
                            <button class="layui-btn layui-btn-normal" id="addnew">增加</button>
                            <button class="layui-btn" id="open">查看</button>
                            <button class="layui-btn layui-btn-normal" id="update">编辑</button>
                            <button class="layui-btn layui-btn-danger" id="delete">删除</button>
                        </div>
                        <div class="layui-btn-group" style="float:right">
                            <button class="layui-btn layui-btn-normal" id="search">搜索</button>
                        </div>
                        <br><br>
                        <div style="height:40em">
                            <table id="list" class="table"></table>
                            <div id="pager"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://cdn.staticfile.org/jquery/3.3.1/jquery.js"></script>
<script src="static/js/jquery.jqGrid.src.js"></script>
<script src="static/js/grid.locale-cn.js"></script>
<script src="static/layui/layui.js"></script>
<script src="static/js/formUtils.js"></script>
<script>
    layui.use('form', function () {
        var form = layui.form;
    });
    layui.use('layer', function () {
        var layer = layui.layer;
    });
    $(function () {
        $("#list").jqGrid({
            url: 'worklink/queryAll.json',//请求地址URL
            datatype: "json",//请求的数据类型
            contentType: 'application/json',
            height: '85%',
            width: '100%',
            autowidth: true,
            shrinkToFit: true,
            rowNum: 10,//每页显示记录数
            //sortable:true,//可以排序
            //sortorder:"desc"//排序方式：倒叙
            sortname: 'receiptNum',//排序字段名
            multiselect: true,//可多选出现多选框
            multiboxonly: true,
            rownumbers: true,
            viewrecords: true,
            gridview:true,//加速显示
            rowList: [10, 50, 100],//分页选项可以下拉选择每页显示记录数
            colModel: [{//数据列名称（数组） 编写表格的数据源，以json格式展示，有数据的总记录数
                name: 'receiptNum',
                label: '单据编号',
                width: 55
            },
                {
                    name: 'receipTheme',
                    label: '单据主题',
                    width: 55
                },
                {
                    name: 'project',
                    label: '工程项目',
                    width: 55
                },
                {
                    name: 'pattern',
                    label: '类型',
                    width: 55
                }
            ],
            prmNames: {
                page: "currPage",
                rows: "pageSize",
                sort: "sortOrder",
                order: "orderBy"
            },
            pager: "#pager",//表格数据关联的分页条html元素
            jsonReader: {
                id: "receiptNum",//行id唯一标识
                root: "rows",//数据模型
                rows: "pageSize",//包含实际数据的数组
                total: "totalPage",//total总页数
                page: "pageIndex",//page当前页
                records: "total",//records查询出的记录数
                repeatitems: false//jqGrid在解析json时，会根据name(colmodel 指定的name)来搜索对应的数据元素（即可以json中元素可以不按顺序）
            },
            postDate:{
                receiptNum:$("#receiptNum").val(),
                receipTheme:$("#receipTheme").val(),
                project:$("#project").val(),
                pattern:$("#patternF").val()
            },
            loadComplete: function (data) {//完成服务器请求后，毁掉函数

            }

        })

        $('#addnew').on('click', function () {
            layer.open({
                offset: '100px',
                type: 2,
                title: '新建工作联系函',
                maxmin: true,
                shadeClose: true,
                area: ['1000px', '530px'],
                content: '${pageContext.request.contextPath}/worklink/toaddWorkLink'
            });
        })

        $('#update').on('click', function () {
            var selectedId = getSelectRow();
            if (selectedId.length > 1) {
                layer.msg('只能选择一个进行编辑');
            } else if (selectedId.length < 1) {
                layer.msg('你需要选择一个!');
            } else {
                updatethis(selectedId[0]);
            }
        })

        $("#search").click(function () {
            var rn = $("#receiptNum").val();
            var pj = $("#project").val();
            var rt = $("#receipTheme").val();
            var pt = $("#pattern").val();

            if (rn=="" && pj==""&& rt==""&& pt=="" ){
                layer.msg("搜索值不能为空");
            }else{
                search();
            }
        })

        $("#delete").on('click', function () {
            var selectedId = getSelectRow();
            if (selectedId.length >= 1) {
                layer.confirm('您是要删除么？', {
                    btn: ['是', '否']
                }, function () {
                    deletethis(selectedId.join(","))
                }, function () {

                });
            } else {
                layer.msg('您还没有选择！');
            }
        })

        $("#open").click(function () {
            var selectedId = getSelectRow();
            if (selectedId.length > 1) {
                layer.msg('您只能选择一个！');
            } else if (selectedId.length < 1) {
                layer.msg('您需要选择一个!')
            } else {
                showthis(selectedId[0]);
            }
        })

    })

    function getSelectRow() {
        var selected = $("#list").jqGrid('getGridParam', 'selarrrow');
        var selectedId = new Array();
        for (var i = 0; i < selected.length; i++) {
            var rowData = $("#list").jqGrid('getRowData', selected[i]);
            console.log(rowData['receiptNum.receiptNum'])
           // selectedId.push(rowData.receiptNum);
            selectedId.push(rowData.receiptNum);
        }
        return selectedId;
    }

    function inittable() {
        $("#list").jqGrid('clearGridData');
        $("#list").jqGrid({
            url: 'worklink/queryAll.json',
            datatype: "json",
            contentType: "application/json",
        }).trigger("reloadGrid");
    }

    function deletethis(str) {
        $.ajax({
            url: "worklink/delete",
            data: {
                receiptNum: str
            },
            dateType: "text",
            success: function (data) {
                if (data.trim() == "success") {
                    layer.msg("删除成功");
                    inittable();
                } else {
                    layer.msg("删除失败");
                }
            },
            error:function () {
                layer.msg("删除错误!");
            }
        })
    }

    function updatethis(dataId) {
        layer.open({
            offset: '100px',
            type: 2,
            title: '编辑工作联系函',
            maxmin: true,
            shadeClose: true,//点击遮罩关闭层
            area: ['1000px', '600px'],
            content: '${pageContext.request.contextPath}/worklink/toModWorkLink',
            success: function (layero, index) {
                var body = layer.getChildFrame('body', index);
                var iframeWin = window[layero.find('iframe')[0]['name']];//得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                iframeWin.updatethis(dataId);
            }
        });
    }

    function showthis(dataId) {
        layer.open({
            offset: '100px',
            type: 2,
            title: '查看工作联系函',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area: ['1000px', '600px'],
            content: '${pageContext.request.contextPath}/worklink/toaddWorkLink',
            success: function (layero, index) {
                var body = layer.getChildFrame('body', index);
                var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                iframeWin.showthis(dataId);
            }
        });
    }

    function search() {

        $("#list").setGridParam({
            url : "worklink/queryAll.json",
            mtype:"POST",
            postData:{
                receiptNum:$("#receiptNum").val(),
                receipTheme:$("#receipTheme").val(),
                project:$("#project").val(),
                pattern:$("#patternF").val()
            }//发送数据
        }).trigger("reloadGrid");//重新载入
    }

</script>
</html>
