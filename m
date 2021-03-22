Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.711.1616433454385367826
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Mar 2021 10:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from localhost (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6DD251C0002;
	Mon, 22 Mar 2021 17:17:32 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] documentation/README minor improvements
Date: Mon, 22 Mar 2021 18:17:25 +0100
Message-Id: <20210322171725.78677-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Minor style and spelling fixes
- Add some extra details; add missing external link macros
  and explain where they are defined
- Correct where documentation can be found on the
  Yocto Project website: the "Documentation" tab
  has been replaced by "Docs" (and its later
  shown as uppercase ("DOCS") by the current CSS, but this
  may change one day.

These updates are not critical anyway, as this file is not part
of the project documentation. It's the documentation of the
documentation!

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/README | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/documentation/README b/documentation/README
index be03bb119..0fa644c30 100644
--- a/documentation/README
+++ b/documentation/README
@@ -47,7 +47,7 @@ Folders exist for individual manuals as follows:
 Each folder is self-contained regarding content and figures.
 
 If you want to find HTML versions of the Yocto Project manuals on the web,
-go to https://www.yoctoproject.org and click on the "Documentation" tab.  From
+go to https://www.yoctoproject.org and click on the "Docs" tab.  From
 there you have access to archived documentation from previous releases, current
 documentation for the latest release, and "Docs in Progress" for the release
 currently being developed.
@@ -91,13 +91,13 @@ Yocto Project documentation website
 A new website has been created to host the Yocto Project
 documentation, it can be found at: https://docs.yoctoproject.org/.
 
-The entire Yocto Project documentation, as well as the BitBake manual
+The entire Yocto Project documentation, as well as the BitBake manual,
 is published on this website, including all previously released
 versions. A version switcher was added, as a drop-down menu on the top
 of the page to switch back and forth between the various versions of
 the current active Yocto Project releases.
 
-Transition pages have been added (as rst file) to show links to old
+Transition pages have been added (as rst files) to show links to old
 versions of the Yocto Project documentation with links to each manual
 generated with DocBook.
 
@@ -109,7 +109,7 @@ obvious reasons, we will only support building the Yocto Project
 documentation with Python3.
 
 Sphinx might be available in your Linux distro packages repositories,
-however it is not recommend using distro packages, as they might be
+however it is not recommend to use distro packages, as they might be
 old versions, especially if you are using an LTS version of your
 distro. The recommended method to install Sphinx and all required
 dependencies is to use the Python Package Index (pip).
@@ -185,7 +185,7 @@ Sphinx has a glossary directive. From
 https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#glossary:
 
     This directive must contain a reST definition list with terms and
-    definitions. The definitions will then be referencable with the
+    definitions. It's then possible to refer to each definition through the
     [https://www.sphinx-doc.org/en/master/usage/restructuredtext/roles.html#role-term
     'term' role].
 
@@ -206,7 +206,7 @@ however there are important shortcomings. For example they cannot be
 used/nested inside code-block sections.
 
 A Sphinx extension was implemented to support variable substitutions
-to mimic the DocBook based documentation behavior. Variabes
+to mimic the DocBook based documentation behavior. Variable
 substitutions are done while reading/parsing the .rst files. The
 pattern for variables substitutions is the same as with DocBook,
 e.g. `&VAR;`.
@@ -237,14 +237,14 @@ Note directive
 Sphinx has a builtin 'note' directive that produces clean Note section
 in the output file. There are various types of directives such as
 "attention", "caution", "danger", "error", "hint", "important", "tip",
-"warning", "admonition" that are supported, and additional directive
+"warning", "admonition" that are supported, and additional directives
 can be added as Sphinx extension if needed.
 
 Figures
 =======
 
 The Yocto Project documentation has many figures/images. Sphinx has a
-'figure' directive which is straight forward to use. To include a
+'figure' directive which is straightforward to use. To include a
 figure in the body of the documentation:
 
   .. image:: figures/YP-flow-diagram.png
@@ -262,7 +262,7 @@ https://sublime-and-sphinx-guide.readthedocs.io/en/latest/references.html.
 References
 ==========
 
-The following extension is enabed by default:
+The following extension is enabled by default:
 sphinx.ext.autosectionlabel
 (https://www.sphinx-doc.org/en/master/usage/extensions/autosectionlabel.html).
 
@@ -271,7 +271,7 @@ autosectionlabel_prefix_document is enabled by default, so that we can
 insert references from any document.
 
 For example, to insert an HTML link to a section from
-documentaion/manual/intro.rst, use:
+documentation/manual/intro.rst, use:
 
   Please check this :ref:`manual/intro:Cross-References to Locations in the Same Document`
 
@@ -294,7 +294,8 @@ Extlinks
 
 The sphinx.ext.extlinks extension is enabled by default
 (https://sublime-and-sphinx-guide.readthedocs.io/en/latest/references.html#use-the-external-links-extension),
-and it is configured with:
+and it is configured with the 'extlinks' definitions in
+the 'documentation/conf.py' file:
 
   'yocto_home': ('https://yoctoproject.org%s', None),
   'yocto_wiki': ('https://wiki.yoctoproject.org%s', None),
@@ -306,6 +307,10 @@ and it is configured with:
   'yocto_git': ('https://git.yoctoproject.org%s', None),
   'oe_home': ('https://www.openembedded.org%s', None),
   'oe_lists': ('https://lists.openembedded.org%s', None),
+  'oe_git': ('https://git.openembedded.org%s', None),
+  'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
+  'oe_layerindex': ('https://layers.openembedded.org%s', None),
+  'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),
 
 It creates convenient shortcuts which can be used throughout the
 documentation rst files, as:
-- 
2.25.1

