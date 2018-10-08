module footpadConcave()
{
    //Modify these to change shape of pad (numbers are in millimeters)
    footpadLength = 90;
    footpadWidth = 40;
    footpadHeight = 10;
    
    //Do not modify below this
    $fn=100;
    footpadHeightOffset = (1/3)*footpadHeight;
    footpadHeightMinusOffset = footpadHeight-footpadHeightOffset;
    //Radius of a curvature = (r^2+h^2)/2h
    concaveRadius = ((footpadWidth*footpadWidth)+(footpadHeightMinusOffset*footpadHeightMinusOffset))/(2*footpadHeightMinusOffset);
    
    tapeCutOutWidth = 26.5;
    tapeCutOutLength = footpadLength-tapeCutOutWidth;
    tapeCutOutHeight = 0.6;
    
    minkowskiDiameter = (3/4)*((1/5)*footpadHeight);
    
    difference()
    {
        hull()
        {
            translate([footpadWidth/2,0,footpadHeight/2])
            union()
            {
                rotate([90,0,0])
                cylinder(d=footpadHeight, h=footpadLength-footpadHeight,center=true);
                translate([0,-(footpadLength/2)+(footpadHeight/2),0])
                sphere(d=footpadHeight);
                translate([0,(footpadLength/2)-(footpadHeight/2),0])
                sphere(d=footpadHeight);
            }
            translate([-footpadWidth/2,0,footpadHeightOffset/2])
            union()
            {
                rotate([90,0,0])
                cylinder(d=footpadHeightOffset, h=footpadLength-footpadHeightOffset-footpadHeight,center=true);
                translate([0,-(footpadLength/2)+(footpadHeightOffset/2)+(footpadHeight/2),0])
                sphere(d=footpadHeightOffset);
                translate([0,(footpadLength/2)-(footpadHeightOffset/2)-(footpadHeight/2),0])
                sphere(d=footpadHeightOffset);
            }
        }
        translate([-footpadWidth/2,0,concaveRadius+footpadHeightOffset])
        rotate([90,0,0])
        cylinder(r=concaveRadius, h=footpadLength, $fn=200, center=true);
        translate([0,0,tapeCutOutHeight/2])
        cube([tapeCutOutWidth,tapeCutOutLength,tapeCutOutHeight],center=true);
        
    }
}
footpadConcave();