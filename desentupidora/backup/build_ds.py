import re
import os

html_path = r"c:\projetos\desentupidora\index.html"
out_path = r"c:\projetos\desentupidora\design-system.html"

with open(html_path, 'r', encoding='utf-8') as f:
    orig_html = f.read()

# Extract head
head_match = re.search(r'<head>.*?</head>', orig_html, flags=re.DOTALL)
head_content = head_match.group(0) if head_match else '<head></head>'

# Top Nav
nav = """
<div style="position: sticky; top:0; z-index:9999; background:#fff; border-bottom:1px solid #eee; padding: 20px;">
    <div class="guten-container">
        <ul style="display:flex; list-style:none; margin:0; padding:0; gap:20px; flex-wrap:wrap; font-family:var(--wp--preset--font-family--primary, sans-serif);">
            <li><a href="#hero" style="color:#333; text-decoration:none; font-weight:bold;">Hero</a></li>
            <li><a href="#typography" style="color:#333; text-decoration:none; font-weight:bold;">Typography</a></li>
            <li><a href="#colors" style="color:#333; text-decoration:none; font-weight:bold;">Colors</a></li>
            <li><a href="#components" style="color:#333; text-decoration:none; font-weight:bold;">UI Components</a></li>
            <li><a href="#layout" style="color:#333; text-decoration:none; font-weight:bold;">Layout</a></li>
            <li><a href="#motion" style="color:#333; text-decoration:none; font-weight:bold;">Motion & Interactions</a></li>
            <li><a href="#icons" style="color:#333; text-decoration:none; font-weight:bold;">Icons</a></li>
        </ul>
    </div>
</div>
"""

# 0) Hero setup
hero_match = re.search(r'<div class="section-wrapper" data-id="2XpG6U">.*?</div></section></div>', orig_html, flags=re.DOTALL)
hero_html = hero_match.group(0) if hero_match else ''
hero_html = hero_html.replace('We Fix All Your Plumbing Problems', 'Design System / Style Guide')
hero_html = hero_html.replace('Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Utenim ad minim veniam, quis nostrud exercitation ullamco dolore.', 'This living style guide documents all reusable patterns, typography, and UI elements used across the platform. Maintain consistency by referring to these canonical examples.')

# Helper for sections
def make_section(id, title, content):
    return f'''
    <section id="{id}" class="wp-block-gutenverse-section layout-boxed align-stretch" style="padding: 80px 0; border-bottom: 1px dashed #ccc;">
        <div class="guten-container">
            <h2 class="wp-block-gutenverse-heading guten-element" style="margin-bottom: 40px;">{title}</h2>
            {content}
        </div>
    </section>
    '''

# 1) Typography
typo_html = """
<div style="display:flex; flex-direction:column; gap:30px;">
    <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
        <div><h1 class="wp-block-gutenverse-heading">Heading 1</h1></div>
        <div style="text-align:right; font-family:monospace;">var(--gutenverse-font-size-1QelBt)</div>
    </div>
    <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
        <div><h2 class="wp-block-gutenverse-heading">Heading 2</h2></div>
        <div style="text-align:right; font-family:monospace;">var(--gutenverse-font-size-nqFA7k)</div>
    </div>
    <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
        <div><h3 class="wp-block-gutenverse-heading">Heading 3</h3></div>
        <div style="text-align:right; font-family:monospace;">var(--gutenverse-font-size-9dytbE)</div>
    </div>
    <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
        <div><h4 class="wp-block-gutenverse-heading">Heading 4</h4></div>
        <div style="text-align:right; font-family:monospace;">var(--gutenverse-font-size-NSzQFS)</div>
    </div>
    <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
        <div><h5 class="wp-block-gutenverse-heading">Heading 5</h5></div>
        <div style="text-align:right; font-family:monospace;">var(--gutenverse-font-size-2fgShG)</div>
    </div>
    <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
        <div><h6 class="wp-block-gutenverse-heading">Heading 6</h6></div>
        <div style="text-align:right; font-family:monospace;">var(--gutenverse-font-size-Ls465s)</div>
    </div>
    <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
        <div><p class="is-large-text">Large Paragraph</p></div>
        <div style="text-align:right; font-family:monospace;">2.25em</div>
    </div>
    <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
        <div><p class="is-regular-text">Regular Paragraph: Lorem ipsum dolor sit amet.</p></div>
        <div style="text-align:right; font-family:monospace;">1em</div>
    </div>
    <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
        <div><p class="is-small-text">Small Text</p></div>
        <div style="text-align:right; font-family:monospace;">0.875em</div>
    </div>
</div>
"""

