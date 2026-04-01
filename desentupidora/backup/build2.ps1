$html = Get-Content -Raw -Encoding UTF8 "index.html"
$headEnd = $html.IndexOf("</head>")
$head = $html.Substring(0, $headEnd + 7)
$bodyStart = $html.IndexOf("<body")
$bodyTagEnd = $html.IndexOf(">", $bodyStart) + 1
$bodyTag = $html.Substring($bodyStart, $bodyTagEnd - $bodyStart)

$scriptsStart = $html.IndexOf("<script id=""wp-block-template-skip-link-js-after""")
$scripts = $html.Substring($scriptsStart)

# Extract original hero as base
$heroStart = $html.IndexOf('<div class="section-wrapper" data-id="2XpG6U">')
$heroEnd = $html.IndexOf('</section></div>', $heroStart) + 16
$heroBase = $html.Substring($heroStart, $heroEnd - $heroStart)

# Replace Title
$heroBase = $heroBase.Replace("We Fix All Your Plumbing Problems", "Desentupidora em São José SC 24h | Atendimento Rápido e Sem Quebra")

# Replace Body text
$bodyPara = "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Utenim ad minim veniam, quis nostrud exercitation ullamco dolore."
$heroBase = $heroBase.Replace("<p>$bodyPara</p>", '<h2 style="font-size: 1.25rem; font-weight: 500; line-height: 1.5; color: #fff; margin-bottom: 2rem;">Serviço de desentupimento em São José com atendimento imediato, equipe especializada e garantia total</h2>
<ul style="list-style: none; padding-left: 0; color: #fff; font-size: 1.1rem; line-height: 1.8; margin-bottom: 2.5rem;">
    <li><i class="fas fa-check-circle" style="color: #00d084; margin-right: 10px;"></i>Desentupimento de esgoto, pia, vaso e ralo</li>
    <li><i class="fas fa-check-circle" style="color: #00d084; margin-right: 10px;"></i>Atendimento 24 horas em toda São José SC</li>
    <li><i class="fas fa-check-circle" style="color: #00d084; margin-right: 10px;"></i>Técnicos experientes e equipamentos profissionais</li>
    <li><i class="fas fa-check-circle" style="color: #00d084; margin-right: 10px;"></i>Chegamos rápido no seu endereço</li>
</ul>')

# Replace Buttons
$origButton = '<div class="guten-element guten-button-wrapper guten-Fha3f7"><a class="guten-button guten-button-sm __desktop-fadeIn" href="#"><span>Contact Us</span></a></div>'
$newButtons = '
<div class="guten-element guten-button-wrapper guten-Fha3f7" style="display:flex; flex-wrap:wrap; gap:15px; margin-top:20px;">
    <a class="guten-button guten-button-sm __desktop-fadeIn" href="https://wa.me/" style="background-color:#25D366; color:#fff; font-weight:bold;">
        <i class="fab fa-whatsapp" style="margin-right: 8px;"></i><span>📲 Chamar no WhatsApp Agora</span>
    </a>
    <a class="guten-button guten-button-sm __desktop-fadeIn" href="tel:" style="background-color:#fff; color:#2296f9; font-weight:bold;">
        <i class="fas fa-phone-alt" style="margin-right: 8px;"></i><span>📞 Ligar Agora</span>
    </a>
</div>'
$heroBase = $heroBase.Replace($origButton, $newButtons)

$bodyContent = @"
<div class="wp-site-blocks">
    $heroBase
</div>
"@

$finalHtml = $head + "`n" + $bodyTag + "`n" + $bodyContent + "`n" + $scripts
[IO.File]::WriteAllText("index2.html", $finalHtml, [Text.Encoding]::UTF8)
