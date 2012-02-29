﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using System.Data.EntityClient;
using System.ComponentModel;
using System.Xml.Serialization;
using System.Runtime.Serialization;

[assembly: EdmSchemaAttribute()]
#region EDM Relationship Metadata

[assembly: EdmRelationshipAttribute("WestgateModel", "ImageImageTag", "Image", System.Data.Metadata.Edm.RelationshipMultiplicity.One, typeof(Westgate.Data.Image), "ImageTag", System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(Westgate.Data.ImageTag), true)]
[assembly: EdmRelationshipAttribute("WestgateModel", "TagImageTag", "Tag", System.Data.Metadata.Edm.RelationshipMultiplicity.One, typeof(Westgate.Data.Tag), "ImageTag", System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(Westgate.Data.ImageTag), true)]

#endregion

namespace Westgate.Data
{
    #region Contexts
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    public partial class WestgateEntities : ObjectContext
    {
        #region Constructors
    
        /// <summary>
        /// Initializes a new WestgateEntities object using the connection string found in the 'WestgateEntities' section of the application configuration file.
        /// </summary>
        public WestgateEntities() : base("name=WestgateEntities", "WestgateEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Initialize a new WestgateEntities object.
        /// </summary>
        public WestgateEntities(string connectionString) : base(connectionString, "WestgateEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Initialize a new WestgateEntities object.
        /// </summary>
        public WestgateEntities(EntityConnection connection) : base(connection, "WestgateEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        #endregion
    
        #region Partial Methods
    
        partial void OnContextCreated();
    
        #endregion
    
        #region ObjectSet Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        public ObjectSet<Image> Images
        {
            get
            {
                if ((_Images == null))
                {
                    _Images = base.CreateObjectSet<Image>("Images");
                }
                return _Images;
            }
        }
        private ObjectSet<Image> _Images;
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        public ObjectSet<UserEnquiry> UserEnquiries
        {
            get
            {
                if ((_UserEnquiries == null))
                {
                    _UserEnquiries = base.CreateObjectSet<UserEnquiry>("UserEnquiries");
                }
                return _UserEnquiries;
            }
        }
        private ObjectSet<UserEnquiry> _UserEnquiries;
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        public ObjectSet<Tag> Tags
        {
            get
            {
                if ((_Tags == null))
                {
                    _Tags = base.CreateObjectSet<Tag>("Tags");
                }
                return _Tags;
            }
        }
        private ObjectSet<Tag> _Tags;
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        public ObjectSet<ImageTag> ImageTags
        {
            get
            {
                if ((_ImageTags == null))
                {
                    _ImageTags = base.CreateObjectSet<ImageTag>("ImageTags");
                }
                return _ImageTags;
            }
        }
        private ObjectSet<ImageTag> _ImageTags;

        #endregion
        #region AddTo Methods
    
        /// <summary>
        /// Deprecated Method for adding a new object to the Images EntitySet. Consider using the .Add method of the associated ObjectSet&lt;T&gt; property instead.
        /// </summary>
        public void AddToImages(Image image)
        {
            base.AddObject("Images", image);
        }
    
        /// <summary>
        /// Deprecated Method for adding a new object to the UserEnquiries EntitySet. Consider using the .Add method of the associated ObjectSet&lt;T&gt; property instead.
        /// </summary>
        public void AddToUserEnquiries(UserEnquiry userEnquiry)
        {
            base.AddObject("UserEnquiries", userEnquiry);
        }
    
        /// <summary>
        /// Deprecated Method for adding a new object to the Tags EntitySet. Consider using the .Add method of the associated ObjectSet&lt;T&gt; property instead.
        /// </summary>
        public void AddToTags(Tag tag)
        {
            base.AddObject("Tags", tag);
        }
    
        /// <summary>
        /// Deprecated Method for adding a new object to the ImageTags EntitySet. Consider using the .Add method of the associated ObjectSet&lt;T&gt; property instead.
        /// </summary>
        public void AddToImageTags(ImageTag imageTag)
        {
            base.AddObject("ImageTags", imageTag);
        }

        #endregion
    }
    

    #endregion
    
    #region Entities
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="WestgateModel", Name="Image")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class Image : EntityObject
    {
        #region Factory Method
    
        /// <summary>
        /// Create a new Image object.
        /// </summary>
        /// <param name="imageId">Initial value of the ImageId property.</param>
        /// <param name="name">Initial value of the Name property.</param>
        public static Image CreateImage(global::System.Int32 imageId, global::System.String name)
        {
            Image image = new Image();
            image.ImageId = imageId;
            image.Name = name;
            return image;
        }

        #endregion
        #region Primitive Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 ImageId
        {
            get
            {
                return _ImageId;
            }
            set
            {
                if (_ImageId != value)
                {
                    OnImageIdChanging(value);
                    ReportPropertyChanging("ImageId");
                    _ImageId = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("ImageId");
                    OnImageIdChanged();
                }
            }
        }
        private global::System.Int32 _ImageId;
        partial void OnImageIdChanging(global::System.Int32 value);
        partial void OnImageIdChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String Name
        {
            get
            {
                return _Name;
            }
            set
            {
                OnNameChanging(value);
                ReportPropertyChanging("Name");
                _Name = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("Name");
                OnNameChanged();
            }
        }
        private global::System.String _Name;
        partial void OnNameChanging(global::System.String value);
        partial void OnNameChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public global::System.String Description
        {
            get
            {
                return _Description;
            }
            set
            {
                OnDescriptionChanging(value);
                ReportPropertyChanging("Description");
                _Description = StructuralObject.SetValidValue(value, true);
                ReportPropertyChanged("Description");
                OnDescriptionChanged();
            }
        }
        private global::System.String _Description;
        partial void OnDescriptionChanging(global::System.String value);
        partial void OnDescriptionChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public global::System.String BeforeImagePath
        {
            get
            {
                return _BeforeImagePath;
            }
            set
            {
                OnBeforeImagePathChanging(value);
                ReportPropertyChanging("BeforeImagePath");
                _BeforeImagePath = StructuralObject.SetValidValue(value, true);
                ReportPropertyChanged("BeforeImagePath");
                OnBeforeImagePathChanged();
            }
        }
        private global::System.String _BeforeImagePath;
        partial void OnBeforeImagePathChanging(global::System.String value);
        partial void OnBeforeImagePathChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public global::System.String AfterImagePath
        {
            get
            {
                return _AfterImagePath;
            }
            set
            {
                OnAfterImagePathChanging(value);
                ReportPropertyChanging("AfterImagePath");
                _AfterImagePath = StructuralObject.SetValidValue(value, true);
                ReportPropertyChanged("AfterImagePath");
                OnAfterImagePathChanged();
            }
        }
        private global::System.String _AfterImagePath;
        partial void OnAfterImagePathChanging(global::System.String value);
        partial void OnAfterImagePathChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public global::System.String CombinedImagePath
        {
            get
            {
                return _CombinedImagePath;
            }
            set
            {
                OnCombinedImagePathChanging(value);
                ReportPropertyChanging("CombinedImagePath");
                _CombinedImagePath = StructuralObject.SetValidValue(value, true);
                ReportPropertyChanged("CombinedImagePath");
                OnCombinedImagePathChanged();
            }
        }
        private global::System.String _CombinedImagePath;
        partial void OnCombinedImagePathChanging(global::System.String value);
        partial void OnCombinedImagePathChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public Nullable<global::System.Int32> OrderImage
        {
            get
            {
                return _OrderImage;
            }
            set
            {
                OnOrderImageChanging(value);
                ReportPropertyChanging("OrderImage");
                _OrderImage = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("OrderImage");
                OnOrderImageChanged();
            }
        }
        private Nullable<global::System.Int32> _OrderImage;
        partial void OnOrderImageChanging(Nullable<global::System.Int32> value);
        partial void OnOrderImageChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public global::System.String GalleryImagePathBefore
        {
            get
            {
                return _GalleryImagePathBefore;
            }
            set
            {
                OnGalleryImagePathBeforeChanging(value);
                ReportPropertyChanging("GalleryImagePathBefore");
                _GalleryImagePathBefore = StructuralObject.SetValidValue(value, true);
                ReportPropertyChanged("GalleryImagePathBefore");
                OnGalleryImagePathBeforeChanged();
            }
        }
        private global::System.String _GalleryImagePathBefore;
        partial void OnGalleryImagePathBeforeChanging(global::System.String value);
        partial void OnGalleryImagePathBeforeChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public global::System.String GalleryImagePathAfter
        {
            get
            {
                return _GalleryImagePathAfter;
            }
            set
            {
                OnGalleryImagePathAfterChanging(value);
                ReportPropertyChanging("GalleryImagePathAfter");
                _GalleryImagePathAfter = StructuralObject.SetValidValue(value, true);
                ReportPropertyChanged("GalleryImagePathAfter");
                OnGalleryImagePathAfterChanged();
            }
        }
        private global::System.String _GalleryImagePathAfter;
        partial void OnGalleryImagePathAfterChanging(global::System.String value);
        partial void OnGalleryImagePathAfterChanged();

        #endregion
    
        #region Navigation Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("WestgateModel", "ImageImageTag", "ImageTag")]
        public EntityCollection<ImageTag> ImageTags
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedCollection<ImageTag>("WestgateModel.ImageImageTag", "ImageTag");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedCollection<ImageTag>("WestgateModel.ImageImageTag", "ImageTag", value);
                }
            }
        }

