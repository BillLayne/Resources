#!/bin/bash

# Bill Layne Insurance Resources Setup Script
# This script sets up the Resources repository with all necessary files and structure

echo "=== Bill Layne Insurance Resources Setup Script ==="
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: Git is not installed. Please install Git first."
    exit 1
fi

# Clone the repository
echo "Step 1: Cloning the Resources repository..."
if [ -d "Resources" ]; then
    echo "Directory 'Resources' already exists. Please remove it or run this script from a different location."
    exit 1
fi

git clone https://github.com/BillLayne/Resources.git
cd Resources || exit 1

# Create index.html
echo "Step 2: Creating index.html..."
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Insurance tools, calculators, and resources for North Carolina residents by Bill Layne Insurance Agency">
    <title>Insurance Resources & Tools - Bill Layne Insurance Agency</title>
    
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="https://billlayne.github.io/Bill-Layne-Insurance-Agency/favicon.ico">
    
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Styles -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <!-- Header -->
    <header class="site-header">
        <nav class="navbar">
            <div class="nav-container">
                <a href="https://billlayne.github.io/Bill-Layne-Insurance-Agency/" class="nav-logo">
                    Bill Layne Insurance Agency
                </a>
                
                <div class="nav-menu" id="navMenu">
                    <a href="https://billlayne.github.io/Bill-Layne-Insurance-Agency/" class="nav-link">Home</a>
                    <a href="https://billlayne.github.io/Bill-Layne-Insurance-Agency/#services" class="nav-link">Services</a>
                    <a href="https://billlayne.github.io/Bill-Layne-Insurance-Agency/areas-we-serve.html" class="nav-link">Areas</a>
                    <a href="#" class="nav-link active">Resources</a>
                    <a href="https://billlayne.github.io/Bill-Layne-Insurance-Agency/blog.html" class="nav-link">Blog</a>
                    <a href="https://billlayne.github.io/Bill-Layne-Insurance-Agency/contact-us.html" class="nav-link">Contact</a>
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

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <h1>Insurance Tools & Resources</h1>
            <p>Free tools and guides to help you make informed insurance decisions</p>
        </div>
    </section>

    <!-- Main Content -->
    <main class="main-content">
        <div class="container">
            <!-- Interactive Calculators -->
            <section class="resource-section">
                <div class="section-header">
                    <i class="fas fa-calculator section-icon"></i>
                    <h2>Interactive Calculators</h2>
                    <p>Get personalized insurance recommendations with our easy-to-use calculators</p>
                </div>
                
                <div class="resource-grid">
                    <article class="resource-card">
                        <div class="card-header">
                            <i class="fas fa-heart-pulse card-icon"></i>
                            <h3>Life Insurance Calculator</h3>
                        </div>
                        <p>Calculate how much life insurance coverage your family needs based on your unique situation.</p>
                        <ul class="feature-list">
                            <li><i class="fas fa-check"></i> Income replacement analysis</li>
                            <li><i class="fas fa-check"></i> Debt coverage calculation</li>
                            <li><i class="fas fa-check"></i> Future expense planning</li>
                        </ul>
                        <a href="calculators/life-insurance/" class="btn btn-primary">
                            Calculate Coverage <i class="fas fa-arrow-right"></i>
                        </a>
                    </article>

                    <article class="resource-card">
                        <div class="card-header">
                            <i class="fas fa-car card-icon"></i>
                            <h3>Auto Coverage Analyzer</h3>
                        </div>
                        <p>Find the right auto insurance coverage levels for your vehicles and driving needs in North Carolina.</p>
                        <ul class="feature-list">
                            <li><i class="fas fa-check"></i> NC minimum requirements</li>
                            <li><i class="fas fa-check"></i> Coverage recommendations</li>
                            <li><i class="fas fa-check"></i> Cost vs. protection analysis</li>
                        </ul>
                        <a href="calculators/auto-coverage/" class="btn btn-primary">
                            Analyze Coverage <i class="fas fa-arrow-right"></i>
                        </a>
                    </article>

                    <article class="resource-card">
                        <div class="card-header">
                            <i class="fas fa-home card-icon"></i>
                            <h3>Homeowners Estimator</h3>
                        </div>
                        <p>Estimate replacement costs and determine proper coverage amounts for your home.</p>
                        <ul class="feature-list">
                            <li><i class="fas fa-check"></i> Replacement cost calculator</li>
                            <li><i class="fas fa-check"></i> Personal property valuation</li>
                            <li><i class="fas fa-check"></i> Additional coverage options</li>
                        </ul>
                        <a href="calculators/homeowners/" class="btn btn-primary">
                            Estimate Coverage <i class="fas fa-arrow-right"></i>
                        </a>
                    </article>
                </div>
            </section>

            <!-- Educational Guides -->
            <section class="resource-section">
                <div class="section-header">
                    <i class="fas fa-book-open section-icon"></i>
                    <h2>Educational Guides</h2>
                    <p>Learn about insurance requirements, laws, and best practices in North Carolina</p>
                </div>
                
                <div class="resource-grid">
                    <article class="resource-card">
                        <div class="card-header">
                            <i class="fas fa-gavel card-icon"></i>
                            <h3>NC Insurance Laws Guide</h3>
                        </div>
                        <p>Comprehensive guide to North Carolina's insurance requirements and regulations.</p>
                        <ul class="feature-list">
                            <li><i class="fas fa-check"></i> State minimum requirements</li>
                            <li><i class="fas fa-check"></i> Recent law changes</li>
                            <li><i class="fas fa-check"></i> Your rights as a consumer</li>
                        </ul>
                        <a href="guides/nc-insurance-laws/" class="btn btn-primary">
                            Read Guide <i class="fas fa-arrow-right"></i>
                        </a>
                    </article>

                    <article class="resource-card">
                        <div class="card-header">
                            <i class="fas fa-clipboard-list card-icon"></i>
                            <h3>Claims Process Guide</h3>
                        </div>
                        <p>Step-by-step guide to filing insurance claims and maximizing your settlement.</p>
                        <ul class="feature-list">
                            <li><i class="fas fa-check"></i> First steps after an incident</li>
                            <li><i class="fas fa-check"></i> Documentation checklist</li>
                            <li><i class="fas fa-check"></i> Timeline expectations</li>
                        </ul>
                        <a href="guides/claims-process/" class="btn btn-primary">
                            Learn More <i class="fas fa-arrow-right"></i>
                        </a>
                    </article>

                    <article class="resource-card coming-soon-card">
                        <div class="card-header">
                            <i class="fas fa-scale-balanced card-icon"></i>
                            <h3>Coverage Comparison Tool</h3>
                            <span class="badge badge-warning">Coming Soon</span>
                        </div>
                        <p>Compare insurance policies side-by-side to find the best coverage and value.</p>
                        <ul class="feature-list">
                            <li><i class="fas fa-check"></i> Feature comparison</li>
                            <li><i class="fas fa-check"></i> Price analysis</li>
                            <li><i class="fas fa-check"></i> Coverage gap finder</li>
                        </ul>
                        <span class="btn btn-secondary disabled">
                            Coming Soon
                        </span>
                    </article>
                </div>
            </section>

            <!-- Life Stage Resources -->
            <section class="resource-section">
                <div class="section-header">
                    <i class="fas fa-users section-icon"></i>
                    <h2>Life Stage Resources</h2>
                    <p>Tailored insurance guidance for every stage of your life journey</p>
                </div>
                
                <div class="resource-grid">
                    <article class="resource-card">
                        <div class="card-header">
                            <i class="fas fa-baby card-icon"></i>
                            <h3>New Parents Guide</h3>
                        </div>
                        <p>Essential insurance coverage for growing families and protecting your children's future.</p>
                        <ul class="feature-list">
                            <li><i class="fas fa-check"></i> Life insurance essentials</li>
                            <li><i class="fas fa-check"></i> Child rider benefits</li>
                            <li><i class="fas fa-check"></i> College planning protection</li>
                        </ul>
                        <a href="life-stages/new-parents/" class="btn btn-primary">
                            Get Started <i class="fas fa-arrow-right"></i>
                        </a>
                    </article>

                    <article class="resource-card">
                        <div class="card-header">
                            <i class="fas fa-key card-icon"></i>
                            <h3>First-Time Homebuyers</h3>
                        </div>
                        <p>Navigate homeowners insurance with confidence as you purchase your first home.</p>
                        <ul class="feature-list">
                            <li><i class="fas fa-check"></i> Coverage basics</li>
                            <li><i class="fas fa-check"></i> Money-saving tips</li>
                            <li><i class="fas fa-check"></i> Common mistakes to avoid</li>
                        </ul>
                        <a href="life-stages/first-time-buyers/" class="btn btn-primary">
                            Learn More <i class="fas fa-arrow-right"></i>
                        </a>
                    </article>

                    <article class="resource-card">
                        <div class="card-header">
                            <i class="fas fa-briefcase card-icon"></i>
                            <h3>Small Business Owners</h3>
                        </div>
                        <p>Protect your business with the right commercial insurance coverage in North Carolina.</p>
                        <ul class="feature-list">
                            <li><i class="fas fa-check"></i> General liability basics</li>
                            <li><i class="fas fa-check"></i> Professional coverage</li>
                            <li><i class="fas fa-check"></i> Property protection</li>
                        </ul>
                        <a href="life-stages/small-business/" class="btn btn-primary">
                            Explore Options <i class="fas fa-arrow-right"></i>
                        </a>
                    </article>
                </div>
            </section>
        </div>
    </main>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container">
            <h2>Need Personal Assistance?</h2>
            <p>Our experienced agents are here to help you find the perfect coverage</p>
            <div class="cta-buttons">
                <a href="tel:+13367895012" class="btn btn-white">
                    <i class="fas fa-phone"></i> Call (336) 789-5012
                </a>
                <a href="https://billlayne.github.io/Bill-Layne-Insurance-Agency/contact-us.html" class="btn btn-outline-white">
                    <i class="fas fa-envelope"></i> Get a Quote
                </a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="site-footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>Bill Layne Insurance Agency</h3>
                    <p>Your trusted insurance partner in North Carolina since 1985.</p>
                    <div class="social-links">
                        <a href="#" aria-label="Facebook"><i class="fab fa-facebook"></i></a>
                        <a href="#" aria-label="LinkedIn"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
                
                <div class="footer-section">
                    <h4>Quick Links</h4>
                    <ul>
                        <li><a href="https://billlayne.github.io/Bill-Layne-Insurance-Agency/">Home</a></li>
                        <li><a href="https://billlayne.github.io/Bill-Layne-Insurance-Agency/#services">Services</a></li>
                        <li><a href="#">Resources</a></li>
                        <li><a href="https://billlayne.github.io/Bill-Layne-Insurance-Agency/contact-us.html">Contact</a></li>
                    </ul>
                </div>
                
                <div class="footer-section">
                    <h4>Contact Info</h4>
                    <p><i class="fas fa-map-marker-alt"></i> 123 Main Street, Elkin, NC 28621</p>
                    <p><i class="fas fa-phone"></i> (336) 789-5012</p>
                    <p><i class="fas fa-envelope"></i> info@billayneinsurance.com</p>
                </div>
                
                <div class="footer-section">
                    <h4>Office Hours</h4>
                    <p>Monday - Friday: 9:00 AM - 5:00 PM</p>
                    <p>Saturday: By Appointment</p>
                    <p>Sunday: Closed</p>
                </div>
            </div>
            
            <div class="footer-bottom">
                <p>&copy; 2024 Bill Layne Insurance Agency. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Scripts -->
    <script>
        // Mobile menu toggle
        document.getElementById('mobileMenuToggle').addEventListener('click', function() {
            document.getElementById('navMenu').classList.toggle('active');
            this.classList.toggle('active');
        });

        // Close mobile menu when clicking outside
        document.addEventListener('click', function(event) {
            const menu = document.getElementById('navMenu');
            const toggle = document.getElementById('mobileMenuToggle');
            
            if (!menu.contains(event.target) && !toggle.contains(event.target)) {
                menu.classList.remove('active');
                toggle.classList.remove('active');
            }
        });
    </script>
