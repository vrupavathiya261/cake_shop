/* ==========================================================================
   Petal & Crumb — Site Script
   Handles: product data, cart (localStorage), nav, reveal animations,
   toasts, filter bar, and demo form submissions.
   ========================================================================== */

/* ---------------- Product catalogue (single source of truth) ---------------- */
const CAKES = [
  {
    id: 1,
    name: "Belgian Chocolate Truffle Cake",
    category: "Chocolate",
    price: 799,
    oldPrice: 899,
    badge: "Bestseller",
    img: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=700&q=80",
    desc: "Layers of dark Belgian chocolate sponge with silky truffle ganache."
  },
  {
    id: 2,
    name: "Vanilla Bean Cupcake Trio",
    category: "Cupcakes",
    price: 349,
    badge: "Popular",
    img: "https://images.unsplash.com/photo-1587668178277-295251f900ce?auto=format&fit=crop&w=700&q=80",
    desc: "Fluffy vanilla cupcakes swirled with buttercream and sprinkles."
  },
  {
    id: 3,
    name: "Confetti Birthday Cake",
    category: "Birthday",
    price: 949,
    img: "https://images.unsplash.com/photo-1607478900766-efe13248b125?auto=format&fit=crop&w=700&q=80",
    desc: "A rainbow-confetti sponge wrapped in pillowy vanilla frosting."
  },
  {
    id: 4,
    name: "Classic Red Velvet Cake",
    category: "Red Velvet",
    price: 849,
    img: "https://images.unsplash.com/photo-1586985289906-406988974504?auto=format&fit=crop&w=700&q=80",
    desc: "Velvety cocoa layers with tangy cream cheese frosting."
  },
  {
    id: 5,
    name: "Rose Petal Wedding Cake",
    category: "Wedding",
    price: 2499,
    badge: "Premium",
    img: "https://images.unsplash.com/photo-1519340333755-56e9c1d04579?auto=format&fit=crop&w=700&q=80",
    desc: "Three-tier almond sponge finished with hand-piped sugar roses."
  },
  {
    id: 6,
    name: "New York Baked Cheesecake",
    category: "Cheesecake",
    price: 699,
    img: "https://images.unsplash.com/photo-1533134242443-d4fd215305ad?auto=format&fit=crop&w=700&q=80",
    desc: "Rich and creamy, baked slow on a buttery biscuit crust."
  },
  {
    id: 7,
    name: "French Macaron Box (12pc)",
    category: "Cupcakes",
    price: 449,
    img: "https://images.unsplash.com/photo-1558326567-98ae2405596b?auto=format&fit=crop&w=700&q=80",
    desc: "Delicate almond shells in six pastel flavours, filled fresh daily."
  },
  {
    id: 8,
    name: "Salted Caramel Drip Cake",
    category: "Chocolate",
    price: 899,
    badge: "New",
    img: "https://images.unsplash.com/photo-1541599468348-e96984315921?auto=format&fit=crop&w=700&q=80",
    desc: "Moist chocolate sponge under a glossy salted-caramel drip."
  },
  {
    id: 9,
    name: "Strawberry Cream Birthday Cake",
    category: "Birthday",
    price: 999,
    img: "https://images.unsplash.com/photo-1621303837174-89787a7d4729?auto=format&fit=crop&w=700&q=80",
    desc: "Fresh strawberry layers with whipped vanilla mascarpone."
  }
];

/* ---------------- Cart storage helpers ---------------- */
const CART_KEY = "petalcrumb_cart";

function getCart(){
  try{
    return JSON.parse(localStorage.getItem(CART_KEY)) || [];
  }catch(e){ return []; }
}
function saveCart(cart){
  localStorage.setItem(CART_KEY, JSON.stringify(cart));
  updateCartBadge();
}
function addToCart(id, qty = 1){
  const cart = getCart();
  const existing = cart.find(i => i.id === id);
  if(existing){ existing.qty += qty; }
  else{ cart.push({ id, qty }); }
  saveCart(cart);
}
function removeFromCart(id){
  saveCart(getCart().filter(i => i.id !== id));
}
function changeQty(id, delta){
  const cart = getCart();
  const item = cart.find(i => i.id === id);
  if(!item) return;
  item.qty += delta;
  if(item.qty <= 0){
    saveCart(cart.filter(i => i.id !== id));
  }else{
    saveCart(cart);
  }
}
function cartCount(){
  return getCart().reduce((sum, i) => sum + i.qty, 0);
}
function cartTotal(){
  const cart = getCart();
  return cart.reduce((sum, i) => {
    const product = CAKES.find(c => c.id === i.id);
    return product ? sum + product.price * i.qty : sum;
  }, 0);
}
function updateCartBadge(){
  document.querySelectorAll(".cart-count").forEach(el => {
    const count = cartCount();
    el.textContent = count;
    el.style.display = count > 0 ? "flex" : "none";
  });
}

