<%--
  Created by IntelliJ IDEA.
  User: DZH
  Date: 2019/3/4
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>工作联系函</title>
    <meta charset="utf-8">
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/static/css/jqueryui.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/css/ui.jqgrid.css" rel="stylesheet" />
    <style type="text/css">
        table{
            margin-left: 15px;
        }
        form span{
            display:block;
            text-align:center;
            font-weight:bold;
            padding: 0em 0em 0em 0em;
            font-size:30px;
        }
        #djnumtext{
            width:110px;
            padding: 25px 20px;
        }
        #receiptnum{
            width:100px;
            margin-right: -50px;
        }
        #djzttext{
            width:120px;
            padding-left:15px;
        }
        #receiptheme{
            width:100px;
            margin-right:-50px;
        }
        #djrqtext{
            width:110px;
            padding-bottom: 25px;
            padding-right: 25px;
        }
        #sfwbxmtext{
            font-size: small;
            width: 110px;
            padding-bottom: 20px;"
        }
        #danjuzt{
            width: 130px;
            height: 55px;
            padding-right: 34px;
        }
        ul#nav{width:100%;
            heigght:60px;
            background: #00A2CA;
            margin:0 auto}
        ul#nav li{
            display:inline;
            height: 60px;
        }
        ul#nav li a{
            display:inline-block;
            padding:17px 60px;
            /*height:60px;*/
            color:#FFF;
            font-family:"\5FAE\8F6F\96C5\9ED1";
            font-size:16px
        }
        ul#nav li a:hover{
            background: #0095BB;/*设置鼠标滑过或悬停时变化的背景颜色*/
        }
        ol,ul,li{
            list-style:none;
        }
        body{
            color:#000000;
            background:#FFF;
            /*text-align:center;*/
            vertical-align:middle;
        }
        body, div, ul, li{
            margin:0;
            padding:0;
            font-style: normal;
            font:12px/22px "\5B8B\4F53",Arial, Helvetica, sans-serif
        }

        input#brokerage #taskCreateTime{
            padding-left: 10px;
            line-height: 1.3;
            /*line-height: 38px\9;*/
            /*border-width: 1px;*/
            /*border-style: solid;*/
            background-color: #fff;
            border-radius: 2px;
            outline:0;
            box-sizing:border-box;
            margin:0;
            /*padding:0px;*/
            text-rendering: auto;
            color: initial;
            letter-spacing: normal;
            word-spacing: normal;
            text-transform: none;
            text-indent: 0px;
            text-shadow: none;
            text-align: start;
            font: 400 13.3333px Arial;
            height: 40px;
            width: 179px;
        }

    </style>
