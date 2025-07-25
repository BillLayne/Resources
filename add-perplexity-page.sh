#!/bin/bash

# Bill Layne Insurance - Add Perplexity Page Script
# This script helps you add Perplexity pages to your Resources repository

echo "=== Add Perplexity Page to Resources ==="
echo ""

# Check if we're in the Resources directory
if [ ! -f "index.html" ] || [ ! -d "calculators" ]; then
    echo "Error: This script must be run from the Resources repository root directory."
    echo "Please navigate to your Resources folder and try again."
    exit 1
fi

# Function to show menu
show_menu() {
    echo "Select the category for your Perplexity page:"
    echo "1) Calculator (life-insurance, auto-coverage, homeowners)"
    echo "2) Guide (nc-insurance-laws, claims-process, coverage-comparison)"
    echo "3) Life Stage (new-parents, first-time-buyers, small-business)"
    echo "4) Exit"
}

# Function to select specific resource
select_calculator() {
    echo ""
    echo "Select which calculator:"
    echo "1) Life Insurance Calculator"
    echo "2) Auto Coverage Analyzer"
    echo "3) Homeowners Estimator"
    read -p "Enter your choice (1-3): " calc_choice
    
    case $calc_choice in
        1) RESOURCE_PATH="calculators/life-insurance" 
           RESOURCE_NAME="Life Insurance Calculator" ;;
        2) RESOURCE_PATH="calculators/auto-coverage"
           RESOURCE_NAME="Auto Coverage Analyzer" ;;
        3) RESOURCE_PATH="calculators/homeowners"
           RESOURCE_NAME="Homeowners Estimator" ;;
        *) echo "Invalid choice"; exit 1 ;;
    esac
}

select_guide() {
    echo ""
    echo "Select which guide:"
    echo "1) NC Insurance Laws Guide"
    echo "2) Claims Process Guide"
    echo "3) Coverage Comparison Tool"
    read -p "Enter your choice (1-3): " guide_choice
    
    case $guide_choice in
        1) RESOURCE_PATH="guides/nc-insurance-laws"
           RESOURCE_NAME="NC Insurance Laws Guide" ;;
        2) RESOURCE_PATH="guides/claims-process"
           RESOURCE_NAME="Claims Process Guide" ;;
        3) RESOURCE_PATH="guides/coverage-comparison"
           RESOURCE_NAME="Coverage Comparison Tool" ;;
        *) echo "Invalid choice"; exit 1 ;;
    esac
}

select_life_stage() {
    echo ""
    echo "Select which life stage resource:"
    echo "1) New Parents Guide"
    echo "2) First-Time Homebuyers Guide"
    echo "3) Small Business Owners Guide"
    read -p "Enter your choice (1-3): " stage_choice
    
    case $stage_choice in
        1) RESOURCE_PATH="life-stages/new-parents"
           RESOURCE_NAME="New Parents Guide" ;;
        2) RESOURCE_PATH="life-stages/first-time-buyers"
           RESOURCE_NAME="First-Time Homebuyers Guide" ;;
        3) RESOURCE_PATH="life-stages/small-business"
           RESOURCE_NAME="Small Business Owners Guide" ;;
        *) echo "Invalid choice"; exit 1 ;;
    esac
}

# Main menu
show_menu
read -p "Enter your choice (1-4): " choice

case $choice in
    1) select_calculator ;;
    2) select_guide ;;
    3) select_life_stage ;;
    4) echo "Exiting..."; exit 0 ;;
    *) echo "Invalid choice"; exit 1 ;;
esac

echo ""
echo "Selected: $RESOURCE_NAME"
echo "Location: $RESOURCE_PATH"
echo ""

# Ask for the Perplexity HTML file
read -p "Enter the path to your Perplexity HTML file: " HTML_FILE

# Check if file exists
if [ ! -f "$HTML_FILE" ]; then
    echo "Error: File '$HTML_FILE' not found!"
    exit 1
fi

# Create temporary file for modified content
TEMP_FILE=$(mktemp)

