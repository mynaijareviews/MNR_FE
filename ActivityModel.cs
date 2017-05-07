using RList.Library.DataAccess;
using RList.MNR_Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static RList.MNR_Classes.theWall;

namespace RList.Library
{
    public class ActivityModel
    {
        public enum Type
        {
            Poll, BusinessPost, BusinessReview, MovieReview, ProductReview, UserRegistered, NewsPost,
            Image,
            AskMNR,
            NIL
        }

        public class LikeStats
        {
            private int likes, dislikes;
            private Site_Activities.LIKESTATS userLikeStatus;

            public int Dislikes
            {
                get
                {
                    return dislikes;
                }

                set
                {
                    dislikes = value;
                }
            }

            public int Likes
            {
                get
                {
                    return likes;
                }

                set
                {
                    likes = value;
                }
            }

            public Site_Activities.LIKESTATS UserLikeStatus
            {
                get
                {
                    return userLikeStatus;
                }

                set
                {
                    userLikeStatus = value;
                }
            }

            public string likeClass
            {
                get
                {
                    return "";
                }
            }

            public string disLikeClass
            {
                get
                {
                    return "";
                }
            }

            public LikeStats()
            {
                Likes = Dislikes = 0;
                UserLikeStatus = Site_Activities.LIKESTATS.None;
            }

            public LikeStats(string id, Type contentType)
            {
                switch (contentType)
                {
                    case ActivityModel.Type.NewsPost:
                    case ActivityModel.Type.BusinessPost:
                        var post = Central_Post.getData(Guid.Parse(id));
                        Dislikes = post.Dislikes.Count();
                        Likes = post.Likes.Count();
                        break;

                    case ActivityModel.Type.BusinessReview:
                        var breview = BizReview.getItem(int.Parse(id));
                        Dislikes = breview.Dislikes.Count();
                        Likes = breview.Likes.Count();
                        break;

                    case ActivityModel.Type.MovieReview:
                        var mreview = Movie_Customer_Review.getItem(int.Parse(id));
                        Dislikes = mreview.Dislikes.Count();
                        Likes = mreview.Likes.Count();
                        break;

                    case ActivityModel.Type.ProductReview:
                        var preview = ProductReview.getItem(Guid.Parse(id));
                        Dislikes = preview.Dislikes.Count();
                        Likes = preview.Likes.Count();
                        break;

                    case ActivityModel.Type.Image:
                        var img = Image.getItem(Guid.Parse(id));
                        Dislikes = img.Dislikes.Count();
                        Likes = img.Likes.Count();
                        break;

                    default:
                        Likes = Dislikes = 0;
                        break;
                }
            }
        }

        public struct Comment
        {
            private string id;

            public string ID
            {
                get
                {
                    return $"{id}|{(int)ContentType}";
                }
                set
                {
                    id = value;
                }
            }

            public string ThisComment { get; set; }
            public int Likes { get; set; }
            public Site_Activities.LIKESTATS UserLikeStatus { set; get; }
            public int userLikeStatus { get { return (int)UserLikeStatus; } }
            public int DisLikes { get; set; }
            public User user { get; set; }
            public Type ContentType { get; set; }

            public bool CanReply
            {
                get
                {
                    switch (ContentType)
                    {
                        case Type.Poll:

                        case Type.BusinessPost:

                        case Type.NewsPost:

                        case Type.Image:

                        case Type.NIL:

                        case Type.UserRegistered:

                        default:
                            return false;

                        case Type.BusinessReview:

                        case Type.MovieReview:

                        case Type.ProductReview:

                        case Type.AskMNR:
                            return true;
                    }
                }
            }

            public string UserPhoto35x35
            {
                get
                {
                    return user.getProfilePic(35, 35);
                }
            }

            public int UserID
            {
                get
                {
                    return user.UserID;
                }
            }

            public string UserType
            {
                get
                {
                    return user.Usertype;
                }
            }

            public string Username
            {
                get
                {
                    return user.FullName;
                }
            }

            public string UserProfileLink
            {
                get
                {
                    return user.GuestProfileURL;
                }
            }

            public DateTime Date { get; set; }

            public string commentClass
            {
                get
                {
                    return "comment-button";
                }
            }
        }

        private string id;

        public string ID
        {
            get
            {
                return $"{id}|{(int)ContentType}";
            }
            set
            {
                id = value;
            }
        }

        public Type ContentType { get; set; }
        public ActivityContent Content { get; set; }
        public string Owner { get; set; }
        public string OwnerURL { get; set; }
        public bool OwnerURLEnabled { get; set; }
        public string OwnerImage { get; set; }
        public string OwnerImageURL { get; set; }
        public DateTime Date { get; set; }
        public List<Comment> Comments { get; set; }
        public LikeStats LikeStat { get; set; }
        public bool CanEditDelete { get; set; }
        private bool canComment;

        public bool CanComment
        {
            get
            {
                return Validator.CanComment && canComment;
            }
            internal set
            {
                canComment = value;
            }
        }

        private bool canLikeDislike;

        public bool CanLikeDislike
        {
            get
            {
                return Validator.CanLike && canLikeDislike;
            }
            internal set
            {
                canLikeDislike = value;
            }
        }

        public bool IsAD { get; internal set; }
        public bool isVerififed { get; set; }
        public bool showPostOptions { get; set; }

        public bool ShowSavePost
        {
            get
            {
                return User.IsLoggedIn && Validator.CanSave;
            }
        }

        public bool ShowSharePost
        {
            get
            {
                return User.IsLoggedIn && Validator.CanShare;
            }
        }

        public bool ShowShareExternalPost
        {
            get
            {
                return Validator.CanShare;
            }
        }

        public ActivityContainer activityContainer { get; set; }

        public ValidateResult Validator
        {
            get
            {
                if (validator == null)
                {
                    validator = Validate(ContentType);
                }
                return validator.Value;
            }
        }

        private ValidateResult? validator = null;

        private ValidateResult Validate(Type type)
        {
            switch (type)
            {
                case Type.Poll:
                    return ValidateActivity<MNR_POLL>.Validate();

                case Type.NewsPost:
                case Type.BusinessPost:
                    return ValidateActivity<Central_Post>.Validate();

                case Type.BusinessReview:
                    return ValidateActivity<BizReview>.Validate();

                case Type.MovieReview:
                    return ValidateActivity<Movie_Customer_Review>.Validate();

                case Type.ProductReview:
                    return ValidateActivity<ProductReview>.Validate();

                case Type.Image:
                    return ValidateActivity<Image>.Validate();

                case Type.AskMNR:
                    return ValidateActivity<AskMNR_Q>.Validate();

                case Type.UserRegistered:
                case Type.NIL:

                default:
                    return new ValidateResult();
            }
        }
    }
}