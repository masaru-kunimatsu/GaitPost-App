document.addEventListener("DOMContentLoaded", () => {
  const tagNameInput = document.querySelector("#post_form_tag_name");
  if (tagNameInput) {
    const inputElement = document.getElementById("post_form_tag_name");
    const searchResult = document.getElementById("search-result");
    const selectedTags = new Set(); // 選択されたタグを格納する Set

    inputElement.addEventListener("input", () => {
      const keywords = inputElement.value.split(',').map(keyword => keyword.trim()); // カンマで区切ってタグを取得
      searchResult.innerHTML = ""; // 検索結果をクリア

      keywords.forEach((keyword) => {
        if (keyword.length > 0) {
          const XHR = new XMLHttpRequest();
          XHR.open("GET", `/posts/search/?keyword=${keyword}`, true);
          XHR.responseType = "json";
          XHR.send();

          XHR.onload = () => {
            if (XHR.response) {
              const tags = XHR.response.keyword;
              tags.forEach((tag) => {
                if (!selectedTags.has(tag.tag_name) && !keywords.includes(tag.tag_name)) {
                  const tagElement = document.createElement("div");
                  tagElement.setAttribute("class", "child");
                  tagElement.setAttribute("id", tag.id);
                  tagElement.innerHTML = tag.tag_name;
                  searchResult.appendChild(tagElement);

                  tagElement.addEventListener("click", () => {
                    selectedTags.add(tag.tag_name);
                    inputElement.value = Array.from(selectedTags).join(","); // フォームの値を更新
                    searchResult.innerHTML = ""; // クリア後に再描画
                  });
                }
              });
            }
          };
        }
      });
    });
  }
});