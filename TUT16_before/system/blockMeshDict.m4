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
define(sqrt2, 1.41421356)

define(hex2D, hex ($1b $2b $3b $4b $1t $2t $3t $4t))
define(quad2D, ($1b $2b $2t $1t))
define(frontQuad, ($1t $2t $3t $4t))
define(backQuad, ($1b $4b $3b $2b))

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

convertToMeters 0.001;

// Tube Length
define(L, 500)
define(W, 500)
define(r, 150)
define(l, 50)
define(w, 50)
define(g, 10)



// Thickness of 2D slab
define(z, 50)

// Base z
define(Zb, calc(-z/2))

// Top z
define(Zt, calc(Zb + z))

// Number of cells front to back
define(Nz, 1)

// Number of cells per block each direction in rotor
define(Ni, 20)

// Number of cells per block each direction in outer
define(No, 20)
define(Nx, 50)
define(Ny, 30)

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

define(vert, (x$1$2 y$1$2 $3))
define(evert, (ex$1$2 ey$1$2 $3))


// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// Angle Calculations much of this will not be used
define(da, calc(pi/2))
define(das, calc((da/2)))
define(edas, 0)

define(a00, calc(   0 + das))
define(a01, calc(  da + das))
define(a02, calc(2*da + das))
define(a03, calc(3*da + das))

define(ea00, calc(   0 + edas))
define(ea01, calc(  da + edas))
define(ea02, calc(2*da + edas))
define(ea03, calc(3*da + edas))

define(ax00, calc(cos(a00)))
define(ax01, calc(cos(a01)))
define(ax02, calc(cos(a02)))
define(ax03, calc(cos(a03)))

define(eax00, calc(cos(ea00)))
define(eax01, calc(cos(ea01)))
define(eax02, calc(cos(ea02)))
define(eax03, calc(cos(ea03)))

define(ay00, calc(sin(a00)))
define(ay01, calc(sin(a01)))
define(ay02, calc(sin(a02)))
define(ay03, calc(sin(a03)))

define(eay00, calc(sin(ea00)))
define(eay01, calc(sin(ea01)))
define(eay02, calc(sin(ea02)))
define(eay03, calc(sin(ea03)))

// The xx-- and yy-- are sets of repeated x and y coordinates

define(xx00, calc(-L/2))
define(xx01, calc(-r/sqrt2))
define(xx02, calc(-l/2))
define(xx03, calc(l/2))
define(xx04, calc(r/sqrt2))
define(xx05, calc(L/2))

define(yy00, calc(W/2))
define(yy01, calc(r/sqrt2))
define(yy02, calc(w/2))
define(yy03, calc(-w/2))
define(yy04, calc(-r/sqrt2))
define(yy05, calc(-W/2))

// This is the actual 

define(x00, xx00)
define(x01, xx05)
define(x02, xx01)
define(x03, calc((r - g)*ax01))
define(x04, calc((r - g)*ax00))
define(x05, xx04)
define(x06, xx02)
define(x07, xx03)
define(x08, xx02)
define(x09, xx03)
define(x10, xx01)
define(x11, calc((r - g)*ax02))
define(x12, calc((r - g)*ax03))
define(x13, xx04)
define(x14, xx00)
define(x15, xx05)


define(y00, yy00)
define(y01, yy00)
define(y02, yy01)
define(y03, calc((r - g)*ay01))
define(y04, calc((r - g)*ay00))
define(y05, yy01)
define(y06, yy02)
define(y07, yy02)
define(y08, yy03)
define(y09, yy03)
define(y10, yy04)
define(y11, calc((r - g)*ay02))
define(y12, calc((r - g)*ay03))
define(y13, yy04)
define(y14, yy05)
define(y15, yy05)


define(ex00, calc(r*eax00))
define(ex01, calc(r*eax01))
define(ex02, calc(r*eax02))
define(ex03, calc(r*eax03))
define(ex04, calc((r - g)*eax00))
define(ex05, calc((r - g)*eax01))
define(ex06, calc((r - g)*eax02))
define(ex07, calc((r - g)*eax03))


