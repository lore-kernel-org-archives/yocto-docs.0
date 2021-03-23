Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web12.452.1616521023706330990
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Mar 2021 10:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4F4dpj1M43z5tlC;
	Tue, 23 Mar 2021 18:37:00 +0100 (CET)
Date: Tue, 23 Mar 2021 18:36:59 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] documentation/README minor improvements
Message-ID: <20210323173659.hdjbvz6mortxpmbo@qschulz>
References: <20210323144528.107878-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20210323144528.107878-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

On Tue, Mar 23, 2021 at 03:45:29PM +0100, Michael Opdenacker wrote:
> - Minor style and spelling fixes
> - Add some extra details; add missing external link macros
>   and explain where they are defined
> - Correct where documentation can be found on the
>   Yocto Project website: the "Documentation" tab
>   has been replaced by "Docs" (and it's later
>   shown as uppercase ("DOCS") by the current CSS, but this
>   may change one day.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/README | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/documentation/README b/documentation/README
> index be03bb119..0fa644c30 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -47,7 +47,7 @@ Folders exist for individual manuals as follows:
>  Each folder is self-contained regarding content and figures.
>  
>  If you want to find HTML versions of the Yocto Project manuals on the web,
> -go to https://www.yoctoproject.org and click on the "Documentation" tab.  From
> +go to https://www.yoctoproject.org and click on the "Docs" tab.  From
>  there you have access to archived documentation from previous releases, current
>  documentation for the latest release, and "Docs in Progress" for the release
>  currently being developed.
> @@ -91,13 +91,13 @@ Yocto Project documentation website
>  A new website has been created to host the Yocto Project
>  documentation, it can be found at: https://docs.yoctoproject.org/.
>  
> -The entire Yocto Project documentation, as well as the BitBake manual
> +The entire Yocto Project documentation, as well as the BitBake manual,
>  is published on this website, including all previously released
>  versions. A version switcher was added, as a drop-down menu on the top
>  of the page to switch back and forth between the various versions of
>  the current active Yocto Project releases.
>  
> -Transition pages have been added (as rst file) to show links to old
> +Transition pages have been added (as rst files) to show links to old
>  versions of the Yocto Project documentation with links to each manual
>  generated with DocBook.
>  
> @@ -109,7 +109,7 @@ obvious reasons, we will only support building the Yocto Project
>  documentation with Python3.
>  
>  Sphinx might be available in your Linux distro packages repositories,
> -however it is not recommend using distro packages, as they might be
> +however it is not recommend to use distro packages, as they might be

s/recommend/recommended/ while you're at it :)

>  old versions, especially if you are using an LTS version of your
>  distro. The recommended method to install Sphinx and all required
>  dependencies is to use the Python Package Index (pip).
> @@ -185,7 +185,7 @@ Sphinx has a glossary directive. From
>  https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#glossary:
>  
>      This directive must contain a reST definition list with terms and
> -    definitions. The definitions will then be referencable with the
> +    definitions. It's then possible to refer to each definition through the
>      [https://www.sphinx-doc.org/en/master/usage/restructuredtext/roles.html#role-term
>      'term' role].
>  
> @@ -206,7 +206,7 @@ however there are important shortcomings. For example they cannot be
>  used/nested inside code-block sections.
>  
>  A Sphinx extension was implemented to support variable substitutions
> -to mimic the DocBook based documentation behavior. Variabes
> +to mimic the DocBook based documentation behavior. Variable
>  substitutions are done while reading/parsing the .rst files. The
>  pattern for variables substitutions is the same as with DocBook,
>  e.g. `&VAR;`.
> @@ -237,14 +237,14 @@ Note directive
>  Sphinx has a builtin 'note' directive that produces clean Note section
>  in the output file. There are various types of directives such as
>  "attention", "caution", "danger", "error", "hint", "important", "tip",
> -"warning", "admonition" that are supported, and additional directive
> +"warning", "admonition" that are supported, and additional directives
>  can be added as Sphinx extension if needed.
>  
>  Figures
>  =======
>  
>  The Yocto Project documentation has many figures/images. Sphinx has a
> -'figure' directive which is straight forward to use. To include a
> +'figure' directive which is straightforward to use. To include a
>  figure in the body of the documentation:
>  
>    .. image:: figures/YP-flow-diagram.png
> @@ -262,7 +262,7 @@ https://sublime-and-sphinx-guide.readthedocs.io/en/latest/references.html.
>  References
>  ==========
>  
> -The following extension is enabed by default:
> +The following extension is enabled by default:
>  sphinx.ext.autosectionlabel
>  (https://www.sphinx-doc.org/en/master/usage/extensions/autosectionlabel.html).
>  
> @@ -271,7 +271,7 @@ autosectionlabel_prefix_document is enabled by default, so that we can
>  insert references from any document.
>  
>  For example, to insert an HTML link to a section from
> -documentaion/manual/intro.rst, use:
> +documentation/manual/intro.rst, use:
>  
>    Please check this :ref:`manual/intro:Cross-References to Locations in the Same Document`
>  
> @@ -294,7 +294,8 @@ Extlinks
>  
>  The sphinx.ext.extlinks extension is enabled by default
>  (https://sublime-and-sphinx-guide.readthedocs.io/en/latest/references.html#use-the-external-links-extension),
> -and it is configured with:
> +and it is configured with the 'extlinks' definitions in
> +the 'documentation/conf.py' file:
>  
>    'yocto_home': ('https://yoctoproject.org%s', None),
>    'yocto_wiki': ('https://wiki.yoctoproject.org%s', None),
> @@ -306,6 +307,10 @@ and it is configured with:
>    'yocto_git': ('https://git.yoctoproject.org%s', None),
>    'oe_home': ('https://www.openembedded.org%s', None),
>    'oe_lists': ('https://lists.openembedded.org%s', None),
> +  'oe_git': ('https://git.openembedded.org%s', None),
> +  'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
> +  'oe_layerindex': ('https://layers.openembedded.org%s', None),
> +  'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),
>  

Not sure we want to keep this list in sync with whatever is in conf.py.

In any case:
Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks for the patch,
Quentin
