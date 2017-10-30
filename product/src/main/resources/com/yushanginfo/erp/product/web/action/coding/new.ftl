[@b.head/]
  [@b.toolbar title="产品型号编制"/]
  [#assign styleHTML = "width: 200px"/]
  [#if scheme?exists]
    [@b.form name="secondForm" action="!save" theme="list"]
      [@b.field label="编码方案"]${scheme.name}<input type="hidden" name="schemeId" value="${scheme.id}"/>[/@]
      [#list scheme.elements?sort_by(["startAt"]) as element]
        [#assign labelName = "第 " + element.startAt + (element.startAt == element.endAt)?string("", "-" + element.endAt) + " 码"/]
        [#if element.codeCategory?exists]
          [#assign codeMap={}]
          [#list element.codeCategory.codes?sort_by("code") as c]
          [#assign codeMap=codeMap+{c.code:c.name}]
          [/#list]
          [@b.radios label=labelName+element.codeCategory.name name=element.id?string items=codeMap  remember="code" eleName=labelName+element.codeCategory.name/]
        [#elseif element.literal?exists]
          [@b.textfield label=labelName name=element.id?string value=element.literal readOnly="readOnly" maxlength=(element.endAt - element.startAt + 1)?string remember="code"/]
        [#else]
          [@b.textfield label=labelName name=element.id?string maxlength=element.endAt - element.startAt + 1 style=styleHTML remember="code"/]
        [/#if]
      [/#list]
      [@b.field label="结果预览"]
       <div valign="top">
      <span id="view">&nbsp;</span>
      <image src='#' style="height:40px" id="resultBarImage"/><image src='#' style="height:80px" id="resultQRImage"/>
      </div>
      [/@]
      [@b.formfoot]
        <input type="hidden" name="productModel.category.id" value="${scheme.productCategory.id}"/>
        <input type="hidden" name="productModel.code" id="resultCode" value=""/>
        <input type="hidden" name="productModel.remark" id="resultRemark" value=""/>
        [@b.submit value="保存"/]
      [/@]
    [/@]
    <script>
      $(function() {
        $(document).ready(function() {
          var elements = $("[remember=code]");
          
          elements.change(function() {
            var result = "";
            var resultRemark = "";
            elements.each(function() {
               var lableName=$('label[for="'+this.id+'"]')[0].innerHTML
              if(this.tagName=='INPUT'){
                 if(this.type=="text"){
                   result += this.value;
                   //resultRemark += lableName+":"+this.value+" ";
                }else if(this.type=="radio"){
                   if(this.checked){
                      result += this.value;
                      var elename=this.attributes['elename'].value;
                      elename=elename.substring(elename.indexOf("码")+1);
                      resultRemark += elename +":"+ lableName+"("+this.value+") ";
                   }
                }
              }else{
                alert("错误的编码成分");
              }
            });
            
            $("#view").text(result);
            $("#resultCode").val(result);
            $("#resultRemark").val(resultRemark);
            if(result){
               $("#resultBarImage").attr('src',  "${base}/code/bar/"+result+".jpg");
               $("#resultQRImage").attr('src',  "${base}/code/qr/"+result+".jpg");
            }
          });
          
          elements.change();
          $(".title").css("width", "150px");
          //$("#view").parent().children().css("font-size", "18pt");
        });
      });
    </script>
  [#else]
    [@b.form name="firstForm" action="!editNew" theme="list"]
      [@b.select label="方案" name="schemeId" items=schemes?sort_by(["name"]) style=styleHTML/]
      [@b.formfoot]
        [@b.submit value="下一步"/]
      [/@]
    [/@]
  [/#if]
[@b.foot/]