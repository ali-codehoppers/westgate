function addTag(name) {
	$("#catFrame").attr("src", "AddTag.aspx?tagName="+name);
    $("#dialog").dialog("open");
}
function addTag() {
    $("#catFrame").attr("src", "AddTag.aspx");
    $("#dialog").dialog("open");
}
function editTag(id) {
	$("#catFrame").attr("src", "EditTag.aspx?tagID=" + id);
	$("#dialog").dialog("open");
}
function deleteTag(id) {
	window.location.href = "TagsList.aspx?deleteID=" + id;
}
function addSubcategory(id) {
    $("#subCatFrame").attr("src", 'AddSubcategory.aspx?categoryId='+id);
    $("#dialog").dialog("open");
}
function deleteSubCategory(subId, catId) {
    window.location.href = "EditCategory.aspx?deleteId=" + subId + "&CategoryId=" + catId;
}
function addStory(id) {
    $("#dFrame").attr("src", 'AddStory.aspx?subcategoryId='+id);
    $("#dialog").dialog("open");
}
function deleteStory(storyId, catId) {
    window.location.href = "EditSubCategory.aspx?deleteId=" + storyId + "&SubcategoryId=" + catId;
}
function addImage(id) {
	$("#imgframe").attr("src", "addNewImage.aspx?tagId=" + id);
    $("#dialog").dialog("open");
}
function editImage(id) {
    $("#imgframe").attr("src", "addNewImage.aspx?imageId=" + id);
    $("#dialog").dialog("open");
}
function deleteImage(id, tagId) {
	window.location.href = "EditTag.aspx?tagId=" + tagId + "&deleteId=" + id;
}

function deleteImageGallery(id, tagId) {
    if(tagId!=null)
        window.location.href = "Gallery.aspx?tagId=" + tagId + "&deleteId=" + id;
}

function updateImageOrder() {
    window.location.href = "EditTag.aspx?SaveOrder=" + true;
}

function addHomeImages() {
    $("#catFrame").attr("src", "addHomeImages.aspx");
    $("#dialog").dialog("open");
}
function addTagImages(tagId) {
	$("#catFrame").attr("src", "addTagImage.aspx?tagId=" + tagId);
	$("#dialog").dialog("open");
}