        #endregion
    }
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="WestgateModel", Name="ImageTag")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class ImageTag : EntityObject
    {
        #region Factory Method
    
        /// <summary>
        /// Create a new ImageTag object.
        /// </summary>
        /// <param name="imageId">Initial value of the ImageId property.</param>
        /// <param name="tagId">Initial value of the TagId property.</param>
        public static ImageTag CreateImageTag(global::System.Int32 imageId, global::System.Int32 tagId)
        {
            ImageTag imageTag = new ImageTag();
            imageTag.ImageId = imageId;
            imageTag.TagId = tagId;
            return imageTag;
        }

        #endregion
        #region Primitive Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 OrderNumber
        {
            get
            {
                return _OrderNumber;
            }
            set
            {
                OnOrderNumberChanging(value);
                ReportPropertyChanging("OrderNumber");
                _OrderNumber = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("OrderNumber");
                OnOrderNumberChanged();
            }
        }
        private global::System.Int32 _OrderNumber = 0;
        partial void OnOrderNumberChanging(global::System.Int32 value);
        partial void OnOrderNumberChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 ImageId
        {
            get
            {
                return _ImageId;
            }
            set
            {
                if (_ImageId != value)
                {
                    OnImageIdChanging(value);
                    ReportPropertyChanging("ImageId");
                    _ImageId = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("ImageId");
                    OnImageIdChanged();
                }
            }
        }
        private global::System.Int32 _ImageId;
        partial void OnImageIdChanging(global::System.Int32 value);
        partial void OnImageIdChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 TagId
        {
            get
            {
                return _TagId;
            }
            set
            {
                if (_TagId != value)
                {
                    OnTagIdChanging(value);
                    ReportPropertyChanging("TagId");
                    _TagId = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("TagId");
                    OnTagIdChanged();
                }
            }
        }
        private global::System.Int32 _TagId;
        partial void OnTagIdChanging(global::System.Int32 value);
        partial void OnTagIdChanged();

        #endregion
    
        #region Navigation Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("WestgateModel", "ImageImageTag", "Image")]
        public Image Image
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Image>("WestgateModel.ImageImageTag", "Image").Value;
            }
            set
            {
                ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Image>("WestgateModel.ImageImageTag", "Image").Value = value;
            }
        }
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [BrowsableAttribute(false)]
        [DataMemberAttribute()]
        public EntityReference<Image> ImageReference
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Image>("WestgateModel.ImageImageTag", "Image");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedReference<Image>("WestgateModel.ImageImageTag", "Image", value);
                }
            }
        }
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("WestgateModel", "TagImageTag", "Tag")]
        public Tag Tag
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Tag>("WestgateModel.TagImageTag", "Tag").Value;
            }
            set
            {
                ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Tag>("WestgateModel.TagImageTag", "Tag").Value = value;
            }
        }
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [BrowsableAttribute(false)]
        [DataMemberAttribute()]
        public EntityReference<Tag> TagReference
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<Tag>("WestgateModel.TagImageTag", "Tag");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedReference<Tag>("WestgateModel.TagImageTag", "Tag", value);
                }
            }
        }

        #endregion
    }
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="WestgateModel", Name="Tag")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class Tag : EntityObject
    {
        #region Factory Method
    
        /// <summary>
        /// Create a new Tag object.
        /// </summary>
        /// <param name="tagId">Initial value of the TagId property.</param>
        /// <param name="name">Initial value of the Name property.</param>
        /// <param name="showInTabs">Initial value of the ShowInTabs property.</param>
        /// <param name="orderNumber">Initial value of the OrderNumber property.</param>
        public static Tag CreateTag(global::System.Int32 tagId, global::System.String name, global::System.Boolean showInTabs, global::System.Int32 orderNumber)
        {
            Tag tag = new Tag();
            tag.TagId = tagId;
            tag.Name = name;
            tag.ShowInTabs = showInTabs;
            tag.OrderNumber = orderNumber;
            return tag;
        }

        #endregion
        #region Primitive Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 TagId
        {
            get
            {
                return _TagId;
            }
            set
            {
                if (_TagId != value)
                {
                    OnTagIdChanging(value);
                    ReportPropertyChanging("TagId");
                    _TagId = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("TagId");
                    OnTagIdChanged();
                }
            }
        }
        private global::System.Int32 _TagId;
        partial void OnTagIdChanging(global::System.Int32 value);
        partial void OnTagIdChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String Name
        {
            get
            {
                return _Name;
            }
            set
            {
                OnNameChanging(value);
                ReportPropertyChanging("Name");
                _Name = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("Name");
                OnNameChanged();
            }
        }
        private global::System.String _Name;
        partial void OnNameChanging(global::System.String value);
        partial void OnNameChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public global::System.String Description
        {
            get
            {
                return _Description;
            }
            set
            {
                OnDescriptionChanging(value);
                ReportPropertyChanging("Description");
                _Description = StructuralObject.SetValidValue(value, true);
                ReportPropertyChanged("Description");
                OnDescriptionChanged();
            }
        }
        private global::System.String _Description;
        partial void OnDescriptionChanging(global::System.String value);
        partial void OnDescriptionChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Boolean ShowInTabs
        {
            get
            {
                return _ShowInTabs;
            }
            set
            {
                OnShowInTabsChanging(value);
                ReportPropertyChanging("ShowInTabs");
                _ShowInTabs = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("ShowInTabs");
                OnShowInTabsChanged();
            }
        }
        private global::System.Boolean _ShowInTabs;
        partial void OnShowInTabsChanging(global::System.Boolean value);
        partial void OnShowInTabsChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Boolean IsEditable
        {
            get
            {
                return _IsEditable;
            }
            set
            {
                OnIsEditableChanging(value);
                ReportPropertyChanging("IsEditable");
                _IsEditable = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("IsEditable");
                OnIsEditableChanged();
            }
        }
        private global::System.Boolean _IsEditable = true;
        partial void OnIsEditableChanging(global::System.Boolean value);
        partial void OnIsEditableChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 OrderNumber
        {
            get
            {
                return _OrderNumber;
            }
            set
            {
                OnOrderNumberChanging(value);
                ReportPropertyChanging("OrderNumber");
                _OrderNumber = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("OrderNumber");
                OnOrderNumberChanged();
            }
        }
        private global::System.Int32 _OrderNumber;
        partial void OnOrderNumberChanging(global::System.Int32 value);
        partial void OnOrderNumberChanged();

        #endregion
    
        #region Navigation Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("WestgateModel", "TagImageTag", "ImageTag")]
        public EntityCollection<ImageTag> ImageTags
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedCollection<ImageTag>("WestgateModel.TagImageTag", "ImageTag");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedCollection<ImageTag>("WestgateModel.TagImageTag", "ImageTag", value);
                }
            }
        }

        #endregion
    }
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="WestgateModel", Name="UserEnquiry")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class UserEnquiry : EntityObject
    {
        #region Factory Method
    
        /// <summary>
        /// Create a new UserEnquiry object.
        /// </summary>
        /// <param name="id">Initial value of the id property.</param>
        /// <param name="companyName">Initial value of the companyName property.</param>
        /// <param name="personName">Initial value of the personName property.</param>
        /// <param name="email">Initial value of the email property.</param>
        public static UserEnquiry CreateUserEnquiry(global::System.Int32 id, global::System.String companyName, global::System.String personName, global::System.String email)
        {
            UserEnquiry userEnquiry = new UserEnquiry();
            userEnquiry.id = id;
            userEnquiry.companyName = companyName;
            userEnquiry.personName = personName;
            userEnquiry.email = email;
            return userEnquiry;
        }

        #endregion
        #region Primitive Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 id
        {
            get
            {
                return _id;
            }
            set
            {
                if (_id != value)
                {
                    OnidChanging(value);
                    ReportPropertyChanging("id");
                    _id = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("id");
                    OnidChanged();
                }
            }
        }
        private global::System.Int32 _id;
        partial void OnidChanging(global::System.Int32 value);
        partial void OnidChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String companyName
        {
            get
            {
                return _companyName;
            }
            set
            {
                OncompanyNameChanging(value);
                ReportPropertyChanging("companyName");
                _companyName = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("companyName");
                OncompanyNameChanged();
            }
        }
        private global::System.String _companyName;
        partial void OncompanyNameChanging(global::System.String value);
        partial void OncompanyNameChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String personName
        {
            get
            {
                return _personName;
            }
            set
            {
                OnpersonNameChanging(value);
                ReportPropertyChanging("personName");
                _personName = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("personName");
                OnpersonNameChanged();
            }
        }
        private global::System.String _personName;
        partial void OnpersonNameChanging(global::System.String value);
        partial void OnpersonNameChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String email
        {
            get
            {
                return _email;
            }
            set
            {
                OnemailChanging(value);
                ReportPropertyChanging("email");
                _email = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("email");
                OnemailChanged();
            }
        }
        private global::System.String _email;
        partial void OnemailChanging(global::System.String value);
        partial void OnemailChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public global::System.String postCode
        {
            get
            {
                return _postCode;
            }
            set
            {
                OnpostCodeChanging(value);
                ReportPropertyChanging("postCode");
                _postCode = StructuralObject.SetValidValue(value, true);
                ReportPropertyChanged("postCode");
                OnpostCodeChanged();
            }
        }
        private global::System.String _postCode;
        partial void OnpostCodeChanging(global::System.String value);
        partial void OnpostCodeChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public global::System.String phoneNumber
        {
            get
            {
                return _phoneNumber;
            }
            set
            {
                OnphoneNumberChanging(value);
                ReportPropertyChanging("phoneNumber");
                _phoneNumber = StructuralObject.SetValidValue(value, true);
                ReportPropertyChanged("phoneNumber");
                OnphoneNumberChanged();
            }
        }
        private global::System.String _phoneNumber;
        partial void OnphoneNumberChanging(global::System.String value);
        partial void OnphoneNumberChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public global::System.String enquiry
        {
            get
            {
                return _enquiry;
            }
            set
            {
                OnenquiryChanging(value);
                ReportPropertyChanging("enquiry");
                _enquiry = StructuralObject.SetValidValue(value, true);
                ReportPropertyChanged("enquiry");
                OnenquiryChanged();
            }
        }
        private global::System.String _enquiry;
        partial void OnenquiryChanging(global::System.String value);
        partial void OnenquiryChanged();

        #endregion
    
    }

    #endregion
    
}
