Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.9191.1600852743429534507
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Sep 2020 02:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=P68HHC05;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=15025; q=dns/txt; s=axis-central1;
  t=1600852743; x=1632388743;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=GaUotsgcOZfQE1a8rL/K5UiFSUEM5y/02Zg9cS77sLI=;
  b=P68HHC05ImRRXdT+PR4n2gfsCsxS0WeYCAeByg5u7jU/3FbHC5UmqCdp
   qWjPEpiQCt3e9rG3/CIxzJDtuaM5G2RlP8VSUtp10DfpN9omAhHeValhP
   pw1voYQbnUr1BjhH/ryo0G/UfFwEuxLF4ydoc+lyPKmwcG+humY8TG21O
   yLLBQkxqWrbZjeiaS0fRFt1W1hC03hk3jHK2w0C10sgcd3YiXVBXJEasK
   cDqYa7Ug49LyNEh2zQZX2dHWBGWIDh5JNT2PdAf+vfLPSjiDc0p41ZhKB
   Whc7haRsqxyeSQjEP5NXG+uQou+3Xsam+OVLDaHVHtwmR5mSVjPz8lLWI
   Q==;
IronPort-SDR: MTg1m5r/Z2VEDtU2S+2Injs64wW7S0t3H/aVj4KYDx48MyKaXFzEIle6xQAWyX6w5ZMAE+Q2ui
 5dUJ4uySh9XdbpY6JHTldlDKi6t3ZR9abbB1Mem6beVLI6Yc18Da77C+4eYkM+psHtFQz8kmPN
 o3rbp0PnlZELiylwl9objcP3YRwT7zSPr14UEPYn4TaoU7+5lxnimnELRJOaEaGBrWVMFhciQV
 QZ+N6VUgFsefzUs/bjXEeM9a1vIG1nkzNBx3tPAhslTDuI6AEtoY/R7a4A9NWIx6SfKZpApkaP
 I9Q=
X-IronPort-AV: E=Sophos;i="5.77,293,1596492000"; 
   d="scan'208";a="13263179"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] README: include detailed information about sphinx
Thread-Topic: [docs] [PATCH] README: include detailed information about sphinx
Thread-Index: AQHWkMtTyW8yfr9IuUCgpt0InfkvT6l17W8g
Date: Wed, 23 Sep 2020 09:19:00 +0000
Message-ID: <963d33a27b99490fbd2667e2ef244fa2@XBOX03.axis.com>
References: <20200922102937.659302-1-nicolas.dechesne@linaro.org>
In-Reply-To: <20200922102937.659302-1-nicolas.dechesne@linaro.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> Of Nicolas Dechesne
> Sent: den 22 september 2020 12:30
> To: docs@lists.yoctoproject.org
> Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Subject: [docs] [PATCH] README: include detailed information about sphinx
>=20
> * Updated the README to include instructions to build the doc with
>   sphinx
> * Added design guidelines for new contributors
>=20
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  documentation/README | 283 ++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 255 insertions(+), 28 deletions(-)
>=20
> diff --git a/documentation/README b/documentation/README
> index d64f2fd2f..5368807d9 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -40,16 +40,11 @@ Folders exist for individual manuals as follows:
>  * kernel-dev       - The Yocto Project Linux Kernel Development Tasks Ma=
nual
>  * ref-manual       - The Yocto Project Reference Manual
>  * yocto-project-qs - The Yocto Project Quick Start
> -* mega-manual      - The Yocto Project Mega-Manual, which is an aggregat=
ed manual comprised
> -                     of all YP manuals and guides
>  * profile-manual   - The Yocto Project Profile and Tracing Manual
>  * toaster-manual   - The Toaster Manual
> +* test-manual      - The Test Environment Manual
>=20
> -Each folder is self-contained regarding content and figures.  Note that =
there
> -is a sed file needed to process the links of the mega-manual.  The sed f=
ile
> -is located in the tools directory.  Also note that the figures folder in=
 the
