function goPage(pageNum) {
          
              var f=   document.forms[0];
              
              if(pageNum>document.getElementById("totalPages").value)
              {
            	  alert("跳转页超出总页数！");
            	  return false;
              }
              document.getElementById("paginator.currentPage").value=pageNum;
              var regex = /^[0-9]{1,}$/;
				if (!regex.test(pageNum)) {
					alert("跳转页只能由数字组成！！");
					document.getElementById("intputCurrentPage").value='1';
					return false;
				}
			   f.submit();
	}
	
	
	function ajaxSbmitTarget(newAction){
		 var options = {
		        target:    "#listpage",
		        data:       "", 
			    type:       'post',
			    success: successMethod
			     };
			 var formId =document.forms[0].id;
			 document.forms[0].action=newAction;
			 var submitObj ='#'+formId;
			  $(submitObj).ajaxSubmit(options);
	 }		
		function ajaxGoPage(currNum){
		 var options = {
		        target:    "#listpage",
		        data:       "", 
			    type:       'post',
			    success: successMethod
			     };
			    document.getElementById("paginator.currentPage").value=currNum;
			 var formId =document.forms[0].id;
			 var submitObj ='#'+formId;
			  $(submitObj).ajaxSubmit(options);
	 }		   
			   
	function successMethod(msg){
			 document.getElementById("showpage").innerHTML=document.getElementById("jscode").value;
     }     			   
	//验证checkBox是否选择
   function checkBoxIsChecked(checkName){
    var c=  document.getElementsByName(checkName);
    var k=0;
    for(var i=0;i<c.length;i++){
      if(c[i].checked){
        k++;
         break;
         }
    }
    if(k>0){
      return true;
      }
      else{
        alert("至少选择一个再进行提交!");
        return false;
      }
   }			   