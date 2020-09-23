Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.9854.1600854854813954219
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Sep 2020 02:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Hgnmpcd5;
 spf=pass (domain: linaro.org, ip: 209.85.128.53, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f53.google.com with SMTP id s13so6436585wmh.4
        for <docs@lists.yoctoproject.org>; Wed, 23 Sep 2020 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wayBru7ahyr3lwI7PMDjSHhLCjq6RowsD0iW1d21n5w=;
        b=Hgnmpcd5c/ztXN7/AFi698m/CvB/AQ3tlbyvbMj4fdnEjm8jt0yX7KvNRrG7KVT6lS
         fJEjV88sxEHnmOs2XaMP9gQc+4lmC9ENfH3/0YD7JeLMTSUjDJG0ZTplU8mnOSXgXNY/
         qdP+CMhGuw/Fpb3r0x7SKJe/RD6CL+0HSU/dKKnKlM0xxmpLFK7qLSD6ma2Zs3WreTDY
         1q91An/+W0AcMNuW6FbfnPE0kdlxPShjoHBn1A8scAwlSvN6YO8Q8eOD7ZQsaTUHjop9
         lFWXaER8HQ49dq84e+aj53dk+9MygNodc45AcAWa34Rym0WyOVyvdJFifN+5VmvRfBxV
         nnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wayBru7ahyr3lwI7PMDjSHhLCjq6RowsD0iW1d21n5w=;
        b=qOldzoRNjw4SgfBVf/SStmYU125b0DoB7GPhX79dknKrEx92n1xB0DueKmsz/MNdYr
         YBWPsvnQy0nOqwUNkZ4NAjkrBWW0LNyv/h9rhMujKBo6bqm7d9m0V2lkz7AN+D+Xct1J
         o2+p/j1aojKpBllpV70nLsbfXA6FrXz0uyHR/gFRbWM/NWhj2IqntMkUCWmyJpaXW0Sn
         +f3i1/NwxRArhaIw2x7zYC8SVkLYbknrks45mTIcEkw021tE0F0lJmVfGS8wYjbYXd4C
         TMZneCrUfIxfIecfSjhoziPH7i5qIeGKlYwcBs0pK09CtstmGMAKB0ERWc/ifn1XJ0LS
         Z8Wg==
X-Gm-Message-State: AOAM532PH6unNToX2etbPWMzERrL+V17s0ofWYZmPOtPhaS9GNjlZPbn
	knORQMilomiyLpJjtueA0GJKN08Oy1Gq+8kd
X-Google-Smtp-Source: ABdhPJzn/qysnCbb/z1x0Pnw7ay8NOIQZU9ZlX/ihPoUeukzDvcYWimXvE9dcpVT1AYnwzeSQCCOVA==
X-Received: by 2002:a05:600c:2189:: with SMTP id e9mr5552581wme.8.1600854852441;
        Wed, 23 Sep 2020 02:54:12 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from nikaia.localdomain ([2a01:e0a:1b9:3e10:d6af:c5d9:8b6e:b994])
        by smtp.gmail.com with ESMTPSA id h204sm7732392wmf.35.2020.09.23.02.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 02:54:11 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH v2] README: include detailed information about sphinx
Date: Wed, 23 Sep 2020 11:53:53 +0200
Message-Id: <20200923095353.685946-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* Updated the README to include instructions to build the doc with
  sphinx
* Added design guidelines for new contributors

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
Changes in v2: 
- fixed spelling/grammar based on Peter's feedback, thank you so much!

 documentation/README | 283 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 255 insertions(+), 28 deletions(-)

diff --git a/documentation/README b/documentation/README
index d64f2fd2f..fce3cfe17 100644
--- a/documentation/README
+++ b/documentation/README
@@ -40,16 +40,11 @@ Folders exist for individual manuals as follows:
 * kernel-dev       - The Yocto Project Linux Kernel Development Tasks Manual
 * ref-manual       - The Yocto Project Reference Manual
 * yocto-project-qs - The Yocto Project Quick Start
-* mega-manual      - The Yocto Project Mega-Manual, which is an aggregated manual comprised
-                     of all YP manuals and guides
 * profile-manual   - The Yocto Project Profile and Tracing Manual
 * toaster-manual   - The Toaster Manual
+* test-manual      - The Test Environment Manual
 
-Each folder is self-contained regarding content and figures.  Note that there
-is a sed file needed to process the links of the mega-manual.  The sed file
-is located in the tools directory.  Also note that the figures folder in the
-mega-manual directory contains duplicates of all the figures in the YP folders
-directories for all YP manuals and guides.
+Each folder is self-contained regarding content and figures.
 
 If you want to find HTML versions of the Yocto Project manuals on the web,
 go to http://www.yoctoproject.org and click on the "Documentation" tab.  From
