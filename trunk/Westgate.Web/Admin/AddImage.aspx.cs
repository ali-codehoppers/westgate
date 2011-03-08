using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

using Westgate.Data;
namespace Westgate.Web.Admin
{
    public partial class AddImage : AuthenticatedPage
    {
        Westgate.Data.Image EditImage;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (IsPostBack == false)
            {
                if (Request["action"] == "exception")
                {
                    ErrorLabel.Visible = true;
                }
                if (Request["imageId"] != null)
                {
                    ddlCategory.Enabled = false;
                    ddlStories.Enabled = false;
                    ddlSubcategories.Enabled = false;
                    btnSave.Visible = false;
                    btnUpdate.Visible = true;
                    imgAfter.Visible = true;
                    imgCombined.Visible = true;
                    imgBefore.Visible = true;

                    Westgate.Data.Image image = GetImage();
                    EditImage = image;
                    imgBefore.ImageUrl = image.BeforeImagePath;
                    imgAfter.ImageUrl = image.AfterImagePath;
                    imgCombined.ImageUrl = image.CombinedImagePath;
                    tbName.Text = image.Name;
                    tbDescription.Text = image.Description;
                    
                }
            }
        }
        private Westgate.Data.Image GetImage()
        {
            try
            {
                if (Request["imageId"] != null)
                {
                    int imageId = int.Parse(Request["imageId"]);
                    Westgate.Data.Image image = (from i in DatabaseContext.Images where i.ImageId == imageId select i).FirstOrDefault();
                    return image;
                }
            }
            catch { }
            return null;
        }

        protected void ddlCategories_DataBound(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                if (Request["imageId"] != null)
                {
                    ddlCategory.SelectedItem.Value = EditImage.Story.Subcategory.CategoryId.ToString();
                    ddlCategory.SelectedItem.Text = EditImage.Story.Subcategory.Category.Name;
                }
            }
            ddlSubcategories.DataBind();
        }
        protected void ddlSubcategories_DataBound(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                if (Request["imageId"] != null)
                {
                    ddlSubcategories.SelectedItem.Value = EditImage.Story.SubcategoryId.ToString();
                    ddlSubcategories.SelectedItem.Text = EditImage.Story.Subcategory.Name;
                }
            }
            ddlStories.DataBind();
        }
        protected void ddlStories_DataBound(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                if (Request["imageId"] != null)
                {
                    ddlStories.SelectedItem.Value = EditImage.StoryId.ToString();
                    ddlStories.SelectedItem.Text = EditImage.Story.Name;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Westgate.Data.Image image = new Data.Image();
            SetImage(image);
            DatabaseContext.AddToImages(image);
            DatabaseContext.SaveChanges();
            Response.Redirect("~/Admin/AddImage.aspx?imageId=" + image.ImageId);
        }
        private void SetImage(Westgate.Data.Image image)
        {
            image.StoryId = int.Parse(ddlStories.SelectedValue);
            image.Name = tbName.Text;
            image.Description = tbDescription.Text;
            string beforeImagePath = SaveFile(fileBeforeImage);
            if (beforeImagePath != null)
            {
                image.BeforeImagePath = beforeImagePath;
            }
            string afterImagePath = SaveFile(fileAfterImage);
            if (afterImagePath != null)
            {
                image.AfterImagePath = afterImagePath;
            }
            if (beforeImagePath != null && afterImagePath != null)
            {
                string combinedFilePath = CreateCombinedImage(beforeImagePath, afterImagePath);
                if (combinedFilePath != null)
                {
                    image.CombinedImagePath = combinedFilePath;
                }
            }
        }
        private string CreateCombinedImage(string beforeImagePath,string afterImagePath)
        {
            try
            {
                System.Drawing.Image beforeImage = System.Drawing.Image.FromFile(Server.MapPath(beforeImagePath));
                System.Drawing.Image afterImage = System.Drawing.Image.FromFile(Server.MapPath(afterImagePath));
                Bitmap combinedImage = new Bitmap(936, 350);
                Graphics graphic = Graphics.FromImage(combinedImage);
                graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                graphic.DrawImage(beforeImage, 0, 0, (float)468, (float)350);
                graphic.DrawImage(afterImage, 468, 0, (float)468, (float)350);
                graphic.Dispose();
                string fileName = System.Guid.NewGuid().ToString() + ".png";
                string path = Server.MapPath("~/UserImages") + @"\" + fileName;
                combinedImage.Save(path);
                return "~/UserImages/" + fileName ;
            }
            catch { }
            return null;
        }
        private string SaveFile(FileUpload file)
        {
            try
            {
                if (file.HasFile)
                {
                    string fileName = System.Guid.NewGuid().ToString() + ".png";
                    string path = Server.MapPath("~/UserImages") + @"\" + fileName;
                    File.WriteAllBytes(path, file.FileBytes);
                    return "~/UserImages/" + fileName ;
                }
            }
            catch { }
            return null;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Westgate.Data.Image image = GetImage();
            SetImage(image);
            DatabaseContext.SaveChanges();
        }
    }
}