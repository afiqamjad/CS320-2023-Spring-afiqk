####################################################
#!/usr/bin/env python3
####################################################
import sys
print(sys.executable)
sys.path.append('./../../../05')
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
"""
HX-2023-03-14: 30 points
BU CAS CS320-2023-Spring: Image Processing
"""
####################################################
import math
####################################################
import kervec
import imgvec
####################################################
from PIL import Image
####################################################

def load_color_image(filename):
    """
    Loads a color image from the given file and returns a dictionary
    representing that image.

    Invoked as, for example:
       i = load_color_image("test_images/cat.png")
    """
    with open(filename, "rb") as img_handle:
        img = Image.open(img_handle)
        img = img.convert("RGB")  # in case we were given a greyscale image
        img_data = img.getdata()
        pixels = list(img_data)
        width, height = img.size
        return imgvec.image(height, width, pixels)
    # return None

def save_color_image(image, filename, mode="PNG"):
    """
    Saves the given color image to disk or to a file-like object.  If filename
    is given as a string, the file type will be inferred from the given name.
    If filename is given as a file-like object, the file type will be
    determined by the "mode" parameter.
    """
    out = Image.new(mode="RGB", size=(image.width, image.height))
    out.putdata(image.pixlst)
    if isinstance(filename, str):
        out.save(filename)
    else:
        out.save(filename, mode)
    out.close()
    # return None

####################################################
#
# HX-2023-03-18:
# This one is incorrect:
# def grey_of_color(clr):
#     (r0, b1, g2) = clr
#     return round(0.299*r0+0.587*b1+0.114*g2)
def grey_of_color(clr):
    (rr, gg, bb) = clr
    return round(0.299*rr+0.587*gg+0.114*bb)
#
####################################################

def image_invert_grey(ximg):
    return imgvec.image_make_map(ximg, lambda pix: 255 - pix)
def image_invert_color(ximg):
    return imgvec.image_make_map(ximg, lambda clr: 255 - grey_of_color(clr))

####################################################
#
# towers = \
#     load_color_image("INPUT/towers.jpg")
#balloons = \
#     load_color_image("assigns/05/MySolution/Python/INPUT/balloons.png")
#
####################################################
#
# save_color_image(image_invert_color(towers), "OUTPUT/towers_invert.png")
# save_color_image(image_invert_color(balloons), "assigns/05/MySolution/Python/OUTPUT/balloons_invert.png")
#
####################################################

def image_edges_grey(image):
    """
    This is an implementation of the Sobel operator.
    """
    krow = \
        kervec.kernel_make_pylist\
        (3, [-1, -2, -1, 0, 0, 0, 1, 2, 1])
    kcol = \
        kervec.kernel_make_pylist\
        (3, [-1, 0, 1, -2, 0, 2, -1, 0, 1])
    imgrow = \
        imgvec.image_kernel_correlate(image, krow, 'extend')
    imgcol = \
        imgvec.image_kernel_correlate(image, kcol, 'extend')
    imgres = \
        imgvec.image_make_z2map\
        (imgrow, imgcol, lambda x, y: math.sqrt(x*x + y*y))
    return imgvec.image_round_and_clip(imgres)

def image_edges_color(image):
    return image_edges_grey\
        (imgvec.image_make_map(image, lambda clr: 255 - grey_of_color(clr)))

####################################################

def image_blur_bbehav_grey(image, ksize, bbehav):
    ksize2 = ksize*ksize
    kernel = \
        kervec.kernel_make_pylist\
        (ksize, ksize2*[1.0/ksize2])
    return imgvec.image_round_and_clip\
        (imgvec.image_kernel_correlate(image, kernel, bbehav))

####################################################

def color_filter_from_greyscale_filter(filt):
    """
    Given a filter that takes a greyscale image as input and produces a
    greyscale image as output, returns a function that takes a color image as
    input and produces the filtered color image.
    """
    def image_filter(cimage):
        ww = cimage.width
        hh = cimage.height
        image0 = filt(imgvec.image_make_map(cimage, lambda clr: clr[0]))
        image1 = filt(imgvec.image_make_map(cimage, lambda clr: clr[1]))
        image2 = filt(imgvec.image_make_map(cimage, lambda clr: clr[2]))
        return imgvec.image_make_tuple\
            (hh, ww, \
             tuple(zip(image0.pixlst, image1.pixlst, image2.pixlst)))
    return lambda cimage: image_filter(cimage)

