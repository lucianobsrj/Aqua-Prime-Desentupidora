$html = Get-Content -Raw -Encoding UTF8 "index.html"
$headEnd = $html.IndexOf("</head>")
$head = $html.Substring(0, $headEnd + 7)
$bodyStart = $html.IndexOf("<body")
$bodyTagEnd = $html.IndexOf(">", $bodyStart) + 1
$bodyTag = $html.Substring($bodyStart, $bodyTagEnd - $bodyStart)

$scriptsStart = $html.IndexOf("<script id=""wp-block-template-skip-link-js-after""")
$scripts = $html.Substring($scriptsStart)

# Hero section
$heroStart = $html.IndexOf('<div class="section-wrapper" data-id="2XpG6U">')
$heroEnd = $html.IndexOf('</section></div>', $heroStart) + 16
$hero = $html.Substring($heroStart, $heroEnd - $heroStart)
$hero = $hero.Replace("We Fix All Your Plumbing Problems", "Design System / Style Guide")
$hero = $hero.Replace("Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Utenim ad minim veniam, quis nostrud exercitation ullamco dolore.", "Here is the comprehensive living style guide.")

# Components
$btnStart = $html.IndexOf('<div class="guten-element guten-button-wrapper guten-PYEwdr">')
$btnEnd = $html.IndexOf('</div>', $btnStart) + 6
$btn = $html.Substring($btnStart, $btnEnd - $btnStart)

$cardStart = $html.IndexOf('<div class="wp-block-gutenverse-team guten-element guten-team guten-uRUCb2">')
$cardEnd = $html.IndexOf('</div></div></div>', $cardStart) + 18
$card = $html.Substring($cardStart, $cardEnd - $cardStart)

$formStart = $html.IndexOf('<form class="guten-element guten-form-builder guten-wX3UhW" data-form-id="454">')
$formEnd = $html.IndexOf('</form>', $formStart) + 7
$form = $html.Substring($formStart, $formEnd - $formStart)

