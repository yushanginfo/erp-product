[@b.head/]
  [@b.toolbar title="代码"/]
  <table class="indexpanel">
    <tr>
      <td class="index_view">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="codes" theme="search"]
          [@b.textfields names="code.code;代码值,code.name;名称"/]
          [@b.select label="种类" name="code.category.id" items=categories?sort_by(["name"]) option=r"${item.name}(${item.code})" empty="..."/]
        [/@]
      </td>
      <td class="index_content">
        [@b.div id="codes"/]
      </td>
    </tr>
  </table>
  <script>
    $(function() {
      $(document).ready(function() {
        document.title = "代码";
        bg.form.submit("searchForm", "${b.url("!search")}", "codes");
      });
    });
  </script>
[@b.foot/]