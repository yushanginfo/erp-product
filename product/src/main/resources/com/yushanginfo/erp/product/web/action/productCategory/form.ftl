[@b.head/]
  [@b.toolbar title="产品种类" + productCategory.persisted?string("维护", "新增")]
    bar.addBack();
  [/@]
  [@b.form name="productCategoryForm" action="!save" theme="list"]
    [#assign styleHTML="width:200px"/]
    [@b.textfield label="编码" name="productCategory.code" value=(productCategory.code)! maxlength="50" required="true" style=styleHTML/]
    [@b.validity]
      [#assign productCategoryId = productCategory.persisted?string(productCategory.id, "")/]
      $("[name='productCategory.code']", document.productCategoryForm).require().assert(function() {
        var isOk = false;
        
        var currData = {};
        currData.id = "${productCategoryId}";
        currData.code = $("form[name=productCategoryForm] [name='productCategory.code']").val();
        currData.parentId = [#if productCategory.persisted]$("form[name=productCategoryForm] [name='productCategory.parent.id']").val()[#else]null[/#if];
        
        $.ajax({
          "type": "post",
          "url": "${b.url("!checkCodeAjax")}",
          "dataType": "json",
          "data": currData,
          "async": false,
          "success": function(data) {
            isOk = data.isOk;
          }
        });
        
        return isOk;
      }, "编码已存在！");
    [/@]
    [@b.textfield label="名称" name="productCategory.name" value=(productCategory.name)! maxlength="200" required="true" style=styleHTML/]
    [@b.select label="上级" name="productCategory.parent.id" items=parent option="id,fullNameWithCode" empty="..." value=(productCategory.parent.id)! style=styleHTML/]
    [@b.formfoot]
      <input type="hidden" name="productCategory.id" value="${productCategoryId}"/>
      [@b.submit value="action.submit"/]
    [/@]
  [/@]
[@b.foot/]