$bodyContent = @"
<div class="wp-site-blocks" style="margin-top: 50px;">
    <!-- Nav -->
    <div style="position: fixed; top:0; width:100%; z-index:9999; background:#fff; border-bottom:1px solid #eee; padding: 20px;">
        <div class="guten-container">
            <ul style="display:flex; list-style:none; margin:0; padding:0; gap:20px; font-family:var(--gutenverse-font-family-GuL2k5, sans-serif); font-weight:700;">
                <li><a href="#hero" style="color:#000;">Hero</a></li>
                <li><a href="#typography" style="color:#000;">Typography</a></li>
                <li><a href="#colors" style="color:#000;">Colors</a></li>
                <li><a href="#components" style="color:#000;">UI Components</a></li>
            </ul>
        </div>
    </div>
    
    <!-- Hero -->
    <div id="hero" style="margin-top: 80px;">$hero</div>
    
    <!-- Typography -->
    <section id="typography" class="wp-block-gutenverse-section layout-boxed" style="padding: 80px 0; border-top: 1px dashed #ccc;">
        <div class="guten-container" style="display:flex; flex-direction:column; gap:20px;">
            <h2 class="wp-block-gutenverse-heading guten-element" style="margin-bottom:20px;">Typography</h2>
            
            <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
                <h1 class="wp-block-gutenverse-heading">Heading 1</h1>
                <span style="font-family:monospace; color:#888;">var(--gutenverse-font-size-xuEzhd) (56px / 1.1em)</span>
            </div>
            
            <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
                <h2 class="wp-block-gutenverse-heading">Heading 2</h2>
                <span style="font-family:monospace; color:#888;">var(--gutenverse-font-size-9dytbE) (32px / 1.2em)</span>
            </div>
            
            <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
                <h3 class="wp-block-gutenverse-heading">Heading 3</h3>
                <span style="font-family:monospace; color:#888;">var(--gutenverse-font-size-NSzQFS) (20px / 1.2em)</span>
            </div>
            
            <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
                <h4 class="wp-block-gutenverse-heading">Heading 4</h4>
                <span style="font-family:monospace; color:#888;">var(--gutenverse-font-size-2fgShG) (18px / 1.3em)</span>
            </div>
            
            <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
                <p class="is-large-text" style="font-weight:700;">Bold L</p>
                <span style="font-family:monospace; color:#888;">2.25em</span>
            </div>
            
            <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
                <p class="is-regular-text" style="font-weight:700;">Bold M</p>
                <span style="font-family:monospace; color:#888;">1em</span>
            </div>
            
            <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
                <p class="is-small-text" style="font-weight:700;">Bold S</p>
                <span style="font-family:monospace; color:#888;">0.875em</span>
            </div>
            
            <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
                <p class="is-large-text">Paragraph</p>
                <span style="font-family:monospace; color:#888;">2.25em</span>
            </div>
            
            <div style="display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #eee; padding-bottom:10px;">
                <p class="is-regular-text">Regular L / Regular M / Regular S</p>
                <span style="font-family:monospace; color:#888;">1em</span>
            </div>
        </div>
    </section>
    
    <!-- Colors -->
    <section id="colors" class="wp-block-gutenverse-section layout-boxed" style="padding: 80px 0; border-top: 1px dashed #ccc;">
        <div class="guten-container">
            <h2 class="wp-block-gutenverse-heading guten-element" style="margin-bottom:20px;">Colors & Surfaces</h2>
            <div style="display:flex; flex-wrap:wrap; gap:20px;">
                <div style="width:150px;"><div class="has-theme-0-background-color" style="height:100px; border-radius:8px;"></div><p style="margin-top:10px; font-weight:bold;">Theme 0</p></div>
                <div style="width:150px;"><div class="has-theme-1-background-color" style="height:100px; border-radius:8px;"></div><p style="margin-top:10px; font-weight:bold;">Theme 1</p></div>
                <div style="width:150px;"><div class="has-theme-2-background-color" style="height:100px; border-radius:8px;"></div><p style="margin-top:10px; font-weight:bold;">Theme 2</p></div>
                <div style="width:150px;"><div class="has-theme-3-background-color" style="height:100px; border-radius:8px;"></div><p style="margin-top:10px; font-weight:bold;">Theme 3</p></div>
                <div style="width:150px;"><div class="has-vivid-cyan-blue-background-color" style="height:100px; border-radius:8px;"></div><p style="margin-top:10px; font-weight:bold;">Vivid Cyan Blue</p></div>
            </div>
        </div>
    </section>

    <!-- UI Components -->
    <section id="components" class="wp-block-gutenverse-section layout-boxed" style="padding: 80px 0; border-top: 1px dashed #ccc;">
        <div class="guten-container" style="display:flex; flex-direction:column; gap:40px;">
            <h2 class="wp-block-gutenverse-heading guten-element">UI Components</h2>
            
            <div>
                <h3>Buttons</h3>
                <div style="display:flex; gap:20px;">
                    $btn
                    $btn
                </div>
            </div>
            
            <div>
                <h3>Cards</h3>
                <div style="display:flex; gap:20px; width:400px;">
                    $card
                </div>
            </div>
            
            <div>
                <h3>Form</h3>
                <div style="max-width: 600px; background:#f9f9f9; padding:20px;">
                    $form
                </div>
            </div>
        </div>
    </section>

    <!-- Layout -->
    <section id="layout" class="wp-block-gutenverse-section layout-boxed" style="padding: 80px 0; border-top: 1px dashed #ccc;">
        <div class="guten-container">
            <h2 class="wp-block-gutenverse-heading guten-element">Layout & Spacing</h2>
            <div style="background:var(--wp--preset--color--theme-4); padding:20px; border:1px dashed #7e8a96;">
                .guten-container
                <div class="is-layout-flex" style="background:#fff; margin-top:20px; padding:10px;">
                    <div style="background:#eee; flex:1; padding:10px; text-align:center;">Column 1</div>
                    <div style="background:#ddd; flex:1; padding:10px; text-align:center;">Column 2</div>
                </div>
            </div>
        </div>
    </section>

    <!-- Motion -->
    <section id="motion" class="wp-block-gutenverse-section layout-boxed" style="padding: 80px 0; border-top: 1px dashed #ccc;">
        <div class="guten-container">
            <h2 class="wp-block-gutenverse-heading guten-element">Motion & Interaction</h2>
            <div style="display:grid; grid-template-columns:1fr 1fr; gap:30px;">
                <div class="__desktop-fadeIn" style="padding:20px; background:#eee; text-align:center; animation-duration: 2s; animation-fill-mode:both;"><code>.__desktop-fadeIn</code></div>
                <div class="__desktop-fadeInUp" style="padding:20px; background:#eee; text-align:center; animation-duration: 2s; animation-fill-mode:both;"><code>.__desktop-fadeInUp</code></div>
            </div>
        </div>
    </section>

    <!-- Icons -->
    <section id="icons" class="wp-block-gutenverse-section layout-boxed" style="padding: 80px 0; border-top: 1px dashed #ccc;">
        <div class="guten-container">
            <h2 class="wp-block-gutenverse-heading guten-element">Icons</h2>
            <div style="display:flex; gap:20px; font-size:2em; color:var(--wp--preset--color--theme-0);">
                <i class="gtn gtn-apartment-light"></i>
                <i class="gtn gtn-phone1-light"></i>
                <i class="gtn gtn-envelope2-light"></i>
                <i class="gtn gtn-play-button"></i>
            </div>
        </div>
    </section>
</div>
"@

$finalHtml = $head + "`n" + $bodyTag + "`n" + $bodyContent + "`n" + $scripts
[IO.File]::WriteAllText("design-system.html", $finalHtml, [Text.Encoding]::UTF8)
