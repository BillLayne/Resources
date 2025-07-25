# Header Update Guide for Bill Layne Insurance Website

## Overview
This guide will help you update all pages on your main website to have the same clean, modern header design as your Resources page.

## What Will Change
- Consistent navigation bar across all pages
- Clean, modern design with hover effects
- Mobile-responsive menu
- Sticky header that stays at top when scrolling
- Professional call-to-action button with phone number

## Method 1: Automatic Update (Using Script)

1. **Copy the script to your main website folder**:
   ```bash
   cp update-headers.sh ~/Bill-Layne-Insurance-Agency/
   cd ~/Bill-Layne-Insurance-Agency/
   ```

2. **Make the script executable**:
   ```bash
   chmod +x update-headers.sh
   ```

3. **Run the script**:
   ```bash
   ./update-headers.sh
   ```

4. **Add the script reference to each HTML file** (before `</body>`):
   ```html
   <script src="header-scripts.js"></script>
   </body>
   ```

## Method 2: Manual Update (For Individual Pages)

### Step 1: Update the CSS
Add this to your `style.css` file:

```css
/* Consistent Header Styles */
.site-header {
    background: #ffffff;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    position: sticky;
    top: 0;
    z-index: 1000;
}

.navbar {
    padding: 1rem 0;
}

.nav-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.nav-logo {
    font-size: 1.5rem;
    font-weight: 700;
    color: #007bff;
    text-decoration: none;
}

.nav-menu {
    display: flex;
    gap: 2rem;
    align-items: center;
}

.nav-link {
    color: #333333;
    text-decoration: none;
    font-weight: 500;
    transition: all 0.3s ease;
    position: relative;
}

.nav-link:hover,
.nav-link.active {
    color: #007bff;
}

.nav-link.active::after {
    content: '';
    position: absolute;
    bottom: -5px;
    left: 0;
    right: 0;
    height: 2px;
    background: #007bff;
}

.nav-actions {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.nav-cta {
    background: #007bff;
    color: #ffffff;
    padding: 0.75rem 1.5rem;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 500;
    transition: all 0.3s ease;
}

.nav-cta:hover {
    background: #0056b3;
}

.mobile-menu-toggle {
    display: none;
    flex-direction: column;
    gap: 4px;
    background: none;
    border: none;
    cursor: pointer;
    padding: 0.5rem;
}

.mobile-menu-toggle span {
    width: 25px;
    height: 3px;
    background: #333333;
    transition: all 0.3s ease;
}

/* Mobile Responsive */
@media (max-width: 768px) {
    .nav-menu {
        position: fixed;
        left: -100%;
        top: 70px;
        flex-direction: column;
        background: #ffffff;
        width: 100%;
        text-align: center;
        transition: all 0.3s ease;
        box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        padding: 2rem 0;
    }
    
    .nav-menu.active {
        left: 0;
    }
    
    .mobile-menu-toggle {
        display: flex;
    }
    
    .mobile-menu-toggle.active span:nth-child(1) {
        transform: rotate(-45deg) translate(-5px, 6px);
    }
    
    .mobile-menu-toggle.active span:nth-child(2) {
        opacity: 0;
    }
    
    .mobile-menu-toggle.active span:nth-child(3) {
        transform: rotate(45deg) translate(-5px, -6px);
    }
}
```

### Step 2: Replace Header HTML
Replace your existing header with this structure:

```html
<header class="site-header">
    <nav class="navbar">
        <div class="nav-container">
            <a href="index.html" class="nav-logo">
                Bill Layne Insurance Agency
            </a>
            
            <div class="nav-menu" id="navMenu">
                <a href="index.html" class="nav-link">Home</a>
                <a href="home-insurance-evaluator.html" class="nav-link">Home Insurance</a>
                <a href="auto-coverage-checkup.html" class="nav-link">Auto Insurance</a>
                <a href="#claims" class="nav-link">Claims Center</a>
                <a href="https://billlayne.github.io/Resources/" class="nav-link" target="_blank">Resources</a>
                <a href="blog.html" class="nav-link">Blog</a>
                <a href="contact-us.html" class="nav-link">Contact</a>
            </div>
            
            <div class="nav-actions">
                <a href="tel:+13367895012" class="nav-cta">
                    <i class="fas fa-phone"></i> (336) 789-5012
                </a>
                <button class="mobile-menu-toggle" id="mobileMenuToggle">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
            </div>
        </div>
    </nav>
</header>
```

### Step 3: Add JavaScript
Add this before `</body>` tag:

```javascript
<script>
document.addEventListener('DOMContentLoaded', function() {
    const mobileMenuToggle = document.getElementById('mobileMenuToggle');
    const navMenu = document.getElementById('navMenu');
    
    if (mobileMenuToggle && navMenu) {
        mobileMenuToggle.addEventListener('click', function() {
            navMenu.classList.toggle('active');
            mobileMenuToggle.classList.toggle('active');
        });
        
        // Close menu when clicking outside
        document.addEventListener('click', function(event) {
            if (!navMenu.contains(event.target) && !mobileMenuToggle.contains(event.target)) {
                navMenu.classList.remove('active');
                mobileMenuToggle.classList.remove('active');
            }
        });
    }
});
</script>
```

## Pages to Update
1. index.html (Homepage)
2. home-insurance-evaluator.html
3. auto-coverage-checkup.html
4. contact-us.html
5. blog.html
6. areas-we-serve.html
7. insurance-elkin-nc.html
8. insurance-mount-airy-nc.html

## Active Page Highlighting
To show which page is currently active, add the `active` class to the appropriate nav-link on each page. For example, on the home insurance page:

```html
<a href="home-insurance-evaluator.html" class="nav-link active">Home Insurance</a>
```

## Testing Checklist
- [ ] Header appears consistently on all pages
- [ ] Mobile menu works on small screens
- [ ] Phone number is clickable
- [ ] Resources link opens in new tab
- [ ] Active page is highlighted
- [ ] Sticky header works when scrolling

## Benefits
- Professional, modern appearance
- Consistent user experience
- Better mobile navigation
- Easy to maintain
- Matches your Resources page design

## Commit Message Suggestion
```
Update website headers for consistent design

- Implement modern header design across all pages
- Add mobile-responsive navigation menu
- Include sticky header functionality
- Add Resources link to navigation
- Improve overall site consistency
```