﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Westgate.Web.Pages;

using Westgate.Data;
namespace Westgate.Web.Admin
{
    public partial class AddStory : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Subcategory subcategory = GetSubcategory();
            if (subcategory != null)
            {
                lblCategory.Text = subcategory.Category.Name;
                lblSubcategory.Text = subcategory.Name;
            }
        }
        private Subcategory GetSubcategory()
        {
            int subcategoryId = int.Parse(Request["subcategoryId"]);
            return (from s in DatabaseContext.Subcategories where s.SubcategoryId == subcategoryId select s).FirstOrDefault();
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            Subcategory subcategory = GetSubcategory();
            if (subcategory != null)
            {
                Story story = new Story { Name = tbName.Text, Description = tbDescription.Text, SubcategoryId = subcategory.SubcategoryId };
                DatabaseContext.AddToStories(story);
                DatabaseContext.SaveChanges();
                Response.Redirect("~/Admin/EditStory.aspx?StoSave=true&storyId=" + story.StoryId, false);
            }
        }
    }
}