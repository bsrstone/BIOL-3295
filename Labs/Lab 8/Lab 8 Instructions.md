# Lab 8: Burton's Pond duck population
(This file is best viewed on the Github website - and other .md files too)

This lab report is due Thursday Nov 21 at 12pm (in lecture - there is no lab next week)

## Part 1: Image analysis
1. Read _Section 5.1.1 Manual thresholding_ on this https://imagej.net/Particle_Analysis#Automatic_Particle_counting.
2. Open the `ImageJ` software. Select `File > Open` and find the file _Duck example.jpg_
3. The approach you read about about in 1. will only work for binary images. Select `Image > Type > 8bit`.
4. Adjust the threshold using `Image > Adjust > Threshold` as described in 1. (You do not need to adjust the Color Threshold as your image is now black and white).
5. Now read the section _Analyze Particles_. Select Choose `Analyze > Analyze Particles...` In the `Show:` menu choose the `Outlines` option from the drop down menu. Change `Size (pixel^2)` to `200-Infinity`.
6. Save the image showing the duck outlines so that you can hand it in for your lab write up.
