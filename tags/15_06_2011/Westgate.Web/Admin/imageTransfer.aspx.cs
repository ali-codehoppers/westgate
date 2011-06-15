using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace Westgate.Web.Admin
{
    public partial class imageTransfer : AuthenticatedPage
    {
        System.Drawing.Image beforeImage, afterImage;
        protected void Page_Load(object sender, EventArgs e)
        {
            var image = (from c in DatabaseContext.Images select c).AsEnumerable();
            foreach(var n in image){
                //if (!(n.CombinedImagePath.Contains(".jpg"))) {
                    SetImage(n);

                //}
            }
            DatabaseContext.SaveChanges();
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

            Graphics graphic = Graphics.FromImage(viewImage);
            graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;

            graphic.DrawImage(image, 0, 0, (float)actualWidth, (float)actualHeight);
            graphic.Dispose();
            string fileName = System.Guid.NewGuid().ToString() + ".png";
            string path = Server.MapPath("~/UserImages") + @"\" + fileName;
            viewImage.Save(path);
            return "~/UserImages/" + fileName;
        }
        private void SetImage(Westgate.Data.Image image)
        {
            string beforeImagePath = image.BeforeImagePath;
            if (beforeImagePath != null)
            {
                beforeImage = System.Drawing.Image.FromFile(Server.MapPath(image.BeforeImagePath));
                beforeImagePath=viewImage(beforeImage, "Before");
            }
            string afterImagePath = image.AfterImagePath;
            if (afterImagePath != null)
            {
                afterImage = System.Drawing.Image.FromFile(Server.MapPath(image.AfterImagePath));
                afterImagePath=viewImage(afterImage, "After");
            }
            if (beforeImagePath != null && afterImagePath != "")
            {
                String path = CreateCombinedImage(beforeImagePath, afterImagePath);
                if (path != null)
                {
                    image.CombinedImagePath = path;
                }
            }
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
    }
}