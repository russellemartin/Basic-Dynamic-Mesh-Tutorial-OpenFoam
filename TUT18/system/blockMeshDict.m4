/*--------------------------------*- C++ -*----------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  5                                     |
|   \\  /    A nd           | Web:      www.OpenFOAM.org                      |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/
FoamFile
{
    version     2.0;
    `format'      ascii;
    class       dictionary;
    object      blockMeshDict;
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// General macros to create 2D/extruded-2D meshes

changecom(//)changequote([,])
define(calc, [esyscmd(perl -e 'print ($1)')])
define(VCOUNT, 0)
define(vlabel, [[// ]Vertex $1 = VCOUNT define($1, VCOUNT)define([VCOUNT], incr(VCOUNT))])
define(pi, 3.14159265)

define(hex2D, hex ($1b $2b $3b $4b $1t $2t $3t $4t))
define(quad2D, ($1b $2b $2t $1t))
define(frontQuad, ($1t $2t $3t $4t))
define(backQuad, ($1b $4b $3b $2b))

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

convertToMeters 1;

// Tube Length
define(L2, 500)
define(H1, 375)
define(H2, 975)
define(H3, 300)
define(LE2, 25)
define(EXT, 150)

// radius
define(r, 62.5)

// test
define(rc, 0)

//gap radius
define(gr, 1)

define(ro, calc(r - rc))
define(ri, calc(r - gr - rc))


define(LE1, 20)

define(a_rat, 8)

// side
define(s, calc(r*2))





// Thickness of 2D slab
define(z, 1)

// Base z
define(Zb, calc(-z/2))

// Top z
define(Zt, calc(Zb + z))

// Number of cells radially between hub and impeller tip
define(Nl, 50)

// Number of cells radially between baffle tip and tank
define(Nw, 24)

// Number of cells azimuthally in each of the 8 blocks
define(Ng, 2)

// Number of cells azimuthally in each of the 8 blocks
define(Ngr, 1)

// Number of cells azimuthally in each of the 8 blocks
define(Ngrt, 3)

// Number of cells in the thickness of the slab
define(Nz, 1)

// Number of cells in the thickness of the slab
define(Ngy, 10)

// Number of cells in the thickness of the slab
define(Ngx, 10)

// Number of cells in the thickness of the slab
define(Nga, 3)

define(Nlx, 10)
define(Nly, 10)

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

define(vert, (x$1$2 y$1$2 $3))
define(evert, (ex$1$2 ey$1$2 $3))

define(da, calc(3.14159/(1+3*a_rat)))
define(das, -da/2)

define(a01, 0)
define(a02, da)
define(a03, (a_rat + 1)*da)
define(a04, (2*a_rat + 1)*da)
define(a05, (3*a_rat + 1)*da)
define(a06, (3*a_rat + 2)*da)
define(a07, (4*a_rat + 2)*da)
define(a08, (5*a_rat + 2)*da)

define(ea01, da/2)
define(ea02, (1/2*a_rat + 1)*da)
define(ea03, (3/2*a_rat + 1)*da)
define(ea04, (5/2*a_rat + 1)*da)
define(ea05, (6/2*a_rat + 3/2)*da)
define(ea06, (7/2*a_rat + 2)*da)
define(ea07, (9/2*a_rat + 2)*da)
define(ea08, (11/2*a_rat + 2)*da)


define(ax01, calc(cos(a01 + das)))
define(ax02, calc(cos(a02 + das)))
define(ax03, calc(cos(a03 + das)))
define(ax04, calc(cos(a04 + das)))
define(ax05, calc(cos(a05 + das)))
define(ax06, calc(cos(a06 + das)))
define(ax07, calc(cos(a07 + das)))
define(ax08, calc(cos(a08 + das)))

define(eax01, calc(cos(ea01 + das)))
define(eax02, calc(cos(ea02 + das)))
define(eax03, calc(cos(ea03 + das)))
define(eax04, calc(cos(ea04 + das)))
define(eax05, calc(cos(ea05 + das)))
define(eax06, calc(cos(ea06 + das)))
define(eax07, calc(cos(ea07 + das)))
define(eax08, calc(cos(ea08 + das)))

define(ay01, calc(sin(a01 + das)))
define(ay02, calc(sin(a02 + das)))
define(ay03, calc(sin(a03 + das)))
define(ay04, calc(sin(a04 + das)))
define(ay05, calc(sin(a05 + das)))
define(ay06, calc(sin(a06 + das)))
define(ay07, calc(sin(a07 + das)))
define(ay08, calc(sin(a08 + das)))

define(eay01, calc(sin(ea01 + das)))
define(eay02, calc(sin(ea02 + das)))
define(eay03, calc(sin(ea03 + das)))
define(eay04, calc(sin(ea04 + das)))
define(eay05, calc(sin(ea05 + das)))
define(eay06, calc(sin(ea06 + das)))
define(eay07, calc(sin(ea07 + das)))
define(eay08, calc(sin(ea08 + das)))

define(xx00, calc(-EXT -L2 + r))
define(xx005, calc(-r))
define(xx01, calc(r))
define(xx02, calc(2*r - r + 0.5*(r - 0.5*LE2)))
define(xx03, calc(2*r + r - 0.5*(r - 0.5*LE2)))
define(xx04, calc(3*r))

define(yy00, calc(-r - H1))
define(yy01, calc(-r))
define(yy02, calc(r))
define(yy03, calc(H2 - H1 - r))
define(yy04, calc(H3/2 + H2 - H1 - r))
define(yy05, calc(H3 + H2 - H1 - r))
define(yy06, calc(EXT + H3 + H2 - H1 - r))


define(x00, calc(ri*ax01))
define(x01, calc(ri*ax02))
define(x02, calc(ri*ax03))
define(x03, calc(ri*ax04))
define(x04, calc(ri*ax05))
define(x05, calc(ri*ax06))
define(x06, calc(ri*ax07))
define(x07, calc(ri*ax08))
define(x08, calc(ro*ax01))
define(x09, calc(ro*ax02))
define(x10, calc(ro*ax03))
define(x11, calc(ro*ax04))
define(x12, calc(ro*ax05))
define(x13, calc(ro*ax06))
define(x14, calc(ro*ax07))
define(x15, calc(ro*ax08))
define(x16, xx01)
define(x17, xx04)
define(x18, xx00)
define(x19, xx005)
define(x20, xx005)
define(x21, xx01)
define(x22, xx04)
define(x23, xx00)
define(x24, xx005)
define(x25, xx005)
define(x26, xx01)
define(x27, xx04)
define(x28, xx01)
define(x29, xx04)
define(x30, xx01)
define(x31, xx04)
define(x32, xx02)
define(x33, xx03)
define(x34, calc(2*r - 0.5*LE2))
define(x35, calc(2*r + 0.5*LE2))
define(x36, calc(2*r - 0.5*LE2))
define(x37, calc(2*r + 0.5*LE2))






define(y00, calc(ri*ay01))
define(y01, calc(ri*ay02))
define(y02, calc(ri*ay03))
define(y03, calc(ri*ay04))
define(y04, calc(ri*ay05))
define(y05, calc(ri*ay06))
define(y06, calc(ri*ay07))
define(y07, calc(ri*ay08))
define(y08, calc(ro*ay01))
define(y09, calc(ro*ay02))
define(y10, calc(ro*ay03))
define(y11, calc(ro*ay04))
define(y12, calc(ro*ay05))
define(y13, calc(ro*ay06))
define(y14, calc(ro*ay07))
define(y15, calc(ro*ay08))
define(y16, yy00)
define(y17, yy00)
define(y18, yy01)
define(y19, yy01)
define(y20, yy01)
define(y21, yy01)
define(y22, yy01)
define(y23, yy02)
define(y24, yy02)
define(y25, yy02)
define(y26, yy02)
define(y27, yy02)
define(y28, yy03)
define(y29, yy03)
define(y30, yy06)
define(y31, yy06)
define(y32, yy04)
define(y33, yy04)
define(y34, yy05)
define(y35, yy05)
define(y36, yy06)
define(y37, yy06)





define(ex00, calc(ri*eax01))
define(ex01, calc(ri*eax02))
define(ex02, calc(ri*eax03))
define(ex03, calc(ri*eax04))
define(ex04, calc(ri*eax05))
define(ex05, calc(ri*eax06))
define(ex06, calc(ri*eax07))
define(ex07, calc(ri*eax08))
define(ex08, calc(ro*eax01))
define(ex09, calc(ro*eax02))
define(ex10, calc(ro*eax03))
define(ex11, calc(ro*eax04))
define(ex12, calc(ro*eax05))
define(ex13, calc(ro*eax06))
define(ex14, calc(ro*eax07))
define(ex15, calc(ro*eax08))
define(ex16, calc(-r))
define(ex17, calc(r))
define(ex18, calc(1.5*r))


define(ey00, calc(ri*eay01))
define(ey01, calc(ri*eay02))
define(ey02, calc(ri*eay03))
define(ey03, calc(ri*eay04))
define(ey04, calc(ri*eay05))
define(ey05, calc(ri*eay06))
define(ey06, calc(ri*eay07))
define(ey07, calc(ri*eay08))
define(ey08, calc(ro*eay01))
define(ey09, calc(ro*eay02))
define(ey10, calc(ro*eay03))
define(ey11, calc(ro*eay04))
define(ey12, calc(ro*eay05))
define(ey13, calc(ro*eay06))
define(ey14, calc(ro*eay07))
define(ey15, calc(ro*eay08))
define(ey16, calc(0))
define(ey17, calc(0))
define(ey18, calc(0))



// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

vertices
(
    vert(0, 0, Zb) vlabel(p00b)
    vert(0, 1, Zb) vlabel(p01b)
    vert(0, 2, Zb) vlabel(p02b)
    vert(0, 3, Zb) vlabel(p03b)
    vert(0, 4, Zb) vlabel(p04b)
    vert(0, 5, Zb) vlabel(p05b)
    vert(0, 6, Zb) vlabel(p06b)
    vert(0, 7, Zb) vlabel(p07b)
    vert(0, 8, Zb) vlabel(p08b)
    vert(0, 9, Zb) vlabel(p09b)
    vert(1, 0, Zb) vlabel(p10b)
    vert(1, 1, Zb) vlabel(p11b)
    vert(1, 2, Zb) vlabel(p12b)
    vert(1, 3, Zb) vlabel(p13b)
    vert(1, 4, Zb) vlabel(p14b)
    vert(1, 5, Zb) vlabel(p15b)
    vert(1, 6, Zb) vlabel(p16b)
    vert(1, 7, Zb) vlabel(p17b)
    vert(1, 8, Zb) vlabel(p18b)
    vert(1, 9, Zb) vlabel(p19b)
    vert(2, 0, Zb) vlabel(p20b)
    vert(2, 1, Zb) vlabel(p21b)
    vert(2, 2, Zb) vlabel(p22b)
    vert(2, 3, Zb) vlabel(p23b)
    vert(2, 4, Zb) vlabel(p24b)
    vert(2, 5, Zb) vlabel(p25b)
    vert(2, 6, Zb) vlabel(p26b)
    vert(2, 7, Zb) vlabel(p27b)
    vert(2, 8, Zb) vlabel(p28b)
    vert(2, 9, Zb) vlabel(p29b)
    vert(3, 0, Zb) vlabel(p30b)
    vert(3, 1, Zb) vlabel(p31b)
    vert(3, 2, Zb) vlabel(p32b)
    vert(3, 3, Zb) vlabel(p33b)
    vert(3, 4, Zb) vlabel(p34b)
    vert(3, 5, Zb) vlabel(p35b)
    vert(3, 6, Zb) vlabel(p36b)
    vert(3, 7, Zb) vlabel(p37b)
    
    
    vert(0, 0, Zt) vlabel(p00t)
    vert(0, 1, Zt) vlabel(p01t)
    vert(0, 2, Zt) vlabel(p02t)
    vert(0, 3, Zt) vlabel(p03t)
    vert(0, 4, Zt) vlabel(p04t)
    vert(0, 5, Zt) vlabel(p05t)
    vert(0, 6, Zt) vlabel(p06t)
    vert(0, 7, Zt) vlabel(p07t)
    vert(0, 8, Zt) vlabel(p08t)
    vert(0, 9, Zt) vlabel(p09t)
    vert(1, 0, Zt) vlabel(p10t)
    vert(1, 1, Zt) vlabel(p11t)
    vert(1, 2, Zt) vlabel(p12t)
    vert(1, 3, Zt) vlabel(p13t)
    vert(1, 4, Zt) vlabel(p14t)
    vert(1, 5, Zt) vlabel(p15t)
    vert(1, 6, Zt) vlabel(p16t)
    vert(1, 7, Zt) vlabel(p17t)
    vert(1, 8, Zt) vlabel(p18t)
    vert(1, 9, Zt) vlabel(p19t)
    vert(2, 0, Zt) vlabel(p20t)
    vert(2, 1, Zt) vlabel(p21t)
    vert(2, 2, Zt) vlabel(p22t)
    vert(2, 3, Zt) vlabel(p23t)
    vert(2, 4, Zt) vlabel(p24t)
    vert(2, 5, Zt) vlabel(p25t)
    vert(2, 6, Zt) vlabel(p26t)
    vert(2, 7, Zt) vlabel(p27t)
    vert(2, 8, Zt) vlabel(p28t)
    vert(2, 9, Zt) vlabel(p29t)
    vert(3, 0, Zt) vlabel(p30t)
    vert(3, 1, Zt) vlabel(p31t)
    vert(3, 2, Zt) vlabel(p32t)
    vert(3, 3, Zt) vlabel(p33t)
    vert(3, 4, Zt) vlabel(p34t)
    vert(3, 5, Zt) vlabel(p35t)
    vert(3, 6, Zt) vlabel(p36t)
    vert(3, 7, Zt) vlabel(p37t)
);

blocks
(
    
    
    // block
    hex2D(p16, p17, p22, p21)
    (Nlx 20 Nz)
    simpleGrading (1 1 1)
    
    // block
    hex2D(p21, p22, p27, p26)
    (Nlx 20 Nz)
    simpleGrading (1 1 1)
    
    // block
    hex2D(p26, p27, p29, p28)
    (Nlx 20 Nz)
    simpleGrading (1 1 1)
    
    // block
    hex2D(p28, p29, p31, p30)
    (Nlx 30 Nz)
    simpleGrading (1 1 1)
    
    // block
    hex2D(p20, p21, p26, p25)
    (20 20 Nz)
    simpleGrading (1 1 1)
    
    
    // block
    hex2D(p18, p20, p25, p23)
    (20 20 Nz)
    simpleGrading (0.5 1 1)
    
    
    
);

edges
(

);

boundary
(

    inlet
    {
        type            patch;
        faces
        (
            quad2D(p16, p17)
        );
    }
    
    outlet1
    {
        type            patch;
        faces
        (
            quad2D(p18, p23)
        );
    }
    
    
    outlet2
    {
        type            patch;
        faces
        (
            quad2D(p30, p31)
        );
    }
    
    
    
    walls_pre
    {
        type            wall;
        faces
        (
            quad2D(p23, p25)
            quad2D(p25, p26)
            quad2D(p26, p28)
            quad2D(p28, p30)
            quad2D(p31, p29)
            quad2D(p29, p27)
            quad2D(p27, p22)
            quad2D(p22, p17)
            quad2D(p16, p21)
            quad2D(p21, p20)
            quad2D(p20, p18)
            
        );
    }
    
    symFront
    {
        type            symmetryPlane;
        faces
        (
            frontQuad(p16, p17, p22, p21)
            frontQuad(p21, p22, p27, p26)
            frontQuad(p26, p27, p29, p28)
            frontQuad(p28, p29, p31, p30)
            frontQuad(p20, p21, p26, p25)
            frontQuad(p18, p20, p25, p23)
            
        );
    }
    
    symBack
    {
        type            symmetryPlane;
        faces
        (
            backQuad(p16, p17, p22, p21)
            backQuad(p21, p22, p27, p26)
            backQuad(p26, p27, p29, p28)
            backQuad(p28, p29, p31, p30)
            backQuad(p20, p21, p26, p25)
            backQuad(p18, p20, p25, p23)
            
        );
    }
    
);

// ************************************************************************* //
