<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs"
    Inherits="Selim_Can_Yazar_Hw5.Home" %>

<!DOCTYPE html>
<html>
<head runat="server">
  <meta charset="utf-8" />
  <title>Güncel Haberler</title>
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
    rel="stylesheet" />

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
      color: #6c757d;
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
    body { margin-top: 0; 
           background-color: #dee2e6;
    }

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

/*  Accordion header arkaplan ve yazı rengi */
#accordionCategories .accordion-button {
  background-color: #6c757d;  /* koyu gri arkaplan */
  color: #fff;                /* başlık yazıları beyaz */
  font-weight: 700;  /* veya bold */
}
/* Çöktürüldüğünde (expanded) de aynı görünüm için: */
#accordionCategories .accordion-button:not(.collapsed) {
  background-color: #6c757d;
  /*color: #fff;*/
  color:var(--bs-warning) !important;
  

}
/* Ok ikonunu (arrow) hep beyaz göstermek için */
#accordionCategories .accordion-button::after {
  /* Bootstrap’ın SVG icon’unu tersleyerek beyazlatıyoruz */
  filter: brightness(0) invert(1);
}
/* Accordion içeriğinin (body) arkaplanı */
#accordionCategories .accordion-body {
  background-color: #dee2e6;
}
/* Accordion butonu odaklandığında (tıklandığında veya klavyeyle ulaşıldığında) */
.accordion-button:focus {
  /* Kenarlık rengini warning sarısına çeviriyoruz */
  border-color: var(--bs-warning) !important;
  /* Box-shadow’ı warning renginin rgba() değerine göre ayarlıyoruz */
  box-shadow: 0 0 0 0.25rem rgba(var(--bs-warning-rgb), .25) !important;
}
/* Accordion header’ların scroll edildiğinde sticky nav’dan aşağıda kalması için */
.accordion-header {
  scroll-margin-top: 9rem; /* main-nav yüksekliğine yakın bir değer */
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

  <form id="form1" runat="server">
    <div class="container py-5 ">

          <!-- ===== Carousel Başlangıç ===== -->
    <div id="slider1"
         class="carousel slide carousel-fade carousel-warning mb-5 w-75 mx-auto"
         data-bs-ride="carousel"
         data-bs-interval="2000">

      <!-- Indicators: üstte göstermek için bottom:auto; top:0; -->
      <div class="carousel-indicators" style="top:0; bottom:auto;">
        <asp:Repeater ID="rptIndicators" runat="server">
          <ItemTemplate>
            <button type="button"
                    data-bs-target="#slider1"
                    data-bs-slide-to="<%# Container.ItemIndex %>"
                    class="<%# Container.ItemIndex == 0 ? "active" : "" %>"
                    aria-label="Slide <%# Container.ItemIndex + 1 %>">
            </button>
          </ItemTemplate>
        </asp:Repeater>
      </div>

      <!-- Slaytlar -->
      <div class="carousel-inner">
        <asp:Repeater ID="rptCarousel" runat="server">
          <ItemTemplate>
            <div class="carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>">
              <asp:HyperLink runat="server"
                             NavigateUrl='<%# "NewsDetail.aspx?id=" + Eval("NewsID") %>'>
                <asp:Image runat="server"
                           ImageUrl='<%# Eval("ImageUrl") %>'
                           CssClass="d-block w-100"
                           AlternateText='<%# Eval("Title") %>' />
                <div class="carousel-caption d-none d-md-block">
                  <h2 class="text-warning"><%# Eval("Title") %></h2>
                </div>
              </asp:HyperLink>
            </div>
          </ItemTemplate>
        </asp:Repeater>
      </div>

      <!-- Prev / Next kontroller -->
      <button class="carousel-control-prev" type="button"
              data-bs-target="#slider1" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"
              aria-hidden="true"
              style="filter:invert(27%) sepia(83%) saturate(3832%) hue-rotate(358deg) brightness(94%) contrast(101%);
                     width:5rem; height:5rem;">
        </span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button"
              data-bs-target="#slider1" data-bs-slide="next">
        <span class="carousel-control-next-icon"
              aria-hidden="true"
              style="filter:invert(27%) sepia(83%) saturate(3832%) hue-rotate(358deg) brightness(94%) contrast(101%);
                     width:5rem; height:5rem;">
        </span>
        <span class="visually-hidden">Next</span>
      </button>

    </div>
    <!-- ===== Carousel Son ===== -->


      <h1 class="mb-3" style="color:#6c757d;">Haber Kategorileri</h1>

      <!-- Accordion kapsayıcı -->
      <div class="accordion vh-50" id="accordionCategories" >
        <asp:Repeater ID="rptCategories" runat="server"
                      OnItemDataBound="rptCategories_ItemDataBound">
          <ItemTemplate>
            <div class="accordion-item bg-transparent">
              <!-- Header -->
              <h2 class="accordion-header"
                  id='heading<%# Container.ItemIndex %>'>
                <button class="accordion-button collapsed mb-2"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#collapse<%# Container.ItemIndex %>"
                        aria-expanded="false"
                        aria-controls="collapse<%# Container.ItemIndex %>">
                  <%# Eval("Category") %>
                </button>
              </h2>
              <!-- Body -->
              <div id="collapse<%# Container.ItemIndex %>"
                   class="accordion-collapse collapse "
                   aria-labelledby='heading<%# Container.ItemIndex %>'
                   data-bs-parent="#accordionCategories">
                <div class="accordion-body overflow-auto" style="max-height:50vh;">
                  <div class="row">
                    <!-- İçerideki haberler için nested Repeater -->
                    <asp:Repeater ID="rptNews" runat="server">
                      <ItemTemplate>
                        <div class="col-md-4 mb-4">
                          <div class="card h-100">
                            <asp:Image ID="imgThumb" runat="server"
                                       CssClass="card-img-top"
                                       Visible='<%# !String.IsNullOrEmpty(Eval("ImageUrl").ToString()) %>'
                                       ImageUrl='<%# Eval("ImageUrl") %>' />
                            <div class="card-body d-flex flex-column">
                              <h5 class="card-title">
                                <%# Eval("Title") %>
                              </h5>
                              <asp:HyperLink ID="hlDetail" runat="server"
                                             CssClass="btn btn-warning mt-auto text-white"
                                             NavigateUrl='<%# "NewsDetail.aspx?id=" + Eval("NewsID") %>'
                                             Text="Detay" />
                            </div>
                          </div>
                        </div>
                      </ItemTemplate>
                    </asp:Repeater>
                  </div>
                </div>
              </div>
            </div>
          </ItemTemplate>
        </asp:Repeater>
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
        // Home’a tıklandığında sayfanın en üstüne smooth scroll
        document.getElementById("btnScrollTop")
            .addEventListener("click", function (e) {
                e.preventDefault();
                window.scrollTo({ top: 0, behavior: "smooth" });
            });
        // 2a) Kategoriler düğmesi: accordion bölümüne scroll
        document.getElementById("btnScrollCats")
            .addEventListener("click", function () {
                document.getElementById("accordionCategories")
                    .scrollIntoView({ behavior: "smooth" });
            });

        // 2c) Dropdown’daki her kategori linki
        document.querySelectorAll(".cat-link").forEach(function (a) {
            a.addEventListener("click", function (e) {
                e.preventDefault();
                // hedef heading id’si
                var headingId = this.dataset.target;
                // önce hedef accordion’u aç
                var collapseId = headingId.replace("heading", "collapse");
                var el = document.getElementById(collapseId);
                new bootstrap.Collapse(el, { toggle: true });
                // sonra heading’in üstüne scroll
                document.getElementById(headingId)
                    .scrollIntoView({ behavior: "smooth" });
            });
        });

    </script>
  

<script>
    window.addEventListener("DOMContentLoaded", () => {
        const hash = window.location.hash;         // örn. "#heading3"
        if (!/^#heading\d+$/.test(hash)) return;   // sadece #headingX formatıysa devam

        // 1) İlgili header ve collapse elementlerini bul
        const header = document.querySelector(hash);
        const idx = hash.replace("#heading", "");
        const collapseEl = document.getElementById("collapse" + idx);
        if (!header || !collapseEl) return;

        // 2) Direkt CSS sınıflarıyla aç
        collapseEl.classList.add("show");
        // panel içindeki button’ı da açık durumuna getir
        const btn = header.querySelector(".accordion-button");
        if (btn) {
            btn.classList.remove("collapsed");
            btn.setAttribute("aria-expanded", "true");
        }

        // 3) Scroll-margin-top ayarımız varsa scrollIntoView da kullanabiliriz
        // fakat nav yüksekliğini çıkararak window.scrollTo tercih edelim
        const navH = document.getElementById("main-nav")?.offsetHeight || 0;
        // header’ın sayfadaki pozisyonu
        const topPos = header.getBoundingClientRect().top + window.pageYOffset;
        window.scrollTo({
            top: topPos - navH - 10,  // navbar altından 10px aşağı
            behavior: "smooth"
        });
    });
</script>








</body>
</html>

