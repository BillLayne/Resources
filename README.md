# Bill Layne Insurance Agency Resources

This repository contains interactive tools, calculators, and educational resources for Bill Layne Insurance Agency clients.

## =� Quick Start

### Enabling GitHub Pages

1. Go to Settings � Pages in this repository
2. Under "Source", select "Deploy from a branch"
3. Choose "main" branch and "/ (root)" folder
4. Click Save
5. Your resources will be available at: `https://billlayne.github.io/Resources/`

## =� Repository Structure

```
Resources/
   index.html              # Main resources landing page
   styles.css             # Shared styles for all pages
   README.md              # This file
   calculators/           # Interactive insurance calculators
      life-insurance/
      auto-coverage/
      homeowners/
   guides/                # Educational guides
      nc-insurance-laws/
      claims-process/
      coverage-comparison/
   life-stages/           # Life stage specific resources
       new-parents/
       first-time-buyers/
       small-business/
```

## =' Adding Perplexity Pages

1. Create a new folder for your resource (e.g., `calculators/new-calculator/`)
2. Save the Perplexity page as `index.html` in that folder
3. Update any relative paths to work with the repository structure
4. Commit and push your changes

## <� Customization

### Updating Colors
Edit the CSS variables in `styles.css`:
```css
:root {
    --primary-color: #007bff;  /* Your brand color */
    --primary-dark: #0056b3;   /* Darker shade */
}
```

### Adding New Resources
1. Add a new card in the appropriate section of `index.html`
2. Follow the existing HTML structure
3. Update the link to point to your new resource

## = Integration with Main Website

### Option 1: Direct Link
Add a "Resources" link in your main website navigation:
```html
<a href="https://billlayne.github.io/Resources/" class="nav-link">Resources</a>
```

### Option 2: Iframe Embed
Embed specific tools in your main website:
```html
<iframe src="https://billlayne.github.io/Resources/calculators/life-insurance/" 
        width="100%" 
        height="800" 
        frameborder="0">
</iframe>
```

## =� Mobile Responsiveness

All pages are fully responsive and optimized for:
- Desktop (1200px+)
- Tablet (768px - 1199px)
- Mobile (< 768px)

## =� Maintenance

1. **Regular Updates**: Check Perplexity Labs for tool updates
2. **Test Links**: Ensure all links work correctly
3. **Monitor Performance**: Use Google PageSpeed Insights
4. **Update Content**: Keep information current and relevant

## =� Support

For questions or assistance:
- Phone: (336) 789-5012
- Email: info@billayneinsurance.com
- Website: https://billlayne.github.io/Bill-Layne-Insurance-Agency/

## =� License

� 2024 Bill Layne Insurance Agency. All rights reserved.