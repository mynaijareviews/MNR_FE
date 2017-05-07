using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RList.Library.DataAccess
{
    public class ActivityViewRequest
    {
        private Activities.Mode mode = Activities.Mode.ALL;
        private string requestUrl;
        private bool thumbnailImage = false;
        private string thumbnailSize = "300px";
        private bool showImage = true;
        private bool showheader = true;
        private bool showContent = true;
        private bool showReadMore = true;
        private bool canComment = true;
        private bool showLikes = true;
        private bool showComments = true;
        private bool canLikeDislike = true;
        private int resultCount = 20;

        public Activities.Mode Mode
        {
            get
            {
                return mode;
            }

            set
            {
                mode = value;
            }
        }

        public bool ThumbnailImage
        {
            get
            {
                return thumbnailImage;
            }

            set
            {
                thumbnailImage = value;
            }
        }

        public string ThumbnailSize
        {
            get
            {
                return thumbnailSize;
            }

            set
            {
                thumbnailSize = value;
            }
        }

        public bool ShowImage
        {
            get
            {
                return showImage;
            }

            set
            {
                showImage = value;
            }
        }

        public bool Showheader
        {
            get
            {
                return showheader;
            }

            set
            {
                showheader = value;
            }
        }

        public bool ShowContent
        {
            get
            {
                return showContent;
            }

            set
            {
                showContent = value;
            }
        }

        public bool ShowReadMore
        {
            get
            {
                return showReadMore;
            }

            set
            {
                showReadMore = value;
            }
        }

        public bool CanComment
        {
            get
            {
                return canComment;
            }

            set
            {
                canComment = value;
            }
        }

        public bool ShowLikes
        {
            get
            {
                return showLikes;
            }

            set
            {
                showLikes = value;
            }
        }

        public bool ShowComments
        {
            get
            {
                return showComments;
            }

            set
            {
                showComments = value;
            }
        }

        public bool CanLikeDislike
        {
            get
            {
                return canLikeDislike;
            }

            set
            {
                canLikeDislike = value;
            }
        }

        public int ResultCount
        {
            get
            {
                return resultCount;
            }

            set
            {
                resultCount = value;
            }
        }

        public string RequestUrl
        {
            get
            {
                return requestUrl;
            }

            set
            {
                requestUrl = value;
            }
        }
    }
}