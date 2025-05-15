// RSSparsing.aspx.cs
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web.UI;
using CodeHollow.FeedReader;
using log4net;

namespace Selim_Can_Yazar_Hw5
{
    public partial class RSSparsing : Page
    {
        static RSSparsing()
        {
            // TLS 1.2 güvenli protokolü garantile (isteğe bağlı)
            System.Net.ServicePointManager.SecurityProtocol =
                System.Net.SecurityProtocolType.Tls12
              | System.Net.SecurityProtocolType.Tls11
              | System.Net.SecurityProtocolType.Tls;

            log4net.Config.XmlConfigurator.Configure();
        }
        private static readonly ILog logger =
            LogManager.GetLogger(typeof(RSSparsing));

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    // 1) NTV’nin RSS URL’leri ve “fallback” kategori adları
                    var feeds = new Dictionary<string, string>
                    {
                        ["https://www.ntv.com.tr/son-dakika.rss"] = "Son Dakika",
                        ["https://www.ntv.com.tr/gundem.rss"] = "Gündem",
                        ["https://www.ntv.com.tr/turkiye.rss"] = "Türkiye",
                        ["https://www.ntv.com.tr/dunya.rss"] = "Dünya",
                        ["https://www.ntv.com.tr/ekonomi.rss"] = "Ekonomi",
                        ["https://www.ntv.com.tr/spor.rss"] = "Spor",
                        ["https://www.ntv.com.tr/teknoloji.rss"] = "Teknoloji",
                        ["https://www.ntv.com.tr/saglik.rss"] = "Sağlık"
                    };

                    var allNews = new ArrayList();
                    int idCtr = 1;

                    // 2) Her RSS’i çek
                    foreach (var kv in feeds)
                    {
                        string url = kv.Key;
                        string category = kv.Value;

                        // FeedReader.ReadAsync hem HTTP hem de gzip’i halleder
                        var feed = await FeedReader.ReadAsync(url);

                        // ilk 20 öğe
                        foreach (var item in feed.Items.Take(20))
                        {
                            // Başlık
                            string title = item.Title ?? "";

                            // İçerik: önce Content, yoksa Description
                            string content = !string.IsNullOrWhiteSpace(item.Content)
                                             ? item.Content
                                             : item.Description ?? "";

                            // Yazar
                            string author = item.Author ?? "";

                            // Yayın Tarihi
                            string pubDate = item.PublishingDate?.ToString("u") ?? "";

                            // Resim URL’si: content HTML içinden <img> src çıkar
                            string imageUrl = "";
                            var m = Regex.Match(
                                content,
                                "<img[^>]+src=[\"'](?<u>[^\"']+)[\"']",
                                RegexOptions.IgnoreCase
                            );
                            if (m.Success)
                                imageUrl = m.Groups["u"].Value;

                            // Haber nesnesi
                            var news = new News(
                                idCtr++,
                                title,
                                content,
                                category,
                                author,
                                pubDate,
                                imageUrl
                            );
                            allNews.Add(news);

                            // DB’ye kaydet
                            SaveToDb(news);
                        }
                    }

                    // 3) Session’a ata ve kullanıcıya bilgi ver
                    Session["newsList"] = allNews;
                    litStatus.Text =
                        "<div class='alert alert-success'>" +
                        "Haberler çekildi ve kaydedildi. " +
                        "<a href='Home.aspx'>Ana sayfaya git</a></div>";
                }
                catch (Exception ex)
                {
                    logger.Error("RSS parsing sırasında hata oluştu:", ex);
                    litStatus.Text =
                        "<div class='alert alert-danger'>" +
                        "Bir hata oluştu. Log dosyasına bakın.</div>";
                }
            }
        }

        private void SaveToDb(News news)
        {
            string connStr = ConfigurationManager
                               .ConnectionStrings["AccessDb"]
                               .ConnectionString;

            using (var conn = new OleDbConnection(connStr))
            {
                conn.Open();
                var check = new OleDbCommand(
                    "SELECT COUNT(*) FROM News WHERE Title = @Title", conn);
                check.Parameters.AddWithValue("@Title", news.Title);

                if ((int)check.ExecuteScalar() == 0)
                {
                    var ins = new OleDbCommand(@"
                        INSERT INTO News
                          (Title, Description, Category, Author, PubDate, ImageUrl)
                        VALUES
                          (@T,@D,@C,@A,@P,@I)", conn);
                    ins.Parameters.AddWithValue("@T", news.Title);
                    ins.Parameters.AddWithValue("@D", news.Description);
                    ins.Parameters.AddWithValue("@C", news.Category);
                    ins.Parameters.AddWithValue("@A", news.Author);
                    ins.Parameters.AddWithValue("@P", news.PubDate);
                    ins.Parameters.AddWithValue("@I", news.ImageUrl);
                    ins.ExecuteNonQuery();
                }
            }
        }
    }
}
