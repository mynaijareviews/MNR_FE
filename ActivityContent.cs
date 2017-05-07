using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;

namespace RList.Library.DataAccess
{
    public class ActivityContent
    {
        private string pageTitle = "MyNaijaReviews";
        private string pictureURL;
        private string video;
        private string content;
        private Dictionary<string, int> pollResults = new Dictionary<string, int>();

        private List<HtmlMeta> metaData = new List<HtmlMeta>();

        public string PageTitle
        {
            get
            {
                return pageTitle;
            }

            set
            {
                pageTitle = value;
            }
        }

        public string PictureURL
        {
            get
            {
                return pictureURL;
            }

            set
            {
                pictureURL = value;
            }
        }

        public string Video
        {
            get
            {
                return video;
            }

            set
            {
                video = value;
            }
        }

        public string Content
        {
            get
            {
                return content;
            }

            set
            {
                content = value;
            }
        }

        public Dictionary<string, int> PollResults
        {
            get
            {
                return pollResults;
            }

            set
            {
                pollResults = value;
            }
        }

        public List<HtmlMeta> MetaData
        {
            get
            {
                return metaData;
            }

            set
            {
                metaData = value;
            }
        }
    }
}