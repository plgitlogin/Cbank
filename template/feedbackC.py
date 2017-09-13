#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#
# Copyright 2017 Nicolas Borie <nicolas.borie@u-pem.fr>
#

def subnlbybr(str):
    """
    Substitute each occurences of char '\n' by '<br />' in the string
    `str` in argument.

    EXAMPLES::

        >>> subnlbybr("\\n")
        '<br/>'
    """
    return "<br/>".join(str.split("\n"))

def add_border(html_code, font_color=None, font_family=None, font_size=None,
               font_style=None, background_color=None, border_radius=None):
    """
    Return `html_code` but the content is placed in a box which
    respects the arguments.

    EXAMPLES::
    
        >>> add_border("Salut!")
        ...
    """
    # CSS local for the border of the div block 
    style = 'border:1px solid black;padding:1%;margin:1%;'
    if background_color is not None:
        style += 'background-color: ' + background_color + ';'
    if border_radius is not None:
        style += 'border-radius: ' + border_radius + ';'
    html_before = '<div style="' + style + '">'

    # CSS local for the content inside the block
    style = ''
    if font_color is not None:
        style += 'color: ' + font_color + ';'
    if font_family is not None:
        style += 'font-family: ' + font_family + ';'
    if font_size is not None:
        style += 'font-size: ' + font_size + ';'
    if font_style is not None:
        style += 'font-style: ' + font_style + ';'
    html_before += '<font style="' + style + '">'

    # Ends of blocks
    html_after = '</font></div>'
    
    return html_before + subnlbybr(html_code) + html_after

def terminal_code(msg):
    """
    Return html/CSS code to display msg with a terminal look.

    EXEMPLES::

        >>> terminal_code(">>> 1+1\n2\n")
        ...
    """
    return add_border(msg, "White", "Monospace", "0.8em", "normal", "Black", None) 
        
def generated_feedback_compilation(flags, compil_state, gcc_msg):
    """
    Generate feedback for the compilation.
    """
    if compil_state == "error":
        bg_color = 'Salmon'
        gcc_state = 'Erreur'
        color_state = 'DarkRed'
    elif compil_state == "warning":
        bg_color = 'Moccasin'
        gcc_state = 'Warning'
        color_state = 'DarkOrange'
    else:
        bg_color = 'LightGreen'
        gcc_state = 'Réussie'
        color_state = 'DarkGreen'

    compil_fb = '<u>Compilation'
    if len(flags) > 0:
        compil_fb += ' avec drapeaux ' + flags
    compil_fb += ' :</u> <font color="' + color_state  + '"><b>' + gcc_state + '</b></font><br />' 

    if compil_state == "error":
        compil_fb += 'Il y a des erreurs à la compilation de votre programme.'
    elif compil_state == "warning":
        compil_fb += 'Vous pouvez augmenter la qualité de votre programme en lisant les recommandations du compilateur.'

    if len(gcc_msg) > 0:
        compil_fb += '<br />Feedback provenant de gcc: <br />'
        compil_fb += terminal_code(gcc_msg)

    return add_border(compil_fb, "Black", None, "1em", "normal", bg_color, "10px")

class FeedbackC:
    pass