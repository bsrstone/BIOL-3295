# Lab 8: Burton's Pond duck population
(This file is best viewed on the Github website - and other .md files too)

This lab report is due Thursday Nov 21 at 12pm (in lecture - there is no lab next week)

## Part 1: Image analysis
Part 1 of this lab requires `ImageJ`. If you haven't already, please install this software: https://imagej.nih.gov/ij/download.html or https://imagej.net/Downloads.
1. Read _Section 5.1.1 Manual thresholding_ on this https://imagej.net/Particle_Analysis#Automatic_Particle_counting.
2. Open the `ImageJ` software. Select `File > Open` and find the file _Duck example.jpg_
3. The approach you read about about in 1. will only work for binary images. Select `Image > Type > 8bit`.
4. Adjust the threshold using `Image > Adjust > Threshold` as described in 1. (You do not need to adjust the Color Threshold as your image is now black and white).
5. Now read the section _Analyze Particles_. Select Choose `Analyze > Analyze Particles...` In the `Show:` menu choose the `Outlines` option from the drop down menu. Change `Size (pixel^2)` to `200-Infinity`.
6. Save the processed image showing the black duck outlines with the red numbers so that you can hand it in for your lab write up.
7. You can also try to start all over and use a color threshold. Doing so, has revealled to me at least, that the black and white thresholding seems to work a bit better for this duck counting exercise.
8. Find an image of a population from the internet, download it, and include the original image in your lab report. Here's the image that I used when testing out this lab: https://earther.gizmodo.com/alaska-s-caribou-boomed-last-year-and-scientists-aren-t-1822023734
9. Use `ImageJ` to count the individuals in your internet image. Save the processed image showing the black outlines with the red numbers to hand in with your lab report. When I practiced this question, I used a Color Threshold for White, and set `Size (pixel^2)` to `200-Infinity`. I counted 695 caribou.
10. In your lab report write a paragraph describing how well the individuals were counted for your internet image. My number of counted caribou was quite sensitive to my choice of `Size (pixel^2)`. Comparing my processed image with the original image revealed that 695 is likely an underestimate as it seemed more common that actual caribou were uncounted than sections of the background were misidentified and included in the count.

## Part 2: Duck counts over time
1. From the folder _Labs > Lab 8_ download the files _DuckDataAnalysis.R_ and _Duck_All_Data.csv_. Download the file _Duck_dates.csv_ from the folder _Labs > Duck_data_.
2. Run the file _DuckDataAnalysis.R_. To get this file to run you will need set the path to _Duck_All_Data.csv_ and _Duck_dates.csv_.
3. Save the figure with 3 panels. Hand in this figure with a figure caption. In the figure caption report the slope of the regressions and the associated p-values.
