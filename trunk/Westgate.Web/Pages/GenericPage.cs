using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Westgate.Data;

namespace Westgate.Web.Pages
{
    public class GenericPage : System.Web.UI.Page
    {
        protected WestgateEntities DatabaseContext = new WestgateEntities();
        protected static class ParameterNames
        {
            public static class Session
            {
                public static string LOGGED_IS_USERID = "LOGGED_IS_USERID";
            }
            public static class Messages
            {
                public static class Info
                {
                    
                }
                public static class Error
                {
                    public static string INVALID_LOGIN = "Invalid User name or password";
                }
            }
        }
        protected object GetThumbnailImagePath(object path)
        {
            return path.ToString().Replace(".png", "_thumb.png");
        }

        protected String GetThumbnailPath(String imageId)
        {
            int imgId = Int32.Parse(imageId);
          Image image = (from img in DatabaseContext.Images
                         where img.ImageId == imgId
						   select img).FirstOrDefault();

            if(image.AfterImagePath!=null && image.AfterImagePath.Length>0)
                return image.AfterImagePath.ToString().Replace(".png", "_thumb.png");
            else
                return image.BeforeImagePath.ToString().Replace(".png", "_thumb.png");
        }
    }
}