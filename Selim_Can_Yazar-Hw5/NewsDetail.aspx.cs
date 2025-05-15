using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Linq;

namespace Selim_Can_Yazar_Hw5
{
    public partial class NewsDetail : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //  A) Dropdown-menü için kategorileri Home.aspx ile aynı sırada yükle
                var allNews = new List<News>();
                string connStr2 = ConfigurationManager.ConnectionStrings["AccessDb"].ConnectionString;
                using (var conn = new OleDbConnection(connStr2))
                {
                    conn.Open();
                    using (var cmd2 = new OleDbCommand("SELECT * FROM News ORDER BY PubDate DESC", conn))
                    using (var rdr2 = cmd2.ExecuteReader())
                    {
                        while (rdr2.Read())
                        {
                            allNews.Add(new News(
                                Convert.ToInt32(rdr2["NewsID"]),
                                rdr2["Title"].ToString(),
                                rdr2["Description"].ToString(),
                                rdr2["Category"].ToString(),
                                rdr2["Author"].ToString(),
                                rdr2["PubDate"].ToString(),
                                rdr2["ImageUrl"].ToString()
                            ));
                        }
                    }
                }
                var groupedMenu = allNews
                    .GroupBy(n => string.IsNullOrEmpty(n.Category) ? "Uncategorized" : n.Category)
                    .Select(g => new { Category = g.Key, Items = g.ToList() })
                    .ToList();
                rptCategoryMenu.DataSource = groupedMenu;
                rptCategoryMenu.DataBind();
                // ID doğrulama
                if (!int.TryParse(Request.QueryString["id"], out int id))
                {
                    litDescription.Text = "<p class='text-danger'>Geçersiz haber ID.</p>";
                    return;
                }

                string connStr = ConfigurationManager
                                   .ConnectionStrings["AccessDb"]
                                   .ConnectionString;
                using (var conn = new OleDbConnection(connStr))
                {
                    conn.Open();
                    var cmd = new OleDbCommand(
                      "SELECT * FROM News WHERE NewsID = @id", conn);
                    cmd.Parameters.AddWithValue("@id", id);

                    using (var reader = cmd.ExecuteReader())
                    {
                        if (!reader.Read())
                        {
                            litDescription.Text = "<p class='text-danger'>Haber bulunamadı.</p>";
                            return;
                        }

                        // Başlık, kategori, yazar, tarih
                        litTitle.Text = reader["Title"].ToString();
                        litCategory.Text = reader["Category"].ToString();
                        litAuthor.Text = reader["Author"].ToString();
                        litPubDate.Text = reader["PubDate"].ToString();

                        // Tekil resim
                        var imgUrl = reader["ImageUrl"].ToString();
                        if (!String.IsNullOrEmpty(imgUrl))
                        {
                            imgNews.ImageUrl = imgUrl;
                            imgNews.Visible = true;
                        }

                        // Açıklama HTML'si
                        string html = reader["Description"].ToString();

                        // — İlk <img> etiketini kaldır (duplication'ı önler)
                        var imgRegex = new Regex("<img[^>]*>", RegexOptions.IgnoreCase);
                        html = imgRegex.Replace(html, "", 1);

                        // Literal'e aktar
                        litDescription.Text = html;
                    }
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}
