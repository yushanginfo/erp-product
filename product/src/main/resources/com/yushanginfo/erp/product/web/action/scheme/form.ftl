[@b.head/]
  [@b.toolbar title="方案" + scheme.persisted?string("维护", "新增")]
    bar.addBack();
  [/@]
  [@b.form name="schemeForm" action="!save" target="schemes" theme="list"]
    [#assign styleHTML = "width: 200px"/]
    [@b.textfield label="名称" name="scheme.name" value=scheme.name! required="true" maxlength="200" style=styleHTML/]
    [@b.validity]
      $("[name='scheme.name']", document.schemeForm).require().assert(function() {
        var isOk = false;
        
        $.ajax({
          "type": "post",
          "url": "${b.url("!checkNameAjax")}",
          "async": false,
          "dataType": "json",
          "data": {
            "id": document.schemeForm["scheme.id"].value,
            "name": document.schemeForm["scheme.name"].value
          },
          "success": function(data) {
            isOk = data.isOk;
          }
        });
        
        return isOk;
      }, "名称已存在！！！");
    [/@]
    [@b.select label="产品种类" name="scheme.productCategory.id" items=productCategories?sort_by(["fullName"]) option="id,fullName" empty="..." value=(scheme.productCategory.id)! required="true" style=styleHTML/]
    [@b.startend label="使用时间段" name="scheme.beginOn,scheme.endOn" start=(scheme.beginOn?string("yyyy-MM-dd"))! end=(scheme.endOn?string("yyyy-MM-dd"))! required="true,false"/]
    [@b.formfoot]
      <input type="hidden" name="scheme.id" value="${scheme.persisted?string(scheme.id, "")}"/>
      [@b.submit value="action.submit"/]
    [/@]
  [/@]
[@b.foot/]