# Function to add custom header and footer
add_customizations() {
    cat > "$TEMP_FILE" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
EOF
    
    # Extract and modify the head content
    sed -n '/<head>/,/<\/head>/p' "$HTML_FILE" | sed '1d;$d' >> "$TEMP_FILE"
    
    # Add custom styles and meta tags
    cat >> "$TEMP_FILE" << 'EOF'
    
    <!-- Custom Branding -->
    <style>
        /* Override Perplexity default colors with Bill Layne Insurance brand */
        :root {
            --primary-color: #007bff !important;
            --secondary-color: #0056b3 !important;
            --accent-color: #28a745 !important;
        }
        
        /* Custom header */
        .custom-header {
            background: #f8f9fa;
            padding: 15px 20px;
            border-bottom: 2px solid #e9ecef;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        .custom-header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
        }
        
        .back-link {
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: color 0.3s ease;
        }
        
        .back-link:hover {
            color: #0056b3;
        }
        
        .contact-info {
            display: flex;
            gap: 20px;
            align-items: center;
            flex-wrap: wrap;
        }
        
        .contact-info a {
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .contact-info a:hover {
            color: #0056b3;
        }
        
        /* Custom footer */
        .custom-footer {
            margin-top: 60px;
            padding: 40px 20px;
            background: #343a40;
            color: white;
            text-align: center;
        }
        
        .custom-footer-content {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .custom-footer h3 {
            margin-bottom: 20px;
            color: white;
        }
        
        .custom-footer .cta-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 30px;
        }
        
        .custom-footer .btn {
            padding: 12px 24px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .custom-footer .btn-primary {
            background: #007bff;
            color: white;
            border: 2px solid #007bff;
        }
        
        .custom-footer .btn-primary:hover {
            background: #0056b3;
            border-color: #0056b3;
        }
        
        .custom-footer .btn-outline {
            background: transparent;
            color: white;
            border: 2px solid white;
        }
        
        .custom-footer .btn-outline:hover {
            background: white;
            color: #343a40;
        }
        
        .footer-links {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid rgba(255,255,255,0.2);
        }
        
        .footer-links a {
            color: rgba(255,255,255,0.8);
            text-decoration: none;
            margin: 0 10px;
        }
        
        .footer-links a:hover {
            color: white;
        }
        
        /* Mobile responsiveness */
        @media (max-width: 768px) {
            .custom-header-content {
                flex-direction: column;
                text-align: center;
            }
            
            .contact-info {
                justify-content: center;
            }
            
            .custom-footer .cta-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .custom-footer .btn {
                width: 100%;
                max-width: 300px;
            }
        }
    </style>
</head>
<body>
    <!-- Custom Header -->
    <div class="custom-header">
        <div class="custom-header-content">
            <a href="https://billlayne.github.io/Resources/" class="back-link">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M19 12H5M12 19l-7-7 7-7"/>
                </svg>
                Back to All Resources
            </a>
            <div class="contact-info">
                <span style="color: #666;">Bill Layne Insurance Agency</span>
                <a href="tel:+13367895012">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
                    </svg>
                    (336) 789-5012
                </a>
            </div>
        </div>
    </div>
    
    <!-- Original Perplexity Content -->
    <div id="perplexity-content">
EOF

    # Extract body content (excluding body tags)
    sed -n '/<body[^>]*>/,/<\/body>/p' "$HTML_FILE" | sed '1d;$d' >> "$TEMP_FILE"
    
    # Add custom footer
    cat >> "$TEMP_FILE" << 'EOF'
    </div>
    
    <!-- Custom Footer -->
    <div class="custom-footer">
        <div class="custom-footer-content">
            <h3>Need Personalized Assistance?</h3>
            <p style="margin-bottom: 30px; opacity: 0.9;">Our experienced agents are here to help you find the perfect coverage for your needs.</p>
            
            <div class="cta-buttons">
                <a href="tel:+13367895012" class="btn btn-primary">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="margin-right: 8px;">
                        <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
                    </svg>
                    Call (336) 789-5012
                </a>
                <a href="https://billlayne.github.io/Bill-Layne-Insurance-Agency/contact-us.html" class="btn btn-outline">
                    Get a Custom Quote
                </a>
            </div>
            
            <div class="footer-links">
                <a href="https://billlayne.github.io/Bill-Layne-Insurance-Agency/">Home</a>
                <a href="https://billlayne.github.io/Resources/">All Resources</a>
                <a href="https://billlayne.github.io/Bill-Layne-Insurance-Agency/contact-us.html">Contact Us</a>
            </div>
            
            <p style="margin-top: 20px; opacity: 0.6; font-size: 14px;">
                © 2024 Bill Layne Insurance Agency. All rights reserved.
            </p>
        </div>
    </div>
    
    <!-- Enhanced JavaScript -->
    <script>
        // Update page title
        document.addEventListener('DOMContentLoaded', function() {
            // Add agency name to title if not already present
            if (!document.title.includes('Bill Layne Insurance')) {
                document.title = document.title + ' - Bill Layne Insurance Agency';
            }
            
            // Replace generic contact forms/CTAs if they exist
            const genericCTAs = document.querySelectorAll('a[href*="contact"], button:contains("Contact")');
            genericCTAs.forEach(function(cta) {
                if (cta.textContent.toLowerCase().includes('contact')) {
                    cta.href = 'tel:+13367895012';
                    cta.textContent = 'Call (336) 789-5012';
                }
            });
            
            // Track page views (optional - add your analytics here)
            if (typeof gtag !== 'undefined') {
                gtag('event', 'page_view', {
                    page_title: document.title,
                    page_location: window.location.href,
                    page_path: window.location.pathname
                });
            }
        });
    </script>
</body>
</html>
EOF
}

# Process the file
echo "Processing Perplexity page..."
add_customizations

# Copy to destination
echo "Copying to $RESOURCE_PATH/index.html..."
cp "$TEMP_FILE" "$RESOURCE_PATH/index.html"

# Clean up
rm "$TEMP_FILE"

# Git operations
echo ""
echo "Adding to Git..."
git add "$RESOURCE_PATH/index.html"

# Show status
echo ""
echo "Current Git status:"
git status --short

# Ask if user wants to commit now
echo ""
read -p "Do you want to commit and push now? (y/n): " commit_now

if [ "$commit_now" = "y" ] || [ "$commit_now" = "Y" ]; then
    read -p "Enter commit message (or press Enter for default): " commit_msg
    
    if [ -z "$commit_msg" ]; then
        commit_msg="Add $RESOURCE_NAME from Perplexity"
    fi
    
    git commit -m "$commit_msg"
    
    echo ""
    echo "Pushing to GitHub..."
    git push origin main
    
    echo ""
    echo "=== Success! ==="
    echo "Your $RESOURCE_NAME has been added and pushed to GitHub."
    echo "It will be available at:"
    echo "https://billlayne.github.io/Resources/$RESOURCE_PATH/"
    echo ""
    echo "Note: It may take 2-3 minutes for GitHub Pages to update."
else
    echo ""
    echo "=== File Added Successfully ==="
    echo "The Perplexity page has been added to: $RESOURCE_PATH/index.html"
    echo "To commit and push later, run:"
    echo "  git commit -m 'Add $RESOURCE_NAME'"
    echo "  git push origin main"
fi

echo ""
echo "Done!"