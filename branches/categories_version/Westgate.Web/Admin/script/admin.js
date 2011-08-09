function addCategory() {
    $("#catFrame").attr("src", "AddCategory.aspx");
    $("#dialog").dialog("open");
}
function editCategory(id) {
    $("#catFrame").attr("src", "EditCategory.aspx?CategoryID=" + id);
    $("#dialog").dialog("open");
}
function deleteCategory(id) {
    window.location.href = "CategoriesList.aspx?deleteID=" + id;
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
    $("#imgframe").attr("src", "addNewImage.aspx?StoryId=" + id);
    $("#dialog").dialog("open");
}
function editImage(id) {
    $("#imgframe").attr("src", "addNewImage.aspx?imageId=" + id);
    $("#dialog").dialog("open");
}
function deleteImage(id, storyId) {
    window.location.href = "EditStory.aspx?StoryId=" + storyId + "&deleteId=" + id;
}
function addHomeImages() {
    $("#catFrame").attr("src", "addHomeImages.aspx");
    $("#dialog").dialog("open");
}