</head>
<body>
<div class="layui-card-body">
    <form class="" id="worklink">
        <button type="button" value="保存" style="float:left;" id="submit" class="layui-btn layui-btn-normal">保存</button><div>${error}</div>
        <span id="workTitle">工作联系函</span>
        <table class="layui-form-item">
            <tr class="layui-form-item">
                <td class="layui-form-label" id="djnumtext">单据编号</td>
                <td style="width: 122px;"><input class="layui-input" type="text" name="receiptNum" value="" id="receiptNum"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td id="djzttext">单据主题</td>
                <td style="width: 124px;">
                    <input class="layui-input" type="text" name="receipTheme" id="receipTheme" value="">
                </td>
                <td class="layui-form-label" id="djrqtext">单据日期</td>
                <td>
                    <div class="form-group container" style="padding-left: 0px;margin-bottom: 0px;">
                        <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                            <input class="form-control" name="receiptDate" type="text" value="2019-03-06" readonly="" style="width: 101px;white-space: nowrap;vertical-align:baseline;" placeholder="请选择日期" id="receiptDate">
                            <span class="input-group-addon" style="padding-top: 7px;width: 14px;padding-bottom: 11px;width: 1%;">
                                <span class="glyphicon glyphicon-remove" style="font-size: 20px;"></span>
                            </span>
                            <span class="input-group-addon" style="padding-top: 7px;padding-bottom: 11px;">
                                <span class="glyphicon glyphicon-calendar" style="font-size: 20px;"></span>
                            </span>
                        </div>
                        <%--<input type="hidden" id="dtp_input2" value="" /><br/>--%>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="layui-form-label" id="sfwbxmtext">是否外部项目</td>
                <td class="layui-input-block">
                    <select name="ifOutProject" id="ifOutProject">
                        <option value="1">是</option>
                        <option value="0">否</option>
                    </select>
                </td>
                <td class="layui-iform-label" style="padding-left: 13px;">工程项目</td>
                <td class="layui-input-block">
                    <select name="project" style="width: 160px;" id="project">
                        <option value="pro1">项目1</option>
                        <option value="pro2">项目2</option>
                        <option value="pro3">项目3</option>
                    </select>
                </td>
                <td>
                    <label class="layui-form-label">类型</label>
                </td>
                <td>
                    <select name="pattern" id="pattern" lay-verify="required">
                        <option value="zcqr">驻场确认</option>
                        <option value="wlqr">网络确认</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 20px;">事项说明</td>
                <td colspan="3">
                    <textarea name="matterCaption" id="matterCaption" rows="2" cols="60"></textarea>
                </td>
                <td class="layui-form-label" id="danjuzt" colspan="2">单据状态</td>
                <td>
                    <div>
                        <select name="receiptStatus" style="width: 160px;" id="receiptStatus" lay-verify="required">
                            <option value="wss">未送审</option>
                            <option value="yss">已送审</option>
                        </select>
                    </div>
                </td>

            </tr>
            <tr>
                <td style="padding-left: 35px;">备注</td>
                <td colspan="8">
                    <textarea name="remarks" rows="3" cols="100" id="remarks"></textarea>
                </td>
            </tr>
        </table>
        <hr style="padding: 0px;margin: 0px">
        <div>
            <div>
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md12 layui-col-lg12 layui-col-xs12">
                        <div class="layui-card">
                            <div class="layui-card-body">
                                <div class="layui-btn-group" style="margin-bottom: 15px">
                                    <div class="layui-card-header" style="display: inline">工作联系任务</div>
                                    <button class="layui-btn layui-btn-normal" id="addnew">增加</button>
                                    <button class="layui-btn layui-btn-danger" id="delete">删除</button>
                                </div>
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
    </form>