/* ---------------- Toast notification ---------------- */
function showToast(message){
  let toast = document.querySelector(".toast");
  if(!toast){
    toast = document.createElement("div");
    toast.className = "toast";
    toast.innerHTML = `<span class="ic">✓</span><span class="msg"></span>`;
    document.body.appendChild(toast);
  }
  toast.querySelector(".msg").textContent = message;
  toast.classList.add("show");
  clearTimeout(toast._timer);
  toast._timer = setTimeout(() => toast.classList.remove("show"), 2600);
}

/* ---------------- Add-to-cart button wiring ---------------- */
function wireAddToCartButtons(){
  document.querySelectorAll("[data-add-cart]").forEach(btn => {
    btn.addEventListener("click", (e) => {
      e.preventDefault();
      const id = Number(btn.getAttribute("data-add-cart"));
      const product = CAKES.find(c => c.id === id);
      if(!product) return;
      addToCart(id, 1);
      showToast(`${product.name} added to cart`);
      const original = btn.innerHTML;
      btn.classList.add("added");
      btn.innerHTML = "✓ Added";
      setTimeout(() => {
        btn.classList.remove("added");
        btn.innerHTML = original;
      }, 1200);
    });
  });
}

/* ---------------- Render cake cards ---------------- */
function cakeCardHTML(c){
  const oldPrice = c.oldPrice ? `<span>₹${c.oldPrice}</span>` : "";
  const badge = c.badge ? `<span class="cake-badge">${c.badge}</span>` : "";
  return `
    <article class="cake-card reveal in" data-category="${c.category}">
      <div class="cake-media">
        <img src="${c.img}" alt="${c.name}" loading="lazy">
        <span class="cake-tag">${c.category}</span>
        ${badge}
      </div>
      <div class="cake-body">
        <h3>${c.name}</h3>
        <p class="desc">${c.desc}</p>
        <div class="cake-meta">
          <div class="cake-price">₹${c.price}${oldPrice}</div>
        </div>
        <button class="add-cart-btn" data-add-cart="${c.id}">🧁 Add to Cart</button>
      </div>
    </article>`;
}

function renderCakeGrid(targetSelector, list){
  const target = document.querySelector(targetSelector);
  if(!target) return;
  target.innerHTML = list.map(cakeCardHTML).join("");
  wireAddToCartButtons();
}

/* ---------------- Filter bar (cakes page) ---------------- */
function wireFilterBar(){
  const bar = document.querySelector(".filter-bar");
  if(!bar) return;
  bar.addEventListener("click", (e) => {
    const btn = e.target.closest(".filter-btn");
    if(!btn) return;
    bar.querySelectorAll(".filter-btn").forEach(b => b.classList.remove("active"));
    btn.classList.add("active");
    const cat = btn.getAttribute("data-filter");
    const list = cat === "All" ? CAKES : CAKES.filter(c => c.category === cat);
    renderCakeGrid("#cakeGrid", list);
  });
}

