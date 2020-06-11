function hoverUploadButton(button, area) {
  area.querySelector("input[type='file']").addEventListener("mouseenter", function () {
    button.classList.add("hovered");
  });

  area.querySelector("input[type='file']").addEventListener("mouseleave", function () {
    button.classList.remove("hovered");
  });
  console.log("Hahaha hoverUploadButton!");
}

// Launch and stop animation on reader load event
function animateUploadButton(button, area, timer) {
  button.innerText = "";
  button.classList.add("validate");
  setTimeout(function(){
     button.classList.remove("validate");
     button.innerText = "Picture selected";
  }, timer);
  console.log("Hahaha animateUploadButton!");
}

// Generate preview on load
function initFilePreview(button, area) {
  const reader = new FileReader();
  const previewClass = area.dataset.filePreviewClass;

  area.querySelector("input[type='file']").addEventListener("change", function (event) {
    if (event.currentTarget.files || event.currentTarget.files[0]) {
      const preview = document.createElement("div");
      console.log("Hustle is real!");
      preview.classList.add('preview', previewClass);

      // Replace preview if it already exists or create a new one
      if (area.querySelector('.' + previewClass).hasAttribute("[data-current-preview]")) {
        old_preview = area.querySelector("[data-current-preview]");
        area.replaceChild(preview, old_preview);
      } else {
        old_preview = area.querySelector('.' + previewClass);
        area.replaceChild(preview, old_preview);
      }
      reader.readAsDataURL(event.currentTarget.files[0]);
      // Callback on readAsDataURL
      reader.addEventListener("load", function () {
        preview.style.backgroundImage = "url('" + reader.result +"')";
        animateUploadButton(button, area, 650)
      }, false);
    };
  });
    console.log("Hahaha initFilePreview!");
}

Array.from(document.querySelectorAll("[data-file-preview-class]")).forEach(function (area) {
  const button = area.parentNode.querySelector("[data-type-upload]");
  initFilePreview(button, area);
  hoverUploadButton(button, area)
});

export { hoverUploadButton, animateUploadButton, initFilePreview  };









