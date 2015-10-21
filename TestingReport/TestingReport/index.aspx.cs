using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestingReport
{
    public partial class index : System.Web.UI.Page
    {
        public string knowledgeClass = "topBanner";
        public string wayClass = "topBanner";
        public string toolClass = "topBanner";
        public string personalClass = "topBanner";

        public string knowledgePaneClass = "bottom-pane";
        public string wayPaneClass = "bottom-pane";
        public string toolPaneClass = "bottom-pane";
        public string personalPaneClass = "bottom-pane";
        protected void Page_Load(object sender, EventArgs e)
        {
            string key = Request["key"];
            if(key !=null)
            {
                if(key.Equals("knowledge"))
                {
                    knowledgeClass = "topBanner topBanner-active";
                    knowledgePaneClass = "bottom-pane bottom-pane-active";
                }
                if(key.Equals("way"))
                {
                    wayClass = "topBanner topBanner-active";
                    wayPaneClass = "bottom-pane bottom-pane-active";
                }
                if(key.Equals("tool"))
                {
                    toolClass = "topBanner topBanner-active";
                    toolPaneClass = "bottom-pane bottom-pane-active";
                }
            }

        }
    }
}