[@b.head/]
  [@b.toolbar title="代码种类" + (codeCategory.persisted)?string("维护", "新增")]
    bar.addBack();
  [/@]
  [@b.form name="codeCategoryForm" action="!save" theme="list"]
    [#assign styleHTML = "width: 200px"/]
    [@b.textfield label="编码" name="codeCategory.code" value=(codeCategory.code)! required="true" maxlength="50" style=styleHTML/]
    [@b.validity]
      $("[name='codeCategory.code']", document.codeCategoryForm).require().assert(function() {
        var isOk = false;
        
        $.ajax({
          "type": "post",
          "url": "${b.url("!checkCodeAjax")}",
          "async": false,
          "dataType": "json",
          "data": {
            "id": ${codeCategory.persisted?string(codeCategory.id, "null")},
            "code": document.codeCategoryForm["codeCategory.code"].value
          },
          "success": function(data) {
            isOk = data.isOk;
          }
        });
        
        return isOk;
      }, "编码已存在！！！");
    [/@]
    [@b.textfield label="名称" name="codeCategory.name" value=(codeCategory.name)! required="true" maxlength="200" style=styleHTML/]
    [@b.formfoot]
      <input type="hidden" name="codeCategory.id" value="${codeCategory.persisted?string(codeCategory.id, "")}"/>
      [@b.submit value="action.submit"/]
    [/@]
  [/@]
[@b.foot/]