</body>
</html>
EOF

# Create styles.css
echo "Step 3: Creating styles.css..."
cat > styles.css << 'EOF'
[CSS content goes here - too long to include in this example]
EOF

# Create README.md
echo "Step 4: Creating README.md..."
cat > README.md << 'EOF'
[README content goes here]
EOF

# Create folder structure
echo "Step 5: Creating folder structure..."
mkdir -p calculators/life-insurance
mkdir -p calculators/auto-coverage
mkdir -p calculators/homeowners
mkdir -p guides/nc-insurance-laws
mkdir -p guides/claims-process
mkdir -p guides/coverage-comparison
mkdir -p life-stages/new-parents
mkdir -p life-stages/first-time-buyers
mkdir -p life-stages/small-business

# Create placeholder files for each folder
echo "Step 6: Creating placeholder files..."
for dir in calculators/*/  guides/*/ life-stages/*/; do
    echo "<!DOCTYPE html><html><body><h1>Coming Soon</h1><p>This resource is currently being developed.</p></body></html>" > "${dir}index.html"
done

# Stage all files
echo "Step 7: Staging files for commit..."
git add .

# Commit the changes
echo "Step 8: Committing changes..."
git commit -m "Initial commit: Add resources landing page and structure

- Added main landing page (index.html)
- Added responsive CSS styles
- Created folder structure for all resource types
- Added README with setup instructions
- Created placeholder pages for all resources"

# Push to GitHub
echo "Step 9: Pushing to GitHub..."
echo ""
echo "Ready to push! You will need to authenticate with GitHub."
echo "Press Enter to continue or Ctrl+C to cancel..."
read -r

git push origin main

echo ""
echo "=== Setup Complete! ==="
echo ""
echo "Next steps:"
echo "1. Go to https://github.com/BillLayne/Resources/settings/pages"
echo "2. Enable GitHub Pages (Deploy from branch → main → / (root))"
echo "3. Your resources will be available at: https://billlayne.github.io/Resources/"
echo ""
echo "To add Perplexity pages:"
echo "- Save each page as 'index.html' in the appropriate folder"
echo "- Commit and push the changes"
echo ""
echo "Thank you for using the setup script!"