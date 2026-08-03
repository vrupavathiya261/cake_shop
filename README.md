# Petal & Crumb — Cake Shop Website

A responsive, front-end-only bakery website built with plain HTML, CSS and JavaScript.

## Structure
```
cake-shop/
├── index.html          Home page
├── css/style.css        All styles (pink bakery theme, design tokens, responsive)
├── js/script.js         Product data, cart logic (localStorage), nav, animations
├── images/               (optional) drop local images here — see README.txt inside
└── pages/
    ├── cakes.html        Full menu with category filters
    ├── about.html        Bakery story, values, team
    ├── contact.html       Contact form (demo, no backend)
    ├── login.html          Login UI (demo, no real auth)
    ├── register.html       Registration UI (demo, no real auth)
    └── cart.html            Shopping cart (add / remove / update qty, checkout)
```

## How to use
Just open `index.html` in any modern browser — no build step, no server, no
database required. All pages are linked from the navigation bar.

## Cart
Cart data is stored in the browser's `localStorage` under the key
`petalcrumb_cart`, so items persist across page reloads and between pages.
The product catalogue lives in `js/script.js` (the `CAKES` array) — edit
prices, names, categories or images there and every page updates automatically.

## Login / Registration
These pages are UI-only, as requested — submitting either form shows a
success message and (for login) redirects home; no data is sent anywhere
or persisted as an account.

## Customizing
- Colors, fonts and spacing are defined as CSS variables at the top of
  `css/style.css` (`:root { ... }`) — change them once, they apply everywhere.
- Cake images currently load from Unsplash's CDN. Swap in your own by
  editing the `img` field per cake in `js/script.js`.
