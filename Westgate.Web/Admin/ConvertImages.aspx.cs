using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace Westgate.Web.Admin
{
    public partial class ConvertImages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string dirPath = Server.MapPath("~/UserImages/");
            IEnumerable<string> files = Directory.EnumerateFiles(dirPath);
            foreach(string file in files)
            {
                SaveThumbNail(file);
            }
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