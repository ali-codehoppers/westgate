using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Westgate.Web.Pages;
using Westgate.Data;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace Westgate.Web.ajax
{
    public partial class ImageContents : AJAXPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pageType = Request["pageType"].ToUpper();
            if (pageType.Equals("HOME"))
            {
                var homeImages = from i in DatabaseContext.Images
                                 where i.OrderImage != null
                                 orderby i.OrderImage
                                 select i;
                if (homeImages.Count() == 0)
                {
                    homeImages = (from i in DatabaseContext.Images
                                  orderby i.ImageId descending
                                  select i);
                }
                rptImages.DataSource = homeImages;
            }

            if (pageType.Equals("TAG") || pageType.Equals("BASICGALLERY"))
            {
                List<Data.Image> tagImages;

                if(pageType.Equals("BASICGALLERY"))
                {
                    tagImages = (from img in DatabaseContext.Images select img).Take(5).ToList();
                }
                else
                {
                    tagImages = (from img in DatabaseContext.Images select img).ToList();
                }

                foreach (Data.Image img in tagImages)
                {
                    if (img.GalleryImagePathBefore == null || img.GalleryImagePathBefore.Length < 1)
                    {
                        System.IO.FileInfo file = null;
                        if (img.BeforeImagePath != null)
                        {
                            string filePath = Server.MapPath(img.BeforeImagePath);
                            file = new System.IO.FileInfo(filePath);
                        }

                        if (file==null || !file.Exists)
                        {
                            if (img.GalleryImagePathAfter != null && img.GalleryImagePathAfter.Length > 0)
                            {
                                img.GalleryImagePathBefore = img.GalleryImagePathAfter;
                            }
                            else
                            {
                                if (img.AfterImagePath != null)
                                {
                                    string filePath = Server.MapPath(img.AfterImagePath);
                                    file = new System.IO.FileInfo(filePath);
                                }

                                if (file.Exists)
                                {
                                    String galleryImagePath = CreateGalleryImage(new Bitmap(file.FullName), new Size(400, 400));
                                    img.GalleryImagePathBefore = galleryImagePath;
                                    img.GalleryImagePathAfter = galleryImagePath;
                                }
                            }
                        }
                        else
                        {
                            String galleryImagePath = CreateGalleryImage(new Bitmap(file.FullName), new Size(400, 400));
                            img.GalleryImagePathBefore = galleryImagePath;
                        }
                    }

                    if (img.GalleryImagePathAfter == null || img.GalleryImagePathAfter.Length < 1)
                    {
                        System.IO.FileInfo file = null;
                        if (img.AfterImagePath != null)
                        {
                            string filePath = Server.MapPath(img.AfterImagePath);
                            file = new System.IO.FileInfo(filePath);
                        }

                        if (file == null || !file.Exists)
                        {
                            if (img.GalleryImagePathBefore != null && img.GalleryImagePathBefore.Length > 0)
                            {
                                img.GalleryImagePathAfter = img.GalleryImagePathBefore;
                            }
                            else
                            {
                                if (img.BeforeImagePath != null)
                                {
                                    string filePath = Server.MapPath(img.BeforeImagePath);
                                    file = new System.IO.FileInfo(filePath);
                                }

                                if (file.Exists)
                                {
                                    String galleryImagePath = CreateGalleryImage(new Bitmap(file.FullName), new Size(400, 400));
                                    img.GalleryImagePathBefore = galleryImagePath;
                                    img.GalleryImagePathAfter = galleryImagePath;
                                }
                            }
                        }
                        else
                        {
                            String galleryImagePath = CreateGalleryImage(new Bitmap(file.FullName), new Size(400, 400));
                            img.GalleryImagePathAfter = galleryImagePath;
                        }
                    }


                    //if (img.GalleryImagePath == null || img.GalleryImagePath.Length < 1)
                    //{
                    //    string filePath = Server.MapPath(img.AfterImagePath);
                    //    System.IO.FileInfo file = new System.IO.FileInfo(filePath);

                    //    if (!file.Exists)
                    //    {
                    //        filePath = Server.MapPath(img.BeforeImagePath);
                    //        file = new System.IO.FileInfo(filePath);
                    //    }

                    //    if (file.Exists)
                    //    {

                    //        String galleryImagePath = CreateGalleryImage(new Bitmap(file.FullName), new Size(400, 400));
                    //        img.GalleryImagePath = galleryImagePath;
                    //    }
                    //}
                }
                DatabaseContext.SaveChanges();
                rptImages.DataSource = tagImages;

            }
            rptImages.DataBind();
        }


        private String CreateGalleryImage(System.Drawing.Image sourceImage, Size size)
        {
            int sourceWidth = (int)sourceImage.PhysicalDimension.Width;
            int sourceHeight = (int)sourceImage.PhysicalDimension.Height;

            float nPercent = 0;
            float nPercentW = 0;
            float nPercentH = 0;

            nPercentW = ((float)size.Width / (float)sourceWidth);
            nPercentH = ((float)size.Height / (float)sourceHeight);

            if (nPercentH > nPercentW)
                nPercent = nPercentH;
            else
                nPercent = nPercentW;

            int destWidth = (int)(sourceWidth * nPercent);
            int destHeight = (int)(sourceHeight * nPercent);

            int cropSizeWidth = 0;
            int cropSizeHeight = 0;

            if (destWidth > size.Width)
            {
                cropSizeWidth = (destWidth - size.Width) / 2;
            }
            if (destHeight > size.Height)
            {
                cropSizeHeight = (destHeight - size.Height) / 2;
            }

            Bitmap b = new Bitmap(destWidth, destHeight);
            Graphics g = Graphics.FromImage((System.Drawing.Image)b);

            g.InterpolationMode = InterpolationMode.HighQualityBicubic;

            g.DrawImage(sourceImage, 0, 0, destWidth, destHeight);
            g.Dispose();

            Bitmap bmp2 = new Bitmap(size.Width, size.Height);
            Graphics g2 = Graphics.FromImage((System.Drawing.Image)bmp2);

            g2.DrawImage(b, new Rectangle(0, 0, size.Width, size.Height), new Rectangle(cropSizeWidth, cropSizeHeight, size.Width, size.Height), GraphicsUnit.Pixel);
            g2.Dispose();

            string fileName = System.Guid.NewGuid().ToString() + ".png";
            string path = Server.MapPath("~/UserImages") + @"\HomeGalleryImages\" + fileName;

            bmp2.Save(path, System.Drawing.Imaging.ImageFormat.Png);
            return "~/UserImages/HomeGalleryImages/" + fileName;
        }

    }
}