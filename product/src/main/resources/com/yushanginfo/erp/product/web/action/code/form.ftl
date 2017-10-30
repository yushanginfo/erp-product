[@b.head/]
  [@b.toolbar title="代码配置<span style=\"color: blue\">(" + code.persisted?string("维护", "新增") + ")</span>"]
    bar.addBack();
  [/@]
  [@b.form name="codeForm" action="!save" target="codes" theme="list"]
    [#assign styleHTML = "width: 200px"/]
    [@b.textfield label="代码值" name="code.code" value=code.code! required="true" maxlength="50" style=styleHTML/]
    [@b.validity]
      $("[name='code.code']", document.codeForm).require().assert(function() {
        return document.codeForm["code.category.id"].value.replace(/\s/gm, "").length != 0;
      }, "请先填选“种类”！！！").assert(function() {
        var isOk = false;
        
        $.ajax({
          "type": "post",
          "url": "${b.url("!checkCodeAjax")}",
          "async": false,
          "dataType": "json",
          "data": {
            "id": ${code.persisted?string(code.id, "null")},
            "code": document.codeForm["code.code"].value,
            "categoryId": document.codeForm["code.category.id"].value
          },
          "success": function(data) {
            isOk = data.isOk;
          }
        });
        
        return isOk;
      }, "在当前“种类”中，该“代码值”已存在！！！");
    [/@]
    [@b.textfield label="名称" name="code.name" value=code.name! required="true" maxlength="200" style=styleHTML comment="即，“代码值”的含义。"/]
    [@b.select label="种类" name="code.category.id" items=categories?sort_by(["name"]) option=r"${item.name}(${item.code})" empty="..." value=(code.category.id)! required="true" style=styleHTML/]
    [@b.formfoot]
      <input type="hidden" name="code.id" value="${code.persisted?string(code.id, "")}"/>
      [@b.submit value="action.submit"/]
    [/@]
  [/@]
[@b.foot/]