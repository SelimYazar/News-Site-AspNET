using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Selim_Can_Yazar_Hw5
{
    public partial class Home : Page
    {
        // Bu sınıfı kullanmak için App_Code/News.cs’deki News modelini tutuyoruz.

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 1) Veritabanından tüm haberleri oku
                string connStr = ConfigurationManager
                                   .ConnectionStrings["AccessDb"]
                                   .ConnectionString;

                var list = new List<News>();
                using (var conn = new OleDbConnection(connStr))
                {
                    conn.Open();
                    var cmd = new OleDbCommand("SELECT * FROM News ORDER BY PubDate DESC", conn);
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            list.Add(new News(
                                Convert.ToInt32(reader["NewsID"]),
                                reader["Title"].ToString(),
                                reader["Description"].ToString(),
                                reader["Category"].ToString(),
                                reader["Author"].ToString(),
                                reader["PubDate"].ToString(),
                                reader["ImageUrl"].ToString()
                            ));
                        }
                    }
                }
                // 2) Carousel için en yeni 10 haberi sırala
                     var latest10 = list
                    .OrderByDescending(n => DateTime.Parse(n.PubDate))
                    .Take(10)
                    .ToList();

                     rptIndicators.DataSource = latest10;
                     rptIndicators.DataBind();

                     rptCarousel.DataSource = latest10;
                     rptCarousel.DataBind();
                // 2) Kategoriye göre grupla
                var grouped = list
                    .GroupBy(n => string.IsNullOrEmpty(n.Category)
                                  ? "Uncategorized"
                                  : n.Category)
                    .Select(g => new {
                        Category = g.Key,
                        Items = g.ToList()
                    })
                    .ToList();

                // 3) Outer repeater’a ata
                rptCategories.DataSource = grouped;
                rptCategories.DataBind();

                // 4) dropdown menüye de aynı kaynaktan bind et
                rptCategoryMenu.DataSource = grouped;
                rptCategoryMenu.DataBind();
            }
        }

        protected void rptCategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // Sadece öğe tiplerine bak
            if (e.Item.ItemType == ListItemType.Item ||
                e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // DataItem anonim nesne: { Category = "...", Items = List<News> }
                dynamic data = e.Item.DataItem;
                var items = data.Items as List<News>;

                // Nested repeater’ı bul ve bind et
                var rptNews = (Repeater)e.Item.FindControl("rptNews");
                rptNews.DataSource = items;
                rptNews.DataBind();
            }
        }
    }
}
