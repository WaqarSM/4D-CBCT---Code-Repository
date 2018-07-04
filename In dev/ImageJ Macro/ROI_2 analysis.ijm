open("/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/sprTest/3D_11_68640_n0003725_spr_0.00_hann_0.0_d410_s1_sZ1.mha");
selectWindow("3D_11_68640_n0003725_spr_0.00_hann_0.0_d410_s1_sZ1.mha");
run("Reslice [/]...", "output=1.000 start=Left");
run("Rotate 90 Degrees Right");
run("Flip Horizontally", "stack");
selectWindow("3D_11_68640_n0003725_spr_0.00_hann_0.0_d410_s1_sZ1.mha");
close();
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.00_hann_0.0_d410_s1_sZ1");
run("Divide...", "value=68640 stack");
run("Add...", "value=0.003725 stack");
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
run("ROI Manager...");
roiManager("Open", "/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/profiles/tomoRTK_2_slice229.roi");
roiManager("Select", 0);
//wait(5000)
run("Plot Profile");
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.00_hann_0.0_d410_s1_sZ1");
close();

//------------------------------------------------------------------------------

open("/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/sprTest/3D_11_68640_n0003725_spr_0.00_hann_0.8_d410_s1_sZ1.mha");
selectWindow("3D_11_68640_n0003725_spr_0.00_hann_0.8_d410_s1_sZ1.mha");
run("Reslice [/]...", "output=1.000 start=Left");
run("Rotate 90 Degrees Right");
run("Flip Horizontally", "stack");
selectWindow("3D_11_68640_n0003725_spr_0.00_hann_0.8_d410_s1_sZ1.mha");
close();
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.00_hann_0.8_d410_s1_sZ1");
run("Divide...", "value=68640 stack");
run("Add...", "value=0.003725 stack");
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
run("ROI Manager...");
roiManager("Open", "/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/profiles/tomoRTK_2_slice229.roi");
roiManager("Select", 0);
run("Plot Profile");
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.00_hann_0.8_d410_s1_sZ1");
close();

//------------------------------------------------------------------------------
open("/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/sprTest/3D_11_68640_n0003725_spr_0.00_hann_1.0_d410_s1_sZ1.mha");
selectWindow("3D_11_68640_n0003725_spr_0.00_hann_1.0_d410_s1_sZ1.mha");
run("Reslice [/]...", "output=1.000 start=Left");
run("Rotate 90 Degrees Right");
run("Flip Horizontally", "stack");
selectWindow("3D_11_68640_n0003725_spr_0.00_hann_1.0_d410_s1_sZ1.mha");
close();
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.00_hann_1.0_d410_s1_sZ1");
run("Divide...", "value=68640 stack");
run("Add...", "value=0.003725 stack");
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
run("ROI Manager...");
roiManager("Open", "/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/profiles/tomoRTK_2_slice229.roi");
roiManager("Select", 0);
run("Plot Profile");
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.00_hann_1.0_d410_s1_sZ1");
close();


//--------------------------------------------------------------------------------------
open("/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/sprTest/3D_11_68640_n0003725_spr_0.24_hann_0.0_d410_s1_sZ1.mha");
selectWindow("3D_11_68640_n0003725_spr_0.24_hann_0.0_d410_s1_sZ1.mha");
run("Reslice [/]...", "output=1.000 start=Left");
run("Rotate 90 Degrees Right");
run("Flip Horizontally", "stack");
selectWindow("3D_11_68640_n0003725_spr_0.24_hann_0.0_d410_s1_sZ1.mha");
close();
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.24_hann_0.0_d410_s1_sZ1");
run("Divide...", "value=68640 stack");
run("Add...", "value=0.003725 stack");
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
run("ROI Manager...");
roiManager("Open", "/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/profiles/tomoRTK_2_slice229.roi");
roiManager("Select", 0);
run("Plot Profile");
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.24_hann_0.0_d410_s1_sZ1");
close();

//------------------------------------------------------------------------------

