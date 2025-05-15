<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsDetail.aspx.cs" Inherits="Selim_Can_Yazar_Hw5.NewsDetail" %>
<!DOCTYPE html>
<html>
<head runat="server">
  <meta charset="utf-8" />
  <title>Haber Detayı</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
       <!-- Font Awesome (sosyal ikonlar için) -->
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha384-…"
        crossorigin="anonymous" />

  <style>
    /* --- main-nav --- */
    #main-nav {
      background-color: #fff;
      position: sticky;
      top: 0;
      z-index: 1000;
      border-bottom: 1px solid #ddd;
    }
    #main-nav .container {
      display: grid;
      grid-template-columns: 0.6fr 3fr 2fr;
      padding: 1rem;
      align-items: center;
    }
    #main-nav .logo-panel {
      width: 70px;
      height: 70px;
      overflow: hidden; 
      position: relative;
    }
    #main-nav .logo-panel .logo {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transform: scale(2); /* Büyütme */
      z-index: -1;
    }
     #main-nav .container > ul {
   display: flex;
   justify-self: center;
   list-style: none;
   align-content:center;
 }
    /*#main-nav ul li a {
      padding: 1rem; 
      font-weight: bold;
      color: #2a9d8f;
    }
    #main-nav ul li a.active {
      background-color: #e76f51;
      color: #fff; 
      border-radius: 10px;
    }
    #main-nav ul li a:hover {
      background-color: #dee2e6;
      color: #6c757d; 
      border-radius: 10px;
    }*/
    #main-nav .social-icons {
      justify-self: end;
    }
    #main-nav .social-icons a {
      margin: 0 0.5rem;
      transition: transform 0.3s, box-shadow 0.3s;
    }

    /* --- crypto-prices --- */
    #crypto-prices {
      background: #f8f9fa;
      padding: 0.5rem;
      text-align: center;
      font-size: 0.7rem;
      border-bottom: 2px solid #ddd;
      position: sticky;
      z-index: 999;
    }
    .crypto-item {
      margin: 0 1rem;
      display: inline-flex;
      align-items: center;
    }
    .crypto-item img {
      width: 1.6rem;
      height: 1.6rem;
      margin-right: 0.5rem;
    }
    #crypto-prices .change {
      font-size: 1rem;    
    }

    /* Küçük ayarlar */
    body { margin-top: 0; }

    /* --- main-nav içindeki sosyal ikonlar --- */
#main-nav .social-icons a {
  display: inline-block;
  margin: 0 1rem;
  transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
}

/* Facebook ikonu */
#main-nav .social-icons a:nth-child(1) i {
  color: #1877f2;
  border-radius: 1rem;
}
#main-nav .social-icons a:nth-child(1):hover i {
  transform: translateY(-5px) scale(1.2);
  box-shadow: -5px 5px 0px rgba(24,119,242,1), -10px 10px 0px rgba(24,119,242,0.7);
  border-radius: 1.5rem;
}
#main-nav .social-icons a:nth-child(1):active i {
  opacity: 0.7;
}

/* YouTube ikonu */
#main-nav .social-icons a:nth-child(2) i {
  color: #ff0000;
  border-radius: 1rem;
}
#main-nav .social-icons a:nth-child(2):hover i {
  transform: translateY(-5px) scale(1.2);
  box-shadow: -5px 5px 0px rgba(255,0,0,1), -10px 10px 0px rgba(255,0,0,0.7);
  border-radius: 1.5rem;
}
#main-nav .social-icons a:nth-child(2):active i {
  opacity: 0.7;
}

/* Twitter ikonu */
#main-nav .social-icons a:nth-child(3) i {
  color: #1da1f2;
  border-radius: 1rem;
}
#main-nav .social-icons a:nth-child(3):hover i {
  transform: translateY(-5px) scale(1.2);
  box-shadow: -5px 5px 0px rgba(29,161,242,1), -10px 10px 0px rgba(29,161,242,0.7);
  border-radius: 1.5rem;
}
#main-nav .social-icons a:nth-child(3):active i {
  opacity: 0.7;
}

/* Instagram ikonu */
#main-nav .social-icons a:nth-child(4) i {
  background: linear-gradient(45deg, #f9ce34, #ee2a7b, #6228d7);
  -webkit-background-clip: text;
  background-clip: text;
  -webkit-text-fill-color: transparent;
  color: transparent;
  border-radius: 1rem;
}
#main-nav .social-icons a:nth-child(4):hover i {
  transform: translateY(-5px) scale(1.2);
  box-shadow: -5px 5px 0px rgba(239,89,153,1), -10px 10px 0px rgba(239,89,153,0.7);
  border-radius: 1.5rem;
}
#main-nav .social-icons a:nth-child(4):active i {
  opacity: 0.7;
}

