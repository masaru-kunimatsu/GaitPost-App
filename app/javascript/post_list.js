window.addEventListener('load', function(){
  const post_lists = document.querySelectorAll(".post-list, .search-post-list");
  post_lists.forEach(function(post_list) {
    post_list.addEventListener('mouseover', function() {
      this.setAttribute("style", "box-shadow: 0 10px 25px 0 rgba(0, 0, 0, 0.5);");
    });
    post_list.addEventListener('mouseout', function() {
      this.removeAttribute("style", "box-shadow: 0 10px 25px 0 rgba(0, 0, 0, 0.5);");
    });
  });
});