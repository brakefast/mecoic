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
            width:110px;
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
            padding-top: 15px;
            padding-bottom: 9px;
            height: 55px;
        }
    </style>
</head>
<body>
<div class="layui-card-body">
    <form class="layui-form" id="worklink">
        <button type="button" value="保存" style="float:left;" id="submit" class="layui-btn layui-btn-normal">保存</button><div>${error}</div>
        <span>工作联系函</span>
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
                    <div class="form-group container">
                        <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="padding-left: 0px;margin-bottom: 0px;">
                            <input class="form-control" name="receiptDate" type="text" value="2019-03-06" readonly="" style="width: 101px;" placeholder="请选择日期" id="receiptDate" style="width: 101px;white-space: nowrap;vertical-align:baseline;">
                            <span class="input-group-addon" style="padding-top: 7px;width: 14px;padding-bottom: 11px;width: 1%;"><span class="glyphicon glyphicon-remove" style="font-size: 20px;"></span></span>
                            <span class="input-group-addon" style="padding-top: 7px;width: 14px;padding-bottom: 11px;width: 1%;"><span class="glyphicon glyphicon-calendar" style="font-size: 20px;"></span></span>
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
                <td class="layui-form-label" id="danjuzt" colspan="2">&nbsp;&nbsp;&nbsp;单据状态&nbsp;&nbsp;&nbsp;</td>
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
    </form>
</div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/formUtils.js"></script>
<script type="text/javascript">
    layui.use('form', function () {
        var form = layui.form;
    });

    layui.use('layer', function () {
        var layer = layui.layer;
    });

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
        return formMod();
    });

    function updatethis(dataId){
        $.ajax({
            url:"worklinkget",
            data:{
                receiptNum:dataId
            },
            dataType:"json",
            success:function(data){
                $("#receiptNum").val(data.receiptNum);
                $("#receiptNum").prop("disabled","disabled");
                $("#receipTheme").val(data.receipTheme);
                $("#receiptDate").val(data.receiptDate);
                $("#ifOutProject").val(data.ifOutProject);
                $("#project").val(data.project);
                $("#pattern").val(data.pattern);
                $("#matterCaption").val(data.matterCaption);
                $("#receiptStatus").val(data.receiptStatus);
                $("#remarks").val(data.remarks);
                layui.form.render();//下拉框有值默认就被选择？
            }
        })
    }

    function formMod() {
        $.ajax({
            type:"POST",
            // dataType:"text",//预期服务器返回的数据类型 //若为json,无法接受字符传返回值
            url:"${pageContext.request.contextPath}/worklink/mod",
            // contentType:"application/json;charset=utf-8",
            dataType:"text",
            // data:JSON.stringify($("#worklink").formSerialize()),//序列化表单信息
            //     data:{
            //
            //     },
            data:FormUtils.convertSimpleForm2ObjectBySelector("#worklink"),
            success:function (data) {//data从服务器返回的数据
                if(data.trim() == "success"){
                    layer.alert("提交成功");
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);//关闭当前窗口
                    parent.location.reload();
                    //frash();//刷新父窗口
                    // parent.location.reload();
                }else{
                    layer.alert("提交失败！");
                }
            },
            error:function () {
                layer.alert("提交错误！");
            }
        });
    }

</script>
</html>
