open("/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/sprTest/3D_11_68640_n0003725_spr_0.00_hann_0.8_d410_s1_sZ1.mha");

run("Reslice [/]...", "output=1.000 start=Left");
run("Rotate 90 Degrees Right");
run("Flip Horizontally", "stack");

run("ROI Manager...");
roiManager("Open", "/Users/mwaqar/4DCBCT-Code-Repository/In dev/ImageJ Macro/slice230full.roi");
roiManager("Select", 0);

selectWindow("3D_11_68640_n0003725_spr_0.00_hann_0.8_d410_s1_sZ1.mha");
close();
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.00_hann_0.8_d410_s1_sZ1");
saveAs("Jpeg", "/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/sprTest/jpg/Reslice of 3D_11_68640_n0003725_spr_0.00_hann_0.8_d410_s1_sZ1.jpg");



