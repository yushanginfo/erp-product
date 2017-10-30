[#assign title][#if enterprises?size>0]${enterprises?first.name}[#else]某工厂[/#if]产品编码系统[/#assign]

[@b.head title=title/]

  <div class="container" style="margin-top:300px">
   <div class="row">
      <div class="col-md-2"></div>
      <h4  class="col-md-8" style="text-align:center">产品编码系统</h4>
   </div>
   <div class="row">
     <div class="col-md-2"></div>
     <form name="searchform" action="${base}/product/coding/search" method="post">
	 <div class="input-group col-md-8" style="margin-top:0px positon:relative">  
	       <input type="text" name="productModel.code" class="form-control"placeholder="产品型号" / >  
	            <span class="input-group-btn"> 
	               <button class="btn btn-info btn-search" >查找</button>
	               <a class="btn btn-info btn-search" href="${b.url("!editNew")}" style="margin-left:3px">新建</a>  
	            </span>
	 </div>
     </form>
	</div>
	
	<div class="row">
      <div class="col-md-2"></div>
      <div class="col-md-8" style="text-align:center" ><span>从${productModelCount}条中查找</span></div>
   </div>
</div>
 
 [@b.foot/]