/* ---------------- Render cart page ---------------- */
function renderCartPage(){
  const wrap = document.querySelector("#cartItems");
  if(!wrap) return;
  const cart = getCart();

  if(cart.length === 0){
    document.querySelector("#cartLayout").style.display = "none";
    document.querySelector("#emptyCart").style.display = "block";
    return;
  }
  document.querySelector("#cartLayout").style.display = "grid";
  document.querySelector("#emptyCart").style.display = "none";

  wrap.innerHTML = cart.map(item => {
    const p = CAKES.find(c => c.id === item.id);
    if(!p) return "";
    return `
      <div class="cart-item" data-id="${p.id}">
        <img src="${p.img}" alt="${p.name}">
        <div>
          <div class="cart-item-name">${p.name}</div>
          <div class="cart-item-cat">${p.category}</div>
        </div>
        <div class="qty-control">
          <button data-qty="-1">−</button>
          <span>${item.qty}</span>
          <button data-qty="1">+</button>
        </div>
        <div class="item-price">₹${p.price * item.qty}</div>
        <button class="remove-btn" data-remove title="Remove">✕</button>
      </div>`;
  }).join("");

  wrap.querySelectorAll(".qty-control button").forEach(btn => {
    btn.addEventListener("click", () => {
      const id = Number(btn.closest(".cart-item").dataset.id);
      changeQty(id, Number(btn.dataset.qty));
      renderCartPage();
    });
  });
  wrap.querySelectorAll("[data-remove]").forEach(btn => {
    btn.addEventListener("click", () => {
      const id = Number(btn.closest(".cart-item").dataset.id);
      removeFromCart(id);
      showToast("Item removed from cart");
      renderCartPage();
    });
  });

  const subtotal = cartTotal();
  const delivery = subtotal > 0 ? 60 : 0;
  const total = subtotal + delivery;
  document.querySelector("#summarySubtotal").textContent = `₹${subtotal}`;
  document.querySelector("#summaryDelivery").textContent = `₹${delivery}`;
  document.querySelector("#summaryTotal").textContent = `₹${total}`;
}

function wireCheckout(){
  const btn = document.querySelector("#checkoutBtn");
  if(!btn) return;
  btn.addEventListener("click", () => {
    if(getCart().length === 0) return;
    showToast("🎉 Order placed! Thank you for shopping with us.");
    localStorage.removeItem(CART_KEY);
    updateCartBadge();
    setTimeout(renderCartPage, 400);
  });
}

/* ---------------- Nav: mobile menu + scroll shadow ---------------- */
function wireNav(){
  const burger = document.querySelector(".hamburger");
  const links = document.querySelector(".nav-links");
  if(burger && links){
    burger.addEventListener("click", () => {
      burger.classList.toggle("open");
      links.classList.toggle("open");
    });
    links.querySelectorAll("a").forEach(a => a.addEventListener("click", () => {
      burger.classList.remove("open");
      links.classList.remove("open");
    }));
  }
  const nav = document.querySelector(".navbar");
  if(nav){
    window.addEventListener("scroll", () => {
      nav.classList.toggle("scrolled", window.scrollY > 10);
    });
  }
}

/* ---------------- Reveal-on-scroll ---------------- */
function wireReveal(){
  const items = document.querySelectorAll(".reveal");
  if(!items.length) return;
  const io = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if(entry.isIntersecting){
        entry.target.classList.add("in");
        io.unobserve(entry.target);
      }
    });
  }, { threshold: 0.15 });
  items.forEach(el => io.observe(el));
}

/* ---------------- Demo form handling (no backend) ---------------- */
function wireDemoForm(formSelector, successMessage, redirect){
  const form = document.querySelector(formSelector);
  if(!form) return;
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const successBox = form.querySelector(".form-success");
    if(successBox){
      successBox.classList.add("show");
      successBox.scrollIntoView({ behavior: "smooth", block: "center" });
    }
    showToast(successMessage);
    form.reset();
    if(redirect){
      setTimeout(() => { window.location.href = redirect; }, 1400);
    }
  });
}

/* ---------------- Init ---------------- */
document.addEventListener("DOMContentLoaded", () => {
  updateCartBadge();
  wireNav();
  wireReveal();
  wireAddToCartButtons();

  // Home page featured cakes
  renderCakeGrid("#featuredGrid", CAKES.slice(0, 4));

  // Cakes page full grid + filters
  if(document.querySelector("#cakeGrid")){
    renderCakeGrid("#cakeGrid", CAKES);
    wireFilterBar();
  }

  // Cart page
  renderCartPage();
  wireCheckout();

  // Forms
  wireDemoForm("#contactForm", "Message sent! We'll reply within 24 hours.");
  wireDemoForm("#loginForm", "Welcome back! Login successful.", "../index.html");
  wireDemoForm("#registerForm", "Account created! Please log in.", "login.html");
  wireDemoForm("#newsletterForm", "Subscribed! Sweet treats coming your way.");
});