> -mega-manual directory contains duplicates of all the figures in the YP f=
olders
> -directories for all YP manuals and guides.
> +Each folder is self-contained regarding content and figures.
>=20
>  If you want to find HTML versions of the Yocto Project manuals on the we=
b,
>  go to http://www.yoctoproject.org and click on the "Documentation" tab. =
From
> @@ -60,34 +55,266 @@ currently being developed.
>  In general, the Yocto Project site (http://www.yoctoproject.org) is a gr=
eat
>  reference for both information and downloads.
>=20
> -Makefile
> +poky.yaml
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This file defines variables used for documentation production.  The vari=
ables
> +are used to define release pathnames, URLs for the published manuals, et=
c.
> +
> +template
>  =3D=3D=3D=3D=3D=3D=3D=3D
> +Contains various templates, fonts, and some old PNG files.
> +
> +Sphinx
> +=3D=3D=3D=3D=3D=3D
> +
> +The Yocto Project documentation was migrated from the original DocBook
> +format to Sphinx based documentation for the Yocto Project 3.2
> +release. This section will provideo additional information related to

Change "provideo" to "provide".

> +the Sphinx migration, and guidelines for developers willing to
> +contritute to the Yocto Project documentation.

Change "contritute" to "contribute".

> +
> +   Sphinx is a tool that makes it easy to create intelligent and
> +   beautiful documentation, written by Georg Brandl and licensed under
> +   the BSD license. It was originally created for the Python
> +   documentation.
> +
> +Extensive documentation is available on the Sphinx website:
> +https://www.sphinx-doc.org/en/master/. Sphinx is designed to be
> +extensible thanks to the ability to write our own custom extensions,
> +as Python modules, which will be executed during the generation of the
> +documentation.
> +
> +Yocto Project documentation website
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A new website has been created to host the Yocto Project
> +documentation, it can be found at: https://docs.yoctoproject.org/.
> +
> +The entire Yocto Project documentation, as well as the BitBake manual
> +is published on this website, including all previously released
> +versions. A version switcher was added, as a drop-down menu on the top
> +of the page to switch back and forth between the various versions of
> +the current active Yocto Project releases.
> +
> +Transition pages have been added (as rst file) to show links to old
> +version of the Yocto Project documentation with links to each manual

Change "version" to "versions".

> +generated with DocBook.
> +
> +How to build the Yocto Project documentation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Sphinx is written in Python, while it might work with Python2, for
> +obvious reasons, we will only support building the Yocto Project
> +documentation with Python3.

Change "Python, while" to "Python. While".

> +
> +Sphinx might be available in your Linux distro packages repositories,
> +however it is not recommend using distro packages, as they might be
> +old versions, especially if you are using an LTS version of your
> +distro. The recommended method to install Sphinx and all required
> +dependencies is to use the Python Package Index (pip).
> +
> +To install all required packages run:
>=20
> -The Makefile processes manual directories to create HTML, PDF,
> -tarballs, etc.  Details on how the Makefile work are documented
> -inside the Makefile.  See that file for more information.
> + $ pip3 install sphinx sphinx_rtd_theme pyyaml
>=20
> -To build a manual, you run the make command and pass it the name
> -of the folder containing the manual's contents.
> -For example, the following command run from the documentation directory
> -creates an HTML version of the SDK manual.
> -The DOC variable specifies the manual you are making:
> +To build the documentation locally, run:
>=20
> -     $ make DOC=3Dsdk-manual
> + $ cd documentation
> + $ make -f Makefile.sphinx html
>=20
> -poky.ent
> +The resulting HTML index page will be _build/html/index.html, and you
> +can browse your own copy of the locally generated documentation with
> +your browser.
> +
> +Sphinx theme and CSS customization
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The Yocto Project documentation is currently based on the "Read the
> +Docs" Sphinx theme, with a few changes to make sure the look and feel
> +of the project documentation is preserved.
> +
> +Most of the theme changes can be done using the file
> +'sphinx-static/theme_overrides.css'. Most CSS changes in this file
> +were inherited from the DocBook CSS stylesheets.
> +
> +Sphinx design guidelines and principles
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The initial Docbook to Sphinx migration was done with automated an

Change "automated an" to "an automated".

> +tool called Pandoc (https://pandoc.org/). The tool produced some clean
> +output markdown text file. After the initial automated conversion

Change "file" to "files".

> +additional changes were done to fix up headings, images and links. In
> +addition Sphinx has built in mechanisms (directives) which were used
> +to replace similar functions implemented in Docbook such as glossary,
> +variables substitutions, notes and references.
> +
> +Headings
>  =3D=3D=3D=3D=3D=3D=3D=3D
>=20
> -This file defines variables used for documentation production.  The vari=
ables
> -are used to define release pathnames, URLs for the published manuals, et=
c.
> +The layout of the Yocto Project manuals is organized as follows
>=20
> -template
> +    Book
> +      Chapter
> +        Section
> +          Section
> +            Section
> +
> +The following headings styles are defined in Sphinx:
> +
> +    Book              =3D> overline =3D=3D=3D
> +      Chapter         =3D> overline ***
> +        Section       =3D> =3D=3D=3D=3D
> +          Section     =3D> ----
> +            Section   =3D> ^^^^
> +              Section =3D> """" or ~~~~
> +
> +With this proposal, we preserve the same TOCs between Sphinx and Docbook=
.
> +
> +Built-in glossary
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Sphinx has a glossary directive. From
> +https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.h=
tml#glossary:
> +
> +    This directive must contain a reST definition list with terms and
> +    definitions. The definitions will then be referencable with the
> +    [https://www.sphinx-doc.org/en/master/usage/restructuredtext/roles.h=
tml#role-term
> +    'term' role].
> +
> +So anywhere in any of the Yocto Project manuals, :term:`VAR` can be
> +used to refer to an item from the glossary, and a link is created
> +automatically. A general index of terms is also generated by Sphinx
> +automatically.
> +
> +Global substitutions
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The Yocto Project documentation makes heavy use of global
> +variables. In Docbook these variables are stored in the file
> +poky.ent. This Docbook feature is not handled automatically with
> +Pandoc. Sphinx has builtin support for substitutions
> +(https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html=
#substitutions),
> +however there are important shortcomings. For example they cannot be
> +used/nested inside code-block sections.
> +
> +A Sphinx extension was implemented to support variable substitutions
> +to mimic the DocBook based documentation behavior. Variabes
> +substitutions are done while reading/parsing the .rst files. The
> +pattern for variables substitutions is the same as with DocBook,
> +e.g. `&VAR;`.
> +
> +The implementation of the extension can be found here in the file
> +documentation/sphinx/yocto-vars.py, this extension is enabled by
> +default when building the Yocto Project documentation.  All variables
> +are set in a file call poky.yaml, which was initially generated from
> +poky.ent. The file was converted into YAML to that it is easier to

Change "YAML to" to "YAML so".

> +process by the custom Sphinx extension (which is a Python module).
> +
> +For example, the following .rst content will produce the 'expected'
> +content:
> +
> +  .. code-block::
> +      $ mkdir ~/poky-&DISTRO;
> +      or
> +      $ git clone &YOCTO_GIT_URL;/git/poky -b &DISTRO_NAME_NO_CAP;
> +
> +Variables can be nested, like it was the case for DocBook:
> +
> +  YOCTO_HOME_URL : "http://www.yoctoproject.org"
> +  YOCTO_DOCS_URL : "&YOCTO_HOME_URL;/docs"
> +
> +Note directive
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Sphinx has a builtin 'note' directive that produces clean Note section
> +in the output file. There are various types of directives such as
> +"attention", "caution", "danger", "error", "hint", "important", "tip",
> +"warning", "admonition" that are supported, and additional directive
> +can be added as Sphinx extension if needed.
> +
> +Figures
> +=3D=3D=3D=3D=3D=3D=3D
> +
> +The Yocto Project documentation has many figures/images. Sphinx as a

Change "as a" to "has a".

> +'figure' directive which is straight forward to use. To include a
> +figure in the body of the documentation:
> +
> +  .. image:: figures/YP-flow-diagram.png
> +
> +Links and References
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The following types of links can be used: links to other locations in
> +the same document, to locations in other documents and to external
> +websites.
> +
> +More information can be found here:
> +https://sublime-and-sphinx-guide.readthedocs.io/en/latest/references.htm=
l.
> +
> +References
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The following extension is enabed by default:
> +sphinx.ext.autosectionlabel
> +(https://www.sphinx-doc.org/en/master/usage/extensions/autosectionlabel.=
html).
> +
> +This extension allows you to refer sections its title. Note that

Change "refer sections its title" to "refer to sections by their titles".

> +autosectionlabel_prefix_document is enable by default, so that we can

Change "enable" to "enabled".

> +insert references from any document.
> +
> +For example, to insert an HTML link to a section from
> +documentaion/manual/intro.rst, use:
> +
> +  Please check this :ref:`manual/intro:Cross-References to Locations in =
the Same Document`
> +
> +Alternatively a custom text can be used instead of using the section
> +text:
> +
> +  Please check this :ref:`section <manual/intro:Cross-References to
> Locations in the Same Document>`
> +
> +TIP: The following command can be used to dump all the references that
> +     are defined in the project documentation:
> +
> +       python -msphinx.ext.intersphinx <path to build folder>/html/objec=
ts.inv
> +
> +This dump contains all links and for each link it shows the default
> +"Link Text" that Sphinx would use. If the default link text is not
> +appropriate, a custom link text can be used in the ':ref:' directive.
> +
> +Extlinks
>  =3D=3D=3D=3D=3D=3D=3D=3D
> -Contains various templates, fonts, and some old PNG files.
>=20
> -tools
> -=3D=3D=3D=3D=3D
> -Contains a tool to convert the DocBook files to PDF format.  This folder=
 also
> -contains the mega-manual.sed file, which is used by Makefile to process
> -cross-references from within the manual that normally go to an external
> -manual.
> +The sphinx.ext.extlinks extension is enabled by default
> +(https://sublime-and-sphinx-guide.readthedocs.io/en/latest/references.ht=
ml#use-the-external-links-
> extension),
> +and it is configured with:
> +
> +  'yocto_home': ('https://yoctoproject.org%s', None),
> +  'yocto_wiki': ('https://wiki.yoctoproject.org%s', None),
> +  'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
> +  'yocto_lists': ('https://lists.yoctoproject.org%s', None),
> +  'yocto_bugs': ('https://bugzilla.yoctoproject.org%s', None),
> +  'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
> +  'yocto_docs': ('https://docs.yoctoproject.org%s', None),
> +  'yocto_git': ('https://git.yoctoproject.org%s', None),
> +  'oe_home': ('https://www.openembedded.org%s', None),
> +  'oe_lists': ('https://lists.openembedded.org%s', None),
> +
> +It creates convenient shortcuts which can be used throughout the
> +documentation rst files, as:
> +
> +  Please check this :yocto_wiki:`wiki page </Weekly_Status>`
> +
> +Intersphinx links
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The sphinx.ext.intersphinx extension is enabled by default
> +(https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html)=
,
> +so that we can cross reference content from other Sphinx based
> +documentation project, such as the BitBake manual.

Change "project" to "projects".

> +
> +References to the bitbake manual can be done like this:
> +
> +  See the ":ref:`-D <bitbake:bitbake-user-manual/bitbake-user-manual-int=
ro:usage and syntax>`" option
> +or
> +  :term:`bitbake:BB_NUMBER_PARSE_THREADS`
> --
> 2.28.0

//Peter

