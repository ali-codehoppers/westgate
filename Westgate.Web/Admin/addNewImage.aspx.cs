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
using System.Drawing.Imaging;
namespace Westgate.Web.Admin
{
    public partial class addNewImage : AuthenticatedPage
    {
        Westgate.Data.Image EditImage;
        String BeforeX1, BeforeX2, BeforeY1, BeforeY2, AfterX1, AfterX2, AfterY1, AfterY2;
        System.Drawing.Image beforeImage, afterImage;
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
                    btnDelete.Visible = true;
                    imgAfter.Visible = true;
                    imgCombined.Visible = true;
                    imgBefore.Visible = true;

                    Westgate.Data.Image image = GetImage();
                    EditImage = image;

                    beforeImage = System.Drawing.Image.FromFile(Server.MapPath(image.BeforeImagePath));
                    ///////////////////////////////////////////////////////////////
                    imgBefore.ImageUrl = viewImage(beforeImage, "Before");
                    //////////////////////////////////////////////////////////////
                    afterImage = System.Drawing.Image.FromFile(Server.MapPath(image.AfterImagePath));
                    ///////////////////////////////////////////////////////////////
                    imgAfter.ImageUrl = viewImage(afterImage, "After");
                    /////////////////////////////////////////////////////////////
                    imgCombined.ImageUrl = image.CombinedImagePath;
                    tbName.Text = image.Name;
                    tbDescription.Text = image.Description;

                }
            }
        }
        private String viewImage(System.Drawing.Image image, String type)
        {
            String Width = image.PhysicalDimension.Width.ToString();
            String Height = image.PhysicalDimension.Height.ToString();

            Bitmap viewImage;
            int mapWidth = 468;
            int mapHeight = 350;
            double aspectRatio = (double)mapWidth / (double)mapHeight;
            int imgWidth = Convert.ToInt32(Width);
            int imgHeight = Convert.ToInt32(Height);
            double imgAspectRatio = (double)imgWidth / (double)imgHeight;
            int actualWidth, actualHeight;
            if (imgAspectRatio > aspectRatio)
            {
                int mapImgHeight = (int)((double)(imgHeight * mapWidth) / (double)imgWidth);
                actualWidth = mapWidth;
                actualHeight = mapImgHeight;
                viewImage = new Bitmap(mapWidth, mapImgHeight);
            }
            else
            {

                int mapImgWidth = (int)((double)(imgWidth * mapHeight) / (double)imgHeight);
                actualWidth = mapImgWidth;
                actualHeight = mapHeight;
                viewImage = new Bitmap(mapImgWidth, mapHeight);
            }
            if (type == "Before")
            {
                BeforeImageWidth.Value = actualWidth.ToString();
                BeforeImageHeight.Value = actualHeight.ToString();
            }
            else
            {
                AfterImageWidth.Value = actualWidth.ToString();
                AfterImageHeight.Value = actualHeight.ToString();
            }
            Graphics graphic = Graphics.FromImage(viewImage);
            graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;

            graphic.DrawImage(image, 0, 0, (float)actualWidth, (float)actualHeight);
            graphic.Dispose();
            string fileName = System.Guid.NewGuid().ToString() + ".png";
            string path = Server.MapPath("~/UserImages") + @"\" + fileName;
            viewImage.Save(path);
            return "~/UserImages/" + fileName;
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
                BeforeAcutalImage.Value = beforeImagePath;
                image.BeforeImagePath = beforeImagePath;
                beforeImage = System.Drawing.Image.FromFile(Server.MapPath(beforeImagePath));
                imgBefore.ImageUrl = viewImage(beforeImage, "Before");

                int quarterWidth = Convert.ToInt32(BeforeImageWidth.Value) / 4;
                int quarterHeight = Convert.ToInt32(BeforeImageHeight.Value) / 4;
                BeforeX1 = Convert.ToString(quarterWidth);
                BeforeX2 = Convert.ToString(quarterWidth * 3);
                BeforeY1 = Convert.ToString(quarterHeight);
                BeforeY2 = Convert.ToString(quarterHeight * 3);
                BeforeImageX1.Value = BeforeX1;
                BeforeImageX2.Value = BeforeX2;
                BeforeImageY1.Value = BeforeY1;
                BeforeImageY2.Value = BeforeY2;
            }
            string afterImagePath = SaveFile(fileAfterImage);
            if (afterImagePath != null)
            {
                AfterActualImage.Value = afterImagePath;
                image.AfterImagePath = afterImagePath;
                afterImage = System.Drawing.Image.FromFile(Server.MapPath(afterImagePath));
                imgAfter.ImageUrl = viewImage(afterImage, "After");

                int quarterWidth = Convert.ToInt32(AfterImageWidth.Value) / 4;
                int quarterHeight = Convert.ToInt32(AfterImageHeight.Value) / 4;
                AfterX1 = Convert.ToString(quarterWidth);
                AfterX2 = Convert.ToString(quarterWidth * 3);
                AfterY1 = Convert.ToString(quarterHeight);
                AfterY2 = Convert.ToString(quarterHeight * 3);
                AfterImageX1.Value = AfterX1;
                AfterImageX2.Value = AfterX2;
                AfterImageY1.Value = AfterY1;
                AfterImageY2.Value = AfterY2;
            }
            if (imgBefore.ImageUrl != null && imgBefore.ImageUrl != "" && imgAfter.ImageUrl != null && imgAfter.ImageUrl != "")
            {
                String path = CreateCombinedImage(imgBefore.ImageUrl, imgAfter.ImageUrl);
                if (path != null)
                {
                    image.CombinedImagePath = path;
                    imgCombined.ImageUrl = path;
                }
            }
            /*
            if (BeforeX1 != null && BeforeX1 != "" &&   AfterX1!=null && AfterX1!="") {

                //beforeImage = System.Drawing.Image.FromFile(Server.MapPath(image.BeforeImagePath));
                //afterImage = System.Drawing.Image.FromFile(Server.MapPath(image.AfterImagePath));
                //double beforeActualHeight = (double)beforeImage.PhysicalDimension.Height / (double)Convert.ToInt32(BeforeImageHeight.Value);
                //double beforeActualWidth = (double)beforeImage.PhysicalDimension.Width / (double)Convert.ToInt32(BeforeImageWidth.Value);
                //double afterActualHeight = (double)afterImage.PhysicalDimension.Height / (double)Convert.ToInt32(AfterImageHeight.Value);
                //double afterActualWidth = (double)afterImage.PhysicalDimension.Width / (double)Convert.ToInt32(AfterImageWidth.Value);

                //int beforeX = (int)((double)Convert.ToDouble(BeforeX1) * beforeActualWidth);
                //int beforeY = (int)((double)Convert.ToDouble(BeforeY1) * beforeActualHeight);
                //int beforeWidth = (int)((double)(Convert.ToDouble(BeforeX2) - Convert.ToDouble(BeforeX1)) * beforeActualWidth);
                //int beforeHeight = (int)((double)(Convert.ToDouble(BeforeY2) - Convert.ToDouble(BeforeY1)) * beforeActualHeight);
                //int afterX = (int)((double)Convert.ToDouble(AfterX1) * afterActualWidth);
                //int afterY = (int)((double)Convert.ToDouble(AfterY1) * afterActualHeight);
                //int afterWidth = (int)((double)(Convert.ToDouble(AfterX2) - Convert.ToDouble(AfterX1))*afterActualWidth);
                //int afterHeight = (int)((double)(Convert.ToDouble(AfterY2) - Convert.ToDouble(AfterY1))*afterActualHeight);

                Bitmap beforeCropImage = new Bitmap(936, 350);
                Graphics graphic = Graphics.FromImage(beforeCropImage);
                graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;

                //Rectangle beforeCropArea = new Rectangle(beforeX, beforeY, beforeWidth, beforeHeight);
                //Rectangle afterCropArea = new Rectangle(afterX, afterY, afterWidth, afterHeight);
                Rectangle cropArea1 = new Rectangle(0, 0, 468, 350);
                Rectangle cropArea2 = new Rectangle(468, 0, 468, 350);
                graphic.DrawImage(beforeImage, cropArea1, beforeCropArea, GraphicsUnit.Pixel);
                graphic.DrawImage(afterImage, cropArea2, afterCropArea, GraphicsUnit.Pixel);
                graphic.Dispose();

                string fileName = System.Guid.NewGuid().ToString() + ".png";
                string path = Server.MapPath("~/UserImages") + @"\" + fileName;
                beforeCropImage.Save(path);

                image.CombinedImagePath = "~/UserImages/" + fileName;
                imgCombined.ImageUrl = image.CombinedImagePath;
                
            }
            */
        }

        private string CreateCombinedImage(string beforeImagePath, string afterImagePath)
        {
            try
            {
                beforeImage = System.Drawing.Image.FromFile(Server.MapPath(beforeImagePath));
                afterImage = System.Drawing.Image.FromFile(Server.MapPath(afterImagePath));
                int beforeWidth = Convert.ToInt32(beforeImage.PhysicalDimension.Width.ToString());
                int beforeHeight = Convert.ToInt32(beforeImage.PhysicalDimension.Height.ToString());
                int afterWidth = Convert.ToInt32(afterImage.PhysicalDimension.Width.ToString());
                int afterHeight = Convert.ToInt32(afterImage.PhysicalDimension.Height.ToString());
                int x0 = 468 - beforeWidth;
                int y0 = 350 - beforeHeight;
                int ax0 = 468 - afterWidth;
                int ay0 = 350 - afterHeight;
                Bitmap combinedImage = new Bitmap(936, 350);
                Graphics graphic = Graphics.FromImage(combinedImage);
                graphic.Clear(Color.White);
                graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                graphic.DrawImage(beforeImage, x0 / 2, y0 / 2, (float)beforeWidth, (float)beforeHeight);
                graphic.DrawImage(afterImage, (468 + (ax0 / 2)), ay0 / 2, (float)afterWidth, (float)afterHeight);
                graphic.Dispose();
                string fileName = System.Guid.NewGuid().ToString() + ".png";
                string path = Server.MapPath("~/UserImages") + @"\" + fileName;
                combinedImage.Save(path);
                SaveThumbNail(path);
                System.Drawing.Image img = System.Drawing.Image.FromFile(path);
                img.Save(path.Replace(".png", ".jpg"), System.Drawing.Imaging.ImageFormat.Jpeg);
                return "~/UserImages/" + fileName.Replace(".png", ".jpg");
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
                    SaveThumbNail(path);
                    return "~/UserImages/" + fileName;
                }
            }
            catch { }
            return null;
        }

        private void SaveThumbNail(string path)
        {
            System.Drawing.Image actualImage = System.Drawing.Image.FromFile(path);
            Bitmap thumbImage = new Bitmap(100, 100);
            Graphics graphic = Graphics.FromImage(thumbImage);
            graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphic.DrawImage(actualImage, 0, 0, (float)100, (float)100);
            graphic.Dispose();
            thumbImage.Save(path.Replace(".png", "_thumb.png"));
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            BeforeX1 = BeforeImageX1.Value;
            BeforeX2 = BeforeImageX2.Value;
            BeforeY1 = BeforeImageY1.Value;
            BeforeY2 = BeforeImageY2.Value;
            AfterX1 = AfterImageX1.Value;
            AfterX2 = AfterImageX2.Value;
            AfterY1 = AfterImageY1.Value;
            AfterY2 = AfterImageY2.Value;
            Westgate.Data.Image image = GetImage();
            SetImage(image);
            DatabaseContext.SaveChanges();
            beforeImage = System.Drawing.Image.FromFile(Server.MapPath(image.BeforeImagePath));
            imgBefore.ImageUrl = viewImage(beforeImage, "Before");
            afterImage = System.Drawing.Image.FromFile(Server.MapPath(image.AfterImagePath));
            imgAfter.ImageUrl = viewImage(afterImage, "After");
            imgCombined.ImageUrl = image.CombinedImagePath;
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Westgate.Data.Image image = GetImage();
            DatabaseContext.DeleteObject(image);
            DatabaseContext.SaveChanges();
            Response.Redirect("~/Admin/ImagesList.aspx");
        }
    }
}