/* LinkedIn ikonu */
#main-nav .social-icons a:nth-child(5) i {
  color: #0a66c2;
}
#main-nav .social-icons a:nth-child(5):hover i {
  transform: translateY(-5px) scale(1.2);
  box-shadow: -5px 5px 0px rgba(10,102,194,1), -10px 10px 0px rgba(10,102,194,0.7);
  border-radius: 1.5rem;
}
#main-nav .social-icons a:nth-child(5):active i {
  opacity: 0.7;
}


    /* Detay sayfasındaki bağımsız resim */
    .article-img {
      display: block;
      margin: 1rem auto;
      max-height: 30vh;
      width: auto;
    }
    /* Açıklama içindeki tüm <img> etiketleri için */
    .article-content img {
      display: block;
      margin: 1rem auto;
      max-height: 30vh;
      width: auto;
    }


    /* sayfa gövdesi arkaplanı */
   body {
     background-color: #6c757d;
     margin: 0;
     padding: 0;
   }
   /* haber kartı */
   .news-card {
     width: 50%;
     background-color: #dee2e6;
     margin: 2rem auto;
     border: none;
   }
   .news-card .card-body { padding: 2rem; }
   .news-card .card-title { 
       text-align: center; 
       margin-bottom: 1.5rem;
       width: 75%;
  margin: 0 auto 1.5rem;  /* üstte 0, yanda otomatik ortala, altta 1.5rem boşluk */
   }
   .news-card .news-meta { text-align: center; margin-bottom: 1.5rem; }
   .news-card .article-content { width: 75%; margin: 0 auto; }
   /* Haber resimlerinin tamamı kartı doldursun, taşanı kırpsın */
.news-card .article-img,
.news-card .article-content img {
  display: block;
  width: 75%;            /* kart genişliğini (padding hariç) doldur */
  height: 20rem;          /* sabit yükseklik: ihtiyacınıza göre ayarlayın */
  object-fit: cover;      /* kırparak kutuyu doldur */
  margin: 0 auto 1.5rem;  /* alt boşluk ve ortalama */
  border-radius: 0.25rem; /* istersen hafif yuvarlak köşe */
}

   .news-card .btn-back {
     display: block;
     margin: 2rem auto 0;
   }
   .dropdown-menu {
  top: auto !important;    /* varsayılan konumdan sıyrıl */
  bottom: auto !important;
  transform: translate3d(0, .25rem, 0) !important; /* aşağı doğru */
}
  </style>
</head>
<body>

      
    <!-- ===== main-nav ===== -->
  <nav id="main-nav">
    <div class="container">
      <div class="logo-panel">
        <video autoplay loop muted class="logo">
          <source src="img/N.mp4" type="video/mp4" />
        </video>
      </div>
         <ul>
      <li><button type="button" id="btnScrollTop" class="btn btn-warning text-white me-2" >Ana Sayfa</button></li>
      <li>
<div class="btn-group me-2">
  <!-- 2a) Ana düğme: accordion’a scroll -->
  <button type="button"
          class="btn btn-warning text-white "
          id="btnScrollCats">
    Kategoriler
  </button>
  <!-- 2b) Dropdown toggle -->
  <button id="btnDropdownCats"
         type="button"
          class="btn btn-warning dropdown-toggle dropdown-toggle-split text-white"
          data-bs-toggle="dropdown"
          aria-expanded="false"aria-haspopup="true">
    <span class="visually-hidden">Kategoriler</span>
  </button>
  <!-- 2c) Menu: her kategori için bir <a> -->
  <ul class="dropdown-menu" aria-labelledby="btnDropdownCats">
    <asp:Repeater ID="rptCategoryMenu" runat="server">
      <ItemTemplate>
        <li>
          <a href="#"
             class="dropdown-item cat-link"
             data-target='<%# "heading" + Container.ItemIndex %>'>
            <%# Eval("Category") %>
          </a>
        </li>
      </ItemTemplate>
    </asp:Repeater>
  </ul>
</div>
         </li>
      
    </ul>
      <div class="social-icons">
        <a href="#"><i class="fab fa-facebook fa-2x"></i></a>
        <a href="#"><i class="fab fa-youtube fa-2x"></i></a>
        <a href="#"><i class="fab fa-twitter fa-2x"></i></a>
        <a href="#"><i class="fab fa-instagram fa-2x"></i></a>
        <a href="#"><i class="fab fa-linkedin fa-2x"></i></a>
      </div>
    </div>
  </nav>

  <!-- ===== crypto-prices ===== -->
  <div id="crypto-prices">
    <span id="btc-price" class="crypto-item">BTC: --</span> 
    <span id="eth-price" class="crypto-item">ETH: --</span> 
    <span id="bnb-price" class="crypto-item">BNB: --</span> 
    <span id="xrp-price" class="crypto-item">XRP: --</span> 
    <span id="ada-price" class="crypto-item">ADA: --</span>
  </div>

