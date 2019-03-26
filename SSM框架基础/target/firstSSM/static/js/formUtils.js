 
var FormUtils={
	convertSimpleForm2ObjectBySelector:function(formSelector,obj){
		obj=obj||{};
		var fields=$(formSelector).find("input:text,input:hidden,input:password,select,textarea");
		
		var checkboxFiels = $(formSelector).find("input:checkbox");
		checkboxFiels.each(function(ind,elm){
			fields.push($(elm));
		});
		
		var radioFiels = $(formSelector).find("input:radio:checked");
		radioFiels.each(function(ind,elm){
			fields.push($(elm));
		});
		
		FormUtils.formFieldsToObj(fields,obj);
		return obj;  
	},
	convertSimpleForm2Object:function(formId,obj){
		obj=obj||{};
		FormUtils.convertSimpleForm2ObjectBySelector("#"+formId,obj);
		return obj;  
	},
	convertSimpleForm2ObjectByName:function(formName,obj){
		obj=obj||{};
		FormUtils.convertSimpleForm2ObjectBySelector("form[name='"+formName+"']",obj);
		return obj;  
	},
	formFieldsToObj : function(fields,obj){
		fields.each(function(index,domObj){
			var item=$(domObj);
	        if(item.attr("name")){
	           if(item.attr("type")&&item.attr("type").toLowerCase()=="radio"){	          
	              if(item.attr("checked") && (item.attr("checked")===true || item.attr("checked") =="true" || item.attr("checked") == "checked")){	          
	                 obj[item.attr("name")]=item.val();
	              }
	           }else if(item.attr("type")&&item.attr("type").toLowerCase()=="checkbox"){
		        	 //checked 当复选框用作单选作用时,勾选复选框是value应为true/1/yes或其它,反选复选框时以为false/0/no.
					//<k:checkbox formatRules="{checkedValueMap:{checked:true,unChecked:false}}"/>,
					//<k:checkbox formatRules="{checkedValueMap:{checked:1,unChecked:0}}"/>,
					//<k:checkbox formatRules="{checkedValueMap:{checked:yes,unChecked:no}}"/>,
					//和jq-format-impl.js checkedValueMap 实现方法对应
	        	  if(item.attr("formatRules") && item.attr("formatRules").length>0 && $.parseJSON(item.attr("formatRules")).checkedValueMap){
	        			  obj[item.attr("name")] = item.val();
	        	  }else{
	        		  if(item.attr("checked")!=undefined){
	        			  if(item.attr("checked").length>0 || item.attr("checked") =="true" || item.attr("checked") == "checked"){	          
	        				  obj[item.attr("name")] = item.val();	
	        			  }
	        		  }
	        	  }
	           } else if (FormUtils._containStr(domObj, "datePicker")) {
					var dateStr = item.val();
					//alert(dateStr);
					//alert(dateStr.length);
					if(dateStr.length >0){
						if(dateStr.length == 1){
							obj[item.attr("name")] = null;
						}
						else if (dateStr.length <= 4) {
							obj[item.attr("name")] = new Date(dateStr,0);
						} else if (dateStr.length <= 7) {
							var dateArray = dateStr.split("-");
							if(dateArray.length==2){
								obj[item.attr("name")] = new Date(dateArray[0], dateArray[1] - 1);
							} else {
								if (dateStr.indexOf(':') != -1) {
									obj[item.attr("name")] = dateStr;
								} else {
									obj[item.attr("name")] = null;
								}
							}	
						} else if (dateStr.length <= 10) {
							var dateArray = dateStr.split("-");
							if(dateArray.length==3){
								obj[item.attr("name")] = new Date(dateArray[0], dateArray[1] - 1, dateArray[2]);
							} else {
								obj[item.attr("name")] = null;
							}	
						} else if (dateStr.length <= 16) {
							var spaceIndex = dateStr.indexOf(" ");
							var dateArray = dateStr.substring(0, spaceIndex).split("-");
							var timeArray = dateStr.substring(spaceIndex + 1, dateStr.length).split(":");
							if(dateArray.length==3&&timeArray.length==2){
								obj[item.attr("name")] = new Date(dateArray[0], dateArray[1] - 1, dateArray[2], timeArray[0], timeArray[1], 0);
							} else {
								obj[item.attr("name")] = null;
							}
						} else {
							var spaceIndex = dateStr.indexOf(" ");
							var dateArray = dateStr.substring(0, spaceIndex).split("-");
							var timeArray = dateStr.substring(spaceIndex + 1, dateStr.length).split(":");
							if(dateArray.length==3&&timeArray.length==3){
								obj[item.attr("name")] = new Date(dateArray[0], dateArray[1] - 1, dateArray[2], timeArray[0], timeArray[1], timeArray[2]);
							} else {
								obj[item.attr("name")] = null;
							}
						}
					}
//					} else if(item.attr("name").indexOf('_code_name_value') != -1){// Select Text
//						obj[item.attr("name").substring(0,item.attr("name").indexOf('_code_name_value'))] = item.val();
				} else if(item.attr("name").indexOf('_code_name_filtrateSelect') != -1){
					obj[item.attr("name")] = item.val() == null ? "" : item.val();
				} else if(item.attr("name").indexOf('_code_name_display') != -1
						|| item.attr("name").indexOf('_code_name_config') != -1){// Select Text
					// do nothing
				} else {
					obj[item.attr("name")] = item.val();
				}
			}
	 });
  },
	  convertSimpleForm2OrgObjectBySelector : function(formSelector, obj) {
		obj = obj || {};
		var fields = $(formSelector).find("input,select,textarea");
		fields.each(function(index, domObj) {
			var item = $(domObj);
			if (item.attr("name")) {
				if (item.attr("type") && item.attr("type").toLowerCase() == "radio") {
					if (item.attr("checked") && item.attr("checked") == true) {
						obj[item.attr("name")] = item.val();
					}
				} else if (item.attr("type") && item.attr("type").toLowerCase() == "checkbox") {
					if (item.attr("checked") && (item.attr("checked") === true || item.attr("checked") == "true" || item.attr("checked") == "checked")) {
						obj[item.attr("name")] = true;
					} else {
						obj[item.attr("name")] = false;
					}
				} else {
					obj[item.attr("name")] = item.val();
				}
			}
		});
		return obj;
	},
	
  
	convertSimpleObject2FormBySelector : function(obj,formSelector){
		  var fields=$(formSelector).find("input,select,textarea");
		  FormUtils.obj2FormFields(fields,obj); 
	  },
  convertSimpleObject2Form : function(obj,formId){
	  FormUtils.clearForm(formId);
	  var fields = FormUtils.convertSimpleObject2FormBySelector(obj,"#"+formId);
  },
  
  convertSimpleObject2FormByName : function(obj,formName){
	  FormUtils.clearForm(formName);
	  var fields = FormUtils.convertSimpleObject2FormBySelector(obj,"form[name='"+formName+"']");
  },
  obj2FormFields : function(fields,obj){
     fields.each(function(index,domObj){
	        var item=$(domObj);
	        if(item.attr("name")){
	           if(item.attr("type")&&item.attr("type").toLowerCase()=="radio"){	          
	              if(obj[item.attr("name")]!=null&&obj[item.attr("name")].toString()==item.val()){	          
	                 item.attr("checked",true);
	                 delete obj[item.attr("name")]; 
	              }
	           }else if(item.attr("type")&&item.attr("type").toLowerCase()=="checkbox"){
	        	   
	        	   //checked 当复选框用作单选作用时,勾选复选框是value应为true/1/yes或其它,反选复选框时以为false/0/no.
					//<k:checkbox formatRules="{checkedValueMap:{checked:true,unChecked:false}}"/>,
					//<k:checkbox formatRules="{checkedValueMap:{checked:1,unChecked:0}}"/>,
					//<k:checkbox formatRules="{checkedValueMap:{checked:yes,unChecked:no}}"/>,
					//和jq-format-impl.js checkedValueMap 实现方法对应
	        	   if(item.attr("formatRules") && item.attr("formatRules").length>0 && $.parseJSON(item.attr("formatRules")).checkedValueMap){
	        		   var checkedValueMap = $.parseJSON(item.attr("formatRules")).checkedValueMap;
	        		   if(obj[item.attr("name")]!=null){
	        			   if(checkedValueMap.checked.toString() == obj[item.attr("name")].toString()){
	        				   item.attr("checked",true);
	        			   }else{
	        				   item.removeAttr("checked");
	        			   }
	        			   item.val(obj[item.attr("name")].toString());
	        		   }
	        	   }else{
	        		   if(obj[item.attr("name")]!=null && obj[item.attr("name")].toString() == item.val().toString()){	          
							item.attr("checked",true);
						}else{
							item.removeAttr("checked");
						}
	        	   }
	           } else if(item.attr("type")&&item.attr("type").toLowerCase()=="select-one"){
	           		// select
	           		// modified by Linc 2010-01-21 当值里含有空格时会找不到相应的对象,必需加上引号
	           		var optionItem = $("option[value='"+obj[item.attr("name")]+"']", item);
	           		optionItem.attr("selected", true);
	           }else{
	              if (FormUtils._containStr(domObj, "datePicker")) {
						var dateObj = obj[item.attr("name")];
						if (dateObj) {
							if(dateObj.length >= 0&&dateObj.length <= 5&&dateObj.indexOf(':') != -1){
								item.val(dateObj);
							}else{
								var year = dateObj.getFullYear();
								var month = dateObj.getMonth() + 1;
								if (month < 10) {
									month = "0" + month;
								}
								var date = dateObj.getDate();
								if (date < 10) {
									date = "0" + date;
								}
								var hour = dateObj.getHours();
								if (hour < 10) {
									hour = "0" + hour;
								}
								var minutes = dateObj.getMinutes();
								if (minutes < 10) {
									minutes = "0" + minutes;
								}
								var seconds = dateObj.getSeconds();
								if (seconds < 10) {
									seconds = "0" + seconds;
								}
								var dtmFmt;
								if(fields[index]){
									dtmFmt = FormUtils._returnDateFmt(fields[index], "WdatePicker");
								}
								if(!dtmFmt){
									dtmFmt = 'yyyy-MM-dd HH:mm';
								}
								if (dtmFmt.length > 16) {
									item.val(year+"-"+month+"-"+date+" "+hour+":"+minutes+":"+seconds);
								} else if (dtmFmt.length > 10) {
									item.val(year+"-"+month+"-"+date+" "+hour+":"+minutes);
								} else if (dtmFmt.length > 7) {
									item.val(year+"-"+month+"-"+date);
								} else if (dtmFmt.length > 4) {
									item.val(year+"-"+month);
								} else if (dtmFmt.length > 2){
									item.val(year);
								} else {
									var yearS = year%100;
									if(yearS < 10){
										yearS = '0' + yearS;
									}
									item.val(yearS);
								}
							}
						} else {
							item.val('');
						}
					} else if(item.attr("name").indexOf('_code_name_filtrateSelect') != -1){
						var realName = item.attr("name");
						var hiddenName = item.attr("name").substring(0,item.attr("name").indexOf('_code_name_filtrateSelect'));
						var hiddenObj = $("input[name='"+hiddenName+"']")[0];
						var realObj = $("input[name='"+realName+"']")[0];
						hiddenObj.value = obj[hiddenName] == null ? "" : obj[hiddenName];
						realObj.value = obj[hiddenName] == null ? "" : obj[hiddenName];
					} else if(item.attr("name").indexOf('_code_name_display') != -1){// Select Text
						var realName = item.attr("name").substring(0,item.attr("name").indexOf('_code_name_display'));
//						var hiddenName = realName + '_code_name_value';
						var hiddenName = realName;
						var configName = realName + '_code_name_config';
						var hiddenObj = $("input[name='"+hiddenName+"']")[0];
						var configObj = $("input[name='"+configName+"']")[0];
						var config = configObj.value;
						var astrConfig = config.split(',');
						var entityClassName = null;
						var nameField = null;
						for(var index = 0; index < astrConfig.length; index ++){
							if(astrConfig[index].indexOf('entityClass') != -1){
								entityClassName = astrConfig[index].substring(astrConfig[index].indexOf('=')+2,astrConfig[index].length-1);
							}
							if(astrConfig[index].indexOf('nameField') != -1){
								nameField = astrConfig[index].substring(astrConfig[index].indexOf('=')+2,astrConfig[index].length-1);
							}
						}
						hiddenObj.value = obj[realName];
						var value = '';
						if(obj[realName]){
							value += obj[realName];
							if(entityClassName&&nameField){
								CommonWebService.loadByPk(entityClassName, realName, obj[realName], {
									callback : function(result) {
										if (result) {
											value += '/';
											value += result[nameField];
										}
									},
									async : false
								});
							}
						}
						item.val(value);
//					} else if(item.attr("name").indexOf('_code_name_value') != -1
//							|| item.attr("name").indexOf('_code_name_config') != -1){// Select Text
						// do nothing
					} else if(item.attr("name").indexOf('_code_name_config') != -1){// Select Text
						// do nothing
					} else if(item.attr("name") && item.attr("name").indexOf('_code_nama_showComma') != -1){
						var realName = item.attr("name").substring(0,item.attr("name").indexOf('_code_nama_showComma'));
						//item.val(obj[realName]);
						//2010-04-13 jcc 显示 千分位
						if(obj[realName] == null || obj[realName] == undefined)
							item.val('') ;
						else
							item.val(CommonUtils.getScienceNumber(obj[realName], true)) ;
					} else if(item.attr("type")&&item.attr("type").toLowerCase()=="text"){
					/* var ff = FormUtils._returnNumFmt(fields[index]);
						var aa=obj[item.attr("name")];
						if(ff == null||ff == undefined){
							item.val(obj[item.attr("name")]);
						}   **liucy 2011/3/4*/
						
						/* liucy start 2011/3/4 */
						var objValue = obj[item.attr("name")];
						var ff = FormUtils._returnNumFmt(fields[index]);
						if(objValue == null || objValue == undefined){
							objValue = '';
						}
						if(ff == null||ff == undefined){
							item.val(objValue);
						}
						else{
							var value=eval(ff+"(objValue)");
							item.val(value);
						}/* liucy end 2011/3/4 */
					} else {
						if(obj[item.attr("name")] == null || obj[item.attr("name")] == undefined){
							item.val('');
						} else {
							item.val(obj[item.attr("name")]);
						}
					}
	           }
	        }
	 });
  },

  clearForm4Selector:function(selector){
	  var inputFields=$("input",selector);
	  var textareaFields=$("textarea",selector);
	  var selectFields=$("select",selector);
	  
	  inputFields.each(function(index,domObj){
		  var item=$(domObj);
		  if(item.attr("name") && item.attr("name").indexOf("_gci") == -1){//过滤掉condition隐藏域 Cloud
			  if(item.attr("type")&&item.attr("type").toLowerCase()=="radio"){	              
				  item.removeAttr("checked");	              
			  }else if(item.attr("type")&&item.attr("type").toLowerCase()=="checkbox"){	              
				  item.removeAttr("checked");
			  }else if(item.attr("name").indexOf('_code_name_config')==-1){
				  item.attr("value","");//item.val("")对于select中用空数据的时候会选中空数据的那条 Cloud
			  }
		  }
	 });
	 
	 textareaFields.each(function(index,domObj){
		  var item=$(domObj);
		  item.text("");
	 });
	 
	 selectFields.each(function(index,domObj){
		  var item = $(domObj);
		  $("option",item).eq(0).attr('selected','selected');

		 //清除select2下拉框 add by taiyuan 20161212
		 $("#"+domObj.name).val('');
		 $("#select2-"+domObj.name+"-container").text('')
		 $("#select2-"+domObj.name+"-container").attr('title','')
	 });
	  
     // 解决可输入下拉框清空的问题
     var optionsAIS = $("option[id^='AIS_']",selector);
     optionsAIS.each(function(index, domObj){
    	 domObj.text = '';
    	 domObj.value = '';
     });
  },
  clearForm:function(formId){
     var selector="#"+formId;
     FormUtils.clearForm4Selector(selector);
  },
	disableForm:function(formId,isDisabled){
		var attr="disable";
		$("form[id='"+formId+"'] .layer-date").addClass("readonly");
		if(!isDisabled){
			attr="enable";
			$("form[id='"+formId+"'] .layer-date").removeClass("readonly");
		}
		$("form[id='"+formId+"'] :text").attr("disabled",isDisabled);
		$("form[id='"+formId+"'] textarea").attr("disabled",isDisabled);
		$("form[id='"+formId+"'] select").attr("disabled",isDisabled);
		$("form[id='"+formId+"'] :radio").attr("disabled",isDisabled);
		$("form[id='"+formId+"'] :checkbox").attr("disabled",isDisabled);
		$("form[id='"+formId+"'] :button").attr("disabled",isDisabled);
		$("form[id='"+formId+"'] .layer-date").attr("disabled",isDisabled);

	},
  clearFormWithOutHidden:function(formId){
	     var fields=$("#"+formId+" :input");
	     fields.each(function(index,domObj){
		        var item=$(domObj);
		        if(item.attr("name")){
		           if(item.attr("type")&&item.attr("type").toLowerCase()=="radio"){	              
		                 item.removeAttr("checked");	              
		           }else if(item.attr("type")&&item.attr("type").toLowerCase()=="checkbox"){	              
		                 item.removeAttr("checked");
		           }else if(item.attr("name").indexOf('_code_name_config')==-1){
		              if(item.attr("type")&&item.attr("type").toLowerCase()!="hidden"){
		            	  item.attr("value","");//item.val("")对于select中用空数据的时候会选中空数据的那条 Cloud
		              }
		           }
		        }
		 });
	  },
  _containsClass:function(domObj,clazz){
    var className=domObj.className;
    return (className&&className.indexOf(clazz)!=-1);
  },
  _containStr:function(domObj, str){
	for (var i = 0; i < domObj.attributes.length; i++) {
		var node = domObj.attributes[i];
		if (node && node.nodeValue
				&& typeof node.nodeValue == 'string'
				&& node.nodeValue.indexOf(str) != -1) {
			return true;
		}
	}
	return false;
  },
  _returnDateFmt : function(domObj, id) {
		var strDomAttr = '';
		//Modified by Linc 2009-11-30
		var obj = domObj;
		var objBtn = $("button[onclick*='" + id + "']", 
			domObj.parentNode.parentNode)[0];
		if (objBtn)
			obj = objBtn;
		// readonly为true时,不能找不到此控件dateFormat
//		for (var i = 0; i < obj.attributes.length; i++) {
//			var node = obj.attributes[i];
//			if (node && node.nodeValue
//					&& typeof node.nodeValue == 'string'
//					&& node.nodeValue.indexOf(id) != -1) {
//				strDomAttr = node.nodeValue;
//			}
//		}
//		var beginIndex = strDomAttr.indexOf('{');
//		var endIndex = strDomAttr.indexOf('}');
//		if(beginIndex == -1 || endIndex == -1){
//			return '';
//		}
//		var strAttr = strDomAttr.substring(beginIndex + 1, endIndex);
//		var arrayAttr = strAttr.split(',');
//		var strDtmFmt;
//		for (var i = 0; i < arrayAttr.length; i++) {
//			var attr = arrayAttr[i];
//			if (attr && attr.indexOf('dateFmt') != -1) {
//				var beginI = attr.indexOf(':');
//				strDtmFmt = attr.substring(beginI + 2, attr.length - 1);
//			}
//		}
//		return strDtmFmt;
		return obj.getAttribute("dateFormat");
	},
  _returnNumFmt : function(domObj) {
		var obj = domObj;
		return obj.getAttribute("resultReDefined");
	},
	checkFormModify : function (aFormIds){
		var len = aFormIds.length;
		for(var i = 0; i < len; i++){
			initFileds(aFormIds[i]);
		}
		status = false;
		window.parent.IS_DIRTY_FUNC[window.parent.ACTIVE_TAB_ID] = function(){	
			if(!status){
				var flag = false;
				for(var i = 0; i < len; i++){
					if(checkModification(aFormIds[i])){
						flag = true;
					}
				}
				if(flag){
					return true;
				}
				return false;
			}	
		};
		//取消onbeforeunload事件 
//		window.onbeforeunload = function(){	
//			if(!status){
//				var flag = false;
//				for(var i = 0; i < len; i++){
//					if(checkModification(aFormIds[i])){
//						flag = true;
//					}
//				}
//				if(flag){
//					return '数据已修改，请点击保存按钮。';
//				}
//			}	
//		};
	}	
};