</div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/formUtils.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/grid.locale-cn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.jqGrid.src.js"></script>
<script type="text/javascript">
    layui.use('form', function () {
        var form = layui.form;
    });

    layui.use('layer', function () {
        var layer = layui.layer;
    });

    function usejqGrid(dataId){
        $("#list").jqGrid({
            url: '${pageContext.request.contextPath}/worklinkTask/querySubList.json?receiptNum='+dataId,
            datatype:'json',
            rowNum:10,
            rowList:[10,20,30],
            pager: '#pager',//表格数据关联的分页条html元素
            sortName: 'taskId',
            contentType: 'application/json',
            width: '100%',
            height: '65%',
            autowidth: true,
            multiselect: true,
            multiboxonly: true,
            rownumbers: true,
            viewrecords: true,
            shrinkToFit: true,//此属性用来说明当初始化列宽度时候的计算类型，如果为ture，则按比例初始化列宽度。如果为false，则列宽度使用colModel指定的宽度
            gridview: true,//加速显示
            colModel:[
                {
                    name:'taskId',
                    label:'任务id',
                    width:20,
                    hidden:true,
                    key:true
                },
                {
                    name:'taskCreateTime',
                    label:'单据创建日期',
                    width:55
                },
                {
                    name:'brokerage',
                    label:'经办人',
                    width:55
                },
                {
                    name:'tradeType',
                    label:'交易方式',
                    width:55}
            ],
            prmNames: {
                page:'currPage',
                rows:'pageSize',
                sort:'sortOrder',
                order:'orderBy'
            },
            jsonReader:{
                id:'taskId',
                root:'rows',//数据模型
                rows:'pageSize',
                total:'totalPage',
                page:'pageIndex',
                records :'total',
                repeatitems:false
            }
        })
    }

    function getNow(s){
        return s<10?'0'+s:s;
    }

    if($('#date').val() == null){
        var myDate = new Date();
        var month = myDate.getMonth()+1;
        var yyr = myDate.getFullYear() +'-' + getNow(month) + '-' + getNow(myDate.getDate());
        $('#date').val(yyr);
    }
    $('.form_date').datetimepicker({
        value:'2019-03-18',
        language: 'zh-CN',
        weekStart: 1,
        todayBtn:  true,
        autoclose: true,
        todayHighlight: 1,
        defaultDate: true,
        startView: 2,
        minView: 2,
        forceParse: 0,
        format: 'yyyy-mm-dd',
        formatDate: 'yyyy-mm-dd',
        startDate:'2019-01-01',
        validateOnBlur:true,
        onChangeDateTime:function (dateText, inst) {
            console.log(dateText);
        }
    });
    console.log($(".form_date").find("input").val());
    $('#submit').click(function () {
        return validateForm();
    });

    function showthis(dataId) {
        $("#workTitle").remove();
        $("#submit").remove();
        $("input").css({"background-color": "#F2F2F2", "color": "#000000"})
        $("textarea").css({"background-color": "#F2F2F2", "color": "#000000"})
        $("select").css({"background-color": "#F2F2F2", "color": "#000000"})
        $.ajax({
            url: "worklinkget",
            data: {
                receiptNum: dataId
            },
            dateType: "json",
            success: function (data) {
                $("#receiptNum").val(data.receiptNum);
                $("#receiptNum").attr("disabled", "disabled");
                $("#receipTheme").val(data.receipTheme);
                $("#receipTheme").attr("disabled", "disabled");
                $("#ifOutProject").val(data.ifOutProject);
                $("#ifOutProject").attr("disabled", "disabled");
                $("#project").val(data.project);
                $("#project").attr("disabled", "disabled");
                $("#pattern").val(data.pattern);
                $("#pattern").attr("disabled", "disabled");
                $("#matterCaption").val(data.matterCaption);
                $("#matterCaption").attr("disabled", "disabled");
                $("#receiptStatus").val(data.receiptStatus);
                $("#receiptStatus").attr("disabled", "disabled");
                $("#receiptDate").val(data.receiptDate);
                $("#receiptDate").attr("disabled", "disabled");
                $("#remarks").val(data.remarks);
                $("#remarks").attr("disabled", "disabled");
                usejqGrid(dataId);
                layui.form.render();
            }
        })

    }

    function frash() {
        location.reload();
    }

    function validateForm() {
        var num = $("#receiptNum").val();
        if(num != ''){
            var bds = /^[A-Za-z0-9]+$/;
            if(!bds.test(num)){
                layer.alert('单据编号为英文跟数字的组合');
                $("#receiptNum").focus();
                return false;
            }
            // var _data = {
            //     receiptNum:$("#receiptNum").val(),
            //     receipTheme:$("#receipTheme").val(),
            //     ifOutProject:$("#ifOutProject").val(),
            //     project:$("#project").val(),
            //     pattern:$("#pattern").val(),
            //     matterCaption:$("#matterCaption").val(),
            //     receiptStatus:$("#receiptStatus").val(),
            //     receiptDate:$("#receiptDate").val(),
            //     remarks:$("#remarks").val()
            // }

            $.ajax({
                type:"post",
                // dataType:"text",//预期服务器返回的数据类型 //若为json,无法接受字符传返回值
                url:"${pageContext.request.contextPath}/worklink/save",
                // contentType:"application/json;charset=utf-8",
                dataType:"text",

            //     data:{
            //
            //     },//序列化表单信息
                data:FormUtils.convertSimpleForm2ObjectBySelector("#worklink"),
                success:function (data) {//data从服务器返回的数据
                    if(data.trim() == "success"){
                        layer.alert("提交成功");
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);//关闭当前窗口
                        //parent.frash();//刷新父窗口
                        parent.location.reload();
                        // parent.location.reload();
                    }else{
                        layer.alert("提交失败！");
                    }
                },
                error:function () {
                    layer.alert("提交错误！");
                }
            });
            console.log($("#worklink").formSerialize());
            console.log($("#worklink").serialize());
        }else{
            layer.alert('单据编号未输入');
            $("#receiptNum").focus();
            return false;
        };
    }

</script>
</html>