define(ey00, calc(r*eay00))
define(ey01, calc(r*eay01))
define(ey02, calc(r*eay02))
define(ey03, calc(r*eay03))
define(ey04, calc((r - g)*eay00))
define(ey05, calc((r - g)*eay01))
define(ey06, calc((r - g)*eay02))
define(ey07, calc((r - g)*eay03))

// This is the actual 

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
);

blocks
(
    // block 0
    hex2D(p15, p01, p05, p13)
    (Nx No Nz)
    simpleGrading (1 1 1)
    
    // block 1
    hex2D(p05, p01, p00, p02)
    (No Ny Nz)
    simpleGrading (1 1 1)
    
    // block 2
    hex2D(p10, p02, p00, p14)
    (Nx No Nz)
    simpleGrading (1 1 1)
    
    // block 3
    hex2D(p15, p13, p10, p14)
    (No Ny Nz)
    simpleGrading (1 1 1)
    
    
    // block 4
    hex2D(p12, p04, p07, p09)
    (Ni Ni Nz)
    simpleGrading (1 1 1)
    
    // block 5
    hex2D(p07, p04, p03, p06)
    (Ni Ni Nz)
    simpleGrading (1 1 1)
    
    // block 6
    hex2D(p08, p06, p03, p11)
    (Ni Ni Nz)
    simpleGrading (1 1 1)
    
    // block 7
    hex2D(p12, p09, p08, p11)
    (Ni Ni Nz)
    simpleGrading (1 1 1)
    
);

edges
(
  arc p13b p05b evert(0, 0, Zb)
  arc p05b p02b evert(0, 1, Zb)
  arc p02b p10b evert(0, 2, Zb)
  arc p10b p13b evert(0, 3, Zb)
  
  arc p12b p04b evert(0, 4, Zb)
  arc p04b p03b evert(0, 5, Zb)
  arc p03b p11b evert(0, 6, Zb)
  arc p11b p12b evert(0, 7, Zb)
  
  arc p13t p05t evert(0, 0, Zt)
  arc p05t p02t evert(0, 1, Zt)
  arc p02t p10t evert(0, 2, Zt)
  arc p10t p13t evert(0, 3, Zt)
  
  arc p12t p04t evert(0, 4, Zt)
  arc p04t p03t evert(0, 5, Zt)
  arc p03t p11t evert(0, 6, Zt)
  arc p11t p12t evert(0, 7, Zt)
);

boundary
(

    inlet
    {
        type            patch;
        faces
        (
            quad2D(p14, p00)
        );
    }
    
    outlet
    {
        type            patch;
        faces
        (
            quad2D(p15, p01)
        );
    }
    
    dymWall
    {
        type            wall;
        faces
        (
            quad2D(p06, p07)
            quad2D(p07, p09)
            quad2D(p09, p08)
            quad2D(p08, p06)
            
        );
    }
    
    AMI1
    {
        type            wall;
        faces
        (
            quad2D(p12, p04)
            quad2D(p04, p03)
            quad2D(p03, p11)
            quad2D(p11, p12)
        );
    }
    
    AMI2
    {
        type            wall;
        faces
        (
            quad2D(p13, p05)
            quad2D(p05, p02)
            quad2D(p02, p10)
            quad2D(p10, p13)
        );
    }
    
    walls
    {
        type            wall;
        faces
        (
            quad2D(p00, p01)
            quad2D(p14, p15)
        );
    }
    
    
    front
    {
        type            empty;
        faces
        (
            frontQuad(p15, p13, p05, p01)
            frontQuad(p05, p02, p00, p01)
            frontQuad(p10, p14, p00, p02)
            frontQuad(p15, p14, p10, p13)
            frontQuad(p12, p09, p07, p04)
            frontQuad(p07, p06, p03, p04)
            frontQuad(p08, p11, p03, p06)
            frontQuad(p12, p11, p08, p09)
            
        );
    }
    
    back
    {
        type            empty;
        faces
        (
            backQuad(p15, p13, p05, p01)
            backQuad(p05, p02, p00, p01)
            backQuad(p10, p14, p00, p02)
            backQuad(p15, p14, p10, p13)
            backQuad(p12, p09, p07, p04)
            backQuad(p07, p06, p03, p04)
            backQuad(p08, p11, p03, p06)
            backQuad(p12, p11, p08, p09)
            
        );
    }
);

// ************************************************************************* //
