# Lab 8: Burton's Pond duck population
(This file is best viewed on the Github website - and other .md files too)

This lab report is due Thursday Nov 21 at 12pm (in lecture - there is no lab next week)

## Part 1: Image analysis
1. Read _Section 5.1.1 Manual thresholding_ on this https://imagej.net/Particle_Analysis#Automatic_Particle_counting.
2. Open the `ImageJ` software. Select `File > Open` and find the file _Duck example.jpg_
3. The approach you read about about in 1. will only work for binary images. Select `Image > Type > 8bit`.
4. Adjust the threshold using `Image > Adjust > Threshold` as described in 1. (You do not need to adjust the Color Threshold as your image is now black and white).
5. Now read the section _Analyze Particles_. Select Choose `Analyze > Analyze Particles...` In the `Show:` menu choose the `Outlines` option from the drop down menu. Change `Size (pixel^2)` to `200-Infinity`.
6. Save the processed image showing the black duck outlines with the red numbers so that you can hand it in for your lab write up.
7. You can also try to start all over and use a color threshold. Doing so, has revealled to me at least, that the black and white thresholding seems to work a bit better for this duck counting exercise.
8. Find an image of a population from the internet, download it, and include the original image in your lab report.
9. Use `ImageJ` to count the individuals in your internet image. Save the processed image showing the black outlines with the red numbers to hand in with your lab report.
10. In your lab report write a paragraph describing how well the individuals were counted for your internet image.