# 2) Colors
colors_html = """
<div style="display:flex; flex-wrap:wrap; gap:20px;">
    <div style="width:150px;">
        <div class="has-theme-0-background-color" style="height:100px; border-radius:8px; border:1px solid #eee;"></div>
        <p style="margin-top:10px; font-weight:bold;">Theme 0</p>
    </div>
    <div style="width:150px;">
        <div class="has-theme-1-background-color" style="height:100px; border-radius:8px; border:1px solid #eee;"></div>
        <p style="margin-top:10px; font-weight:bold;">Theme 1</p>
    </div>
    <div style="width:150px;">
        <div class="has-theme-2-background-color" style="height:100px; border-radius:8px; border:1px solid #eee;"></div>
        <p style="margin-top:10px; font-weight:bold;">Theme 2</p>
    </div>
    <div style="width:150px;">
        <div class="has-theme-3-background-color" style="height:100px; border-radius:8px; border:1px solid #eee;"></div>
        <p style="margin-top:10px; font-weight:bold;">Theme 3</p>
    </div>
    <div style="width:150px;">
        <div class="has-theme-4-background-color" style="height:100px; border-radius:8px; border:1px solid #eee;"></div>
        <p style="margin-top:10px; font-weight:bold;">Theme 4</p>
    </div>
    <div style="width:150px;">
        <div class="has-theme-5-background-color" style="height:100px; border-radius:8px; border:1px solid #eee;"></div>
        <p style="margin-top:10px; font-weight:bold;">Theme 5</p>
    </div>
    <div style="width:150px;">
        <div class="has-vivid-cyan-blue-background-color" style="height:100px; border-radius:8px; border:1px solid #eee;"></div>
        <p style="margin-top:10px; font-weight:bold;">Vivid Cyan Blue</p>
    </div>
    <div style="width:150px;">
        <div class="has-vivid-green-cyan-background-color" style="height:100px; border-radius:8px; border:1px solid #eee;"></div>
        <p style="margin-top:10px; font-weight:bold;">Vivid Green Cyan</p>
    </div>
</div>
"""

# Extract UI Components
btn_match = re.search(r'<div class="guten-element guten-button-wrapper[^\>]+><a class="guten-button guten-button-sm"[^\>]+><span>.*?</span></a></div>', orig_html)
btn_html = btn_match.group(0) if btn_match else '<a class="guten-button guten-button-sm" href="#"><span>Button</span></a>'

form_match = re.search(r'<form class="guten-element guten-form-builder[^\>]+>.*?</form>', orig_html, flags=re.DOTALL)
form_html = form_match.group(0) if form_match else ''

card_match = re.search(r'<div class="wp-block-gutenverse-team guten-element guten-team[^\>]+>.*?</div></div></div>', orig_html, flags=re.DOTALL)
card_html = card_match.group(0) if card_match else ''

iconbox_match = re.search(r'<div class="guten-element [a-zA-Z0-9_-]+ guten-icon-box icon-position-top"><div class="guten-icon-box-wrapper[^\>]+>.*?</div></div></div>', orig_html, flags=re.DOTALL)
iconbox_html = iconbox_match.group(0) if iconbox_match else ''