####################################################

def image_blur_bbehav_color(image, ksize, bbehav):
    return \
        color_filter_from_greyscale_filter\
        (lambda image: image_blur_bbehav_grey(image, ksize, bbehav))(image)

####################################################
# save_color_image\
#    (image_blur_bbehav_color(balloons, 5, 'extend'), "OUTPUT/balloons_blurred.png")
####################################################
####################################################
def single_seam(image):
    cenergy = []
    lister = {}
    for i in range(0, image.width):
        cenergy.append(image.pixlst[i])
        lister[(0,i)] =  None
    for i in range(image.width, len(image.pixlst)):
        minval, coords = idktbh(cenergy, image, image.pixlst[i], i // image.width, i % image.width)
        cenergy.append(minval)
        lister[(i // image.width, i % image.width)] = coords
    return cenergy, lister

def idktbh(energy, image, pix, x, y):
    if y % image.width == 0:
        min1 = energy[((x-1)*image.width)+y]
        min2 = energy[((x-1)*image.width)+y+1]
        if min1 == min2:
            minval = min1
            coords = (x-1, y)
        else:
            minval = min(min1,min2)
            if minval == min1:
                coords = (x-1, y)
            else:
                coords = (x-1, y+1)
        return pix + minval, coords
    if y % image.width - 1 == 0:
        min1 = energy[((x-1)*image.width)+y]
        min2 = energy[((x-1)*image.width)+y-1]
        if min1 == min2:
            minval = min2
            coords = (x-1, y-1)
        else:
            minval = min(min1,min2)
            if minval == min1:
                coords = (x-1, y)
            else:
                coords = (x-1, y-1)
        return pix + minval, coords
    min1 = energy[((x-1)*image.width)+y]
    min2 = energy[((x-1)*image.width)+y+1]
    min3 = energy[((x-1)*image.width)+y-1]
    if min1 == min2 and min2 == min3:
        minval = min3
        coords = (x-1, y-1)
    elif min1 == min2 and (min1 < min3):
        minval = min1
        coords = (x-1, y)
    elif min1 == min3 and (min1 < min2):
        minval = min3
        coords = (x-1, y-1)
    elif min2 == min3 and (min3 < min1):
        minval = min3
        coords = (x-1, y-1)
    else:
        minval = min(min1,min2,min3)
        if minval == min1:
                coords = (x-1, y)
        elif minval == min2:
                coords = (x-1, y+1)
        else:
                coords = (x-1, y-1)
    return pix + minval, coords

def seams(image, energy, lister):
    bruh = []
    coords = (0,0)
    minval = 99999999
    counter = 0
    for i in energy[(image.height-1)*image.width:((image.height-1)*image.width)+image.width]:
        if i < minval:
            minval = i
            coords = (image.height-1, counter)
        counter = counter + 1
    bruh.append(coords[1])
    while lister[coords] != None:
        coords = lister[coords]
        bruh.append(coords[1])
    return bruh

def removeSeam(image, bruh):
   return imgvec.image_make_pylist\
 (image.height, image.width-1, imgvec.image_i2filter_pylist(image, lambda i0, j0, _: bruh[i0] != j0))


def image_seam_carving_color(image, ncol):
    """
    Starting from the given image, use the seam carving technique to remove
    ncols (an integer) columns from the image. Returns a new image.
    """
    
    assert ncol < image.width
    hmm = image
    i =  0
    while i < ncol:
        hmm = one_carve(hmm)
        i = i + 1
    return hmm
    
def one_carve(image):
    inverted = image_edges_color(image)
    energy, lister = single_seam(inverted)
    seamsList = seams(image, energy, lister)
    seamsList.reverse()
    newImage = removeSeam(image, seamsList)
    return newImage
    

balloons = \
    load_color_image\
    ("assigns/05\MySolution\Python\INPUT/balloons.png")

inverted = image_edges_color(balloons)
energy, lister = single_seam(inverted)
seamsList =  seams(balloons, energy, lister)
seamsList.reverse()
print(energy[312*500 + 2: (312*500)+500])

print(seamsList)
