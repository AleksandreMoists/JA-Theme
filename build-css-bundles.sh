#!/bin/bash
# CSS Bundle Build Script - JA-Theme
# Purpose: Rebuild all CSS bundles from source component files
# Usage: ./build-css-bundles.sh
# Date: January 2, 2026

echo "🔨 Building CSS bundles for JA-Theme..."
echo "----------------------------------------"

# Bundle 1: Core (always loaded)
echo "📦 Building bundle-core.css (16 files)..."
cat assets/base.css \
    assets/component-price.css \
    assets/component-discounts.css \
    assets/component-rating.css \
    assets/component-list-menu.css \
    assets/component-list-social.css \
    assets/component-list-payment.css \
    assets/component-pagination.css \
    assets/component-search.css \
    assets/component-localization-form.css \
    assets/component-menu-drawer.css \
    assets/component-mega-menu.css \
    assets/section-footer.css \
    assets/component-accordion.css \
    assets/component-newsletter.css \
    assets/newsletter-section.css \
    > assets/bundle-core.css

# Bundle 2: Product pages
echo "📦 Building bundle-product.css (15 files)..."
cat assets/section-main-product.css \
    assets/component-product-variant-picker.css \
    assets/component-swatch.css \
    assets/component-swatch-input.css \
    assets/component-pickup-availability.css \
    assets/component-complementary-products.css \
    assets/component-deferred-media.css \
    assets/component-modal-video.css \
    assets/component-model-viewer-ui.css \
    assets/component-product-model.css \
    assets/quantity-popover.css \
    assets/component-volume-pricing.css \
    assets/section-featured-product.css \
    assets/section-related-products.css \
    assets/quick-add.css \
    > assets/bundle-product.css

# Bundle 3: Cart functionality
echo "📦 Building bundle-cart.css (5 files)..."
cat assets/component-cart-drawer.css \
    assets/component-cart.css \
    assets/component-cart-items.css \
    assets/component-cart-notification.css \
    assets/component-totals.css \
    > assets/bundle-cart.css

# Bundle 4: Collection/search pages
echo "📦 Building bundle-collection.css (6 files)..."
cat assets/component-facets.css \
    assets/component-card.css \
    assets/template-collection.css \
    assets/component-collection-hero.css \
    assets/component-show-more.css \
    assets/section-collection-list.css \
    > assets/bundle-collection.css

# Bundle 5: Sliders (homepage)
echo "📦 Building bundle-slider.css (4 files)..."
cat assets/component-slider.css \
    assets/component-slideshow.css \
    assets/section-image-banner.css \
    assets/collage.css \
    > assets/bundle-slider.css

# Bundle 6: Content pages (blog, articles, pages)
echo "📦 Building bundle-content.css (8 files)..."
cat assets/component-article-card.css \
    assets/section-blog-post.css \
    assets/section-main-blog.css \
    assets/section-featured-blog.css \
    assets/section-rich-text.css \
    assets/section-multicolumn.css \
    assets/component-image-with-text.css \
    assets/collapsible-content.css \
    > assets/bundle-content.css

# Bundle 7: Customer account pages
echo "📦 Building bundle-customer.css (4 files)..."
cat assets/customer.css \
    assets/section-password.css \
    assets/template-giftcard.css \
    assets/section-contact-form.css \
    > assets/bundle-customer.css

# Bundle 8: Quick order (B2B)
echo "📦 Building bundle-quick-order.css (1 file)..."
cp assets/quick-order-list.css assets/bundle-quick-order.css

# Bundle 9: Utilities (conditional)
echo "📦 Building bundle-utilities.css (6 files)..."
cat assets/component-predictive-search.css \
    assets/mask-blobs.css \
    assets/video-section.css \
    assets/section-email-signup-banner.css \
    assets/section-main-page.css \
    assets/component-progress-bar.css \
    > assets/bundle-utilities.css

echo "----------------------------------------"
echo "✅ All CSS bundles built successfully!"
echo ""
echo "📊 Bundle Summary:"
ls -lh assets/bundle-*.css | awk '{print "   " $9 " - " $5}'
echo ""
echo "Total bundles: $(ls assets/bundle-*.css | wc -l)"
echo ""
echo "💡 Next steps:"
echo "   1. Test with: shopify theme dev"
echo "   2. Verify all page types load correctly"
echo "   3. Run Lighthouse performance test"
echo ""
