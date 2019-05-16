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

convertToMeters 1;

// Tube Length
define(L, 500)
define(W, 500)



// Thickness of 2D slab
define(z, 50)

// Base z
define(Zb, calc(-z/2))

// Top z
define(Zt, calc(Zb + z))

// Number of cells front to back
define(Nz, 1)

// Number of cells in x direction
define(Nx, 20)

// Number of cells in y direction
define(Ny, 20)

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

define(vert, (x$1$2 y$1$2 $3))
define(evert, (ex$1$2 ey$1$2 $3))


// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

// The xx-- and yy-- are sets of repeated x and y coordinates

define(xx00, calc(-L/2))
define(xx01, calc(L/2))

define(yy00, calc(-W/2))
define(yy01, calc(W/2))

// This is the actual 

define(x00, xx00)
define(x01, xx01)
define(x02, xx00)
define(x03, xx01)


define(y00, yy00)
define(y01, yy00)
define(y02, yy01)
define(y03, yy01)


// This is the actual 

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

vertices
(
    vert(0, 0, Zb) vlabel(p00b)
    vert(0, 1, Zb) vlabel(p01b)
    vert(0, 2, Zb) vlabel(p02b)
    vert(0, 3, Zb) vlabel(p03b)
    
    
    
    vert(0, 0, Zt) vlabel(p00t)
    vert(0, 1, Zt) vlabel(p01t)
    vert(0, 2, Zt) vlabel(p02t)
    vert(0, 3, Zt) vlabel(p03t)
);

blocks
(
    // block 0
    hex2D(p00, p01, p03, p02)
    (Nx Ny Nz)
    simpleGrading (1 1 1)
    
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
            quad2D(p02, p00)
        );
    }
    
    outlet
    {
        type            patch;
        faces
        (
            quad2D(p03, p01)
        );
    }

    
    walls
    {
        type            wall;
        faces
        (
            quad2D(p00, p01)
            quad2D(p02, p03)
        );
    }
    
    
    symFront
    {
        type            symmetryPlane;
        faces
        (
            frontQuad(p00, p01, p03, p02)
            
        );
    }
    
    symBack
    {
        type            symmetryPlane;
        faces
        (
            backQuad(p00, p01, p03, p02)
        );
    }
);

// ************************************************************************* //