<form id="form2" runat="server">
   <div class="card news-card">
     <div class="card-body">
       <!-- 1) Başlık -->
       <h1 class="card-title">
         <asp:Literal ID="litTitle" runat="server" Mode="PassThrough" />
       </h1>

       <!-- 2) Meta bilgileri -->
       <div class="news-meta">
         <strong>Kategori:</strong> <asp:Literal ID="litCategory" runat="server" />
         &nbsp;|&nbsp;
         <strong>Yazar:</strong> <asp:Literal ID="litAuthor" runat="server" />
         &nbsp;|&nbsp;
         <strong>Tarih:</strong> <asp:Literal ID="litPubDate" runat="server" />
       </div>

       <!-- 3) Haber resmi -->
       <asp:Image ID="imgNews" runat="server"
                  CssClass="article-img"
                  Visible="false" />

       <!-- 4) Haber içeriği -->
       <div class="article-content">
         <asp:Literal ID="litDescription" runat="server" Mode="PassThrough" />
       </div>

       <!-- 5) Geri dön butonu -->
       <asp:Button ID="btnBack" runat="server" Text="⟵ Geri Dön"
                   CssClass="btn btn-secondary btn-back"
                   OnClick="btnBack_Click" />
     </div>
   </div>
 </form>

       <script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
 </script>
    <!-- ===== Crypto Fiyatları JS ===== -->
 <script>
     async function fetchCryptoPrices() {
         try {
             // 1) Coingecko’dan bilinen ikon haritası
             const iconMap = {
                 BTC: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png",
                 ETH: "https://assets.coingecko.com/coins/images/279/large/ethereum.png",
                 BNB: "https://assets.coingecko.com/coins/images/825/large/binance-coin-logo.png",
                 XRP: "https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png",
                 ADA: "https://assets.coingecko.com/coins/images/975/large/cardano.png"
             };

             const cryptos = [
                 { symbol: "BTCUSDT", name: "BTC" },
                 { symbol: "ETHUSDT", name: "ETH" },
                 { symbol: "BNBUSDT", name: "BNB" },
                 { symbol: "XRPUSDT", name: "XRP" },
                 { symbol: "ADAUSDT", name: "ADA" },
             ];

             // 2) Binance API’dan fiyat bilgisi al
             const results = await Promise.all(
                 cryptos.map(c =>
                     fetch(`https://api.binance.com/api/v3/ticker/24hr?symbol=${c.symbol}`)
                         .then(res => res.json())
                 )
             );

             // 3) Elde edilen her kripto için DOM'u güncelle
             results.forEach((data, i) => {
                 const { name } = cryptos[i];
                 const price = parseFloat(data.lastPrice).toFixed(2);
                 const change = parseFloat(data.priceChangePercent).toFixed(2);
                 const up = change >= 0;
                 const arrow = up ? "&uarr;" : "&darr;";
                 const color = up ? "green" : "red";

                 // hedef span
                 const el = document.getElementById(`${name.toLowerCase()}-price`);
                 if (!el) return;

                 el.innerHTML = `
 <img src="${iconMap[name]}" ... />
 <strong>${name}</strong>: $${price}
 <span class="change" style="color:${color}; font-weight:bold; margin-left:6px;">
   ${arrow} ${Math.abs(change)}%
 </span>`;

             });
         } catch (err) {
             console.error("Kripto API Hatası:", err);
             document.getElementById("crypto-prices")
                 .innerText = "Kripto fiyatları alınamıyor!";
         }
     }

     // İlk yüklemede ve her 10 saniyede bir güncelle
     fetchCryptoPrices();
     setInterval(fetchCryptoPrices, 10000);
 </script>

    <script>
        // 1) "Ana Sayfa" butonu: Home.aspx’e, en üste
        document.getElementById("btnScrollTop")
            .addEventListener("click", e => {
                e.preventDefault();
                window.location.href = "Home.aspx";
            });

        // 2) "Kategoriler" butonu: Home.aspx’e, accordionContainer'a
        document.getElementById("btnScrollCats")
            .addEventListener("click", e => {
                e.preventDefault();
                // #accordionCategories varsa en başına gidecek
                window.location.href = "Home.aspx#accordionCategories";
            });

        // 3) Dropdown içindeki kategori linkleri: Home.aspx’e, ilgili headingX’e
        document.querySelectorAll(".cat-link").forEach(el => {
            el.addEventListener("click", e => {
                e.preventDefault();
                const heading = el.getAttribute("data-target"); // "heading2" gibi
                window.location.href = `Home.aspx#${heading}`;
            });
        });
    </script>


</body>
</html>