@@ -60,34 +55,266 @@ currently being developed.
 In general, the Yocto Project site (http://www.yoctoproject.org) is a great
 reference for both information and downloads.
 
-Makefile
+poky.yaml
+=========
+
+This file defines variables used for documentation production.  The variables
+are used to define release pathnames, URLs for the published manuals, etc.
+
+template
 ========
+Contains various templates, fonts, and some old PNG files.
+
+Sphinx
+======
+
+The Yocto Project documentation was migrated from the original DocBook
+format to Sphinx based documentation for the Yocto Project 3.2
+release. This section will provide additional information related to
+the Sphinx migration, and guidelines for developers willing to
+contribute to the Yocto Project documentation.
+
+   Sphinx is a tool that makes it easy to create intelligent and
+   beautiful documentation, written by Georg Brandl and licensed under
+   the BSD license. It was originally created for the Python
+   documentation.
+
+Extensive documentation is available on the Sphinx website:
+https://www.sphinx-doc.org/en/master/. Sphinx is designed to be
+extensible thanks to the ability to write our own custom extensions,
+as Python modules, which will be executed during the generation of the
+documentation.
+
+Yocto Project documentation website
+===================================
+
+A new website has been created to host the Yocto Project
+documentation, it can be found at: https://docs.yoctoproject.org/.
+
+The entire Yocto Project documentation, as well as the BitBake manual
+is published on this website, including all previously released
+versions. A version switcher was added, as a drop-down menu on the top
+of the page to switch back and forth between the various versions of
+the current active Yocto Project releases.
+
+Transition pages have been added (as rst file) to show links to old
+versions of the Yocto Project documentation with links to each manual
+generated with DocBook.
+
+How to build the Yocto Project documentation
+============================================
+
+Sphinx is written in Python. While it might work with Python2, for
+obvious reasons, we will only support building the Yocto Project
+documentation with Python3.
+
+Sphinx might be available in your Linux distro packages repositories,
+however it is not recommend using distro packages, as they might be
+old versions, especially if you are using an LTS version of your
+distro. The recommended method to install Sphinx and all required
+dependencies is to use the Python Package Index (pip).
+
+To install all required packages run:
 
-The Makefile processes manual directories to create HTML, PDF,
-tarballs, etc.  Details on how the Makefile work are documented
-inside the Makefile.  See that file for more information.
+ $ pip3 install sphinx sphinx_rtd_theme pyyaml
 
-To build a manual, you run the make command and pass it the name
-of the folder containing the manual's contents.
-For example, the following command run from the documentation directory
-creates an HTML version of the SDK manual.
-The DOC variable specifies the manual you are making:
+To build the documentation locally, run:
 
-     $ make DOC=sdk-manual
+ $ cd documentation
+ $ make -f Makefile.sphinx html
 
-poky.ent
+The resulting HTML index page will be _build/html/index.html, and you
+can browse your own copy of the locally generated documentation with
+your browser.
+
+Sphinx theme and CSS customization
+==================================
+
+The Yocto Project documentation is currently based on the "Read the
+Docs" Sphinx theme, with a few changes to make sure the look and feel
+of the project documentation is preserved.
+
+Most of the theme changes can be done using the file
+'sphinx-static/theme_overrides.css'. Most CSS changes in this file
+were inherited from the DocBook CSS stylesheets.
+
+Sphinx design guidelines and principles
+=======================================
+
+The initial Docbook to Sphinx migration was done with an automated
+tool called Pandoc (https://pandoc.org/). The tool produced some clean
+output markdown text files. After the initial automated conversion
+additional changes were done to fix up headings, images and links. In
+addition Sphinx has built in mechanisms (directives) which were used
+to replace similar functions implemented in Docbook such as glossary,
+variables substitutions, notes and references.
+
+Headings
 ========
 
-This file defines variables used for documentation production.  The variables
-are used to define release pathnames, URLs for the published manuals, etc.
+The layout of the Yocto Project manuals is organized as follows
 
-template
+    Book
+      Chapter
+        Section
+          Section
+            Section
+
+The following headings styles are defined in Sphinx:
+
+    Book              => overline ===
+      Chapter         => overline ***
+        Section       => ====
+          Section     => ----
+            Section   => ^^^^
+              Section => """" or ~~~~
+
+With this proposal, we preserve the same TOCs between Sphinx and Docbook.
+
+Built-in glossary
+=================
+
+Sphinx has a glossary directive. From
+https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#glossary:
+
+    This directive must contain a reST definition list with terms and
+    definitions. The definitions will then be referencable with the
+    [https://www.sphinx-doc.org/en/master/usage/restructuredtext/roles.html#role-term
+    'term' role].
+
+So anywhere in any of the Yocto Project manuals, :term:`VAR` can be
+used to refer to an item from the glossary, and a link is created
+automatically. A general index of terms is also generated by Sphinx
+automatically.
+
+Global substitutions
+====================
+
+The Yocto Project documentation makes heavy use of global
+variables. In Docbook these variables are stored in the file
+poky.ent. This Docbook feature is not handled automatically with
+Pandoc. Sphinx has builtin support for substitutions
+(https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#substitutions),
+however there are important shortcomings. For example they cannot be
+used/nested inside code-block sections.
+
+A Sphinx extension was implemented to support variable substitutions
+to mimic the DocBook based documentation behavior. Variabes
+substitutions are done while reading/parsing the .rst files. The
+pattern for variables substitutions is the same as with DocBook,
+e.g. `&VAR;`.
+
+The implementation of the extension can be found here in the file
+documentation/sphinx/yocto-vars.py, this extension is enabled by
+default when building the Yocto Project documentation.  All variables
+are set in a file call poky.yaml, which was initially generated from
+poky.ent. The file was converted into YAML so that it is easier to
+process by the custom Sphinx extension (which is a Python module).
+
+For example, the following .rst content will produce the 'expected'
+content:
+
+  .. code-block::
+      $ mkdir ~/poky-&DISTRO;
+      or
+      $ git clone &YOCTO_GIT_URL;/git/poky -b &DISTRO_NAME_NO_CAP;
+
+Variables can be nested, like it was the case for DocBook:
+
+  YOCTO_HOME_URL : "http://www.yoctoproject.org"
+  YOCTO_DOCS_URL : "&YOCTO_HOME_URL;/docs"
+
+Note directive
+==============
+
+Sphinx has a builtin 'note' directive that produces clean Note section
+in the output file. There are various types of directives such as
+"attention", "caution", "danger", "error", "hint", "important", "tip",
+"warning", "admonition" that are supported, and additional directive
+can be added as Sphinx extension if needed.
+
+Figures
+=======
+
+The Yocto Project documentation has many figures/images. Sphinx has a
+'figure' directive which is straight forward to use. To include a
+figure in the body of the documentation:
+
+  .. image:: figures/YP-flow-diagram.png
+
+Links and References
+====================
+
+The following types of links can be used: links to other locations in
+the same document, to locations in other documents and to external
+websites.
+
+More information can be found here:
+https://sublime-and-sphinx-guide.readthedocs.io/en/latest/references.html.
+
+References
+==========
+
+The following extension is enabed by default:
+sphinx.ext.autosectionlabel
+(https://www.sphinx-doc.org/en/master/usage/extensions/autosectionlabel.html).
+
+This extension allows you to refer sections by their titles. Note that
+autosectionlabel_prefix_document is enabled by default, so that we can
+insert references from any document.
+
+For example, to insert an HTML link to a section from
+documentaion/manual/intro.rst, use:
+
+  Please check this :ref:`manual/intro:Cross-References to Locations in the Same Document`
+
+Alternatively a custom text can be used instead of using the section
+text:
+
+  Please check this :ref:`section <manual/intro:Cross-References to Locations in the Same Document>`
+
+TIP: The following command can be used to dump all the references that
+     are defined in the project documentation:
+
+       python -msphinx.ext.intersphinx <path to build folder>/html/objects.inv
+
+This dump contains all links and for each link it shows the default
+"Link Text" that Sphinx would use. If the default link text is not
+appropriate, a custom link text can be used in the ':ref:' directive.
+
+Extlinks
 ========
-Contains various templates, fonts, and some old PNG files.
 
-tools
-=====
-Contains a tool to convert the DocBook files to PDF format.  This folder also
-contains the mega-manual.sed file, which is used by Makefile to process
-cross-references from within the manual that normally go to an external
-manual.
+The sphinx.ext.extlinks extension is enabled by default
+(https://sublime-and-sphinx-guide.readthedocs.io/en/latest/references.html#use-the-external-links-extension),
+and it is configured with:
+
+  'yocto_home': ('https://yoctoproject.org%s', None),
+  'yocto_wiki': ('https://wiki.yoctoproject.org%s', None),
+  'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
+  'yocto_lists': ('https://lists.yoctoproject.org%s', None),
+  'yocto_bugs': ('https://bugzilla.yoctoproject.org%s', None),
+  'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
+  'yocto_docs': ('https://docs.yoctoproject.org%s', None),
+  'yocto_git': ('https://git.yoctoproject.org%s', None),
+  'oe_home': ('https://www.openembedded.org%s', None),
+  'oe_lists': ('https://lists.openembedded.org%s', None),
+
+It creates convenient shortcuts which can be used throughout the
+documentation rst files, as:
+
+  Please check this :yocto_wiki:`wiki page </Weekly_Status>`
+
+Intersphinx links
+=================
+
+The sphinx.ext.intersphinx extension is enabled by default
+(https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html),
+so that we can cross reference content from other Sphinx based
+documentation projects, such as the BitBake manual.
+
+References to the bitbake manual can be done like this:
+
+  See the ":ref:`-D <bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax>`" option
+or
+  :term:`bitbake:BB_NUMBER_PARSE_THREADS`
-- 
2.28.0

