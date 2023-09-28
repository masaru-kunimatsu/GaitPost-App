document.addEventListener("DOMContentLoaded", () => {
  const tagNameInput = document.querySelector("#post_form_tag_name");
  if (tagNameInput) {
    const inputElement = document.getElementById("post_form_tag_name");
    inputElement.addEventListener("input", () => {
      const keyword = document.getElementById("post_form_tag_name").value;
      const keywords = keyword.split(',').map(tag => tag.trim()); // カンマで区切ってタグを抽出
      const searchResult = document.getElementById("search-result");
      searchResult.innerHTML = "";

      keywords.forEach(tag => {
        // 各タグに対して検索を行う
        const XHR = new XMLHttpRequest();
        XHR.open("GET", `/posts/search/?keyword=${tag}`, true);
        XHR.responseType = "json";
        XHR.send();
        XHR.onload = () => {
          if (XHR.response) {
            const tagName = XHR.response.keyword;
            tagName.forEach((resultTag) => {
              const childElement = document.createElement("div");
              childElement.setAttribute("class", "child");
              childElement.setAttribute("id", resultTag.id);
              childElement.innerHTML = resultTag.tag_name;
              searchResult.appendChild(childElement);
              const clickElement = document.getElementById(resultTag.id);
              clickElement.addEventListener("click", () => {
                const currentTags = inputElement.value.split(',').map(tag => tag.trim()); // 現在のタグを抽出
                if (!currentTags.includes(resultTag.tag_name)) {
                  // 選択されたタグが現在のタグに含まれていない場合に追加
                  currentTags.push(resultTag.tag_name);
                  inputElement.value = currentTags.join(', '); // カンマで区切ってフォームに設定
                }
                clickElement.remove();
              });
            });
          }
        };
      });
    });
  }
});
