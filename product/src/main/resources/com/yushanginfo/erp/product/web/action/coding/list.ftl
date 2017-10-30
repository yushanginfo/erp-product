[@b.head/]

<div class="container">

<h5>已编制产品型号</h5>
     <form name="searchform" action="${base}/product/coding/search" method="post">
	 <div class="input-group col-md-4" style="margin-top:0px positon:relative">  
	       <input type="text" name="productModel.code" class="form-control"placeholder="产品型号" value="${Parameters['productModel.code']!}" / >  
	            <span class="input-group-btn"> 
	               <button class="btn btn-info btn-search" >查找</button>  
	               <a class="btn btn-info btn-search" href="${b.url("!editNew")}" style="margin-left:3px">新建</a>  
	            </span>
	 </div>
     </form>
[@b.grid items=productModels var="productModel"]
  [@b.gridbar]
    bar.addItem("${b.text("action.new")}", action.add());
    bar.addItem("${b.text("action.delete")}", action.remove("确认要继续吗？"));
  [/@]
  [@b.row]
    [@b.boxcol/]
    [@b.col property="code" title="编码"/]
    [@b.col property="category.name" title="产品种类"/]
    [@b.col title="条形码"] <img  style="height:30px" src="${base}/code/bar/${productModel.code}.jpg"/>[/@]
    [@b.col property="remark" title="说明"/]
    [@b.col property="updatedAt" title="编码日期"]${productModel.updatedAt?string('yyyy-MM-dd')}[/@]
  [/@]
[/@]
</div>
[@b.foot/]