open("/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/sprTest/3D_11_68640_n0003725_spr_0.24_hann_0.8_d410_s1_sZ1.mha");
selectWindow("3D_11_68640_n0003725_spr_0.24_hann_0.8_d410_s1_sZ1.mha");
run("Reslice [/]...", "output=1.000 start=Left");
run("Rotate 90 Degrees Right");
run("Flip Horizontally", "stack");
selectWindow("3D_11_68640_n0003725_spr_0.24_hann_0.8_d410_s1_sZ1.mha");
close();
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.24_hann_0.8_d410_s1_sZ1");
run("Divide...", "value=68640 stack");
run("Add...", "value=0.003725 stack");
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
run("ROI Manager...");
roiManager("Open", "/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/profiles/tomoRTK_2_slice229.roi");
roiManager("Select", 0);
run("Plot Profile");
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.24_hann_0.8_d410_s1_sZ1");
close();

//------------------------------------------------------------------------------
open("/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/sprTest/3D_11_68640_n0003725_spr_0.24_hann_1.0_d410_s1_sZ1.mha");
selectWindow("3D_11_68640_n0003725_spr_0.24_hann_1.0_d410_s1_sZ1.mha");
run("Reslice [/]...", "output=1.000 start=Left");
run("Rotate 90 Degrees Right");
run("Flip Horizontally", "stack");
selectWindow("3D_11_68640_n0003725_spr_0.24_hann_1.0_d410_s1_sZ1.mha");
close();
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.24_hann_1.0_d410_s1_sZ1");
run("Divide...", "value=68640 stack");
run("Add...", "value=0.003725 stack");
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
run("ROI Manager...");
roiManager("Open", "/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/profiles/tomoRTK_2_slice229.roi");
roiManager("Select", 0);
run("Plot Profile");
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.24_hann_1.0_d410_s1_sZ1");
close();

//======================

open("/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/sprTest/3D_11_68640_n0003725_spr_0.50_hann_0.0_d410_s1_sZ1.mha");
selectWindow("3D_11_68640_n0003725_spr_0.50_hann_0.0_d410_s1_sZ1.mha");
run("Reslice [/]...", "output=1.000 start=Left");
run("Rotate 90 Degrees Right");
run("Flip Horizontally", "stack");
selectWindow("3D_11_68640_n0003725_spr_0.50_hann_0.0_d410_s1_sZ1.mha");
close();
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.50_hann_0.0_d410_s1_sZ1");
run("Divide...", "value=68640 stack");
run("Add...", "value=0.003725 stack");
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
run("ROI Manager...");
roiManager("Open", "/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/profiles/tomoRTK_2_slice229.roi");
roiManager("Select", 0);
run("Plot Profile");
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.50_hann_0.0_d410_s1_sZ1");
close();

//------------------------------------------------------------------------------

open("/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/sprTest/3D_11_68640_n0003725_spr_0.50_hann_0.8_d410_s1_sZ1.mha");
selectWindow("3D_11_68640_n0003725_spr_0.50_hann_0.8_d410_s1_sZ1.mha");
run("Reslice [/]...", "output=1.000 start=Left");
run("Rotate 90 Degrees Right");
run("Flip Horizontally", "stack");
selectWindow("3D_11_68640_n0003725_spr_0.50_hann_0.8_d410_s1_sZ1.mha");
close();
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.50_hann_0.8_d410_s1_sZ1");
run("Divide...", "value=68640 stack");
run("Add...", "value=0.003725 stack");
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
run("ROI Manager...");
roiManager("Open", "/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/profiles/tomoRTK_2_slice229.roi");
roiManager("Select", 0);
run("Plot Profile");
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.50_hann_0.8_d410_s1_sZ1");
close();

//------------------------------------------------------------------------------
open("/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/sprTest/3D_11_68640_n0003725_spr_0.50_hann_1.0_d410_s1_sZ1.mha");
selectWindow("3D_11_68640_n0003725_spr_0.50_hann_1.0_d410_s1_sZ1.mha");
run("Reslice [/]...", "output=1.000 start=Left");
run("Rotate 90 Degrees Right");
run("Flip Horizontally", "stack");
selectWindow("3D_11_68640_n0003725_spr_0.50_hann_1.0_d410_s1_sZ1.mha");
close();
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.50_hann_1.0_d410_s1_sZ1");
run("Divide...", "value=68640 stack");
run("Add...", "value=0.003725 stack");
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
run("ROI Manager...");
roiManager("Open", "/Users/mwaqar/4DCBCT_Project/Expriment_2_recon/img_1.3.46.423632.1410002018315232436205.11/profiles/tomoRTK_2_slice229.roi");
roiManager("Select", 0);
run("Plot Profile");
selectWindow("Reslice of 3D_11_68640_n0003725_spr_0.50_hann_1.0_d410_s1_sZ1");
close();
