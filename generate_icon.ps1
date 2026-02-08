Add-Type -AssemblyName System.Drawing

# Setup Canvas
$width = 400
$height = 400
$bitmap = New-Object System.Drawing.Bitmap $width, $height
$g = [System.Drawing.Graphics]::FromImage($bitmap)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

# Colors
function Col($hex) { return [System.Drawing.ColorTranslator]::FromHtml($hex) }

$c_bg_dark = Col "#1a110d"
$c_bg_light = Col "#3e2b20"
$c_parchment = Col "#e3d2b4"
$c_parchment_shadow = Col "#bfa588"
$c_steel_light = Col "#dbe4eb"
$c_steel_dark = Col "#566069"
$c_gold = Col "#d4af37"
$c_red = Col "#ff3333"
$c_red_dark = Col "#8a1c1c"

# 1. Background (Radial-ish via Linear approximation or huge circle)
$rect = New-Object System.Drawing.Rectangle 0, 0, $width, $height
$brushBg = New-Object System.Drawing.Drawing2D.LinearGradientBrush $rect, $c_bg_light, $c_bg_dark, 45
$g.FillRectangle($brushBg, $rect)
$brushBg.Dispose()

# Noise (Simple random dots)
$rnd = New-Object Random
for($i=0; $i -lt 1000; $i++) {
    $x = $rnd.Next(0, $width)
    $y = $rnd.Next(0, $height)
    $g.FillRectangle([System.Drawing.Brushes]::Black, $x, $y, 2, 2)
}

# 2. Scroll (Parchment)
$g.TranslateTransform(200, 200)
# $g.RotateTransform(-5) # Slight tilt

$pathScroll = New-Object System.Drawing.Drawing2D.GraphicsPath
$sw = 120 # Half width
$sh = 140 # Half height
# Draw a scroll shape with curved top/bottom
$pathScroll.AddLine(-$sw, -$sh + 20, -$sw, $sh - 20)
$pathScroll.AddBezier(-$sw, $sh - 20, -50, $sh + 10, 50, $sh - 10, $sw, $sh - 20)
$pathScroll.AddLine($sw, $sh - 20, $sw, -$sh + 20)
$pathScroll.AddBezier($sw, -$sh + 20, 50, -$sh + 10, -50, -$sh - 10, -$sw, -$sh + 20)
$pathScroll.CloseFigure()

$brushScroll = New-Object System.Drawing.SolidBrush $c_parchment
$g.FillPath($brushScroll, $pathScroll)

# Text Lines on Scroll
$brushText = New-Object System.Drawing.SolidBrush $c_parchment_shadow
for($y = -$sh + 40; $y -lt $sh - 30; $y += 20) {
    $lw = $sw * 2 - 40
    if ($rnd.NextDouble() -gt 0.5) { $lw -= 40 }
    $g.FillRectangle($brushText, -$sw + 20, $y, $lw, 8)
}

# 3. Sword (Vertical)
# Blade
$pathBlade = New-Object System.Drawing.Drawing2D.GraphicsPath
$pathBlade.AddLine(0, 140, 30, -80)
$pathBlade.AddLine(0, -80, -30, -80)
$pathBlade.CloseFigure()

$rectBlade = New-Object System.Drawing.Rectangle -30, -80, 60, 220
$brushBlade = New-Object System.Drawing.Drawing2D.LinearGradientBrush $rectBlade, $c_steel_light, $c_steel_dark, 0
$g.FillPath($brushBlade, $pathBlade)

# Fuller (Groove)
$g.FillRectangle([System.Drawing.Brushes]::Gray, -4, -80, 8, 180)

# Crossguard
$pathGuard = New-Object System.Drawing.Drawing2D.GraphicsPath
$pathGuard.AddLine(-60, -80, 60, -80)
$pathGuard.AddLine(50, -60, 0, -50)
$pathGuard.AddLine(-50, -60, -60, -80)
$pathGuard.CloseFigure()
$brushGold = New-Object System.Drawing.SolidBrush $c_gold
$g.FillPath($brushGold, $pathGuard)

# Hilt
$g.FillRectangle([System.Drawing.Brushes]::SaddleBrown, -10, -140, 20, 60)

# Pommel
$g.FillEllipse($brushGold, -15, -155, 30, 30)

# 4. Recording Eye (The "Auto" part) - placed on the crossguard/center
# Red glowing gem
$gemY = -65
$g.FillEllipse([System.Drawing.Brushes]::Red, -12, $gemY - 12, 24, 24)
# Highlight
$g.FillEllipse([System.Drawing.Brushes]::White, -5, $gemY - 8, 8, 8)
# Gold Rim
$penGold = New-Object System.Drawing.Pen $c_gold, 3
$g.DrawEllipse($penGold, -12, $gemY - 12, 24, 24)

# Reset Transform
$g.ResetTransform()

# 5. Border
$penBorder = New-Object System.Drawing.Pen $c_bg_dark, 10
$g.DrawRectangle($penBorder, 0, 0, $width, $height)

$penInner = New-Object System.Drawing.Pen $c_gold, 4
$g.DrawRectangle($penInner, 10, 10, $width - 20, $height - 20)

# Save
$bitmap.Save("F:\Repos\wow-addons\AutoCombatLog\icon.png", [System.Drawing.Imaging.ImageFormat]::Png)

# Cleanup
$g.Dispose()
$bitmap.Dispose()

Write-Host "Icon Generated Successfully"