# 3) UI Components
ui_html = f"""
<div style="display:flex; flex-direction:column; gap:40px;">
    <div>
        <h3>Buttons</h3>
        <div style="display:flex; gap:20px;">
            {btn_html}
        </div>
    </div>
    <div>
        <h3>Cards</h3>
        <div style="width: 300px;">
            {card_html}
        </div>
    </div>
    <div>
        <h3>Icon Box</h3>
        <div style="width: 300px; border: 1px solid #eee; padding:20px;">
            {iconbox_html}
        </div>
    </div>
    <div>
        <h3>Form Inputs</h3>
        <div style="max-width: 600px; background:#f9f9f9; padding: 20px;">
            {form_html}
        </div>
    </div>
</div>
"""

# 4) Layout & Spacing
layout_html = """
<div style="display:flex; flex-direction:column; gap:20px;">
    <p>Using <code>wp-block-gutenverse-section layour-boxed align-stretch</code> and <code>guten-container</code> to wrap content inside sections.</p>
    <div style="background:var(--wp--preset--color--theme-4); padding:20px; border:1px dashed #7e8a96;">
        .guten-container (Max-width container)
        <div class="is-layout-flex" style="background:#fff; margin-top:20px; padding:10px;">
            <div style="background:#eee; flex:1; padding:10px; text-align:center;">Column 1</div>
            <div style="background:#ddd; flex:1; padding:10px; text-align:center;">Column 2</div>
            <div style="background:#ccc; flex:1; padding:10px; text-align:center;">Column 3</div>
        </div>
    </div>
</div>
"""

# 5) Motion
motion_html = """
<div style="display:grid; grid-template-columns:1fr 1fr; gap:30px;">
    <div class="__desktop-fadeIn" style="padding:20px; background:#eee; text-align:center; animation-duration: 2s; animation-fill-mode:both;">
        <code>.__desktop-fadeIn</code>
    </div>
    <div class="__desktop-fadeInUp" style="padding:20px; background:#eee; text-align:center; animation-duration: 2s; animation-fill-mode:both;">
        <code>.__desktop-fadeInUp</code>
    </div>
    <div class="__desktop-fadeInRight" style="padding:20px; background:#eee; text-align:center; animation-duration: 2s; animation-fill-mode:both;">
        <code>.__desktop-fadeInRight</code>
    </div>
    <div class="guten-icon-box-wrapper hover-from-left" style="padding:40px; background:#eee; text-align:center;">
        Hover Me! <code>.hover-from-left</code>
    </div>
    <div class="guten-icon-box-wrapper hover-from-bottom" style="padding:40px; background:#eee; text-align:center;">
        Hover Me! <code>.hover-from-bottom</code>
    </div>
</div>
"""

# 6) Icons
icons_html = """
<div style="display:flex; gap:20px; font-size:2em;">
    <i class="gtn gtn-apartment-light"></i>
    <i class="gtn gtn-phone1-light"></i>
    <i class="gtn gtn-envelope2-light"></i>
    <i class="fas fa-check-circle" style="color:var(--wp--preset--color--theme-1);"></i>
    <i class="fas fa-arrow-right"></i>
    <i class="gtn gtn-play-button"></i>
</div>
"""

body_html = f"""
<body>
    <div class="wp-site-blocks">
        {nav}
        <div id="hero">{hero_html}</div>
        {make_section('typography', 'Typography', typo_html)}
        {make_section('colors', 'Colors & Surfaces', colors_html)}
        {make_section('components', 'UI Components', ui_html)}
        {make_section('layout', 'Layout & Spacing', layout_html)}
        {make_section('motion', 'Motion & Interaction', motion_html)}
        {make_section('icons', 'Icons', icons_html)}
    </div>
    
    <!-- Retain base scripts -->
    <script src="assets/hooks_f2cb9640960f.js"></script>
    <script src="assets/i18n_078e45e560f5.js"></script>
    <script src="assets/corefrontend_3640692a2883.js"></script>
    <script src="assets/form-builder_6ad389ec576e.js"></script>
    <script src="assets/animejs_4f5cce783740.js"></script>
</body>
"""

final_html = f"<!DOCTYPE html>\\n<html lang='en-US'>\\n{head_content}\\n{body_html}\\n</html>"

with open(out_path, 'w', encoding='utf-8') as f:
    f.write(final_html)

print("Generated design-system.html successfully!")
