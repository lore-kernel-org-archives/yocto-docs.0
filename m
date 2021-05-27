Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.953.1622140892105917468
 for <docs@lists.yoctoproject.org>;
 Thu, 27 May 2021 11:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.200, mailfrom: foss@0leil.net)
Received: from fiqs.lan (84-115-233-129.cable.dynamic.surfer.at [84.115.233.129])
	(Authenticated sender: foss@0leil.net)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPA id 58F512000C;
	Thu, 27 May 2021 18:41:28 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH] docs: replace ``FOO`` by :term:`FOO` where possible
Date: Thu, 27 May 2021 20:41:17 +0200
Message-Id: <20210527184117.80067-1-foss@0leil.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If a variable has a glossary entry and some rST files write about those
variables, it's better to point to the glossary entry instead of just
highlighting it by surrounding it with two tick quotes.

This was automated by the following python script:
"""
import re
from pathlib import Path

with open('objects.inv.txt', 'r') as f:
    objects = f.readlines()

with open('bitbake-objects.inv.txt', 'r') as f:
    objects = objects + f.readlines()

re_term = re.compile(r'variables.html#term-([A-Z_0-9]*)')
terms = []

for obj in objects:
    match = re_term.search(obj)
    if match and match.group(1):
        terms.append(match.group(1))

for rst in Path('.').rglob('*.rst'):
    with open(rst, 'r') as f:
        content = "".joing(f.readlines())
    for term in terms:
        content = re.sub(r'``({})``(?!.*\s*[~-]+)'.format(term), r':term:`\1`', content)

    with open(rst, 'w') as f:
        f.write(content)
"""

Signed-off-by: Quentin Schulz <foss@0leil.net>
---

note that section titles sometimes have ``FOO``, they have been
ignored on purpose (mix of colors in the section title and
underlined/not underlined) but it's absolutely possible to do it (though
:ref: will need to be updated to reflect that change).

build tested only (no errors, no warnings)

 documentation/brief-yoctoprojectqs/index.rst  |    2 +-
 documentation/bsp-guide/bsp.rst               |   16 +-
 documentation/dev-manual/common-tasks.rst     |  386 +++---
 documentation/kernel-dev/advanced.rst         |   56 +-
 documentation/kernel-dev/common.rst           |   52 +-
 documentation/kernel-dev/faq.rst              |    2 +-
 documentation/kernel-dev/maint-appx.rst       |    2 +-
 documentation/overview-manual/concepts.rst    |   72 +-
 documentation/ref-manual/classes.rst          |   74 +-
 documentation/ref-manual/faq.rst              |   16 +-
 documentation/ref-manual/features.rst         |   22 +-
 documentation/ref-manual/migration-1.3.rst    |    4 +-
 documentation/ref-manual/migration-1.4.rst    |   14 +-
 documentation/ref-manual/migration-1.5.rst    |   22 +-
 documentation/ref-manual/migration-1.6.rst    |   12 +-
 documentation/ref-manual/migration-1.7.rst    |    4 +-
 documentation/ref-manual/migration-1.8.rst    |    4 +-
 documentation/ref-manual/migration-2.0.rst    |    4 +-
 documentation/ref-manual/migration-2.1.rst    |    8 +-
 documentation/ref-manual/migration-2.2.rst    |    6 +-
 documentation/ref-manual/migration-2.3.rst    |   20 +-
 documentation/ref-manual/migration-2.4.rst    |    4 +-
 documentation/ref-manual/migration-2.5.rst    |    2 +-
 documentation/ref-manual/migration-2.6.rst    |   22 +-
 documentation/ref-manual/migration-2.7.rst    |    2 +-
 documentation/ref-manual/migration-3.1.rst    |    2 +-
 documentation/ref-manual/migration-3.2.rst    |    6 +-
 documentation/ref-manual/qa-checks.rst        |   26 +-
 documentation/ref-manual/structure.rst        |   16 +-
 documentation/ref-manual/tasks.rst            |   12 +-
 documentation/ref-manual/terms.rst            |    6 +-
 documentation/ref-manual/variables.rst        | 1184 ++++++++---------
 .../appendix-customizing-standard.rst         |    4 +-
 .../sdk-manual/appendix-customizing.rst       |   24 +-
 documentation/sdk-manual/extensible.rst       |   50 +-
 documentation/sdk-manual/working-projects.rst |   12 +-
 .../toaster-manual/setup-and-use.rst          |    2 +-
 .../transitioning-to-a-custom-environment.rst |    2 +-
 38 files changed, 1087 insertions(+), 1087 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 7ae4526c4..b92b0d33d 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -332,7 +332,7 @@ Follow these steps to add a hardware layer:
 #. **Change the Configuration to Build for a Specific Machine:** The
    :term:`MACHINE` variable in the
    ``local.conf`` file specifies the machine for the build. For this
-   example, set the ``MACHINE`` variable to ``cyclone5``. These
+   example, set the :term:`MACHINE` variable to ``cyclone5``. These
    configurations are used:
    https://github.com/kraj/meta-altera/blob/master/conf/machine/cyclone5.conf.
 
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index b46773ded..5c43f53d0 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -95,11 +95,11 @@ layer and from it build an image. Here is an example::
 
 .. note::
 
-   Ordering and :term:`BBFILE_PRIORITY` for the layers listed in ``BBLAYERS``
+   Ordering and :term:`BBFILE_PRIORITY` for the layers listed in :term:`BBLAYERS`
    matter. For example, if multiple layers define a machine configuration, the
    OpenEmbedded build system uses the last layer searched given similar layer
    priorities. The build system works from the top-down through the layers
-   listed in ``BBLAYERS``.
+   listed in :term:`BBLAYERS`.
 
 Some BSPs require or depend on additional layers beyond the BSP's root
 layer in order to be functional. In this case, you need to specify these
@@ -685,7 +685,7 @@ statements as follows::
 
 .. note::
 
-   When the preferred provider is assumed by default, the ``PREFERRED_PROVIDER``
+   When the preferred provider is assumed by default, the :term:`PREFERRED_PROVIDER`
    statement does not appear in the ``"bsp_root_name".conf`` file.
 
 You would use the ``linux-yocto_4.4.bbappend`` file to append specific
@@ -1121,15 +1121,15 @@ list describes them in order of preference:
    how to use these variables.
 
    If you build as you normally would, without specifying any recipes in
-   the ``LICENSE_FLAGS_WHITELIST``, the build stops and provides you
+   the :term:`LICENSE_FLAGS_WHITELIST`, the build stops and provides you
    with the list of recipes that you have tried to include in the image
-   that need entries in the ``LICENSE_FLAGS_WHITELIST``. Once you enter
+   that need entries in the :term:`LICENSE_FLAGS_WHITELIST`. Once you enter
    the appropriate license flags into the whitelist, restart the build
    to continue where it left off. During the build, the prompt will not
    appear again since you have satisfied the requirement.
 
    Once the appropriate license flags are on the white list in the
-   ``LICENSE_FLAGS_WHITELIST`` variable, you can build the encumbered
+   :term:`LICENSE_FLAGS_WHITELIST` variable, you can build the encumbered
    image with no change at all to the normal build process.
 
 #. *Get a Pre-Built Version of the BSP:* You can get this type of BSP by
@@ -1142,7 +1142,7 @@ list describes them in order of preference:
    click-through license agreements presented by the website. If you
    want to build the image yourself using the recipes contained within
    the BSP tarball, you will still need to create an appropriate
-   ``LICENSE_FLAGS_WHITELIST`` to match the encumbered recipes in the
+   :term:`LICENSE_FLAGS_WHITELIST` to match the encumbered recipes in the
    BSP.
 
 .. note::
@@ -1405,7 +1405,7 @@ Project Reference Manual.
 
    The BeagleBone development board requires an SPL to boot and that SPL
    file type must be MLO. Consequently, the machine configuration needs
-   to define ``SPL_BINARY`` as ``MLO``.
+   to define :term:`SPL_BINARY` as ``MLO``.
 
    .. note::
 
diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 130734173..762636a17 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -94,10 +94,10 @@ Follow these general steps to create your layer without using tools:
 
    -  :term:`BBPATH`: Adds the layer's
       root directory to BitBake's search path. Through the use of the
-      ``BBPATH`` variable, BitBake locates class files (``.bbclass``),
+      :term:`BBPATH` variable, BitBake locates class files (``.bbclass``),
       configuration files, and files that are included with ``include``
       and ``require`` statements. For these cases, BitBake uses the
-      first file that matches the name found in ``BBPATH``. This is
+      first file that matches the name found in :term:`BBPATH`. This is
       similar to the way the ``PATH`` variable is used for binaries. It
       is recommended, therefore, that you use unique class and
       configuration filenames in your custom layer.
@@ -205,7 +205,7 @@ following list:
       ``foo``.
 
       To make sure your changes apply only when building machine "one",
-      use a machine override with the ``DEPENDS`` statement::
+      use a machine override with the :term:`DEPENDS` statement::
 
          DEPENDS_one = "foo"
 
@@ -255,7 +255,7 @@ following list:
       are building for a different machine and the ``bblayers.conf``
       file includes the ``meta-one`` layer and the location of your
       machine-specific file is the first location where that file is
-      found according to ``FILESPATH``, builds for all machines will
+      found according to :term:`FILESPATH`, builds for all machines will
       also use that machine-specific file.
 
       You can make sure that a machine-specific file is used for a
@@ -420,7 +420,7 @@ Enabling Your Layer
 
 Before the OpenEmbedded build system can use your new layer, you need to
 enable it. To enable your layer, simply add your layer's path to the
-``BBLAYERS`` variable in your ``conf/bblayers.conf`` file, which is
+:term:`BBLAYERS` variable in your ``conf/bblayers.conf`` file, which is
 found in the :term:`Build Directory`.
 The following example shows how to enable a layer named
 ``meta-mylayer``::
@@ -438,7 +438,7 @@ The following example shows how to enable a layer named
        "
 
 BitBake parses each ``conf/layer.conf`` file from the top down as
-specified in the ``BBLAYERS`` variable within the ``conf/bblayers.conf``
+specified in the :term:`BBLAYERS` variable within the ``conf/bblayers.conf``
 file. During the processing of each ``conf/layer.conf`` file, BitBake
 adds the recipes, classes and configurations contained within the
 particular layer to the source directory.
@@ -531,19 +531,19 @@ have the supporting directory structure set up that will contain any
 files or patches you will be including from the layer.
 
 Using the immediate expansion assignment operator ``:=`` is important
-because of the reference to ``THISDIR``. The trailing colon character is
+because of the reference to :term:`THISDIR`. The trailing colon character is
 important as it ensures that items in the list remain colon-separated.
 
 .. note::
 
-   BitBake automatically defines the ``THISDIR`` variable. You should
+   BitBake automatically defines the :term:`THISDIR` variable. You should
    never set this variable yourself. Using "_prepend" as part of the
-   ``FILESEXTRAPATHS`` ensures your path will be searched prior to other
+   :term:`FILESEXTRAPATHS` ensures your path will be searched prior to other
    paths in the final list.
 
    Also, not all append files add extra files. Many append files simply
    allow to add build options (e.g. ``systemd``). For these cases, your
-   append file would not even use the ``FILESEXTRAPATHS`` statement.
+   append file would not even use the :term:`FILESEXTRAPATHS` statement.
 
 Prioritizing Your Layer
 -----------------------
@@ -830,7 +830,7 @@ variable changes are in effect for every build and consequently affect
 all images, which might not be what you require.
 
 To add a package to your image using the local configuration file, use
-the ``IMAGE_INSTALL`` variable with the ``_append`` operator::
+the :term:`IMAGE_INSTALL` variable with the ``_append`` operator::
 
    IMAGE_INSTALL_append = " strace"
 
@@ -855,7 +855,7 @@ to a specific image only. Here is an example::
 This example adds ``strace`` to the ``core-image-minimal`` image only.
 
 You can add packages using a similar approach through the
-``CORE_IMAGE_EXTRA_INSTALL`` variable. If you use this variable, only
+:term:`CORE_IMAGE_EXTRA_INSTALL` variable. If you use this variable, only
 ``core-image-*`` images are affected.
 
 Customizing Images Using Custom ``IMAGE_FEATURES`` and ``EXTRA_IMAGE_FEATURES``
@@ -866,18 +866,18 @@ high-level image features by using the
 :term:`IMAGE_FEATURES` and
 :term:`EXTRA_IMAGE_FEATURES`
 variables. Although the functions for both variables are nearly
-equivalent, best practices dictate using ``IMAGE_FEATURES`` from within
-a recipe and using ``EXTRA_IMAGE_FEATURES`` from within your
+equivalent, best practices dictate using :term:`IMAGE_FEATURES` from within
+a recipe and using :term:`EXTRA_IMAGE_FEATURES` from within your
 ``local.conf`` file, which is found in the
 :term:`Build Directory`.
 
 To understand how these features work, the best reference is
 ``meta/classes/core-image.bbclass``. This class lists out the available
-``IMAGE_FEATURES`` of which most map to package groups while some, such
+:term:`IMAGE_FEATURES` of which most map to package groups while some, such
 as ``debug-tweaks`` and ``read-only-rootfs``, resolve as general
 configuration settings.
 
-In summary, the file looks at the contents of the ``IMAGE_FEATURES``
+In summary, the file looks at the contents of the :term:`IMAGE_FEATURES`
 variable and then maps or configures the feature accordingly. Based on
 this information, the build system automatically adds the appropriate
 packages or configurations to the
@@ -885,11 +885,11 @@ packages or configurations to the
 Effectively, you are enabling extra features by extending the class or
 creating a custom class for use with specialized image ``.bb`` files.
 
-Use the ``EXTRA_IMAGE_FEATURES`` variable from within your local
+Use the :term:`EXTRA_IMAGE_FEATURES` variable from within your local
 configuration file. Using a separate area from which to enable features
 with this variable helps you avoid overwriting the features in the image
-recipe that are enabled with ``IMAGE_FEATURES``. The value of
-``EXTRA_IMAGE_FEATURES`` is added to ``IMAGE_FEATURES`` within
+recipe that are enabled with :term:`IMAGE_FEATURES`. The value of
+:term:`EXTRA_IMAGE_FEATURES` is added to :term:`IMAGE_FEATURES` within
 ``meta/conf/bitbake.conf``.
 
 To illustrate how you can use these variables to modify your image,
@@ -903,8 +903,8 @@ images both include OpenSSH. The ``core-image-minimal`` image does not
 contain an SSH server.
 
 You can customize your image and change these defaults. Edit the
-``IMAGE_FEATURES`` variable in your recipe or use the
-``EXTRA_IMAGE_FEATURES`` in your ``local.conf`` file so that it
+:term:`IMAGE_FEATURES` variable in your recipe or use the
+:term:`EXTRA_IMAGE_FEATURES` in your ``local.conf`` file so that it
 configures the image you are working with to include
 ``ssh-server-dropbear`` or ``ssh-server-openssh``.
 
@@ -926,7 +926,7 @@ the form for the two lines you need::
 
 Defining the software using a custom recipe gives you total control over
 the contents of the image. It is important to use the correct names of
-packages in the ``IMAGE_INSTALL`` variable. You must use the
+packages in the :term:`IMAGE_INSTALL` variable. You must use the
 OpenEmbedded notation and not the Debian notation for the names (e.g.
 ``glibc-dev`` instead of ``libc6-dev``).
 
@@ -946,25 +946,25 @@ to create a custom package group recipe that is used to build the image
 or images. A good example of a package group recipe is
 ``meta/recipes-core/packagegroups/packagegroup-base.bb``.
 
-If you examine that recipe, you see that the ``PACKAGES`` variable lists
+If you examine that recipe, you see that the :term:`PACKAGES` variable lists
 the package group packages to produce. The ``inherit packagegroup``
 statement sets appropriate default values and automatically adds
 ``-dev``, ``-dbg``, and ``-ptest`` complementary packages for each
-package specified in the ``PACKAGES`` statement.
+package specified in the :term:`PACKAGES` statement.
 
 .. note::
 
    The ``inherit packagegroup`` line should be located near the top of the
-   recipe, certainly before the ``PACKAGES`` statement.
+   recipe, certainly before the :term:`PACKAGES` statement.
 
-For each package you specify in ``PACKAGES``, you can use ``RDEPENDS``
-and ``RRECOMMENDS`` entries to provide a list of packages the parent
+For each package you specify in :term:`PACKAGES`, you can use :term:`RDEPENDS`
+and :term:`RRECOMMENDS` entries to provide a list of packages the parent
 task package should contain. You can see examples of these further down
 in the ``packagegroup-base.bb`` recipe.
 
 Here is a short, fabricated example showing the same basic pieces for a
 hypothetical packagegroup defined in ``packagegroup-custom.bb``, where
-the variable ``PN`` is the standard way to abbreviate the reference to
+the variable :term:`PN` is the standard way to abbreviate the reference to
 the full packagegroup name ``packagegroup-custom``::
 
    DESCRIPTION = "My Custom Package Groups"
@@ -994,7 +994,7 @@ their dependencies and their recommended package dependencies listed:
 ``packagegroup-custom-apps``, and ``packagegroup-custom-tools``. To
 build an image using these package group packages, you need to add
 ``packagegroup-custom-apps`` and/or ``packagegroup-custom-tools`` to
-``IMAGE_INSTALL``. For other forms of image dependencies see the other
+:term:`IMAGE_INSTALL`. For other forms of image dependencies see the other
 areas of this section.
 
 Customizing an Image Hostname
@@ -1142,7 +1142,7 @@ Following are some syntax examples:
 
  - Use this syntax to generate a recipe using code that
    you extract from source. The extracted code is placed in its own layer
-   defined by ``EXTERNALSRC``.
+   defined by :term:`EXTERNALSRC`.
    ::
 
       recipetool create -o OUTFILE -x EXTERNALSRC source
@@ -1288,22 +1288,22 @@ Fetching Code
 The first thing your recipe must do is specify how to fetch the source
 files. Fetching is controlled mainly through the
 :term:`SRC_URI` variable. Your recipe
-must have a ``SRC_URI`` variable that points to where the source is
+must have a :term:`SRC_URI` variable that points to where the source is
 located. For a graphical representation of source locations, see the
 ":ref:`overview-manual/concepts:sources`" section in
 the Yocto Project Overview and Concepts Manual.
 
 The :ref:`ref-tasks-fetch` task uses
-the prefix of each entry in the ``SRC_URI`` variable value to determine
+the prefix of each entry in the :term:`SRC_URI` variable value to determine
 which :ref:`fetcher <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>` to use to get your
-source files. It is the ``SRC_URI`` variable that triggers the fetcher.
+source files. It is the :term:`SRC_URI` variable that triggers the fetcher.
 The :ref:`ref-tasks-patch` task uses
 the variable after source is fetched to apply patches. The OpenEmbedded
 build system uses
 :term:`FILESOVERRIDES` for
-scanning directory locations for local files in ``SRC_URI``.
+scanning directory locations for local files in :term:`SRC_URI`.
 
-The ``SRC_URI`` variable in your recipe must define each unique location
+The :term:`SRC_URI` variable in your recipe must define each unique location
 for your source files. It is good practice to not hard-code version
 numbers in a URL used in ``SRC_URI``. Rather than hard-code these
 values, use ``${``\ :term:`PV`\ ``}``,
@@ -1319,7 +1319,7 @@ comes from a single tarball. Notice the use of the
 
    SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
 
-Files mentioned in ``SRC_URI`` whose names end in a typical archive
+Files mentioned in :term:`SRC_URI` whose names end in a typical archive
 extension (e.g. ``.tar``, ``.tar.gz``, ``.tar.bz2``, ``.zip``, and so
 forth), are automatically extracted during the
 :ref:`ref-tasks-unpack` task. For
@@ -1341,17 +1341,17 @@ is an example from the recipe
    SRC_URI = "git://git.kernel.dk/blktrace.git \
               file://ldflags.patch"
 
-If your ``SRC_URI`` statement includes URLs pointing to individual files
+If your :term:`SRC_URI` statement includes URLs pointing to individual files
 fetched from a remote server other than a version control system,
 BitBake attempts to verify the files against checksums defined in your
 recipe to ensure they have not been tampered with or otherwise modified
 since the recipe was written. Two checksums are used:
 ``SRC_URI[md5sum]`` and ``SRC_URI[sha256sum]``.
 
-If your ``SRC_URI`` variable points to more than a single URL (excluding
+If your :term:`SRC_URI` variable points to more than a single URL (excluding
 SCM URLs), you need to provide the ``md5`` and ``sha256`` checksums for
 each URL. For these cases, you provide a name for each URL as part of
-the ``SRC_URI`` and then reference that name in the subsequent checksum
+the :term:`SRC_URI` and then reference that name in the subsequent checksum
 statements. Here is an example combining lines from the files
 ``git.inc`` and ``git_2.24.1.bb``::
 
@@ -1369,7 +1369,7 @@ with other signatures on the download page for the upstream source (e.g.
 OpenEmbedded build system only deals with ``sha256sum`` and ``md5sum``,
 you should verify all the signatures you find by hand.
 
-If no ``SRC_URI`` checksums are specified when you attempt to build the
+If no :term:`SRC_URI` checksums are specified when you attempt to build the
 recipe, or you provide an incorrect checksum, the build will produce an
 error for each missing or incorrect checksum. As part of the error
 message, the build system provides the checksum string corresponding to
@@ -1385,7 +1385,7 @@ paste them into your recipe and then run the build again to continue.
 
 This final example is a bit more complicated and is from the
 ``meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.20.bb`` recipe. The
-example's ``SRC_URI`` statement identifies multiple files as the source
+example's :term:`SRC_URI` statement identifies multiple files as the source
 files for the recipe: a tarball, a patch file, a desktop file, and an
 icon.
 ::
@@ -1424,9 +1424,9 @@ If you are fetching your source files from an upstream source archived
 tarball and the tarball's internal structure matches the common
 convention of a top-level subdirectory named
 ``${``\ :term:`BPN`\ ``}-${``\ :term:`PV`\ ``}``,
-then you do not need to set ``S``. However, if ``SRC_URI`` specifies to
+then you do not need to set :term:`S`. However, if :term:`SRC_URI` specifies to
 fetch source from an archive that does not use this convention, or from
-an SCM like Git or Subversion, your recipe needs to define ``S``.
+an SCM like Git or Subversion, your recipe needs to define :term:`S`.
 
 If processing your recipe using BitBake successfully unpacks the source
 files, you need to be sure that the directory pointed to by ``${S}``
@@ -1436,7 +1436,7 @@ Patching Code
 -------------
 
 Sometimes it is necessary to patch code after it has been fetched. Any
-files mentioned in ``SRC_URI`` whose names end in ``.patch`` or
+files mentioned in :term:`SRC_URI` whose names end in ``.patch`` or
 ``.diff`` or compressed versions of these suffixes (e.g. ``diff.gz`` are
 treated as patches. The
 :ref:`ref-tasks-patch` task
@@ -1445,7 +1445,7 @@ automatically applies these patches.
 The build system should be able to apply patches with the "-p1" option
 (i.e. one directory level in the path will be stripped off). If your
 patch needs to have more directory levels stripped off, specify the
-number of levels using the "striplevel" option in the ``SRC_URI`` entry
+number of levels using the "striplevel" option in the :term:`SRC_URI` entry
 for the patch. Alternatively, if your patch needs to be applied in a
 specific subdirectory that is not specified in the patch file, use the
 "patchdir" option in the entry.
@@ -1465,24 +1465,24 @@ Your recipe needs to have both the
 :term:`LIC_FILES_CHKSUM`
 variables:
 
--  ``LICENSE``: This variable specifies the license for the software.
+-  :term:`LICENSE`: This variable specifies the license for the software.
    If you do not know the license under which the software you are
    building is distributed, you should go to the source code and look
    for that information. Typical files containing this information
-   include ``COPYING``, ``LICENSE``, and ``README`` files. You could
+   include ``COPYING``, :term:`LICENSE`, and ``README`` files. You could
    also find the information near the top of a source file. For example,
    given a piece of software licensed under the GNU General Public
-   License version 2, you would set ``LICENSE`` as follows::
+   License version 2, you would set :term:`LICENSE` as follows::
 
       LICENSE = "GPLv2"
 
-   The licenses you specify within ``LICENSE`` can have any name as long
+   The licenses you specify within :term:`LICENSE` can have any name as long
    as you do not use spaces, since spaces are used as separators between
    license names. For standard licenses, use the names of the files in
-   ``meta/files/common-licenses/`` or the ``SPDXLICENSEMAP`` flag names
+   ``meta/files/common-licenses/`` or the :term:`SPDXLICENSEMAP` flag names
    defined in ``meta/conf/licenses.conf``.
 
--  ``LIC_FILES_CHKSUM``: The OpenEmbedded build system uses this
+-  :term:`LIC_FILES_CHKSUM`: The OpenEmbedded build system uses this
    variable to make sure the license text has not changed. If it has,
    the build produces an error and it affords you the chance to figure
    it out and correct the problem.
@@ -1492,11 +1492,11 @@ variables:
    the checksums of the files to be sure the text has not changed. Any
    differences result in an error with the message containing the
    current checksum. For more explanation and examples of how to set the
-   ``LIC_FILES_CHKSUM`` variable, see the
+   :term:`LIC_FILES_CHKSUM` variable, see the
    ":ref:`dev-manual/common-tasks:tracking license changes`" section.
 
    To determine the correct checksum string, you can list the
-   appropriate files in the ``LIC_FILES_CHKSUM`` variable with incorrect
+   appropriate files in the :term:`LIC_FILES_CHKSUM` variable with incorrect
    md5 strings, attempt to build the software, and then note the
    resulting error messages that will report the correct md5 strings.
    See the ":ref:`dev-manual/common-tasks:fetching code`" section for
@@ -1522,7 +1522,7 @@ installed on the target in order for the software to run.
 
 Within a recipe, you specify build-time dependencies using the
 :term:`DEPENDS` variable. Although there are nuances,
-items specified in ``DEPENDS`` should be names of other
+items specified in :term:`DEPENDS` should be names of other
 recipes. It is important that you specify all build-time dependencies
 explicitly.
 
@@ -1639,12 +1639,12 @@ your software is built:
 Once configuration succeeds, it is always good practice to look at the
 ``log.do_configure`` file to ensure that the appropriate options have
 been enabled and no additional build-time dependencies need to be added
-to ``DEPENDS``. For example, if the configure script reports that it
-found something not mentioned in ``DEPENDS``, or that it did not find
+to :term:`DEPENDS`. For example, if the configure script reports that it
+found something not mentioned in :term:`DEPENDS`, or that it did not find
 something that it needed for some desired optional functionality, then
-you would need to add those to ``DEPENDS``. Looking at the log might
+you would need to add those to :term:`DEPENDS`. Looking at the log might
 also reveal items being checked for, enabled, or both that you do not
-want, or items not being found that are in ``DEPENDS``, in which case
+want, or items not being found that are in :term:`DEPENDS`, in which case
 you would need to look at passing extra options to the configure script
 as needed. For reference information on configure options specific to
 the software you are building, you can consult the output of the
@@ -1762,13 +1762,13 @@ Here are some common issues that cause failures.
    compilation process notes that files could not be found. In these
    cases, you need to go back and add additional options to the
    configure script as well as possibly add additional build-time
-   dependencies to ``DEPENDS``.
+   dependencies to :term:`DEPENDS`.
 
    Occasionally, it is necessary to apply a patch to the source to
    ensure the correct paths are used. If you need to specify paths to
    find files staged into the sysroot from other recipes, use the
    variables that the OpenEmbedded build system provides (e.g.
-   ``STAGING_BINDIR``, ``STAGING_INCDIR``, ``STAGING_DATADIR``, and so
+   :term:`STAGING_BINDIR`, :term:`STAGING_INCDIR`, :term:`STAGING_DATADIR`, and so
    forth).
 
 Installing
@@ -2022,7 +2022,7 @@ the list of directories within a recipe::
 
    The `/sysroot-only` is to be used by recipes that generate artifacts
    that are not included in the target filesystem, allowing them to share
-   these artifacts without needing to use the ``DEPLOY_DIR``.
+   these artifacts without needing to use the :term:`DEPLOY_DIR`.
 
 For a more complete description of the :ref:`ref-tasks-populate_sysroot`
 task and its associated functions, see the
@@ -2048,7 +2048,7 @@ statement that essentially identifies itself as being able to provide
    PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
 
 Any recipe that inherits the ``kernel`` class is
-going to utilize a ``PROVIDES`` statement that identifies that recipe as
+going to utilize a :term:`PROVIDES` statement that identifies that recipe as
 being able to provide the ``virtual/kernel`` item.
 
 Now comes the time to actually build an image and you need a kernel
@@ -2072,7 +2072,7 @@ build is dependent on ``virtual/kernel`` for example::
 
 During the build, the OpenEmbedded build system picks
 the correct recipe needed for the ``virtual/kernel`` dependency based on
-the ``PREFERRED_PROVIDER`` variable. If you want to use the small kernel
+the :term:`PREFERRED_PROVIDER` variable. If you want to use the small kernel
 mentioned at the beginning of this section, configure your build as
 follows::
 
@@ -2080,8 +2080,8 @@ follows::
 
 .. note::
 
-   Any recipe that ``PROVIDES`` a ``virtual/*`` item that is ultimately not
-   selected through ``PREFERRED_PROVIDER`` does not get built. Preventing these
+   Any recipe that :term:`PROVIDES` a ``virtual/*`` item that is ultimately not
+   selected through :term:`PREFERRED_PROVIDER` does not get built. Preventing these
    recipes from building is usually the desired behavior since this mechanism's
    purpose is to select between mutually exclusive alternative providers.
 
@@ -2221,8 +2221,8 @@ Single .c File Package (Hello World!)
 
 Building an application from a single file that is stored locally (e.g.
 under ``files``) requires a recipe that has the file listed in the
-``SRC_URI`` variable. Additionally, you need to manually write the
-``do_compile`` and ``do_install`` tasks. The ``S`` variable defines the
+:term:`SRC_URI` variable. Additionally, you need to manually write the
+``do_compile`` and ``do_install`` tasks. The :term:`S` variable defines the
 directory containing the source code, which is set to
 :term:`WORKDIR` in this case - the
 directory BitBake uses for the build.
@@ -2256,7 +2256,7 @@ Autotooled Package
 ~~~~~~~~~~~~~~~~~~
 
 Applications that use Autotools such as ``autoconf`` and ``automake``
-require a recipe that has a source archive listed in ``SRC_URI`` and
+require a recipe that has a source archive listed in :term:`SRC_URI` and
 also inherit the
 :ref:`autotools <ref-classes-autotools>` class,
 which contains the definitions of all the steps needed to build an
@@ -2275,7 +2275,7 @@ Following is one example: (``hello_2.3.bb``)
 
    inherit autotools gettext
 
-The variable ``LIC_FILES_CHKSUM`` is used to track source license
+The variable :term:`LIC_FILES_CHKSUM` is used to track source license
 changes as described in the
 ":ref:`dev-manual/common-tasks:tracking license changes`" section in
 the Yocto Project Overview and Concepts Manual. You can quickly create
@@ -2285,7 +2285,7 @@ Makefile-Based Package
 ~~~~~~~~~~~~~~~~~~~~~~
 
 Applications that use GNU ``make`` also require a recipe that has the
-source archive listed in ``SRC_URI``. You do not need to add a
+source archive listed in :term:`SRC_URI`. You do not need to add a
 ``do_compile`` step since by default BitBake starts the ``make`` command
 to compile the application. If you need additional ``make`` options, you
 should store them in the
@@ -2297,7 +2297,7 @@ Otherwise, BitBake runs an empty ``do_install`` task by default.
 
 Some applications might require extra parameters to be passed to the
 compiler. For example, the application might need an additional header
-path. You can accomplish this by adding to the ``CFLAGS`` variable. The
+path. You can accomplish this by adding to the :term:`CFLAGS` variable. The
 following example shows this::
 
    CFLAGS_prepend = "-I ${S}/include "
@@ -2341,7 +2341,7 @@ In the following example, ``mtd-utils`` is a makefile-based package::
 Splitting an Application into Multiple Packages
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-You can use the variables ``PACKAGES`` and ``FILES`` to split an
+You can use the variables :term:`PACKAGES` and :term:`FILES` to split an
 application into multiple packages.
 
 Following is an example that uses the ``libxpm`` recipe. By default,
@@ -2365,12 +2365,12 @@ into separate packages::
 
 In the previous example, we want to ship the ``sxpm`` and ``cxpm``
 binaries in separate packages. Since ``bindir`` would be packaged into
-the main ``PN`` package by default, we prepend the ``PACKAGES`` variable
+the main :term:`PN` package by default, we prepend the :term:`PACKAGES` variable
 so additional package names are added to the start of list. This results
 in the extra ``FILES_*`` variables then containing information that
 define which files and directories go into which packages. Files
 included by earlier packages are skipped by latter packages. Thus, the
-main ``PN`` package does not include the above listed files.
+main :term:`PN` package does not include the above listed files.
 
 Packaging Externally Produced Binaries
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -2415,12 +2415,12 @@ Reference Manual's variable glossary.
    -  Using :term:`DEPENDS` is a good
       idea even for components distributed in binary form, and is often
       necessary for shared libraries. For a shared library, listing the
-      library dependencies in ``DEPENDS`` makes sure that the libraries
+      library dependencies in :term:`DEPENDS` makes sure that the libraries
       are available in the staging sysroot when other recipes link
       against the library, which might be necessary for successful
       linking.
 
-   -  Using ``DEPENDS`` also allows runtime dependencies between
+   -  Using :term:`DEPENDS` also allows runtime dependencies between
       packages to be added automatically. See the
       ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
       section in the Yocto Project Overview and Concepts Manual for more
@@ -2747,7 +2747,7 @@ file or include from a lower-level configuration file are as follows:
 
 -  ``PREFERRED_PROVIDER_virtual/kernel``
 
--  ``MACHINE_FEATURES`` (e.g. "apm screen wifi")
+-  :term:`MACHINE_FEATURES` (e.g. "apm screen wifi")
 
 You might also need these variables:
 
@@ -2755,7 +2755,7 @@ You might also need these variables:
 
 -  ``KERNEL_IMAGETYPE`` (e.g. "zImage")
 
--  ``IMAGE_FSTYPES`` (e.g. "tar.gz jffs2")
+-  :term:`IMAGE_FSTYPES` (e.g. "tar.gz jffs2")
 
 You can find full details on these variables in the reference section.
 You can leverage existing machine ``.conf`` files from
@@ -2771,8 +2771,8 @@ examples in the Source Directory at ``meta/recipes-kernel/linux`` that
 you can use as references.
 
 If you are creating a new kernel recipe, normal recipe-writing rules
-apply for setting up a ``SRC_URI``. Thus, you need to specify any
-necessary patches and set ``S`` to point at the source code. You need to
+apply for setting up a :term:`SRC_URI`. Thus, you need to specify any
+necessary patches and set :term:`S` to point at the source code. You need to
 create a ``do_configure`` task that configures the unpacked kernel with
 a ``defconfig`` file. You can do this by using a ``make defconfig``
 command or, more commonly, by copying in a suitable ``defconfig`` file
@@ -2785,8 +2785,8 @@ If you are extending an existing kernel recipe, it is usually a matter
 of adding a suitable ``defconfig`` file. The file needs to be added into
 a location similar to ``defconfig`` files used for other machines in a
 given kernel recipe. A possible way to do this is by listing the file in
-the ``SRC_URI`` and adding the machine to the expression in
-``COMPATIBLE_MACHINE``::
+the :term:`SRC_URI` and adding the machine to the expression in
+:term:`COMPATIBLE_MACHINE`::
 
    COMPATIBLE_MACHINE = '(qemux86|qemumips)'
 
@@ -3178,9 +3178,9 @@ To manually upgrade recipe versions, follow these general steps:
 1. *Change the Version:* Rename the recipe such that the version (i.e.
    the :term:`PV` part of the recipe name)
    changes appropriately. If the version is not part of the recipe name,
-   change the value as it is set for ``PV`` within the recipe itself.
+   change the value as it is set for :term:`PV` within the recipe itself.
 
-2. *Update* ``SRCREV`` *if Needed*: If the source code your recipe builds
+2. *Update* :term:`SRCREV` *if Needed*: If the source code your recipe builds
    is fetched from Git or some other version control system, update
    :term:`SRCREV` to point to the
    commit hash that matches the new version.
@@ -3241,15 +3241,15 @@ patches.
 During a build, the unpacked temporary source code used by recipes to
 build packages is available in the Build Directory as defined by the
 :term:`S` variable. Below is the default
-value for the ``S`` variable as defined in the
+value for the :term:`S` variable as defined in the
 ``meta/conf/bitbake.conf`` configuration file in the
 :term:`Source Directory`::
 
    S = "${WORKDIR}/${BP}"
 
 You should be aware that many recipes override the
-``S`` variable. For example, recipes that fetch their source from Git
-usually set ``S`` to ``${WORKDIR}/git``.
+:term:`S` variable. For example, recipes that fetch their source from Git
+usually set :term:`S` to ``${WORKDIR}/git``.
 
 .. note::
 
@@ -3369,13 +3369,13 @@ Follow these general steps:
    ``file2.c``, and ``file3.c`` files.
 
    You can find the resulting patch file in the ``patches/``
-   subdirectory of the source (``S``) directory.
+   subdirectory of the source (:term:`S`) directory.
 
 8. *Copy the Patch File:* For simplicity, copy the patch file into a
    directory named ``files``, which you can create in the same directory
    that holds the recipe (``.bb``) file or the append (``.bbappend``)
    file. Placing the patch here guarantees that the OpenEmbedded build
-   system will find the patch. Next, add the patch into the ``SRC_URI``
+   system will find the patch. Next, add the patch into the :term:`SRC_URI`
    of the recipe. Here is an example::
 
       SRC_URI += "file://my_changes.patch"
@@ -3454,7 +3454,7 @@ terminal window.
       use the full compiler name such as ``arm-poky-linux-gnueabi-gcc``
       instead of just using ``gcc``. The same applies to other
       applications such as ``binutils``, ``libtool`` and so forth.
-      BitBake sets up environment variables such as ``CC`` to assist
+      BitBake sets up environment variables such as :term:`CC` to assist
       applications, such as ``make`` to find the correct tools.
 
    -  It is also worth noting that ``devshell`` still works over X11
@@ -3573,7 +3573,7 @@ The following figure and list overviews the build process:
    ``conf/local.conf`` configuration file, which is found in the Build
    Directory, is set up how you want it. This file defines many aspects
    of the build environment including the target machine architecture
-   through the ``MACHINE`` variable, the packaging format used during
+   through the :term:`MACHINE` variable, the packaging format used during
    the build
    (:term:`PACKAGE_CLASSES`),
    and a centralized tarball download directory through the
@@ -3646,7 +3646,7 @@ Follow these steps to set up and execute multiple configuration builds:
    consider a scenario with two different multiconfigs for the same
    :term:`MACHINE`: "qemux86" built
    for two distributions such as "poky" and "poky-lsb". In this case,
-   you might want to use the same ``TMPDIR``.
+   you might want to use the same :term:`TMPDIR`.
 
    Here is an example showing the minimal statements needed in a
    configuration file for a "qemux86" target whose temporary build
@@ -3663,7 +3663,7 @@ Follow these steps to set up and execute multiple configuration builds:
    .. image:: figures/multiconfig_files.png
       :align: center
 
-   The reason for this required file hierarchy is because the ``BBPATH``
+   The reason for this required file hierarchy is because the :term:`BBPATH`
    variable is not constructed until the layers are parsed.
    Consequently, using the configuration file as a pre-configuration
    file is not possible unless it is located in the current working
@@ -3674,7 +3674,7 @@ Follow these steps to set up and execute multiple configuration builds:
    :term:`BBMULTICONFIG`
    variable in your ``conf/local.conf`` configuration file to specify
    each multiconfig. Continuing with the example from the previous
-   figure, the ``BBMULTICONFIG`` variable needs to enable two
+   figure, the :term:`BBMULTICONFIG` variable needs to enable two
    multiconfigs: "x86" and "arm" by specifying each configuration file::
 
       BBMULTICONFIG = "x86 arm"
@@ -3708,7 +3708,7 @@ Follow these steps to set up and execute multiple configuration builds:
    Support for multiple configuration builds in the Yocto Project &DISTRO;
    (&DISTRO_NAME;) Release does not include Shared State (sstate)
    optimizations. Consequently, if a build uses the same object twice
-   in, for example, two different ``TMPDIR``
+   in, for example, two different :term:`TMPDIR`
    directories, the build either loads from an existing sstate cache for
    that build at the start or builds the object fresh.
 
@@ -3806,7 +3806,7 @@ Follow these steps to create an initramfs image:
       recipe and the initramfs recipe should the initramfs image include
       kernel modules.
 
-   Setting the ``INITRAMFS_IMAGE_BUNDLE`` flag causes the initramfs
+   Setting the :term:`INITRAMFS_IMAGE_BUNDLE` flag causes the initramfs
    image to be unpacked into the ``${B}/usr/`` directory. The unpacked
    initramfs image is then passed to the kernel's ``Makefile`` using the
    :term:`CONFIG_INITRAMFS_SOURCE`
@@ -3828,7 +3828,7 @@ Follow these steps to create an initramfs image:
    :term:`PACKAGE_INSTALL`
    rather than
    :term:`IMAGE_INSTALL`.
-   ``PACKAGE_INSTALL`` gives more direct control of what is added to the
+   :term:`PACKAGE_INSTALL` gives more direct control of what is added to the
    image as compared to the defaults you might not necessarily want that
    are set by the :ref:`image <ref-classes-image>`
    or :ref:`core-image <ref-classes-core-image>`
@@ -3912,7 +3912,7 @@ your own distribution that are likely modeled after ``poky-tiny``.
 
 .. note::
 
-   To use ``poky-tiny`` in your build, set the ``DISTRO`` variable in your
+   To use ``poky-tiny`` in your build, set the :term:`DISTRO` variable in your
    ``local.conf`` file to "poky-tiny" as described in the
    ":ref:`dev-manual/common-tasks:creating your own distribution`"
    section.
@@ -4156,17 +4156,17 @@ your tunings to best consider build times and package feed maintenance.
    :term:`TMPDIR` across builds. The
    Yocto Project supports switching between different
    :term:`MACHINE` values in the same
-   ``TMPDIR``. This practice is well supported and regularly used by
+   :term:`TMPDIR`. This practice is well supported and regularly used by
    developers when building for multiple machines. When you use the same
-   ``TMPDIR`` for multiple machine builds, the OpenEmbedded build system
+   :term:`TMPDIR` for multiple machine builds, the OpenEmbedded build system
    can reuse the existing native and often cross-recipes for multiple
    machines. Thus, build time decreases.
 
    .. note::
 
       If :term:`DISTRO` settings change or fundamental configuration settings
-      such as the filesystem layout, you need to work with a clean ``TMPDIR``.
-      Sharing ``TMPDIR`` under these circumstances might work but since it is
+      such as the filesystem layout, you need to work with a clean :term:`TMPDIR`.
+      Sharing :term:`TMPDIR` under these circumstances might work but since it is
       not guaranteed, you should use a clean ``TMPDIR``.
 
 -  *Enable the Appropriate Package Architecture:* By default, the
@@ -4304,7 +4304,7 @@ your ``local.conf`` file::
    EXTERNALSRC_pn-myrecipe = "path-to-your-source-tree"
 
 This next example shows how to accomplish the same thing by setting
-``EXTERNALSRC`` in the recipe itself or in the recipe's append file::
+:term:`EXTERNALSRC` in the recipe itself or in the recipe's append file::
 
    EXTERNALSRC = "path"
    EXTERNALSRC_BUILD = "path"
@@ -4340,7 +4340,7 @@ Follow these steps to populate your Downloads directory:
 1. *Create a Clean Downloads Directory:* Start with an empty downloads
    directory (:term:`DL_DIR`). You
    start with an empty downloads directory by either removing the files
-   in the existing directory or by setting ``DL_DIR`` to point to either
+   in the existing directory or by setting :term:`DL_DIR` to point to either
    an empty location or one that does not yet exist.
 
 2. *Generate Tarballs of the Source Git Repositories:* Edit your
@@ -4351,7 +4351,7 @@ Follow these steps to populate your Downloads directory:
 
    During
    the fetch process in the next step, BitBake gathers the source files
-   and creates tarballs in the directory pointed to by ``DL_DIR``. See
+   and creates tarballs in the directory pointed to by :term:`DL_DIR`. See
    the
    :term:`BB_GENERATE_MIRROR_TARBALLS`
    variable for more information.
@@ -4394,7 +4394,7 @@ directory:
 
    The ``SOURCE_MIRROR_URL`` and ``own-mirror``
    class set up the system to use the downloads directory as your "own
-   mirror". Using the ``BB_NO_NETWORK`` variable makes sure that
+   mirror". Using the :term:`BB_NO_NETWORK` variable makes sure that
    BitBake's fetching process in step 3 stays local, which means files
    from your "own-mirror" are used.
 
@@ -4420,27 +4420,27 @@ directory:
 
          SRCREV = "${AUTOREV}"
 
-      When a recipe sets ``SRCREV`` to
+      When a recipe sets :term:`SRCREV` to
       ``${AUTOREV}``, the build system accesses the network in an
       attempt to determine the latest version of software from the SCM.
-      Typically, recipes that use ``AUTOREV`` are custom or modified
+      Typically, recipes that use :term:`AUTOREV` are custom or modified
       recipes. Recipes that reside in public repositories usually do not
-      use ``AUTOREV``.
+      use :term:`AUTOREV`.
 
-      If you do have recipes that use ``AUTOREV``, you can take steps to
+      If you do have recipes that use :term:`AUTOREV`, you can take steps to
       still use the recipes in an offline build. Do the following:
 
       1. Use a configuration generated by enabling :ref:`build
          history <dev-manual/common-tasks:maintaining build output quality>`.
 
       2. Use the ``buildhistory-collect-srcrevs`` command to collect the
-         stored ``SRCREV`` values from the build's history. For more
+         stored :term:`SRCREV` values from the build's history. For more
          information on collecting these values, see the
          ":ref:`dev-manual/common-tasks:build history package information`"
          section.
 
       3. Once you have the correct source revisions, you can modify
-         those recipes to set ``SRCREV`` to specific versions of the
+         those recipes to set :term:`SRCREV` to specific versions of the
          software.
 
 Speeding Up a Build
@@ -4580,7 +4580,7 @@ the built library.
 The :term:`PACKAGES` and
 :term:`FILES_* <FILES>` variables in the
 ``meta/conf/bitbake.conf`` configuration file define how files installed
-by the ``do_install`` task are packaged. By default, the ``PACKAGES``
+by the ``do_install`` task are packaged. By default, the :term:`PACKAGES`
 variable includes ``${PN}-staticdev``, which represents all static
 library files.
 
@@ -5943,7 +5943,7 @@ system to make your images more secure:
       EXTRA_IMAGE_FEATURES = "debug-tweaks"
 
    To disable that feature, simply comment out that line in your
-   ``local.conf`` file, or make sure ``IMAGE_FEATURES`` does not contain
+   ``local.conf`` file, or make sure :term:`IMAGE_FEATURES` does not contain
    "debug-tweaks" before producing your final image. Among other things,
    leaving this in place sets the root password as blank, which makes
    logging in for debugging or inspection easy during development but
@@ -6248,20 +6248,20 @@ the following:
    .. note::
 
       Technically, a third component, the "epoch" (i.e. :term:`PE`) is involved
-      but this discussion for the most part ignores ``PE``.
+      but this discussion for the most part ignores :term:`PE`.
 
    The version and revision are taken from the
    :term:`PV` and
    :term:`PR` variables, respectively.
 
--  ``PV``: The recipe version. ``PV`` represents the version of the
-   software being packaged. Do not confuse ``PV`` with the binary
+-  :term:`PV`: The recipe version. :term:`PV` represents the version of the
+   software being packaged. Do not confuse :term:`PV` with the binary
    package version.
 
 -  ``PR``: The recipe revision.
 
 -  :term:`SRCPV`: The OpenEmbedded
-   build system uses this string to help define the value of ``PV`` when
+   build system uses this string to help define the value of :term:`PV` when
    the source code revision needs to be included in it.
 
 -  :yocto_wiki:`PR Service </PR_Service>`: A
@@ -6271,12 +6271,12 @@ the following:
 
 Whenever the binary package content changes, the binary package version
 must change. Changing the binary package version is accomplished by
-changing or "bumping" the ``PR`` and/or ``PV`` values. Increasing these
+changing or "bumping" the :term:`PR` and/or :term:`PV` values. Increasing these
 values occurs one of two ways:
 
 -  Automatically using a Package Revision Service (PR Service).
 
--  Manually incrementing the ``PR`` and/or ``PV`` variables.
+-  Manually incrementing the :term:`PR` and/or :term:`PV` variables.
 
 Given a primary challenge of any build system and its users is how to
 maintain a package feed that is compatible with existing package manager
@@ -6290,7 +6290,7 @@ package revisioning remains linear, see the
 section.
 
 The following three sections provide related information on the PR
-Service, the manual method for "bumping" ``PR`` and/or ``PV``, and on
+Service, the manual method for "bumping" :term:`PR` and/or :term:`PV`, and on
 how to ensure binary package revisioning remains linear.
 
 Working With a PR Service
@@ -6320,20 +6320,20 @@ Because the OpenEmbedded build system uses
 unique to a given build, the build system knows when to rebuild
 packages. All the inputs into a given task are represented by a
 signature, which can trigger a rebuild when different. Thus, the build
-system itself does not rely on the ``PR``, ``PV``, and ``PE`` numbers to
+system itself does not rely on the :term:`PR`, :term:`PV`, and :term:`PE` numbers to
 trigger a rebuild. The signatures, however, can be used to generate
 these values.
 
 The PR Service works with both ``OEBasic`` and ``OEBasicHash``
-generators. The value of ``PR`` bumps when the checksum changes and the
+generators. The value of :term:`PR` bumps when the checksum changes and the
 different generator mechanisms change signatures under different
 circumstances.
 
 As implemented, the build system includes values from the PR Service
-into the ``PR`` field as an addition using the form "``.x``" so ``r0``
+into the :term:`PR` field as an addition using the form "``.x``" so ``r0``
 becomes ``r0.1``, ``r0.2`` and so forth. This scheme allows existing
-``PR`` values to be used for whatever reasons, which include manual
-``PR`` bumps, should it be necessary.
+:term:`PR` values to be used for whatever reasons, which include manual
+:term:`PR` bumps, should it be necessary.
 
 By default, the PR Service is not enabled or running. Thus, the packages
 generated are just "self consistent". The build system adds and removes
@@ -6349,7 +6349,7 @@ this scenario, you can enable a local PR Service by setting
    PRSERV_HOST = "localhost:0"
 
 Once the service is started, packages will automatically
-get increasing ``PR`` values and BitBake takes care of starting and
+get increasing :term:`PR` values and BitBake takes care of starting and
 stopping the server.
 
 If you have a more complex setup where multiple host development systems
@@ -6379,7 +6379,7 @@ history, see the
 
 .. note::
 
-   The OpenEmbedded build system does not maintain ``PR`` information as
+   The OpenEmbedded build system does not maintain :term:`PR` information as
    part of the shared state (sstate) packages. If you maintain an sstate
    feed, it's expected that either all your building systems that
    contribute to the sstate feed use a shared PR Service, or you do not
@@ -6398,27 +6398,27 @@ The alternative to setting up a PR Service is to manually "bump" the
 
 If a committed change results in changing the package output, then the
 value of the PR variable needs to be increased (or "bumped") as part of
-that commit. For new recipes you should add the ``PR`` variable and set
+that commit. For new recipes you should add the :term:`PR` variable and set
 its initial value equal to "r0", which is the default. Even though the
 default value is "r0", the practice of adding it to a new recipe makes
 it harder to forget to bump the variable when you make changes to the
 recipe in future.
 
 If you are sharing a common ``.inc`` file with multiple recipes, you can
-also use the ``INC_PR`` variable to ensure that the recipes sharing the
+also use the :term:`INC_PR` variable to ensure that the recipes sharing the
 ``.inc`` file are rebuilt when the ``.inc`` file itself is changed. The
-``.inc`` file must set ``INC_PR`` (initially to "r0"), and all recipes
-referring to it should set ``PR`` to "${INC_PR}.0" initially,
+``.inc`` file must set :term:`INC_PR` (initially to "r0"), and all recipes
+referring to it should set :term:`PR` to "${INC_PR}.0" initially,
 incrementing the last number when the recipe is changed. If the ``.inc``
-file is changed then its ``INC_PR`` should be incremented.
+file is changed then its :term:`INC_PR` should be incremented.
 
-When upgrading the version of a binary package, assuming the ``PV``
-changes, the ``PR`` variable should be reset to "r0" (or "${INC_PR}.0"
-if you are using ``INC_PR``).
+When upgrading the version of a binary package, assuming the :term:`PV`
+changes, the :term:`PR` variable should be reset to "r0" (or "${INC_PR}.0"
+if you are using :term:`INC_PR`).
 
 Usually, version increases occur only to binary packages. However, if
-for some reason ``PV`` changes but does not increase, you can increase
-the ``PE`` variable (Package Epoch). The ``PE`` variable defaults to
+for some reason :term:`PV` changes but does not increase, you can increase
+the :term:`PE` variable (Package Epoch). The :term:`PE` variable defaults to
 "0".
 
 Binary package version numbering strives to follow the `Debian Version
@@ -6433,20 +6433,20 @@ Automatically Incrementing a Package Version Number
 When fetching a repository, BitBake uses the
 :term:`SRCREV` variable to determine
 the specific source code revision from which to build. You set the
-``SRCREV`` variable to
+:term:`SRCREV` variable to
 :term:`AUTOREV` to cause the
 OpenEmbedded build system to automatically use the latest revision of
 the software::
 
    SRCREV = "${AUTOREV}"
 
-Furthermore, you need to reference ``SRCPV`` in ``PV`` in order to
+Furthermore, you need to reference :term:`SRCPV` in :term:`PV` in order to
 automatically update the version whenever the revision of the source
 code changes. Here is an example::
 
    PV = "1.0+git${SRCPV}"
 
-The OpenEmbedded build system substitutes ``SRCPV`` with the following:
+The OpenEmbedded build system substitutes :term:`SRCPV` with the following:
 
 .. code-block:: none
 
@@ -6479,7 +6479,7 @@ with a number. The number used depends on the state of the PR Service:
 
 In summary, the OpenEmbedded build system does not track the history of
 binary package versions for this purpose. ``AUTOINC``, in this case, is
-comparable to ``PR``. If PR server is not enabled, ``AUTOINC`` in the
+comparable to :term:`PR`. If PR server is not enabled, ``AUTOINC`` in the
 package version is simply replaced by "0". If PR server is enabled, the
 build system keeps track of the package versions and bumps the number
 when the package revision changes.
@@ -6654,7 +6654,7 @@ ensure that any :term:`RDEPENDS` and
 :term:`RRECOMMENDS` on a package
 name starting with the prefix are satisfied during build time. If you
 are using ``do_split_packages`` as described in the previous section,
-the value you put in ``PACKAGES_DYNAMIC`` should correspond to the name
+the value you put in :term:`PACKAGES_DYNAMIC` should correspond to the name
 pattern specified in the call to ``do_split_packages``.
 
 Using Runtime Package Management
@@ -6822,7 +6822,7 @@ From within the build directory where you have built an image based on
 your packaging choice (i.e. the
 :term:`PACKAGE_CLASSES`
 setting), simply start the server. The following example assumes a build
-directory of ``poky/build/tmp/deploy/rpm`` and a ``PACKAGE_CLASSES``
+directory of ``poky/build/tmp/deploy/rpm`` and a :term:`PACKAGE_CLASSES`
 setting of "package_rpm"::
 
    $ cd poky/build/tmp/deploy/rpm
@@ -7360,7 +7360,7 @@ command::
 
 The
 recipe this command generates is very similar to the recipe created in
-the previous section. However, the ``SRC_URI`` looks like the following::
+the previous section. However, the :term:`SRC_URI` looks like the following::
 
    SRC_URI = " \
        git://github.com/martinaglv/cute-files.git;protocol=https \
@@ -7394,7 +7394,7 @@ of precedence is the same as this list:
 
 -  ``PACKAGE_ADD_METADATA_<PN>``
 
--  ``PACKAGE_ADD_METADATA``
+-  :term:`PACKAGE_ADD_METADATA`
 
 `<PKGTYPE>` is a parameter and expected to be a distinct name of specific
 package type:
@@ -7587,7 +7587,7 @@ variable defines the Device Table to use and should be set in the
 machine or distro configuration file. Alternatively, you can set this
 variable in your ``local.conf`` configuration file.
 
-If you do not define the ``IMAGE_DEVICE_TABLES`` variable, the default
+If you do not define the :term:`IMAGE_DEVICE_TABLES` variable, the default
 ``device_table-minimal.txt`` is used::
 
    IMAGE_DEVICE_TABLES = "device_table-mymachine.txt"
@@ -7713,13 +7713,13 @@ Creating the Root Filesystem
 To create the read-only root filesystem, simply add the
 "read-only-rootfs" feature to your image, normally in one of two ways.
 The first way is to add the "read-only-rootfs" image feature in the
-image's recipe file via the ``IMAGE_FEATURES`` variable::
+image's recipe file via the :term:`IMAGE_FEATURES` variable::
 
    IMAGE_FEATURES += "read-only-rootfs"
 
 As an alternative, you can add the same feature
 from within your build directory's ``local.conf`` file with the
-associated ``EXTRA_IMAGE_FEATURES`` variable, as in::
+associated :term:`EXTRA_IMAGE_FEATURES` variable, as in::
 
    EXTRA_IMAGE_FEATURES = "read-only-rootfs"
 
@@ -7813,7 +7813,7 @@ Enabling and Disabling Build History
 ------------------------------------
 
 Build history is disabled by default. To enable it, add the following
-``INHERIT`` statement and set the
+:term:`INHERIT` statement and set the
 :term:`BUILDHISTORY_COMMIT`
 variable to "1" at the end of your ``conf/local.conf`` file found in the
 :term:`Build Directory`::
@@ -7913,10 +7913,10 @@ example assuming
 
 You can use the
 ``buildhistory-collect-srcrevs`` command with the ``-a`` option to
-collect the stored ``SRCREV`` values from build history and report them
+collect the stored :term:`SRCREV` values from build history and report them
 in a format suitable for use in global configuration (e.g.,
 ``local.conf`` or a distro include file) to override floating
-``AUTOREV`` values to a fixed set of revisions. Here is some example
+:term:`AUTOREV` values to a fixed set of revisions. Here is some example
 output from this command::
 
    $ buildhistory-collect-srcrevs -a
@@ -7945,7 +7945,7 @@ output from this command::
 
    Here are some notes on using the ``buildhistory-collect-srcrevs`` command:
 
-   -  By default, only values where the ``SRCREV`` was not hardcoded
+   -  By default, only values where the :term:`SRCREV` was not hardcoded
       (usually when ``AUTOREV`` is used) are reported. Use the ``-a``
       option to see all ``SRCREV`` values.
 
@@ -8276,7 +8276,7 @@ Once you start running the tests, the following happens:
    tests run. The full boot log is written to
    ``${WORKDIR}/testimage/qemu_boot_log``.
 
-5. Each test module loads in the order found in ``TEST_SUITES``. You can
+5. Each test module loads in the order found in :term:`TEST_SUITES`. You can
    find the full output of the commands run over SSH in
    ``${WORKDIR}/testimgage/ssh_target_log``.
 
@@ -8310,7 +8310,7 @@ addresses written into the image, or set the image to use DHCP and have
 your DHCP server on the test network assign a known IP address based on
 the MAC address of the device.
 
-In order to run tests on hardware, you need to set ``TEST_TARGET`` to an
+In order to run tests on hardware, you need to set :term:`TEST_TARGET` to an
 appropriate value. For QEMU, you do not have to change anything, the
 default value is "qemu". For running tests on hardware, the following
 options are available:
@@ -8359,14 +8359,14 @@ options are available:
 Selecting SystemdbootTarget
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-If you did not set ``TEST_TARGET`` to "SystemdbootTarget", then you do
+If you did not set :term:`TEST_TARGET` to "SystemdbootTarget", then you do
 not need any information in this section. You can skip down to the
 ":ref:`dev-manual/common-tasks:running tests`" section.
 
-If you did set ``TEST_TARGET`` to "SystemdbootTarget", you also need to
+If you did set :term:`TEST_TARGET` to "SystemdbootTarget", you also need to
 perform a one-time setup of your master image by doing the following:
 
-1. *Set EFI_PROVIDER:* Be sure that ``EFI_PROVIDER`` is as follows::
+1. *Set EFI_PROVIDER:* Be sure that :term:`EFI_PROVIDER` is as follows::
 
       EFI_PROVIDER = "systemd-boot"
 
@@ -8400,7 +8400,7 @@ perform a one-time setup of your master image by doing the following:
 3. *Install image:* Install the image that you just built on the target
    system.
 
-The final thing you need to do when setting ``TEST_TARGET`` to
+The final thing you need to do when setting :term:`TEST_TARGET` to
 "SystemdbootTarget" is to set up the test image:
 
 1. *Set up your local.conf file:* Make sure you have the following
@@ -8421,8 +8421,8 @@ Power Control
 For most hardware targets other than "simpleremote", you can control
 power:
 
--  You can use ``TEST_POWERCONTROL_CMD`` together with
-   ``TEST_POWERCONTROL_EXTRA_ARGS`` as a command that runs on the host
+-  You can use :term:`TEST_POWERCONTROL_CMD` together with
+   :term:`TEST_POWERCONTROL_EXTRA_ARGS` as a command that runs on the host
    and does power cycling. The test code passes one argument to that
    command: off, on or cycle (off then on). Here is an example that
    could appear in your ``local.conf`` file::
@@ -8441,8 +8441,8 @@ power:
 
    .. note::
 
-      You need to customize ``TEST_POWERCONTROL_CMD`` and
-      ``TEST_POWERCONTROL_EXTRA_ARGS`` for your own setup. The one requirement
+      You need to customize :term:`TEST_POWERCONTROL_CMD` and
+      :term:`TEST_POWERCONTROL_EXTRA_ARGS` for your own setup. The one requirement
       is that it accepts "on", "off", and "cycle" as the last argument.
 
 -  When no command is defined, it connects to the device over SSH and
@@ -8540,14 +8540,14 @@ the ``local.conf`` file as normal. Be sure that tests reside in
 
 You can change the set of tests run by appending or overriding
 :term:`TEST_SUITES` variable in
-``local.conf``. Each name in ``TEST_SUITES`` represents a required test
-for the image. Test modules named within ``TEST_SUITES`` cannot be
+``local.conf``. Each name in :term:`TEST_SUITES` represents a required test
+for the image. Test modules named within :term:`TEST_SUITES` cannot be
 skipped even if a test is not suitable for an image (e.g. running the
 RPM tests on an image without ``rpm``). Appending "auto" to
-``TEST_SUITES`` causes the build system to try to run all tests that are
+:term:`TEST_SUITES` causes the build system to try to run all tests that are
 suitable for the image (i.e. each test module may elect to skip itself).
 
-The order you list tests in ``TEST_SUITES`` is important and influences
+The order you list tests in :term:`TEST_SUITES` is important and influences
 test dependencies. Consequently, tests that depend on other tests should
 be added after the test on which they depend. For example, since the
 ``ssh`` test depends on the ``ping`` test, "ssh" needs to come after
@@ -8599,7 +8599,7 @@ following BitBake command form::
 Exporting the tests places them in the
 :term:`Build Directory` in
 ``tmp/testexport/``\ image, which is controlled by the
-``TEST_EXPORT_DIR`` variable.
+:term:`TEST_EXPORT_DIR` variable.
 
 You can now run the tests outside of the build environment::
 
@@ -9558,7 +9558,7 @@ So the first thing to do is build "neard" locally. Before you start the
 build, set the
 :term:`PARALLEL_MAKE` variable
 in your ``local.conf`` file to a high number (e.g. "-j 20"). Using a
-high value for ``PARALLEL_MAKE`` increases the chances of the race
+high value for :term:`PARALLEL_MAKE` increases the chances of the race
 condition showing up::
 
    $ bitbake neard
@@ -9631,7 +9631,7 @@ The final thing you need to do to implement the fix in the build is to
 update the "neard" recipe (i.e. ``neard-0.14.bb``) so that the
 :term:`SRC_URI` statement includes
 the patch file. The recipe file is in the folder above the patch. Here
-is what the edited ``SRC_URI`` statement would look like::
+is what the edited :term:`SRC_URI` statement would look like::
 
    SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BPN}-${PV}.tar.xz \
               file://neard.in \
@@ -9640,7 +9640,7 @@ is what the edited ``SRC_URI`` statement would look like::
              "
 
 With the patch complete and moved to the correct folder and the
-``SRC_URI`` statement updated, you can exit the ``devshell``::
+:term:`SRC_URI` statement updated, you can exit the ``devshell``::
 
    $ exit
 
@@ -9985,14 +9985,14 @@ Here are some other tips that you might find useful:
 -  Removing :term:`TMPDIR` (usually
    ``tmp/``, within the
    :term:`Build Directory`) can often fix
-   temporary build issues. Removing ``TMPDIR`` is usually a relatively
+   temporary build issues. Removing :term:`TMPDIR` is usually a relatively
    cheap operation, because task output will be cached in
    :term:`SSTATE_DIR` (usually
    ``sstate-cache/``, which is also in the Build Directory).
 
    .. note::
 
-      Removing ``TMPDIR`` might be a workaround rather than a fix.
+      Removing :term:`TMPDIR` might be a workaround rather than a fix.
       Consequently, trying to determine the underlying cause of an issue before
       removing the directory is a good idea.
 
@@ -10585,9 +10585,9 @@ build will fail.
 Specifying the ``LIC_FILES_CHKSUM`` Variable
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The ``LIC_FILES_CHKSUM`` variable contains checksums of the license text
+The :term:`LIC_FILES_CHKSUM` variable contains checksums of the license text
 in the source code for the recipe. Following is an example of how to
-specify ``LIC_FILES_CHKSUM``::
+specify :term:`LIC_FILES_CHKSUM`::
 
    LIC_FILES_CHKSUM = "file://COPYING;md5=xxxx \
                        file://licfile1.txt;beginline=5;endline=29;md5=yyyy \
@@ -10607,7 +10607,7 @@ specify ``LIC_FILES_CHKSUM``::
 
 The build system uses the :term:`S`
 variable as the default directory when searching files listed in
-``LIC_FILES_CHKSUM``. The previous example employs the default
+:term:`LIC_FILES_CHKSUM`. The previous example employs the default
 directory.
 
 Consider this next example::
@@ -10620,13 +10620,13 @@ The first line locates a file in ``${S}/src/ls.c`` and isolates lines
 five through 16 as license text. The second line refers to a file in
 :term:`WORKDIR`.
 
-Note that ``LIC_FILES_CHKSUM`` variable is mandatory for all recipes,
-unless the ``LICENSE`` variable is set to "CLOSED".
+Note that :term:`LIC_FILES_CHKSUM` variable is mandatory for all recipes,
+unless the :term:`LICENSE` variable is set to "CLOSED".
 
 Explanation of Syntax
 ~~~~~~~~~~~~~~~~~~~~~
 
-As mentioned in the previous section, the ``LIC_FILES_CHKSUM`` variable
+As mentioned in the previous section, the :term:`LIC_FILES_CHKSUM` variable
 lists all the important files that contain the license text for the
 source code. It is possible to specify a checksum for an entire file, or
 a specific section of a file (specified by beginning and ending line
@@ -10646,7 +10646,7 @@ build, the correct md5 checksum is placed in the build log and can be
 easily copied to the recipe.
 
 There is no limit to how many files you can specify using the
-``LIC_FILES_CHKSUM`` variable. Generally, however, every project
+:term:`LIC_FILES_CHKSUM` variable. Generally, however, every project
 requires a few specifications for license tracking. Many projects have a
 "COPYING" file that stores the license information for all the source
 code files. This practice allows you to just track the "COPYING" file as
@@ -10683,16 +10683,16 @@ name and version (after variable expansion)::
    LICENSE_FLAGS = "license_${PN}_${PV}"
 
 In order for a component restricted by a
-``LICENSE_FLAGS`` definition to be enabled and included in an image, it
+:term:`LICENSE_FLAGS` definition to be enabled and included in an image, it
 needs to have a matching entry in the global
 :term:`LICENSE_FLAGS_WHITELIST`
 variable, which is a variable typically defined in your ``local.conf``
 file. For example, to enable the
 ``poky/meta/recipes-multimedia/gstreamer/gst-plugins-ugly`` package, you
 could add either the string "commercial_gst-plugins-ugly" or the more
-general string "commercial" to ``LICENSE_FLAGS_WHITELIST``. See the
+general string "commercial" to :term:`LICENSE_FLAGS_WHITELIST`. See the
 ":ref:`dev-manual/common-tasks:license flag matching`" section for a full
-explanation of how ``LICENSE_FLAGS`` matching works. Here is the
+explanation of how :term:`LICENSE_FLAGS` matching works. Here is the
 example::
 
    LICENSE_FLAGS_WHITELIST = "commercial_gst-plugins-ugly"
@@ -10723,8 +10723,8 @@ License Flag Matching
 
 License flag matching allows you to control what recipes the
 OpenEmbedded build system includes in the build. Fundamentally, the
-build system attempts to match ``LICENSE_FLAGS`` strings found in
-recipes against ``LICENSE_FLAGS_WHITELIST`` strings found in the
+build system attempts to match :term:`LICENSE_FLAGS` strings found in
+recipes against :term:`LICENSE_FLAGS_WHITELIST` strings found in the
 whitelist. A match causes the build system to include a recipe in the
 build, while failure to find a match causes the build system to exclude
 a recipe.
@@ -10734,14 +10734,14 @@ concepts will help you correctly and effectively use matching.
 
 Before a flag defined by a particular recipe is tested against the
 contents of the whitelist, the expanded string ``_${PN}`` is appended to
-the flag. This expansion makes each ``LICENSE_FLAGS`` value
+the flag. This expansion makes each :term:`LICENSE_FLAGS` value
 recipe-specific. After expansion, the string is then matched against the
 whitelist. Thus, specifying ``LICENSE_FLAGS = "commercial"`` in recipe
 "foo", for example, results in the string ``"commercial_foo"``. And, to
 create a match, that string must appear in the whitelist.
 
-Judicious use of the ``LICENSE_FLAGS`` strings and the contents of the
-``LICENSE_FLAGS_WHITELIST`` variable allows you a lot of flexibility for
+Judicious use of the :term:`LICENSE_FLAGS` strings and the contents of the
+:term:`LICENSE_FLAGS_WHITELIST` variable allows you a lot of flexibility for
 including or excluding recipes based on licensing. For example, you can
 broaden the matching capabilities by using license flags string subsets
 in the whitelist.
@@ -10753,7 +10753,7 @@ in the whitelist.
    ``usethispart_1.3``, ``usethispart_1.4``, and so forth).
 
 For example, simply specifying the string "commercial" in the whitelist
-matches any expanded ``LICENSE_FLAGS`` definition that starts with the
+matches any expanded :term:`LICENSE_FLAGS` definition that starts with the
 string "commercial" such as "commercial_foo" and "commercial_bar", which
 are the strings the build system automatically generates for
 hypothetical recipes named "foo" and "bar" assuming those recipes simply
@@ -10767,7 +10767,7 @@ only specific recipes into the image, or you can use a string subset
 that causes a broader range of matches to allow a range of recipes into
 the image.
 
-This scheme works even if the ``LICENSE_FLAGS`` string already has
+This scheme works even if the :term:`LICENSE_FLAGS` string already has
 ``_${PN}`` appended. For example, the build system turns the license
 flag "commercial_1.2_foo" into "commercial_1.2_foo_foo" and would match
 both the general "commercial" and the specific "commercial_1.2_foo"
@@ -10814,14 +10814,14 @@ file::
 
 Of course, you could also create a matching whitelist for those
 components using the more general "commercial" in the whitelist, but
-that would also enable all the other packages with ``LICENSE_FLAGS``
+that would also enable all the other packages with :term:`LICENSE_FLAGS`
 containing "commercial", which you may or may not want::
 
    LICENSE_FLAGS_WHITELIST = "commercial"
 
 Specifying audio and video plugins as part of the
 ``COMMERCIAL_AUDIO_PLUGINS`` and ``COMMERCIAL_VIDEO_PLUGINS`` statements
-(along with the enabling ``LICENSE_FLAGS_WHITELIST``) includes the
+(along with the enabling :term:`LICENSE_FLAGS_WHITELIST`) includes the
 plugins or components into built images, thus adding support for media
 formats or components.
 
@@ -10887,7 +10887,7 @@ accidental release of proprietary software. The Yocto Project provides
 an :ref:`archiver <ref-classes-archiver>` class to
 help avoid some of these concerns.
 
-Before you employ ``DL_DIR`` or the ``archiver`` class, you need to
+Before you employ :term:`DL_DIR` or the ``archiver`` class, you need to
 decide how you choose to provide source. The source ``archiver`` class
 can generate tarballs and SRPMs and can create them with various levels
 of compliance in mind.
diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index 0e745c375..871ec8ae7 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -46,15 +46,15 @@ linux-yocto recipe.
 
 Every linux-yocto style recipe must define the
 :term:`KMACHINE` variable. This
-variable is typically set to the same value as the ``MACHINE`` variable,
+variable is typically set to the same value as the :term:`MACHINE` variable,
 which is used by :term:`BitBake`.
 However, in some cases, the variable might instead refer to the
-underlying platform of the ``MACHINE``.
+underlying platform of the :term:`MACHINE`.
 
-Multiple BSPs can reuse the same ``KMACHINE`` name if they are built
+Multiple BSPs can reuse the same :term:`KMACHINE` name if they are built
 using the same BSP description. Multiple Corei7-based BSPs could share
-the same "intel-corei7-64" value for ``KMACHINE``. It is important to
-realize that ``KMACHINE`` is just for kernel mapping, while ``MACHINE``
+the same "intel-corei7-64" value for :term:`KMACHINE`. It is important to
+realize that :term:`KMACHINE` is just for kernel mapping, while :term:`MACHINE`
 is the machine type within a BSP Layer. Even with this distinction,
 however, these two variables can hold the same value. See the
 ":ref:`kernel-dev/advanced:bsp descriptions`" section for more information.
@@ -66,7 +66,7 @@ to indicate the branch.
 
 .. note::
 
-   You can use the ``KBRANCH`` value to define an alternate branch typically
+   You can use the :term:`KBRANCH` value to define an alternate branch typically
    with a machine override as shown here from the ``meta-yocto-bsp`` layer::
 
            KBRANCH_edgerouter = "standard/edgerouter"
@@ -81,8 +81,8 @@ variables:
 
 :term:`LINUX_KERNEL_TYPE`
 defines the kernel type to be used in assembling the configuration. If
-you do not specify a ``LINUX_KERNEL_TYPE``, it defaults to "standard".
-Together with ``KMACHINE``, ``LINUX_KERNEL_TYPE`` defines the search
+you do not specify a :term:`LINUX_KERNEL_TYPE`, it defaults to "standard".
+Together with :term:`KMACHINE`, :term:`LINUX_KERNEL_TYPE` defines the search
 arguments used by the kernel tools to find the appropriate description
 within the kernel Metadata with which to build out the sources and
 configuration. The linux-yocto recipes define "standard", "tiny", and
@@ -90,21 +90,21 @@ configuration. The linux-yocto recipes define "standard", "tiny", and
 section for more information on kernel types.
 
 During the build, the kern-tools search for the BSP description file
-that most closely matches the ``KMACHINE`` and ``LINUX_KERNEL_TYPE``
+that most closely matches the :term:`KMACHINE` and :term:`LINUX_KERNEL_TYPE`
 variables passed in from the recipe. The tools use the first BSP
 description they find that matches both variables. If the tools cannot find
 a match, they issue a warning.
 
-The tools first search for the ``KMACHINE`` and then for the
-``LINUX_KERNEL_TYPE``. If the tools cannot find a partial match, they
-will use the sources from the ``KBRANCH`` and any configuration
+The tools first search for the :term:`KMACHINE` and then for the
+:term:`LINUX_KERNEL_TYPE`. If the tools cannot find a partial match, they
+will use the sources from the :term:`KBRANCH` and any configuration
 specified in the :term:`SRC_URI`.
 
 You can use the
 :term:`KERNEL_FEATURES`
 variable to include features (configuration fragments, patches, or both)
-that are not already included by the ``KMACHINE`` and
-``LINUX_KERNEL_TYPE`` variable combination. For example, to include a
+that are not already included by the :term:`KMACHINE` and
+:term:`LINUX_KERNEL_TYPE` variable combination. For example, to include a
 feature specified as "features/netfilter/netfilter.scc", specify::
 
    KERNEL_FEATURES += "features/netfilter/netfilter.scc"
@@ -116,7 +116,7 @@ specify::
    KERNEL_FEATURES_append_qemux86 = " cfg/sound.scc"
 
 The value of
-the entries in ``KERNEL_FEATURES`` are dependent on their location
+the entries in :term:`KERNEL_FEATURES` are dependent on their location
 within the kernel Metadata itself. The examples here are taken from the
 ``yocto-kernel-cache`` repository. Each branch of this repository
 contains "features" and "cfg" subdirectories at the top-level. For more
@@ -344,7 +344,7 @@ as how an additional feature description file is included with the
 
 Typically, features are less granular than configuration fragments and
 are more likely than configuration fragments and patches to be the types
-of things you want to specify in the ``KERNEL_FEATURES`` variable of the
+of things you want to specify in the :term:`KERNEL_FEATURES` variable of the
 Linux kernel recipe. See the
 ":ref:`kernel-dev/advanced:using kernel metadata in a recipe`" section earlier
 in the manual.
@@ -509,12 +509,12 @@ description as meeting the criteria set by the recipe being built. This
 example supports the "beaglebone" machine for the "standard" kernel and
 the "arm" architecture.
 
-Be aware that there is no hard link between the ``KTYPE`` variable and a kernel
+Be aware that there is no hard link between the :term:`KTYPE` variable and a kernel
 type description file. Thus, if you do not have the
 kernel type defined in your kernel Metadata as it is here, you only need
 to ensure that the
 :term:`LINUX_KERNEL_TYPE`
-variable in the kernel recipe and the ``KTYPE`` variable in the BSP
+variable in the kernel recipe and the :term:`KTYPE` variable in the BSP
 description file match.
 
 To separate your kernel policy from your hardware configuration, you
@@ -657,7 +657,7 @@ Notice again the three critical variables:
 :term:`KMACHINE`,
 :term:`KTYPE`, and
 :term:`KARCH`. Of these variables, only
-``KTYPE`` has changed to specify the "tiny" kernel type.
+:term:`KTYPE` has changed to specify the "tiny" kernel type.
 
 Kernel Metadata Location
 ========================
@@ -693,7 +693,7 @@ directory hierarchy below
 a linux-yocto recipe or for a Linux kernel recipe derived by copying and
 modifying
 ``oe-core/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb`` to
-a recipe in your layer, ``FILESEXTRAPATHS`` is typically set to
+a recipe in your layer, :term:`FILESEXTRAPATHS` is typically set to
 ``${``\ :term:`THISDIR`\ ``}/${``\ :term:`PN`\ ``}``.
 See the ":ref:`kernel-dev/common:modifying an existing recipe`"
 section for more information.
@@ -718,10 +718,10 @@ and fetches any files referenced in the ``.scc`` files by the
 ``include``, ``patch``, or ``kconf`` commands. Because of this, it is
 necessary to bump the recipe :term:`PR`
 value when changing the content of files not explicitly listed in the
-``SRC_URI``.
+:term:`SRC_URI`.
 
 If the BSP description is in recipe space, you cannot simply list the
-``*.scc`` in the ``SRC_URI`` statement. You need to use the following
+``*.scc`` in the :term:`SRC_URI` statement. You need to use the following
 form from your kernel append file::
 
    SRC_URI_append_myplatform = " \
@@ -735,7 +735,7 @@ When stored outside of the recipe-space, the kernel Metadata files
 reside in a separate repository. The OpenEmbedded build system adds the
 Metadata to the build as a "type=kmeta" repository through the
 :term:`SRC_URI` variable. As an
-example, consider the following ``SRC_URI`` statement from the
+example, consider the following :term:`SRC_URI` statement from the
 ``linux-yocto_4.12.bb`` kernel recipe::
 
    SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
@@ -744,20 +744,20 @@ example, consider the following ``SRC_URI`` statement from the
 
 ``${KMETA}``, in this context, is simply used to name the directory into
 which the Git fetcher places the Metadata. This behavior is no different
-than any multi-repository ``SRC_URI`` statement used in a recipe (e.g.
+than any multi-repository :term:`SRC_URI` statement used in a recipe (e.g.
 see the previous section).
 
 You can keep kernel Metadata in a "kernel-cache", which is a directory
 containing configuration fragments. As with any Metadata kept outside
-the recipe-space, you simply need to use the ``SRC_URI`` statement with
+the recipe-space, you simply need to use the :term:`SRC_URI` statement with
 the "type=kmeta" attribute. Doing so makes the kernel Metadata available
 during the configuration phase.
 
-If you modify the Metadata, you must not forget to update the ``SRCREV``
+If you modify the Metadata, you must not forget to update the :term:`SRCREV`
 statements in the kernel's recipe. In particular, you need to update the
 ``SRCREV_meta`` variable to match the commit in the ``KMETA`` branch you
 wish to use. Changing the data in these branches and not updating the
-``SRCREV`` statements to match will cause the build to fetch an older
+:term:`SRCREV` statements to match will cause the build to fetch an older
 commit.
 
 Organizing Your Source
@@ -820,7 +820,7 @@ patches into a feature.
 
 Once you have a new branch, you can set up your kernel Metadata to use
 the branch a couple different ways. In the recipe, you can specify the
-new branch as the ``KBRANCH`` to use for the board as follows::
+new branch as the :term:`KBRANCH` to use for the board as follows::
 
    KBRANCH = "mynewbranch"
 
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index f64cbab56..de62df5b1 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -70,7 +70,7 @@ section:
    :term:`MACHINE` variable is set to
    "qemux86-64", which is fine if you are building for the QEMU emulator
    in 64-bit mode. However, if you are not, you need to set the
-   ``MACHINE`` variable appropriately in your ``conf/local.conf`` file
+   :term:`MACHINE` variable appropriately in your ``conf/local.conf`` file
    found in the
    :term:`Build Directory` (i.e.
    ``poky/build`` in this example).
@@ -248,7 +248,7 @@ section:
    :term:`MACHINE` variable is set to
    "qemux86-64", which is fine if you are building for the QEMU emulator
    in 64-bit mode. However, if you are not, you need to set the
-   ``MACHINE`` variable appropriately in your ``conf/local.conf`` file
+   :term:`MACHINE` variable appropriately in your ``conf/local.conf`` file
    found in the
    :term:`Build Directory` (i.e.
    ``poky/build`` in this example).
@@ -474,7 +474,7 @@ variable as follows::
 The path ``${``\ :term:`THISDIR`\ ``}/${``\ :term:`PN`\ ``}``
 expands to "linux-yocto" in the current directory for this example. If
 you add any new files that modify the kernel recipe and you have
-extended ``FILESPATH`` as described above, you must place the files in
+extended :term:`FILESPATH` as described above, you must place the files in
 your layer in the following area::
 
    your-layer/recipes-kernel/linux/linux-yocto/
@@ -553,7 +553,7 @@ the append file.
 
 For example, suppose you had some configuration options in a file called
 ``network_configs.cfg``. You can place that file inside a directory
-named ``linux-yocto`` and then add a ``SRC_URI`` statement such as the
+named ``linux-yocto`` and then add a :term:`SRC_URI` statement such as the
 following to the append file. When the OpenEmbedded build system builds
 the kernel, the configuration options are picked up and applied.
 ::
@@ -563,7 +563,7 @@ the kernel, the configuration options are picked up and applied.
 To group related configurations into multiple files, you perform a
 similar procedure. Here is an example that groups separate
 configurations specifically for Ethernet and graphics into their own
-files and adds the configurations by using a ``SRC_URI`` statement like
+files and adds the configurations by using a :term:`SRC_URI` statement like
 the following in your append file::
 
    SRC_URI += "file://myconfig.cfg \
@@ -643,7 +643,7 @@ following lines to the linux-yocto ``.bbappend`` file in your layer::
    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
    SRC_URI += "file://defconfig"
 
-The ``SRC_URI`` tells the build system how to search
+The :term:`SRC_URI` tells the build system how to search
 for the file, while the
 :term:`FILESEXTRAPATHS`
 extends the :term:`FILESPATH`
@@ -684,7 +684,7 @@ with the following content (without indentation)::
    CONFIG_SERIAL_CORE_CONSOLE=y
 
 Next, include this
-configuration fragment and extend the ``FILESPATH`` variable in your
+configuration fragment and extend the :term:`FILESPATH` variable in your
 ``.bbappend`` file::
 
    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
@@ -722,7 +722,7 @@ form::
    KBUILD_DEFCONFIG_KMACHINE ?= "defconfig_file"
 
 Here is an example
-that assigns the ``KBUILD_DEFCONFIG`` variable based on "raspberrypi2"
+that assigns the :term:`KBUILD_DEFCONFIG` variable based on "raspberrypi2"
 and provides the path to the "in-tree" ``defconfig`` file to be used for
 a Raspberry Pi 2, which is based on the Broadcom 2708/2709 chipset::
 
@@ -734,7 +734,7 @@ Aside from modifying your kernel recipe and providing your own
 a kernel's ``linux-``\ `machine`\ ``.inc`` file). In other words, if the
 build system detects a statement that identifies an "out-of-tree"
 ``defconfig`` file, that statement will override your
-``KBUILD_DEFCONFIG`` variable.
+:term:`KBUILD_DEFCONFIG` variable.
 
 See the
 :term:`KBUILD_DEFCONFIG`
@@ -1349,10 +1349,10 @@ be picked up and applied when the kernel is built::
    SRC_URI += "file://myconfig.cfg"
 
 As mentioned earlier, you can group related configurations into multiple
-files and name them all in the ``SRC_URI`` statement as well. For
+files and name them all in the :term:`SRC_URI` statement as well. For
 example, you could group separate configurations specifically for
 Ethernet and graphics into their own files and add those by using a
-``SRC_URI`` statement like the following in your append file::
+:term:`SRC_URI` statement like the following in your append file::
 
    SRC_URI += "file://myconfig.cfg \
                file://eth.cfg \
@@ -1628,11 +1628,11 @@ Here are some basic steps you can use to work with your own sources:
    appropriate for your project:
 
    -  :term:`SRC_URI`: The
-      ``SRC_URI`` should specify a Git repository that uses one of the
+      :term:`SRC_URI` should specify a Git repository that uses one of the
       supported Git fetcher protocols (i.e. ``file``, ``git``, ``http``,
-      and so forth). The ``SRC_URI`` variable should also specify either
+      and so forth). The :term:`SRC_URI` variable should also specify either
       a ``defconfig`` file or some configuration fragment files. The
-      skeleton recipe provides an example ``SRC_URI`` as a syntax
+      skeleton recipe provides an example :term:`SRC_URI` as a syntax
       reference.
 
    -  :term:`LINUX_VERSION`:
@@ -1650,16 +1650,16 @@ Here are some basic steps you can use to work with your own sources:
       indicate to the OpenEmbedded build system that the recipe has
       changed.
 
-   -  :term:`PV`: The default ``PV``
+   -  :term:`PV`: The default :term:`PV`
       assignment is typically adequate. It combines the
-      ``LINUX_VERSION`` with the Source Control Manager (SCM) revision
+      :term:`LINUX_VERSION` with the Source Control Manager (SCM) revision
       as derived from the :term:`SRCPV`
       variable. The combined results are a string with the following
       form::
 
          3.19.11+git1+68a635bf8dfb64b02263c1ac80c948647cc76d5f_1+218bd8d2022b9852c60d32f0d770931e3cf343e2
 
-      While lengthy, the extra verbosity in ``PV`` helps ensure you are
+      While lengthy, the extra verbosity in :term:`PV` helps ensure you are
       using the exact sources from which you intend to build.
 
    -  :term:`COMPATIBLE_MACHINE`:
@@ -1773,7 +1773,7 @@ information to build modules. If your module ``Makefile`` uses a
 different variable, you might want to override the
 :ref:`ref-tasks-compile` step, or
 create a patch to the ``Makefile`` to work with the more typical
-``KERNEL_SRC`` or ``KERNEL_PATH`` variables.
+:term:`KERNEL_SRC` or :term:`KERNEL_PATH` variables.
 
 After you have prepared your recipe, you will likely want to include the
 module in your images. To do this, see the documentation for the
@@ -1886,23 +1886,23 @@ build stops. Kernel features are the last elements processed for
 configuring and patching the kernel. Therefore, adding features in this
 manner is a way to enforce specific features are present and enabled
 without needing to do a full audit of any other layer's additions to the
-``SRC_URI`` statement.
+:term:`SRC_URI` statement.
 
 You add a kernel feature by providing the feature as part of the
-``KERNEL_FEATURES`` variable and by providing the path to the feature's
+:term:`KERNEL_FEATURES` variable and by providing the path to the feature's
 ``.scc`` file, which is relative to the root of the kernel Metadata. The
 OpenEmbedded build system searches all forms of kernel Metadata on the
-``SRC_URI`` statement regardless of whether the Metadata is in the
+:term:`SRC_URI` statement regardless of whether the Metadata is in the
 "kernel-cache", system kernel Metadata, or a recipe-space Metadata (i.e.
 part of the kernel recipe). See the
 ":ref:`kernel-dev/advanced:kernel metadata location`" section for
 additional information.
 
-When you specify the feature's ``.scc`` file on the ``SRC_URI``
+When you specify the feature's ``.scc`` file on the :term:`SRC_URI`
 statement, the OpenEmbedded build system adds the directory of that
 ``.scc`` file along with all its subdirectories to the kernel feature
 search path. Because subdirectories are searched, you can reference a
-single ``.scc`` file in the ``SRC_URI`` statement to reference multiple
+single ``.scc`` file in the :term:`SRC_URI` statement to reference multiple
 kernel features.
 
 Consider the following example that adds the "test.scc" feature to the
@@ -1910,7 +1910,7 @@ build.
 
 1. *Create the Feature File:* Create a ``.scc`` file and locate it just
    as you would any other patch file, ``.cfg`` file, or fetcher item you
-   specify in the ``SRC_URI`` statement.
+   specify in the :term:`SRC_URI` statement.
 
    .. note::
 
@@ -1937,7 +1937,7 @@ build.
    a similarly named configuration fragment file ``test.cfg``.
 
 2. *Add the Feature File to SRC_URI:* Add the ``.scc`` file to the
-   recipe's ``SRC_URI`` statement::
+   recipe's :term:`SRC_URI` statement::
 
       SRC_URI_append = " file://test.scc"
 
@@ -1945,7 +1945,7 @@ build.
    appended to the existing path.
 
 3. *Specify the Feature as a Kernel Feature:* Use the
-   ``KERNEL_FEATURES`` statement to specify the feature as a kernel
+   :term:`KERNEL_FEATURES` statement to specify the feature as a kernel
    feature::
 
       KERNEL_FEATURES_append = " test.scc"
diff --git a/documentation/kernel-dev/faq.rst b/documentation/kernel-dev/faq.rst
index cffd1c433..f0a7af37b 100644
--- a/documentation/kernel-dev/faq.rst
+++ b/documentation/kernel-dev/faq.rst
@@ -68,7 +68,7 @@ How do I change the Linux kernel command line?
 ----------------------------------------------
 
 The Linux kernel command line is
-typically specified in the machine config using the ``APPEND`` variable.
+typically specified in the machine config using the :term:`APPEND` variable.
 For example, you can add some helpful debug information doing the
 following::
 
diff --git a/documentation/kernel-dev/maint-appx.rst b/documentation/kernel-dev/maint-appx.rst
index 3354de5f0..d968c856f 100644
--- a/documentation/kernel-dev/maint-appx.rst
+++ b/documentation/kernel-dev/maint-appx.rst
@@ -104,7 +104,7 @@ patch, or BSP:
       repository organized under the "Yocto Linux Kernel" heading in the
       :yocto_git:`Yocto Project Source Repositories <>`.
 
-   -  Areas pointed to by ``SRC_URI`` statements found in kernel recipes.
+   -  Areas pointed to by :term:`SRC_URI` statements found in kernel recipes.
 
    For a typical build, the target of the search is a feature
    description in an ``.scc`` file whose name follows this format (e.g.
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index e5bdcdad2..ab882ff77 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -332,7 +332,7 @@ created by an autobuilder:
    One useful scenario for using the ``conf/site.conf`` file is to
    extend your :term:`BBPATH` variable
    to include the path to a ``conf/site.conf``. Then, when BitBake looks
-   for Metadata using ``BBPATH``, it finds the ``conf/site.conf`` file
+   for Metadata using :term:`BBPATH`, it finds the ``conf/site.conf`` file
    and applies your common configurations found in the file. To override
    configurations in a particular build directory, alter the similar
    configurations within that build directory's ``conf/local.conf``
@@ -532,7 +532,7 @@ to build software. A combination of the two is also possible.
 
 BitBake uses the :term:`SRC_URI`
 variable to point to source files regardless of their location. Each
-recipe must have a ``SRC_URI`` variable that points to the source.
+recipe must have a :term:`SRC_URI` variable that points to the source.
 
 Another area that plays a significant role in where source files come
 from is pointed to by the
@@ -540,13 +540,13 @@ from is pointed to by the
 a cache that can hold previously downloaded source. You can also
 instruct the OpenEmbedded build system to create tarballs from Git
 repositories, which is not the default behavior, and store them in the
-``DL_DIR`` by using the
+:term:`DL_DIR` by using the
 :term:`BB_GENERATE_MIRROR_TARBALLS`
 variable.
 
-Judicious use of a ``DL_DIR`` directory can save the build system a trip
+Judicious use of a :term:`DL_DIR` directory can save the build system a trip
 across the Internet when looking for files. A good method for using a
-download directory is to have ``DL_DIR`` point to an area outside of
+download directory is to have :term:`DL_DIR` point to an area outside of
 your Build Directory. Doing so allows you to safely delete the Build
 Directory if needed without fear of removing any downloaded source file.
 
@@ -747,7 +747,7 @@ Build Directory's hierarchy:
    architecture of the built package or packages. Depending on the
    eventual destination of the package or packages (i.e. machine
    architecture, :term:`Build Host`, SDK, or
-   specific machine), ``PACKAGE_ARCH`` varies. See the variable's
+   specific machine), :term:`PACKAGE_ARCH` varies. See the variable's
    description for details.
 
 -  :term:`TARGET_OS`: The operating
@@ -756,7 +756,7 @@ Build Directory's hierarchy:
 
 -  :term:`PN`: The name of the recipe used
    to build the package. This variable can have multiple meanings.
-   However, when used in the context of input files, ``PN`` represents
+   However, when used in the context of input files, :term:`PN` represents
    the name of the recipe.
 
 -  :term:`WORKDIR`: The location
@@ -773,7 +773,7 @@ Build Directory's hierarchy:
    files for a given recipe.
 
    -  :term:`BPN`: The name of the recipe
-      used to build the package. The ``BPN`` variable is a version of
+      used to build the package. The :term:`BPN` variable is a version of
       the ``PN`` variable but with common prefixes and suffixes removed.
 
    -  :term:`PV`: The version of the
@@ -803,13 +803,13 @@ and the :term:`FILESPATH` variable
 to locate applicable patch files.
 
 Default processing for patch files assumes the files have either
-``*.patch`` or ``*.diff`` file types. You can use ``SRC_URI`` parameters
+``*.patch`` or ``*.diff`` file types. You can use :term:`SRC_URI` parameters
 to change the way the build system recognizes patch files. See the
 :ref:`ref-tasks-patch` task for more
 information.
 
 BitBake finds and applies multiple patches for a single recipe in the
-order in which it locates the patches. The ``FILESPATH`` variable
+order in which it locates the patches. The :term:`FILESPATH` variable
 defines the default set of directories that the build system uses to
 search for patch files. Once found, patches are applied to the recipe's
 source files, which are located in the
@@ -877,12 +877,12 @@ This step in the build process consists of the following tasks:
    :ref:`ref-tasks-compile` task.
    Compilation occurs in the directory pointed to by the
    :term:`B` variable. Realize that the
-   ``B`` directory is, by default, the same as the
+   :term:`B` directory is, by default, the same as the
    :term:`S` directory.
 
 -  *do_install*: After compilation completes, BitBake executes the
    :ref:`ref-tasks-install` task.
-   This task copies files from the ``B`` directory and places them in a
+   This task copies files from the :term:`B` directory and places them in a
    holding area pointed to by the :term:`D`
    variable. Packaging occurs later using files from this holding
    directory.
@@ -928,7 +928,7 @@ the analysis and package splitting process use several areas:
 -  :term:`PKGDATA_DIR`: A shared,
    global-state directory that holds packaging metadata generated during
    the packaging process. The packaging process copies metadata from
-   ``PKGDESTWORK`` to the ``PKGDATA_DIR`` area where it becomes globally
+   :term:`PKGDESTWORK` to the :term:`PKGDATA_DIR` area where it becomes globally
    available.
 
 -  :term:`STAGING_DIR_HOST`:
@@ -1008,7 +1008,7 @@ actually install:
 
 With :term:`IMAGE_ROOTFS`
 pointing to the location of the filesystem under construction and the
-``PACKAGE_INSTALL`` variable providing the final list of packages to
+:term:`PACKAGE_INSTALL` variable providing the final list of packages to
 install, the root file system is created.
 
 Package installation is under control of the package manager (e.g.
@@ -1057,7 +1057,7 @@ based on the image types specified in the
 The process turns everything into an image file or a set of image files
 and can compress the root filesystem image to reduce the overall size of
 the image. The formats used for the root filesystem depend on the
-``IMAGE_FSTYPES`` variable. Compression depends on whether the formats
+:term:`IMAGE_FSTYPES` variable. Compression depends on whether the formats
 support compression.
 
 As an example, a dynamically created task when creating a particular
@@ -1066,7 +1066,7 @@ image type would take the following form::
    do_image_type
 
 So, if the type
-as specified by the ``IMAGE_FSTYPES`` were ``ext4``, the dynamically
+as specified by the :term:`IMAGE_FSTYPES` were ``ext4``, the dynamically
 generated task would be as follows::
 
    do_image_ext4
@@ -1171,9 +1171,9 @@ the task is rerun.
    the sstate cache mechanism adds is a way to cache task output that
    can then be shared between build machines.
 
-Since ``STAMPS_DIR`` is usually a subdirectory of ``TMPDIR``, removing
-``TMPDIR`` will also remove ``STAMPS_DIR``, which means tasks will
-properly be rerun to repopulate ``TMPDIR``.
+Since :term:`STAMPS_DIR` is usually a subdirectory of :term:`TMPDIR`, removing
+:term:`TMPDIR` will also remove :term:`STAMPS_DIR`, which means tasks will
+properly be rerun to repopulate :term:`TMPDIR`.
 
 If you want some task to always be considered "out of date", you can
 mark it with the :ref:`nostamp <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`
@@ -1408,7 +1408,7 @@ This next list, shows the variables associated with a standard SDK:
 
 -  :term:`TOOLCHAIN_HOST_TASK`:
    Lists packages that make up the host part of the SDK (i.e. the part
-   that runs on the ``SDKMACHINE``). When you use
+   that runs on the :term:`SDKMACHINE`). When you use
    ``bitbake -c populate_sdk imagename`` to create the SDK, a set of
    default packages apply. This variable allows you to add more
    packages.
@@ -1614,7 +1614,7 @@ them if they are deemed to be valid.
       :term:`PR` information as part of
       the shared state packages. Consequently, there are considerations that
       affect maintaining shared state feeds. For information on how the
-      build system works with packages and can track incrementing ``PR``
+      build system works with packages and can track incrementing :term:`PR`
       information, see the ":ref:`dev-manual/common-tasks:automatically incrementing a package version number`"
       section in the Yocto Project Development Tasks Manual.
 
@@ -1671,8 +1671,8 @@ objective of making native or cross packages relocatable.
    build host. However, cross packages generate output for the target
    architecture.
 
-The checksum therefore needs to exclude ``WORKDIR``. The simplistic
-approach for excluding the work directory is to set ``WORKDIR`` to some
+The checksum therefore needs to exclude :term:`WORKDIR`. The simplistic
+approach for excluding the work directory is to set :term:`WORKDIR` to some
 fixed value and create the checksum for the "run" script.
 
 Another problem results from the "run" scripts containing functions that
@@ -1690,7 +1690,7 @@ contains code that first figures out the variable and function
 dependencies, and then creates a checksum for the data used as the input
 to the task.
 
-Like the ``WORKDIR`` case, there can be situations where dependencies should be
+Like the :term:`WORKDIR` case, there can be situations where dependencies should be
 ignored. For these situations, you can instruct the build process to
 ignore a dependency by using a line like the following::
 
@@ -1707,7 +1707,7 @@ following::
    PACKAGE_ARCHS[vardeps] = "MACHINE"
 
 This example explicitly
-adds the ``MACHINE`` variable as a dependency for ``PACKAGE_ARCHS``.
+adds the :term:`MACHINE` variable as a dependency for :term:`PACKAGE_ARCHS`.
 
 As an example, consider a case with in-line Python where BitBake is not
 able to figure out dependencies. When running in debug mode (i.e. using
@@ -1761,7 +1761,7 @@ through this setting in the ``bitbake.conf`` file::
 
    BB_SIGNATURE_HANDLER ?= "OEBasicHash"
 
-The "OEBasicHash" ``BB_SIGNATURE_HANDLER`` is the same
+The "OEBasicHash" :term:`BB_SIGNATURE_HANDLER` is the same
 as the "OEBasic" version but adds the task hash to the :ref:`stamp
 files <overview-manual/concepts:stamp files and the rerunning of tasks>`. This
 results in any metadata change that changes the task hash, automatically causing
@@ -1782,7 +1782,7 @@ the build. This information includes:
 -  ``BBHASHDEPS_``\ filename\ ``:``\ taskname: The task dependencies for
    each task.
 
--  ``BB_TASKHASH``: The hash of the currently running task.
+-  :term:`BB_TASKHASH`: The hash of the currently running task.
 
 Shared State
 ------------
@@ -1851,7 +1851,7 @@ The following list explains the previous example:
       ``do_deploy`` is in the shared state cache and its signature indicates
       that the cached output is still valid (i.e. if no relevant task inputs
       have changed), then the contents of the shared state cache copies
-      directly to ${``DEPLOY_DIR_IMAGE``} by the ``do_deploy_setscene`` task
+      directly to ${:term:`DEPLOY_DIR_IMAGE`} by the ``do_deploy_setscene`` task
       instead, skipping the ``do_deploy`` task.
 
 -  The following task definition is glue logic needed to make the
@@ -1897,8 +1897,8 @@ The following list explains the previous example:
 
 -  ``sstate-inputdirs`` and ``sstate-outputdirs`` can also be used with
    multiple directories. For example, the following declares
-   ``PKGDESTWORK`` and ``SHLIBWORK`` as shared state input directories,
-   which populates the shared state cache, and ``PKGDATA_DIR`` and
+   :term:`PKGDESTWORK` and ``SHLIBWORK`` as shared state input directories,
+   which populates the shared state cache, and :term:`PKGDATA_DIR` and
    ``SHLIBSDIR`` as the corresponding shared state output directories::
 
       do_package[sstate-inputdirs] = "${PKGDESTWORK} ${SHLIBSWORKDIR}"
@@ -1925,7 +1925,7 @@ shared state files. Here is an example::
    subdirectories, where the subdirectory names are based on the first two
    characters of the hash.
    If the shared state directory structure for a mirror has the same structure
-   as ``SSTATE_DIR``, you must specify "PATH" as part of the URI to enable the build
+   as :term:`SSTATE_DIR`, you must specify "PATH" as part of the URI to enable the build
    system to map to the appropriate subdirectory.
 
 The shared state package validity can be detected just by looking at the
@@ -1976,7 +1976,7 @@ dependencies, you must manually declare the dependencies.
 
    Simultaneously, all executables and shared libraries installed by the
    recipe are inspected to see what shared libraries they link against.
-   For each shared library dependency that is found, ``PKGDATA_DIR`` is
+   For each shared library dependency that is found, :term:`PKGDATA_DIR` is
    queried to see if some package (likely from a different recipe)
    contains the shared library. If such a package is found, a runtime
    dependency is added from the package that depends on the shared
@@ -1985,7 +1985,7 @@ dependencies, you must manually declare the dependencies.
    The automatically added runtime dependency also includes a version
    restriction. This version restriction specifies that at least the
    current version of the package that provides the shared library must
-   be used, as if "package (>= version)" had been added to ``RDEPENDS``.
+   be used, as if "package (>= version)" had been added to :term:`RDEPENDS`.
    This forces an upgrade of the package containing the shared library
    when installing the package that depends on the library, if needed.
 
@@ -1999,14 +1999,14 @@ dependencies, you must manually declare the dependencies.
    pkg-config modules (``*.pc`` files) installed by the recipe are
    located. For each module, the package that contains the module is
    registered as providing the module. The resulting module-to-package
-   mapping is saved globally in ``PKGDATA_DIR`` by the
+   mapping is saved globally in :term:`PKGDATA_DIR` by the
    ``do_packagedata`` task.
 
    Simultaneously, all pkg-config modules installed by the recipe are
    inspected to see what other pkg-config modules they depend on. A
    module is seen as depending on another module if it contains a
    "Requires:" line that specifies the other module. For each module
-   dependency, ``PKGDATA_DIR`` is queried to see if some package
+   dependency, :term:`PKGDATA_DIR` is queried to see if some package
    contains the module. If such a package is found, a runtime dependency
    is added from the package that depends on the module to the package
    that contains the module.
@@ -2046,7 +2046,7 @@ recipe in :term:`DEPENDS` through use
 of a ``[``\ :ref:`deptask <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
 declaration, which guarantees that the required
 shared-library/module-to-package mapping information will be available
-when needed as long as ``DEPENDS`` has been correctly set.
+when needed as long as :term:`DEPENDS` has been correctly set.
 
 Fakeroot and Pseudo
 ===================
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 6dd0cbbd4..cfdf8cbf8 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -50,7 +50,7 @@ splitting out of debug symbols during packaging).
    ``do_package_write_*`` tasks to
    have different signatures for the machines with different tunings.
    Additionally, unnecessary rebuilds occur every time an image for a
-   different ``MACHINE`` is built even when the recipe never changes.
+   different :term:`MACHINE` is built even when the recipe never changes.
 
 By default, all recipes inherit the :ref:`base <ref-classes-base>` and
 :ref:`package <ref-classes-package>` classes, which enable
@@ -110,7 +110,7 @@ It's useful to have some idea of how the tasks defined by the
 -  :ref:`ref-tasks-configure` - Regenerates the
    configure script (using ``autoreconf``) and then launches it with a
    standard set of arguments used during cross-compilation. You can pass
-   additional parameters to ``configure`` through the ``EXTRA_OECONF``
+   additional parameters to ``configure`` through the :term:`EXTRA_OECONF`
    or :term:`PACKAGECONFIG_CONFARGS`
    variables.
 
@@ -168,7 +168,7 @@ example use for this class.
    the "subpath" parameter limits the checkout to a specific subpath
    of the tree. Here is an example where ``${BP}`` is used so that the files
    are extracted into the subdirectory expected by the default value of
-   ``S``::
+   :term:`S`::
 
            SRC_URI = "git://example.com/downloads/somepackage.rpm;subpath=${BP}"
 
@@ -256,7 +256,7 @@ Collecting build statistics is enabled by default through the
 :term:`USER_CLASSES` variable from your
 ``local.conf`` file. Consequently, you do not have to do anything to
 enable the class. However, if you want to disable the class, simply
-remove "buildstats" from the ``USER_CLASSES`` list.
+remove "buildstats" from the :term:`USER_CLASSES` list.
 
 .. _ref-classes-buildstats-summary:
 
@@ -448,7 +448,7 @@ deployed to :term:`DEPLOYDIR`, and use ``addtask`` to
 add the task at the appropriate place, which is usually after
 :ref:`ref-tasks-compile` or
 :ref:`ref-tasks-install`. The class then takes care of
-staging the files from ``DEPLOYDIR`` to ``DEPLOY_DIR_IMAGE``.
+staging the files from :term:`DEPLOYDIR` to :term:`DEPLOY_DIR_IMAGE`.
 
 .. _ref-classes-devshell:
 
@@ -489,7 +489,7 @@ The class
 currently only supports creating a development variant of the target
 recipe, not ``native`` or ``nativesdk`` variants.
 
-The ``BBCLASSEXTEND`` syntax (i.e. ``devupstream:target``) provides
+The :term:`BBCLASSEXTEND` syntax (i.e. ``devupstream:target``) provides
 support for ``native`` and ``nativesdk`` variants. Consequently, this
 functionality can be added in a future release.
 
@@ -534,13 +534,13 @@ and to build it, respectively. When your recipe inherits the
 ``externalsrc`` class, you use the
 :term:`EXTERNALSRC` and
 :term:`EXTERNALSRC_BUILD` variables to
-ultimately define ``S`` and ``B``.
+ultimately define :term:`S` and :term:`B`.
 
 By default, this class expects the source code to support recipe builds
 that use the :term:`B` variable to point to the directory in
 which the OpenEmbedded build system places the generated objects built
-from the recipes. By default, the ``B`` directory is set to the
-following, which is separate from the source directory (``S``)::
+from the recipes. By default, the :term:`B` directory is set to the
+following, which is separate from the source directory (:term:`S`)::
 
    ${WORKDIR}/${BPN}/{PV}/
 
@@ -704,8 +704,8 @@ introspection. This functionality is only enabled if the
 .. note::
 
    This functionality is backfilled by default and, if not applicable,
-   should be disabled through ``DISTRO_FEATURES_BACKFILL_CONSIDERED`` or
-   ``MACHINE_FEATURES_BACKFILL_CONSIDERED``, respectively.
+   should be disabled through :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED` or
+   :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`, respectively.
 
 .. _ref-classes-grub-efi:
 
@@ -853,7 +853,7 @@ using an empty :term:`PARALLEL_MAKE` variable.
 Inheriting the ``icecc`` class changes all sstate signatures.
 Consequently, if a development team has a dedicated build system that
 populates :term:`SSTATE_MIRRORS` and they want to
-reuse sstate from ``SSTATE_MIRRORS``, then all developers and the build
+reuse sstate from :term:`SSTATE_MIRRORS`, then all developers and the build
 system need to either inherit the ``icecc`` class or nobody should.
 
 At the distribution level, you can inherit the ``icecc`` class to be
@@ -881,10 +881,10 @@ First, the root filesystem is created from packages using one of the
 ``rootfs*.bbclass`` files (depending on the package format used) and
 then one or more image files are created.
 
--  The ``IMAGE_FSTYPES`` variable controls the types of images to
+-  The :term:`IMAGE_FSTYPES` variable controls the types of images to
    generate.
 
--  The ``IMAGE_INSTALL`` variable controls the list of packages to
+-  The :term:`IMAGE_INSTALL` variable controls the list of packages to
    install into the image.
 
 For information on customizing images, see the
@@ -931,7 +931,7 @@ The ``image_types`` class also handles conversion and compression of images.
 .. note::
 
    To build a VMware VMDK image, you need to add "wic.vmdk" to
-   ``IMAGE_FSTYPES``. This would also be similar for Virtual Box Virtual Disk
+   :term:`IMAGE_FSTYPES`. This would also be similar for Virtual Box Virtual Disk
    Image ("vdi") and QEMU Copy On Write Version 2 ("qcow2") images.
 
 .. _ref-classes-image-live:
@@ -1009,7 +1009,7 @@ Please keep in mind that the QA checks
 are meant to detect real or potential problems in the packaged
 output. So exercise caution when disabling these checks.
 
-Here are the tests you can list with the ``WARN_QA`` and
+Here are the tests you can list with the :term:`WARN_QA` and
 ``ERROR_QA`` variables:
 
 -  ``already-stripped:`` Checks that produced binaries have not
@@ -1142,13 +1142,13 @@ Here are the tests you can list with the ``WARN_QA`` and
 
       PACKAGECONFIG[foo] = "..."
 
--  ``la:`` Checks ``.la`` files for any ``TMPDIR`` paths. Any ``.la``
+-  ``la:`` Checks ``.la`` files for any :term:`TMPDIR` paths. Any ``.la``
    file containing these paths is incorrect since ``libtool`` adds the
    correct sysroot prefix when using the files automatically itself.
 
 -  ``ldflags:`` Ensures that the binaries were linked with the
    :term:`LDFLAGS` options provided by the build system.
-   If this test fails, check that the ``LDFLAGS`` variable is being
+   If this test fails, check that the :term:`LDFLAGS` variable is being
    passed to the linker command.
 
 -  ``libdir:`` Checks for libraries being installed into incorrect
@@ -1188,7 +1188,7 @@ Here are the tests you can list with the ``WARN_QA`` and
    invalid characters (i.e. characters other than 0-9, a-z, ., +, and
    -).
 
--  ``pkgv-undefined:`` Checks to see if the ``PKGV`` variable is
+-  ``pkgv-undefined:`` Checks to see if the :term:`PKGV` variable is
    undefined during :ref:`ref-tasks-package`.
 
 -  ``pkgvarcheck:`` Checks through the variables
@@ -1208,8 +1208,8 @@ Here are the tests you can list with the ``WARN_QA`` and
 -  ``pn-overrides:`` Checks that a recipe does not have a name
    (:term:`PN`) value that appears in
    :term:`OVERRIDES`. If a recipe is named such that
-   its ``PN`` value matches something already in ``OVERRIDES`` (e.g.
-   ``PN`` happens to be the same as :term:`MACHINE` or
+   its :term:`PN` value matches something already in :term:`OVERRIDES` (e.g.
+   :term:`PN` happens to be the same as :term:`MACHINE` or
    :term:`DISTRO`), it can have unexpected consequences.
    For example, assignments such as ``FILES_${PN} = "xyz"`` effectively
    turn into ``FILES = "xyz"``.
@@ -1740,7 +1740,7 @@ To use this class, inherit it globally and specify
    SOURCE_MIRROR_URL = "http://example.com/my-source-mirror"
 
 You can specify only a single URL
-in ``SOURCE_MIRROR_URL``.
+in :term:`SOURCE_MIRROR_URL`.
 
 .. _ref-classes-package:
 
@@ -1764,7 +1764,7 @@ package-specific classes:
    use this class.
 
 You can control the list of resulting package formats by using the
-``PACKAGE_CLASSES`` variable defined in your ``conf/local.conf``
+:term:`PACKAGE_CLASSES` variable defined in your ``conf/local.conf``
 configuration file, which is located in the :term:`Build Directory`.
 When defining the variable, you can
 specify one or more package types. Since images are generated from
@@ -1785,7 +1785,7 @@ the same or similar package. This comparison takes into account a
 complete build of the package with all dependencies previously built.
 The reason for this discrepancy is because the RPM package manager
 creates and processes more :term:`Metadata` than the IPK package
-manager. Consequently, you might consider setting ``PACKAGE_CLASSES`` to
+manager. Consequently, you might consider setting :term:`PACKAGE_CLASSES` to
 "package_ipk" if you are building smaller systems.
 
 Before making your package manager decision, however, you should
@@ -1867,7 +1867,7 @@ variable in the ``local.conf`` file.
 .. note::
 
    You cannot specify the ``package_tar`` class first using the
-   ``PACKAGE_CLASSES`` variable. You must use ``.deb``, ``.ipk``, or ``.rpm``
+   :term:`PACKAGE_CLASSES` variable. You must use ``.deb``, ``.ipk``, or ``.rpm``
    file formats for your image or SDK.
 
 .. _ref-classes-packagedata:
@@ -1889,7 +1889,7 @@ This class is enabled by default because it is inherited by the
 ========================
 
 The ``packagegroup`` class sets default values appropriate for package
-group recipes (e.g. ``PACKAGES``, ``PACKAGE_ARCH``, ``ALLOW_EMPTY``, and
+group recipes (e.g. :term:`PACKAGES`, :term:`PACKAGE_ARCH`, :term:`ALLOW_EMPTY`, and
 so forth). It is highly recommended that all package group recipes
 inherit this class.
 
@@ -2208,7 +2208,7 @@ modifying and building source code out of the work directory for a
 recipe, enabling ``rm_work`` will potentially result in your changes to
 the source being lost. To exclude some recipes from having their work
 directories deleted by ``rm_work``, you can add the names of the recipe
-or recipes you are working on to the ``RM_WORK_EXCLUDE`` variable, which
+or recipes you are working on to the :term:`RM_WORK_EXCLUDE` variable, which
 can also be set in your ``local.conf`` file. Here is an example::
 
    RM_WORK_EXCLUDE += "busybox glibc"
@@ -2323,11 +2323,11 @@ results so these tests can be skipped over but still make the correct
 values available. The ``meta/site directory`` contains test results
 sorted into different categories such as architecture, endianness, and
 the ``libc`` used. Site information provides a list of files containing
-data relevant to the current build in the ``CONFIG_SITE`` variable that
+data relevant to the current build in the :term:`CONFIG_SITE` variable that
 Autotools automatically picks up.
 
-The class also provides variables like ``SITEINFO_ENDIANNESS`` and
-``SITEINFO_BITS`` that can be used elsewhere in the metadata.
+The class also provides variables like :term:`SITEINFO_ENDIANNESS` and
+:term:`SITEINFO_BITS` that can be used elsewhere in the metadata.
 
 .. _ref-classes-sstate:
 
@@ -2378,7 +2378,7 @@ stages:
    .. note::
 
       Additionally, a recipe can customize the files further by
-      declaring a processing function in the ``SYSROOT_PREPROCESS_FUNCS``
+      declaring a processing function in the :term:`SYSROOT_PREPROCESS_FUNCS`
       variable.
 
    A shared state (sstate) object is built from these files and the
@@ -2420,11 +2420,11 @@ stages:
       recommended for general use, the files do allow some issues such
       as user creation and module indexes to be addressed.
 
-   Because recipes can have other dependencies outside of ``DEPENDS``
+   Because recipes can have other dependencies outside of :term:`DEPENDS`
    (e.g. ``do_unpack[depends] += "tar-native:do_populate_sysroot"``),
    the sysroot creation function ``extend_recipe_sysroot`` is also added
    as a pre-function for those tasks whose dependencies are not through
-   ``DEPENDS`` but operate similarly.
+   :term:`DEPENDS` but operate similarly.
 
    When installing dependencies into the sysroot, the code traverses the
    dependency graph and processes dependencies in exactly the same way
@@ -2750,8 +2750,8 @@ initialization script on behalf of the package. The OpenEmbedded build
 system takes care of details such as making sure the script is stopped
 before a package is removed and started when the package is installed.
 
-Three variables control this class: ``INITSCRIPT_PACKAGES``,
-``INITSCRIPT_NAME`` and ``INITSCRIPT_PARAMS``. See the variable links
+Three variables control this class: :term:`INITSCRIPT_PACKAGES`,
+:term:`INITSCRIPT_NAME` and :term:`INITSCRIPT_PARAMS`. See the variable links
 for details.
 
 .. _ref-classes-useradd:
@@ -2805,9 +2805,9 @@ additional information.
 .. note::
 
    You do not use the ``useradd-staticids`` class directly. You either enable
-   or disable the class by setting the ``USERADDEXTENSION`` variable. If you
+   or disable the class by setting the :term:`USERADDEXTENSION` variable. If you
    enable or disable the class in a configured system, :term:`TMPDIR` might
-   contain incorrect ``uid`` and ``gid`` values. Deleting the ``TMPDIR``
+   contain incorrect ``uid`` and ``gid`` values. Deleting the :term:`TMPDIR`
    directory will correct this condition.
 
 .. _ref-classes-utility-tasks:
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index f1b564a60..640ef77d0 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -108,10 +108,10 @@ the team can place sources there so builds continue to work.
 but the package is being marked as machine-specific in all cases, how do
 I prevent this?
 
-**A:** Set ``SRC_URI_OVERRIDES_PACKAGE_ARCH`` = "0" in the ``.bb`` file
+**A:** Set :term:`SRC_URI_OVERRIDES_PACKAGE_ARCH` = "0" in the ``.bb`` file
 but make sure the package is manually marked as machine-specific for the
 case that needs it. The code that handles
-``SRC_URI_OVERRIDES_PACKAGE_ARCH`` is in the
+:term:`SRC_URI_OVERRIDES_PACKAGE_ARCH` is in the
 ``meta/classes/base.bbclass`` file.
 
 **Q:** I'm behind a firewall and need to use a proxy server. How do I do
@@ -250,7 +250,7 @@ size, you need to set various configurations:
    :term:`IMAGE_ROOTFS_EXTRA_SPACE`
    variable to add additional free space to the image. The build system
    adds this space to the image after it determines its
-   ``IMAGE_ROOTFS_SIZE``.
+   :term:`IMAGE_ROOTFS_SIZE`.
 
 **Q:** Why don't you support directories with spaces in the pathnames?
 
@@ -262,11 +262,11 @@ situation changes, the team will not support spaces in pathnames.
 **Q:** How do I use an external toolchain?
 
 **A:** The toolchain configuration is very flexible and customizable. It
-is primarily controlled with the ``TCMODE`` variable. This variable
+is primarily controlled with the :term:`TCMODE` variable. This variable
 controls which ``tcmode-*.inc`` file to include from the
 ``meta/conf/distro/include`` directory within the :term:`Source Directory`.
 
-The default value of ``TCMODE`` is "default", which tells the
+The default value of :term:`TCMODE` is "default", which tells the
 OpenEmbedded build system to use its internally built toolchain (i.e.
 ``tcmode-default.inc``). However, other patterns are accepted. In
 particular, "external-\*" refers to external toolchains. One example is
@@ -325,7 +325,7 @@ Here is another technique::
    BB_FETCH_PREMIRRORONLY = "1"
 
 This statement
-limits the build system to pulling source from the ``PREMIRRORS`` only.
+limits the build system to pulling source from the :term:`PREMIRRORS` only.
 Again, this technique is useful for reproducing builds.
 
 Here is another technique::
@@ -339,7 +339,7 @@ however, the technique can simply waste time during the build.
 
 Finally, consider an example where you are behind an HTTP-only firewall.
 You could make the following changes to the ``local.conf`` configuration
-file as long as the ``PREMIRRORS`` server is current::
+file as long as the :term:`PREMIRRORS` server is current::
 
    PREMIRRORS_prepend = "\
        ftp://.*/.* http://www.yoctoproject.org/sources/ \n \
@@ -349,7 +349,7 @@ file as long as the ``PREMIRRORS`` server is current::
 
 These changes would cause the build system to successfully fetch source
 over HTTP and any network accesses to anything other than the
-``PREMIRRORS`` would fail.
+:term:`PREMIRRORS` would fail.
 
 The build system also honors the standard shell environment variables
 ``http_proxy``, ``ftp_proxy``, ``https_proxy``, and ``all_proxy`` to
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 31d24b8c2..ded653221 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -10,10 +10,10 @@ can select, and a reference on feature backfilling.
 
 Features provide a mechanism for working out which packages should be
 included in the generated images. Distributions can select which
-features they want to support through the ``DISTRO_FEATURES`` variable,
+features they want to support through the :term:`DISTRO_FEATURES` variable,
 which is set or appended to in a distribution's configuration file such
 as ``poky.conf``, ``poky-tiny.conf``, ``poky-lsb.conf`` and so forth.
-Machine features are set in the ``MACHINE_FEATURES`` variable, which is
+Machine features are set in the :term:`MACHINE_FEATURES` variable, which is
 set in the machine configuration file and specifies the hardware
 features for a given machine.
 
@@ -267,7 +267,7 @@ these valid features is as follows:
 -  *ssh-server-openssh:* Installs the OpenSSH SSH server, which is more
    full-featured than Dropbear. Note that if both the OpenSSH SSH server
    and the Dropbear minimal SSH server are present in
-   ``IMAGE_FEATURES``, then OpenSSH will take precedence and Dropbear
+   :term:`IMAGE_FEATURES`, then OpenSSH will take precedence and Dropbear
    will not be installed.
 
 -  *tools-debug:* Installs debugging tools such as ``strace`` and
@@ -323,27 +323,27 @@ Here are two examples to help illustrate feature backfilling:
 -  *The "pulseaudio" distro feature option*: Previously, PulseAudio
    support was enabled within the Qt and GStreamer frameworks. Because
    of this, the feature is backfilled and thus enabled for all distros
-   through the ``DISTRO_FEATURES_BACKFILL`` variable in the
+   through the :term:`DISTRO_FEATURES_BACKFILL` variable in the
    ``meta/conf/bitbake.conf`` file. However, your distro needs to
    disable the feature. You can disable the feature without affecting
    other existing distro configurations that need PulseAudio support by
-   adding "pulseaudio" to ``DISTRO_FEATURES_BACKFILL_CONSIDERED`` in
+   adding "pulseaudio" to :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED` in
    your distro's ``.conf`` file. Adding the feature to this variable
-   when it also exists in the ``DISTRO_FEATURES_BACKFILL`` variable
+   when it also exists in the :term:`DISTRO_FEATURES_BACKFILL` variable
    prevents the build system from adding the feature to your
-   configuration's ``DISTRO_FEATURES``, effectively disabling the
+   configuration's :term:`DISTRO_FEATURES`, effectively disabling the
    feature for that particular distro.
 
 -  *The "rtc" machine feature option*: Previously, real time clock (RTC)
    support was enabled for all target devices. Because of this, the
    feature is backfilled and thus enabled for all machines through the
-   ``MACHINE_FEATURES_BACKFILL`` variable in the
+   :term:`MACHINE_FEATURES_BACKFILL` variable in the
    ``meta/conf/bitbake.conf`` file. However, your target device does not
    have this capability. You can disable RTC support for your device
    without affecting other machines that need RTC support by adding the
-   feature to your machine's ``MACHINE_FEATURES_BACKFILL_CONSIDERED``
+   feature to your machine's :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`
    list in the machine's ``.conf`` file. Adding the feature to this
-   variable when it also exists in the ``MACHINE_FEATURES_BACKFILL``
+   variable when it also exists in the :term:`MACHINE_FEATURES_BACKFILL`
    variable prevents the build system from adding the feature to your
-   configuration's ``MACHINE_FEATURES``, effectively disabling RTC
+   configuration's :term:`MACHINE_FEATURES`, effectively disabling RTC
    support for that particular machine.
diff --git a/documentation/ref-manual/migration-1.3.rst b/documentation/ref-manual/migration-1.3.rst
index b90767ff9..b23bfe81c 100644
--- a/documentation/ref-manual/migration-1.3.rst
+++ b/documentation/ref-manual/migration-1.3.rst
@@ -125,7 +125,7 @@ Image recipes that previously included ``apps-console-core`` in
 :term:`IMAGE_FEATURES` should now include ``splash``
 instead to enable the boot-up splash screen. Retaining
 ``apps-console-core`` will still include the splash screen but generates a
-warning. The ``apps-x11-core`` and ``apps-x11-games`` ``IMAGE_FEATURES``
+warning. The ``apps-x11-core`` and ``apps-x11-games`` :term:`IMAGE_FEATURES`
 features have been removed.
 
 .. _migration-1.3-removed-recipes:
@@ -185,7 +185,7 @@ include :term:`PE` as part of the filename::
 
    KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
 
-Because the ``PE`` variable is not set by default, these binary files
+Because the :term:`PE` variable is not set by default, these binary files
 could result with names that include two dash characters. Here is an
 example::
 
diff --git a/documentation/ref-manual/migration-1.4.rst b/documentation/ref-manual/migration-1.4.rst
index deb848749..ae5e1bd6f 100644
--- a/documentation/ref-manual/migration-1.4.rst
+++ b/documentation/ref-manual/migration-1.4.rst
@@ -28,7 +28,7 @@ Differences include the following:
    and uninstall script functions ``pkg_preinst``, ``pkg_postinst``,
    ``pkg_prerm``, and ``pkg_postrm`` should always have a package name
    override. For example, use ``RDEPENDS_${PN}`` for the main package
-   instead of ``RDEPENDS``. BitBake uses more strict checks when it
+   instead of :term:`RDEPENDS`. BitBake uses more strict checks when it
    parses recipes.
 
 .. _migration-1.4-build-behavior:
@@ -53,10 +53,10 @@ Differences include the following:
    :term:`SRC_URI`, the build system now uses
    :term:`FILESOVERRIDES` instead of
    :term:`OVERRIDES` for the directory names. In
-   general, the values previously in ``OVERRIDES`` are now in
-   ``FILESOVERRIDES`` as well. However, if you relied upon an additional
-   value you previously added to ``OVERRIDES``, you might now need to
-   add it to ``FILESOVERRIDES`` unless you are already adding it through
+   general, the values previously in :term:`OVERRIDES` are now in
+   :term:`FILESOVERRIDES` as well. However, if you relied upon an additional
+   value you previously added to :term:`OVERRIDES`, you might now need to
+   add it to :term:`FILESOVERRIDES` unless you are already adding it through
    the :term:`MACHINEOVERRIDES` or
    :term:`DISTROOVERRIDES` variables, as
    appropriate. For more related changes, see the
@@ -105,7 +105,7 @@ Variables
 
 The following variables have changed:
 
--  ``SANITY_TESTED_DISTROS``: This variable now uses a distribution
+-  :term:`SANITY_TESTED_DISTROS`: This variable now uses a distribution
    ID, which is composed of the host distributor ID followed by the
    release. Previously,
    :term:`SANITY_TESTED_DISTROS` was
@@ -114,7 +114,7 @@ The following variables have changed:
    you are not specifically setting this variable, or if you are
    specifically setting it to "".
 
--  ``SRC_URI``: The ``${``\ :term:`PN`\ ``}``,
+-  :term:`SRC_URI`: The ``${``\ :term:`PN`\ ``}``,
    ``${``\ :term:`PF`\ ``}``,
    ``${``\ :term:`P`\ ``}``, and ``FILE_DIRNAME`` directories
    have been dropped from the default value of the
diff --git a/documentation/ref-manual/migration-1.5.rst b/documentation/ref-manual/migration-1.5.rst
index c772e51b5..079913fbc 100644
--- a/documentation/ref-manual/migration-1.5.rst
+++ b/documentation/ref-manual/migration-1.5.rst
@@ -68,7 +68,7 @@ The following changes have been made that relate to BitBake:
 -  ``${``\ :term:`P`\ ``}`` and
    ``${``\ :term:`PF`\ ``}`` are no longer added to
    :term:`PROVIDES` by default in ``bitbake.conf``.
-   These version-specific ``PROVIDES`` items were seldom used.
+   These version-specific :term:`PROVIDES` items were seldom used.
    Attempting to use them could result in two versions being built
    simultaneously rather than just one version due to the way BitBake
    resolves dependencies.
@@ -84,9 +84,9 @@ The following changes have been made to the package QA checks:
    :term:`WARN_QA` values in your configuration, check
    that they contain all of the issues that you wish to be reported.
    Previous Yocto Project versions contained a bug that meant that any
-   item not mentioned in ``ERROR_QA`` or ``WARN_QA`` would be treated as
+   item not mentioned in :term:`ERROR_QA` or :term:`WARN_QA` would be treated as
    a warning. Consequently, several important items were not already in
-   the default value of ``WARN_QA``. All of the possible QA checks are
+   the default value of :term:`WARN_QA`. All of the possible QA checks are
    now documented in the ":ref:`insane.bbclass <ref-classes-insane>`"
    section.
 
@@ -97,7 +97,7 @@ The following changes have been made to the package QA checks:
 
 -  If you are using the ``buildhistory`` class, the check for the package
    version going backwards is now controlled using a standard QA check.
-   Thus, if you have customized your ``ERROR_QA`` or ``WARN_QA`` values
+   Thus, if you have customized your :term:`ERROR_QA` or :term:`WARN_QA` values
    and still wish to have this check performed, you should add
    "version-going-backwards" to your value for one or the other
    variables depending on how you wish it to be handled. See the
@@ -129,7 +129,7 @@ The following directory changes exist:
 -  When buildhistory is enabled, its output is now written under the
    :term:`Build Directory` rather than
    :term:`TMPDIR`. Doing so makes it easier to delete
-   ``TMPDIR`` and preserve the build history. Additionally, data for
+   :term:`TMPDIR` and preserve the build history. Additionally, data for
    produced SDKs is now split by :term:`IMAGE_NAME`.
 
 -  The ``pkgdata`` directory produced as part of the packaging process
@@ -157,20 +157,20 @@ major issue in the way the values are used.
 The following changes have been made that relate to
 :term:`IMAGE_FEATURES`:
 
--  The value of ``IMAGE_FEATURES`` is now validated to ensure invalid
+-  The value of :term:`IMAGE_FEATURES` is now validated to ensure invalid
    feature items are not added. Some users mistakenly add package names
    to this variable instead of using
    :term:`IMAGE_INSTALL` in order to have the
    package added to the image, which does not work. This change is
-   intended to catch those kinds of situations. Valid ``IMAGE_FEATURES``
+   intended to catch those kinds of situations. Valid :term:`IMAGE_FEATURES`
    are drawn from ``PACKAGE_GROUP`` definitions,
    :term:`COMPLEMENTARY_GLOB` and a new
-   "validitems" varflag on ``IMAGE_FEATURES``. The "validitems" varflag
+   "validitems" varflag on :term:`IMAGE_FEATURES`. The "validitems" varflag
    change allows additional features to be added if they are not
    provided using the previous two mechanisms.
 
--  The previously deprecated "apps-console-core" ``IMAGE_FEATURES`` item
-   is no longer supported. Add "splash" to ``IMAGE_FEATURES`` if you
+-  The previously deprecated "apps-console-core" :term:`IMAGE_FEATURES` item
+   is no longer supported. Add "splash" to :term:`IMAGE_FEATURES` if you
    wish to have the splash screen enabled, since this is all that
    apps-console-core was doing.
 
@@ -285,7 +285,7 @@ Following are changes to ``udev``:
    ``udev-extraconf`` to your image.
 
 -  ``udev`` no longer brings in ``pciutils-ids`` or ``usbutils-ids``
-   through ``RRECOMMENDS``. These are not needed by ``udev`` itself and
+   through :term:`RRECOMMENDS`. These are not needed by ``udev`` itself and
    removing them saves around 350KB.
 
 .. _migration-1.5-removed-renamed-recipes:
diff --git a/documentation/ref-manual/migration-1.6.rst b/documentation/ref-manual/migration-1.6.rst
index 5a18d6310..dbc27bf73 100644
--- a/documentation/ref-manual/migration-1.6.rst
+++ b/documentation/ref-manual/migration-1.6.rst
@@ -61,7 +61,7 @@ If you do not specify a branch, BitBake looks in the default "master" branch.
 
 Alternatively, if you need to bypass this check (e.g. if you are
 fetching a revision corresponding to a tag that is not on any branch),
-you can add ";nobranch=1" to the end of the URL within ``SRC_URI``.
+you can add ";nobranch=1" to the end of the URL within :term:`SRC_URI`.
 
 .. _migration-1.6-bitbake-deps:
 
@@ -134,9 +134,9 @@ OpenEmbedded build system variables, see the ":doc:`/ref-manual/variables`" Chap
 
 :term:`TMPDIR` can no longer be on an NFS mount. NFS does
 not offer full POSIX locking and inode consistency and can cause
-unexpected issues if used to store ``TMPDIR``.
+unexpected issues if used to store :term:`TMPDIR`.
 
-The check for this occurs on startup. If ``TMPDIR`` is detected on an
+The check for this occurs on startup. If :term:`TMPDIR` is detected on an
 NFS mount, an error occurs.
 
 .. _migration-1.6-variable-changes-PRINC:
@@ -274,7 +274,7 @@ In addition to ``core-image-basic`` being renamed,
 Licensing
 ---------
 
-The top-level ``LICENSE`` file has been changed to better describe the
+The top-level :term:`LICENSE` file has been changed to better describe the
 license of the various components of :term:`OpenEmbedded-Core (OE-Core)`. However,
 the licensing itself remains unchanged.
 
@@ -284,7 +284,7 @@ recipes point to this file within
 ``${COREBASE}/LICENSE``) and thus the accompanying checksum must be
 changed from 3f40d7994397109285ec7b81fdeb3b58 to
 4d92cd373abda3937c2bc47fbc49d690. A better alternative is to have
-``LIC_FILES_CHKSUM`` point to a file describing the license that is
+:term:`LIC_FILES_CHKSUM` point to a file describing the license that is
 distributed with the source that the recipe is building, if possible,
 rather than pointing to ``${COREBASE}/LICENSE``.
 
@@ -297,7 +297,7 @@ The "-fpermissive" option has been removed from the default
 :term:`CFLAGS` value. You need to take action on
 individual recipes that fail when building with this option. You need to
 either patch the recipes to fix the issues reported by the compiler, or
-you need to add "-fpermissive" to ``CFLAGS`` in the recipes.
+you need to add "-fpermissive" to :term:`CFLAGS` in the recipes.
 
 .. _migration-1.6-custom-images:
 
diff --git a/documentation/ref-manual/migration-1.7.rst b/documentation/ref-manual/migration-1.7.rst
index 46bf12658..83c217406 100644
--- a/documentation/ref-manual/migration-1.7.rst
+++ b/documentation/ref-manual/migration-1.7.rst
@@ -140,9 +140,9 @@ part of the variable name. This change not only simplifies usage but
 also allows the values of these variables to be appropriately
 incorporated into task signatures and thus trigger the appropriate tasks
 to re-execute when changed. You should replace any references to
-``module_autoload_*`` with ``KERNEL_MODULE_AUTOLOAD``, and add any
+``module_autoload_*`` with :term:`KERNEL_MODULE_AUTOLOAD`, and add any
 modules for which ``module_conf_*`` is specified to
-``KERNEL_MODULE_PROBECONF``.
+:term:`KERNEL_MODULE_PROBECONF`.
 
 .. _migration-1.7-qa-check-changes:
 
diff --git a/documentation/ref-manual/migration-1.8.rst b/documentation/ref-manual/migration-1.8.rst
index 68d5dcf85..a3554cc49 100644
--- a/documentation/ref-manual/migration-1.8.rst
+++ b/documentation/ref-manual/migration-1.8.rst
@@ -153,8 +153,8 @@ The following QA Check and Validation Changes have occurred:
    instead of ``${D}``.
 
 -  :term:`S` now needs to be set to a valid value within a
-   recipe. If ``S`` is not set in the recipe, the directory is not
-   automatically created. If ``S`` does not point to a directory that
+   recipe. If :term:`S` is not set in the recipe, the directory is not
+   automatically created. If :term:`S` does not point to a directory that
    exists at the time the :ref:`ref-tasks-unpack` task
    finishes, a warning will be shown.
 
diff --git a/documentation/ref-manual/migration-2.0.rst b/documentation/ref-manual/migration-2.0.rst
index 8319b0ee3..ccc1761d8 100644
--- a/documentation/ref-manual/migration-2.0.rst
+++ b/documentation/ref-manual/migration-2.0.rst
@@ -25,7 +25,7 @@ and the porting guide at
 https://gcc.gnu.org/gcc-5/porting_to.html.
 
 Alternatively, you can switch back to GCC 4.9 or 4.8 by setting
-``GCCVERSION`` in your configuration, as follows::
+:term:`GCCVERSION` in your configuration, as follows::
 
    GCCVERSION = "4.9%"
 
@@ -244,7 +244,7 @@ The following QA checks have been added:
 
 -  Added an "invalid-packageconfig" check for any options specified in
    :term:`PACKAGECONFIG` that do not match any
-   ``PACKAGECONFIG`` option defined for the recipe.
+   :term:`PACKAGECONFIG` option defined for the recipe.
 
 .. _migration-2.0-miscellaneous:
 
diff --git a/documentation/ref-manual/migration-2.1.rst b/documentation/ref-manual/migration-2.1.rst
index 32d193f0f..f9ce09350 100644
--- a/documentation/ref-manual/migration-2.1.rst
+++ b/documentation/ref-manual/migration-2.1.rst
@@ -28,8 +28,8 @@ characters. This practice is now a requirement as BitBake's datastore
 now assumes lower-case characters in order to give a slight performance
 boost during parsing. In practical terms, this requirement means that
 anything that ends up in :term:`OVERRIDES` must now
-appear in lower-case characters (e.g. values for ``MACHINE``,
-``TARGET_ARCH``, ``DISTRO``, and also recipe names if
+appear in lower-case characters (e.g. values for :term:`MACHINE`,
+:term:`TARGET_ARCH`, :term:`DISTRO`, and also recipe names if
 ``_pn-``\ recipename overrides are to be effective).
 
 .. _migration-2.1-expand-parameter-to-getvar-and-getvarflag-now-mandatory:
@@ -68,7 +68,7 @@ was a historical accident that has required many classes (e.g.
 to work with sensible build systems. When upgrading to the release, you
 must edit any recipe that relies upon this old default by either setting
 ``EXTRA_OEMAKE`` back to "-e MAKEFLAGS=" or by explicitly setting any
-required variable value overrides using ``EXTRA_OEMAKE``, which is
+required variable value overrides using :term:`EXTRA_OEMAKE`, which is
 typically only needed when a Makefile sets a default value for a
 variable that is inappropriate for cross-compilation using the "="
 operator rather than the "?=" operator.
@@ -376,7 +376,7 @@ These additional changes exist:
       run-postinsts
 
    With the Yocto Project 2.1 release, these packages are
-   only removed if "read-only-rootfs" is in ``IMAGE_FEATURES``, since
+   only removed if "read-only-rootfs" is in :term:`IMAGE_FEATURES`, since
    they might still be needed for a read-write image even in the absence
    of a package manager (e.g. if users need to be added, modified, or
    removed at runtime).
diff --git a/documentation/ref-manual/migration-2.2.rst b/documentation/ref-manual/migration-2.2.rst
index a60ce8d52..2c6b3aa5e 100644
--- a/documentation/ref-manual/migration-2.2.rst
+++ b/documentation/ref-manual/migration-2.2.rst
@@ -239,7 +239,7 @@ to catch recipes that are building software without using the
 OpenEmbedded :term:`LDFLAGS`. This change could result in
 seeing some "No GNU_HASH in the elf binary" QA issues when building such
 recipes. You need to fix these recipes so that they use the expected
-``LDFLAGS``. Depending on how the software is built, the build system
+:term:`LDFLAGS`. Depending on how the software is built, the build system
 used by the software (e.g. a Makefile) might need to be patched.
 However, sometimes making this fix is as simple as adding the following
 to the recipe::
@@ -280,7 +280,7 @@ The following changes took place for BitBake:
    :term:`SRC_URI` parameters to specify these. This
    change is more in-line with how the other fetchers work for source
    control systems. Recipes that fetch from Perforce will need to be
-   updated to use ``SRCREV`` in place of specifying the source revision
+   updated to use :term:`SRCREV` in place of specifying the source revision
    within ``SRC_URI``.
 
 -  Some of BitBake's internal code structures for accessing the recipe
@@ -297,7 +297,7 @@ The following changes took place for BitBake:
    to cause any problems for most users. However, the setscene
    verification function as pointed to by
    ``BB_SETSCENE_VERIFY_FUNCTION`` needed to change signature.
-   Consequently, a new variable named ``BB_SETSCENE_VERIFY_FUNCTION2``
+   Consequently, a new variable named :term:`BB_SETSCENE_VERIFY_FUNCTION2`
    has been added allowing multiple versions of BitBake to work with
    suitably written metadata, which includes OpenEmbedded-Core and Poky.
    Anyone with custom BitBake task scheduler code might also need to
diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation/ref-manual/migration-2.3.rst
index dfbda612a..bb5d7c949 100644
--- a/documentation/ref-manual/migration-2.3.rst
+++ b/documentation/ref-manual/migration-2.3.rst
@@ -35,7 +35,7 @@ Consider the following:
    As an example, see the ``dbus`` recipe. You will see that this recipe
    has a ``pkg_postinst`` that calls ``systemctl`` if "systemd" is in
    :term:`DISTRO_FEATURES`. In the example,
-   ``systemd-systemctl-native`` is added to ``PACKAGE_WRITE_DEPS``,
+   ``systemd-systemctl-native`` is added to :term:`PACKAGE_WRITE_DEPS`,
    which is also conditional on "systemd" being in ``DISTRO_FEATURES``.
 
 -  Examine Recipes that Use ``SSTATEPOSTINSTFUNCS``: You need to
@@ -136,7 +136,7 @@ The following changes to scripts took place:
    removed because the script was found to be deleting files it should
    not have, which lead to broken build trees. Rather than trying to
    delete portions of :term:`TMPDIR` and getting it wrong,
-   it is recommended that you delete ``TMPDIR`` and have it restored
+   it is recommended that you delete :term:`TMPDIR` and have it restored
    from shared state (sstate) on subsequent builds.
 
 -  ``wipe-sysroot``: The ``wipe-sysroot`` script has been removed as
@@ -200,10 +200,10 @@ The following changes took place for BitBake:
    section in the BitBake
    User Manual for additional information.
 
--  ``BB_SETSCENE_VERIFY_FUNCTION`` and ``BB_SETSCENE_VERIFY_FUNCTION2``
+-  ``BB_SETSCENE_VERIFY_FUNCTION`` and :term:`BB_SETSCENE_VERIFY_FUNCTION2`
    Removed: Because the mechanism they were part of is no longer
    necessary with recipe-specific sysroots, the
-   ``BB_SETSCENE_VERIFY_FUNCTION`` and ``BB_SETSCENE_VERIFY_FUNCTION2``
+   ``BB_SETSCENE_VERIFY_FUNCTION`` and :term:`BB_SETSCENE_VERIFY_FUNCTION2`
    variables have been removed.
 
 .. _migration-2.3-absolute-symlinks:
@@ -426,10 +426,10 @@ The following miscellaneous changes have occurred:
 
 -  If the :term:`DISTRO_VERSION` value contains
    the value of the :term:`DATE` variable, which is the
-   default between Poky releases, the ``DATE`` value is explicitly
+   default between Poky releases, the :term:`DATE` value is explicitly
    excluded from ``/etc/issue`` and ``/etc/issue.net``, which is
    displayed at the login prompt, in order to avoid conflicts with
-   Multilib enabled. Regardless, the ``DATE`` value is inaccurate if the
+   Multilib enabled. Regardless, the :term:`DATE` value is inaccurate if the
    ``base-files`` recipe is restored from shared state (sstate) rather
    than rebuilt.
 
@@ -451,7 +451,7 @@ The following miscellaneous changes have occurred:
    tools.
 
 -  The ``USE_LDCONFIG`` variable has been replaced with the "ldconfig"
-   ``DISTRO_FEATURES`` feature. Distributions that previously set::
+   :term:`DISTRO_FEATURES` feature. Distributions that previously set::
 
       USE_LDCONFIG = "0"
 
@@ -494,12 +494,12 @@ The following miscellaneous changes have occurred:
    information.
 
 -  All native and nativesdk recipes now use a separate
-   ``DISTRO_FEATURES`` value instead of sharing the value used by
+   :term:`DISTRO_FEATURES` value instead of sharing the value used by
    recipes for the target, in order to avoid unnecessary rebuilds.
 
-   The ``DISTRO_FEATURES`` for ``native`` recipes is
+   The :term:`DISTRO_FEATURES` for ``native`` recipes is
    :term:`DISTRO_FEATURES_NATIVE` added to
-   an intersection of ``DISTRO_FEATURES`` and
+   an intersection of :term:`DISTRO_FEATURES` and
    :term:`DISTRO_FEATURES_FILTER_NATIVE`.
 
    For nativesdk recipes, the corresponding variables are
diff --git a/documentation/ref-manual/migration-2.4.rst b/documentation/ref-manual/migration-2.4.rst
index 2ba17e0ed..11eaecc61 100644
--- a/documentation/ref-manual/migration-2.4.rst
+++ b/documentation/ref-manual/migration-2.4.rst
@@ -63,7 +63,7 @@ occurred:
 
    -  The ``ionice`` program is now packaged in a separate
       "util-linux-ionice" package. The main ``util-linux`` package has a
-      recommended runtime dependency (i.e. ``RRECOMMENDS``) on the
+      recommended runtime dependency (i.e. :term:`RRECOMMENDS`) on the
       ``util-linux-ionice`` package.
 
 -  ``initscripts``: The ``sushell`` program is now packaged in a
@@ -71,7 +71,7 @@ occurred:
    systems to pull ``sushell`` in when ``selinux`` is enabled. The
    change also eliminates needing to pull in the entire ``initscripts``
    package. The main ``initscripts`` package has a runtime dependency
-   (i.e. ``RDEPENDS``) on the ``sushell`` package when "selinux" is in
+   (i.e. :term:`RDEPENDS`) on the ``sushell`` package when "selinux" is in
    ``DISTRO_FEATURES``.
 
 -  ``glib-2.0``: The ``glib-2.0`` package now has a recommended
diff --git a/documentation/ref-manual/migration-2.5.rst b/documentation/ref-manual/migration-2.5.rst
index 86a0da9c4..7758bebc3 100644
--- a/documentation/ref-manual/migration-2.5.rst
+++ b/documentation/ref-manual/migration-2.5.rst
@@ -281,7 +281,7 @@ The following are additional changes:
    ``IMAGE_FSTYPES``.
 
 -  Recipes with an unconditional dependency on ``libpam`` are only
-   buildable with ``pam`` in ``DISTRO_FEATURES``. If the dependency is
+   buildable with ``pam`` in :term:`DISTRO_FEATURES`. If the dependency is
    truly optional then it is recommended that the dependency be
    conditional upon ``pam`` being in ``DISTRO_FEATURES``.
 
diff --git a/documentation/ref-manual/migration-2.6.rst b/documentation/ref-manual/migration-2.6.rst
index d1c6c0c5f..ed664ec7c 100644
--- a/documentation/ref-manual/migration-2.6.rst
+++ b/documentation/ref-manual/migration-2.6.rst
@@ -156,11 +156,11 @@ Image/Kernel Artifact Naming Changes
 The following changes have been made:
 
 -  Name variables (e.g. :term:`IMAGE_NAME`) use a new
-   ``IMAGE_VERSION_SUFFIX`` variable instead of
-   :term:`DATETIME`. Using ``IMAGE_VERSION_SUFFIX``
+   :term:`IMAGE_VERSION_SUFFIX` variable instead of
+   :term:`DATETIME`. Using :term:`IMAGE_VERSION_SUFFIX`
    allows easier and more direct changes.
 
-   The ``IMAGE_VERSION_SUFFIX`` variable is set in the ``bitbake.conf``
+   The :term:`IMAGE_VERSION_SUFFIX` variable is set in the ``bitbake.conf``
    configuration file as follows::
 
       IMAGE_VERSION_SUFFIX = "-${DATETIME}"
@@ -212,19 +212,19 @@ The following changes have been made:
 The :term:`SERIAL_CONSOLE` variable has been
 functionally replaced by the
 :term:`SERIAL_CONSOLES` variable for some time.
-With the Yocto Project 2.6 release, ``SERIAL_CONSOLE`` has been
+With the Yocto Project 2.6 release, :term:`SERIAL_CONSOLE` has been
 officially deprecated.
 
-``SERIAL_CONSOLE`` will continue to work as before for the 2.6 release.
+:term:`SERIAL_CONSOLE` will continue to work as before for the 2.6 release.
 However, for the sake of future compatibility, it is recommended that
-you replace all instances of ``SERIAL_CONSOLE`` with
-``SERIAL_CONSOLES``.
+you replace all instances of :term:`SERIAL_CONSOLE` with
+:term:`SERIAL_CONSOLES`.
 
 .. note::
 
-   The only difference in usage is that ``SERIAL_CONSOLES``
+   The only difference in usage is that :term:`SERIAL_CONSOLES`
    expects entries to be separated using semicolons as compared to
-   ``SERIAL_CONSOLE``, which expects spaces.
+   :term:`SERIAL_CONSOLE`, which expects spaces.
 
 .. _migration-2.6-poky-sets-unknown-configure-option-to-qa-error:
 
@@ -387,14 +387,14 @@ QEMU (i.e. "qemu-usermode" is in
 default).
 
 If you wish to disable Python profile-guided optimization regardless of
-the value of ``MACHINE_FEATURES``, then ensure that
+the value of :term:`MACHINE_FEATURES`, then ensure that
 :term:`PACKAGECONFIG` for the ``python3`` recipe
 does not contain "pgo". You could accomplish the latter using the
 following at the configuration level::
 
    PACKAGECONFIG_remove_pn-python3 = "pgo"
 
-Alternatively, you can set ``PACKAGECONFIG`` using an append file
+Alternatively, you can set :term:`PACKAGECONFIG` using an append file
 for the ``python3`` recipe.
 
 .. _migration-2.6-miscellaneous-changes:
diff --git a/documentation/ref-manual/migration-2.7.rst b/documentation/ref-manual/migration-2.7.rst
index 1be4d5d5b..2c9bf69f4 100644
--- a/documentation/ref-manual/migration-2.7.rst
+++ b/documentation/ref-manual/migration-2.7.rst
@@ -91,7 +91,7 @@ This section provides information about packaging changes.
    package_name\ ``-src``). If you are currently using ``dbg-pkgs`` in
    :term:`IMAGE_FEATURES` to bring in debug
    symbols and you still need the sources, you must now also add
-   ``src-pkgs`` to ``IMAGE_FEATURES``. Source packages remain in the
+   ``src-pkgs`` to :term:`IMAGE_FEATURES`. Source packages remain in the
    target portion of the SDK by default, unless you have set your own
    value for :term:`SDKIMAGE_FEATURES` that
    does not include ``src-pkgs``.
diff --git a/documentation/ref-manual/migration-3.1.rst b/documentation/ref-manual/migration-3.1.rst
index 7822285a8..8a403ff58 100644
--- a/documentation/ref-manual/migration-3.1.rst
+++ b/documentation/ref-manual/migration-3.1.rst
@@ -260,7 +260,7 @@ Miscellaneous changes
 ---------------------
 
 -  The undocumented ``SRC_DISTRIBUTE_LICENSES`` variable has now been
-   removed in favour of a new ``AVAILABLE_LICENSES`` variable which is
+   removed in favour of a new :term:`AVAILABLE_LICENSES` variable which is
    dynamically set based upon license files found in
    ``${COMMON_LICENSE_DIR}`` and ``${LICENSE_PATH}``.
 
diff --git a/documentation/ref-manual/migration-3.2.rst b/documentation/ref-manual/migration-3.2.rst
index 956a56f62..fb420fc20 100644
--- a/documentation/ref-manual/migration-3.2.rst
+++ b/documentation/ref-manual/migration-3.2.rst
@@ -62,10 +62,10 @@ There is a possible complication where some existing recipe may break, for
 example, a recipe was found to be writing to ``${B}/install`` for
 ``make install`` in ``do_install`` and since ``${B}`` is listed as not to be tracked,
 there were errors trying to ``chown root`` for files in this location. Another
-example was the ``tcl`` recipe where the source directory ``S`` is set to a
+example was the ``tcl`` recipe where the source directory :term:`S` is set to a
 subdirectory of the source tree but files were written out to the directory
 structure above that subdirectory. For these types of cases in your own recipes,
-extend ``PSEUDO_IGNORE_PATHS`` to cover additional paths that pseudo should not
+extend :term:`PSEUDO_IGNORE_PATHS` to cover additional paths that pseudo should not
 be monitoring.
 
 In addition, pseudo's behaviour on mismatches has now been changed - rather
@@ -207,7 +207,7 @@ files into a subdirectory and reference that instead.
 deploy class now cleans ``DEPLOYDIR`` before ``do_deploy``
 ----------------------------------------------------------
 
-``do_deploy`` as implemented in the :ref:`deploy <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before running, just as ``do_install`` cleans up ${:term:`D`} before running. This reduces the risk of ``DEPLOYDIR`` being accidentally contaminated by files from previous runs, possibly even with different config, in case of incremental builds.
+``do_deploy`` as implemented in the :ref:`deploy <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before running, just as ``do_install`` cleans up ${:term:`D`} before running. This reduces the risk of :term:`DEPLOYDIR` being accidentally contaminated by files from previous runs, possibly even with different config, in case of incremental builds.
 
 Most recipes and classes that inherit the ``deploy`` class or interact with ``do_deploy`` are unlikely to be affected by this unless they add ``prefuncs`` to ``do_deploy`` *which also* put files into ``${DEPLOYDIR}`` - these should be refactored to use ``do_deploy_prepend`` instead.
 
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 2e98713a2..a105acc2c 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -88,7 +88,7 @@ Errors and Warnings
    A file-level dependency has been identified from the specified
    package on the specified files, but there is no explicit
    corresponding entry in :term:`RDEPENDS`. If
-   particular files are required at runtime then ``RDEPENDS`` should be
+   particular files are required at runtime then :term:`RDEPENDS` should be
    declared in the recipe to ensure the packages providing them are
    built.
 
@@ -104,7 +104,7 @@ Errors and Warnings
    :term:`RDEPENDS` value being added at the packaging
    stage rather than up front, which is usually automatic based on the
    contents of the package. In most cases, you should change the recipe
-   to add an explicit ``RDEPENDS`` for the dependency.
+   to add an explicit :term:`RDEPENDS` for the dependency.
 
     
 .. _qa-check-dev-so:
@@ -152,7 +152,7 @@ Errors and Warnings
    not explicitly add the ``.debug`` directory to the ``-dbg`` package.
    If this is the case, add the ``.debug`` directory explicitly to
    ``FILES_${PN}-dbg``. See :term:`FILES` for additional
-   information on ``FILES``.
+   information on :term:`FILES`.
 
     
 .. _qa-check-arch:
@@ -235,9 +235,9 @@ Errors and Warnings
 
    This indicates that binaries produced when building the recipe have
    not been linked with the :term:`LDFLAGS` options
-   provided by the build system. Check to be sure that the ``LDFLAGS``
+   provided by the build system. Check to be sure that the :term:`LDFLAGS`
    variable is being passed to the linker command. A common workaround
-   for this situation is to pass in ``LDFLAGS`` using
+   for this situation is to pass in :term:`LDFLAGS` using
    :term:`TARGET_CC_ARCH` within the recipe as
    follows::
 
@@ -403,7 +403,7 @@ Errors and Warnings
    If your recipe name does not match this, or you add packages to
    :term:`PACKAGES` that do not conform to the
    convention, then you will receive this error. Rename your recipe. Or,
-   if you have added a non-conforming package name to ``PACKAGES``,
+   if you have added a non-conforming package name to :term:`PACKAGES`,
    change the package name appropriately.
 
     
@@ -431,13 +431,13 @@ Errors and Warnings
 
    The specified recipe has a name (:term:`PN`) value that
    appears in :term:`OVERRIDES`. If a recipe is named
-   such that its ``PN`` value matches something already in ``OVERRIDES``
-   (e.g. ``PN`` happens to be the same as :term:`MACHINE`
+   such that its :term:`PN` value matches something already in :term:`OVERRIDES`
+   (e.g. :term:`PN` happens to be the same as :term:`MACHINE`
    or :term:`DISTRO`), it can have unexpected
    consequences. For example, assignments such as
    ``FILES_${PN} = "xyz"`` effectively turn into ``FILES = "xyz"``.
-   Rename your recipe (or if ``PN`` is being set explicitly, change the
-   ``PN`` value) so that the conflict does not occur. See
+   Rename your recipe (or if :term:`PN` is being set explicitly, change the
+   :term:`PN` value) so that the conflict does not occur. See
    :term:`FILES` for additional information.
 
     
@@ -464,7 +464,7 @@ Errors and Warnings
    This check looks for instances of setting ``DEPENDS_${PN}``
    which is erroneous (:term:`DEPENDS` is a recipe-wide variable and thus
    it is not correct to specify it for a particular package, nor will such
-   an assignment actually work.) Set ``DEPENDS`` instead.
+   an assignment actually work.) Set :term:`DEPENDS` instead.
 
 
 .. _qa-check-already-stripped:
@@ -499,7 +499,7 @@ Errors and Warnings
 
    Package names must appear only once in the
    :term:`PACKAGES` variable. You might receive this
-   error if you are attempting to add a package to ``PACKAGES`` that is
+   error if you are attempting to add a package to :term:`PACKAGES` that is
    already in the variable's value.
 
     
@@ -523,7 +523,7 @@ Errors and Warnings
    in an image later on in the build process. You need to do one of the
    following:
 
-   -  Add the files to ``FILES`` for the package you want them to appear
+   -  Add the files to :term:`FILES` for the package you want them to appear
       in (e.g. ``FILES_${``\ :term:`PN`\ ``}`` for the main
       package).
 
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 36c9efc1e..5f00edb06 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -251,9 +251,9 @@ variables are hard-coded for various reasons but such variables are
 relatively rare.
 
 At a minimum, you would normally edit this file to select the target
-``MACHINE``, which package types you wish to use
+:term:`MACHINE`, which package types you wish to use
 (:term:`PACKAGE_CLASSES`), and the location from
-which you want to access downloaded files (``DL_DIR``).
+which you want to access downloaded files (:term:`DL_DIR`).
 
 If ``local.conf`` is not present when you start the build, the
 OpenEmbedded build system creates it from ``local.conf.sample`` when you
@@ -336,7 +336,7 @@ the build.
 This directory contains downloaded upstream source tarballs. You can
 reuse the directory for multiple builds or move the directory to another
 location. You can control the location of this directory through the
-``DL_DIR`` variable.
+:term:`DL_DIR` variable.
 
 .. _structure-build-sstate-cache:
 
@@ -346,7 +346,7 @@ location. You can control the location of this directory through the
 This directory contains the shared state cache. You can reuse the
 directory for multiple builds or move the directory to another location.
 You can control the location of this directory through the
-``SSTATE_DIR`` variable.
+:term:`SSTATE_DIR` variable.
 
 .. _structure-build-tmp:
 
@@ -548,7 +548,7 @@ section in the Yocto Project Overview and Concepts Manual.
 ------------------
 
 This directory contains general logs that are not otherwise placed using
-the package's ``WORKDIR``. Examples of logs are the output from the
+the package's :term:`WORKDIR`. Examples of logs are the output from the
 ``do_check_pkg`` or ``do_distro_check`` tasks. Running a build does not
 necessarily mean this directory is created.
 
@@ -569,7 +569,7 @@ It is worth considering the structure of a typical work directory. As an
 example, consider ``linux-yocto-kernel-3.0`` on the machine ``qemux86``
 built within the Yocto Project. For this package, a work directory of
 ``tmp/work/qemux86-poky-linux/linux-yocto/3.0+git1+<.....>``, referred
-to as the ``WORKDIR``, is created. Within this directory, the source is
+to as the :term:`WORKDIR`, is created. Within this directory, the source is
 unpacked to ``linux-qemux86-standard-build`` and then patched by Quilt.
 (See the ":ref:`dev-manual/common-tasks:using quilt in your workflow`" section in
 the Yocto Project Development Tasks Manual for more information.) Within
@@ -577,7 +577,7 @@ the ``linux-qemux86-standard-build`` directory, standard Quilt
 directories ``linux-3.0/patches`` and ``linux-3.0/.pc`` are created, and
 standard Quilt commands can be used.
 
-There are other directories generated within ``WORKDIR``. The most
+There are other directories generated within :term:`WORKDIR`. The most
 important directory is ``WORKDIR/temp/``, which has log files for each
 task (``log.do_*.pid``) and contains the scripts BitBake runs for each
 task (``run.do_*.pid``). The ``WORKDIR/image/`` directory is where "make
@@ -709,7 +709,7 @@ support for a new machine to the Yocto Project, look in this directory.
 
 The contents of this directory controls any distribution-specific
 configurations. For the Yocto Project, the ``defaultsetup.conf`` is the
-main file here. This directory includes the versions and the ``SRCDATE``
+main file here. This directory includes the versions and the :term:`SRCDATE`
 definitions for applications that are configured here. An example of an
 alternative configuration might be ``poky-bleeding.conf``. Although this
 file mainly inherits its configuration from Poky.
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 5bceb79b8..970b08394 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -57,7 +57,7 @@ the current working directory set to ``${``\ :term:`B`\ ``}``.
 The default behavior of this task is to run ``oe_runmake clean`` if a
 makefile (``Makefile``, ``makefile``, or ``GNUmakefile``) is found and
 :term:`CLEANBROKEN` is not set to "1". If no such
-file is found or the ``CLEANBROKEN`` variable is set to "1", the
+file is found or the :term:`CLEANBROKEN` variable is set to "1", the
 ``do_configure`` task does nothing.
 
 .. _ref-tasks-configure_ptest_base:
@@ -308,17 +308,17 @@ This recipe has two patch files located here::
 
    poky/meta/recipes-connectivity/bluez5/bluez5
 
-In the ``bluez5`` recipe, the ``SRC_URI`` statements point to the source
+In the ``bluez5`` recipe, the :term:`SRC_URI` statements point to the source
 and patch files needed to build the package.
 
 .. note::
 
-   In the case for the ``bluez5_5.48.bb`` recipe, the ``SRC_URI`` statements
+   In the case for the ``bluez5_5.48.bb`` recipe, the :term:`SRC_URI` statements
    are from an include file ``bluez5.inc``.
 
 As mentioned earlier, the build system treats files whose file types are
 ``.patch`` and ``.diff`` as patch files. However, you can use the
-"apply=yes" parameter with the ``SRC_URI`` statement to indicate any
+"apply=yes" parameter with the :term:`SRC_URI` statement to indicate any
 file as a patch file::
 
    SRC_URI = " \
@@ -329,7 +329,7 @@ file as a patch file::
 Conversely, if you have a directory full of patch files and you want to
 exclude some so that the ``do_patch`` task does not apply them during
 the patch phase, you can use the "apply=no" parameter with the
-``SRC_URI`` statement::
+:term:`SRC_URI` statement::
 
    SRC_URI = " \
        git://path_to_repo/some_package \
@@ -430,7 +430,7 @@ variable also plays a role in where unpacked source files ultimately
 reside. For more information on how source files are unpacked, see the
 ":ref:`overview-manual/concepts:source fetching`"
 section in the Yocto Project Overview and Concepts Manual and also see
-the ``WORKDIR`` and ``S`` variable descriptions.
+the :term:`WORKDIR` and :term:`S` variable descriptions.
 
 Manually Called Tasks
 =====================
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 0af9af648..54469e507 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -97,11 +97,11 @@ universal, the list includes them just in case:
       .. note::
 
          By default, the Build Directory contains :term:`TMPDIR`, which is a
-         temporary directory the build system uses for its work. ``TMPDIR`` cannot
+         temporary directory the build system uses for its work. :term:`TMPDIR` cannot
          be under NFS. Thus, by default, the Build Directory cannot be under
          NFS. However, if you need the Build Directory to be under NFS, you can
-         set this up by setting ``TMPDIR`` in your ``local.conf`` file to use a local
-         drive. Doing so effectively separates ``TMPDIR`` from :term:`TOPDIR`, which is the
+         set this up by setting :term:`TMPDIR` in your ``local.conf`` file to use a local
+         drive. Doing so effectively separates :term:`TMPDIR` from :term:`TOPDIR`, which is the
          Build Directory.
 
    :term:`Build Host`
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index df6413b68..cb7be99cb 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -63,7 +63,7 @@ system and gives an overview of their function and contents.
       Used by the alternatives system to map duplicated commands to actual
       locations. For example, if the ``bracket`` command provided by the
       ``busybox`` package is duplicated through another package, you must
-      use the ``ALTERNATIVE_LINK_NAME`` variable to specify the actual
+      use the :term:`ALTERNATIVE_LINK_NAME` variable to specify the actual
       location::
 
          ALTERNATIVE_LINK_NAME[bracket] = "/usr/bin/["
@@ -73,7 +73,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         If ``ALTERNATIVE_LINK_NAME`` is not defined, it defaults to ``${bindir}/name``.
+         If :term:`ALTERNATIVE_LINK_NAME` is not defined, it defaults to ``${bindir}/name``.
 
       For more information on the alternatives system, see the
       ":ref:`update-alternatives.bbclass <ref-classes-update-alternatives>`"
@@ -109,11 +109,11 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         If ``ALTERNATIVE_TARGET`` is not defined, it inherits the value
+         If :term:`ALTERNATIVE_TARGET` is not defined, it inherits the value
          from the :term:`ALTERNATIVE_LINK_NAME` variable.
 
-         If ``ALTERNATIVE_LINK_NAME`` and ``ALTERNATIVE_TARGET`` are the
-         same, the target for ``ALTERNATIVE_TARGET`` has "``.{BPN}``"
+         If :term:`ALTERNATIVE_LINK_NAME` and :term:`ALTERNATIVE_TARGET` are the
+         same, the target for :term:`ALTERNATIVE_TARGET` has "``.{BPN}``"
          appended to it.
 
          Finally, if the file referenced has not been renamed, the
@@ -131,8 +131,8 @@ system and gives an overview of their function and contents.
       class, this variable identifies a list of distribution features where
       at least one must be enabled in the current configuration in order
       for the OpenEmbedded build system to build the recipe. In other words,
-      if none of the features listed in ``ANY_OF_DISTRO_FEATURES``
-      appear in ``DISTRO_FEATURES`` within the current configuration, then
+      if none of the features listed in :term:`ANY_OF_DISTRO_FEATURES`
+      appear in :term:`DISTRO_FEATURES` within the current configuration, then
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
       
@@ -174,7 +174,7 @@ system and gives an overview of their function and contents.
       attempt to build. Instead, BitBake assumes these recipes have already
       been built.
 
-      In OpenEmbedded-Core, ``ASSUME_PROVIDED`` mostly specifies native
+      In OpenEmbedded-Core, :term:`ASSUME_PROVIDED` mostly specifies native
       tools that should not be built. An example is ``git-native``, which
       when specified, allows for the Git binary from the host to be used
       rather than building ``git-native``.
@@ -200,7 +200,7 @@ system and gives an overview of their function and contents.
 
    :term:`AUTO_LIBNAME_PKGS`
       When the :ref:`debian <ref-classes-debian>` class is inherited,
-      which is the default behavior, ``AUTO_LIBNAME_PKGS`` specifies which
+      which is the default behavior, :term:`AUTO_LIBNAME_PKGS` specifies which
       packages should be checked for libraries and renamed according to
       Debian library package naming.
 
@@ -213,7 +213,7 @@ system and gives an overview of their function and contents.
       :ref:`syslinux <ref-classes-syslinux>` class checks this variable.
 
    :term:`AUTOREV`
-      When ``SRCREV`` is set to the value of this variable, it specifies to
+      When :term:`SRCREV` is set to the value of this variable, it specifies to
       use the latest source revision in the repository. Here is an example::
 
          SRCREV = "${AUTOREV}"
@@ -224,7 +224,7 @@ system and gives an overview of their function and contents.
       have a kernel recipe that inherits the
       :ref:`kernel <ref-classes-kernel>` class and you use the previous
       statement. In this example, ``${SRCPV}`` does not automatically get
-      into ``PV``. Consequently, you need to change ``PV`` in your recipe
+      into :term:`PV`. Consequently, you need to change :term:`PV` in your recipe
       so that it does contain ``${SRCPV}``.
 
       For more information see the
@@ -238,8 +238,8 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         It is assumed that all changes to ``COMMON_LICENSE_DIR`` and
-         ``LICENSE_PATH`` have been done before ``AVAILABLE_LICENSES``
+         It is assumed that all changes to :term:`COMMON_LICENSE_DIR` and
+         :term:`LICENSE_PATH` have been done before :term:`AVAILABLE_LICENSES`
          is defined (in :ref:`ref-classes-license`).
 
    :term:`AVAILTUNES`
@@ -279,7 +279,7 @@ system and gives an overview of their function and contents.
 
          S = "${WORKDIR}/${BP}"
 
-      You can separate the (``S``) directory and the directory pointed to
+      You can separate the (:term:`S`) directory and the directory pointed to
       by the ``B`` variable. Most Autotools-based recipes support
       separating these directories. The build system defaults to using
       separate directories for ``gcc`` and some kernel recipes.
@@ -289,7 +289,7 @@ system and gives an overview of their function and contents.
       packages are packages installed only through the
       :term:`RRECOMMENDS` variable. You can prevent any
       of these "recommended" packages from being installed by listing them
-      with the ``BAD_RECOMMENDATIONS`` variable::
+      with the :term:`BAD_RECOMMENDATIONS` variable::
 
          BAD_RECOMMENDATIONS = "package_name package_name package_name ..."
 
@@ -314,12 +314,12 @@ system and gives an overview of their function and contents.
 
    :term:`BASE_LIB`
       The library directory name for the CPU or Application Binary
-      Interface (ABI) tune. The ``BASE_LIB`` applies only in the Multilib
+      Interface (ABI) tune. The :term:`BASE_LIB` applies only in the Multilib
       context. See the ":ref:`dev-manual/common-tasks:combining multiple versions of library files into one image`"
       section in the Yocto Project Development Tasks Manual for information
       on Multilib.
 
-      The ``BASE_LIB`` variable is defined in the machine include files in
+      The :term:`BASE_LIB` variable is defined in the machine include files in
       the :term:`Source Directory`. If Multilib is not
       being used, the value defaults to "lib".
 
@@ -332,7 +332,7 @@ system and gives an overview of their function and contents.
       to use to obtain the required source code. Following are
       considerations surrounding this variable:
 
-      -  This host list is only used if ``BB_NO_NETWORK`` is either not set
+      -  This host list is only used if :term:`BB_NO_NETWORK` is either not set
          or set to "0".
 
       -  There is limited support for wildcard matching against the beginning of
@@ -357,14 +357,14 @@ system and gives an overview of their function and contents.
 
       -  Attempts to access networks not in the host list cause a failure.
 
-      Using ``BB_ALLOWED_NETWORKS`` in conjunction with
+      Using :term:`BB_ALLOWED_NETWORKS` in conjunction with
       :term:`PREMIRRORS` is very useful. Adding the host
-      you want to use to ``PREMIRRORS`` results in the source code being
+      you want to use to :term:`PREMIRRORS` results in the source code being
       fetched from an allowed location and avoids raising an error when a
       host that is not allowed is in a :term:`SRC_URI`
       statement. This is because the fetcher does not attempt to use the
-      host listed in ``SRC_URI`` after a successful fetch from the
-      ``PREMIRRORS`` occurs.
+      host listed in :term:`SRC_URI` after a successful fetch from the
+      :term:`PREMIRRORS` occurs.
 
    :term:`BB_DANGLINGAPPENDS_WARNONLY`
       Defines how BitBake handles situations where an append file
@@ -389,7 +389,7 @@ system and gives an overview of their function and contents.
       you to control the build based on these parameters.
 
       Disk space monitoring is disabled by default. To enable monitoring,
-      add the ``BB_DISKMON_DIRS`` variable to your ``conf/local.conf`` file
+      add the :term:`BB_DISKMON_DIRS` variable to your ``conf/local.conf`` file
       found in the :term:`Build Directory`. Use the
       following form:
 
@@ -444,7 +444,7 @@ system and gives an overview of their function and contents.
       variable, the build system also issue a warning when the disk space
       in the ``${SSTATE_DIR}`` directory drops below 1 Gbyte or the number
       of free inodes drops below 100 Kbytes. Subsequent warnings are issued
-      during intervals as defined by the ``BB_DISKMON_WARNINTERVAL``
+      during intervals as defined by the :term:`BB_DISKMON_WARNINTERVAL`
       variable.
 
       The second example stops the build after all currently executing
@@ -461,14 +461,14 @@ system and gives an overview of their function and contents.
       intervals, define the variable in your ``conf/local.conf`` file in
       the :term:`Build Directory`.
 
-      If you are going to use the ``BB_DISKMON_WARNINTERVAL`` variable, you
+      If you are going to use the :term:`BB_DISKMON_WARNINTERVAL` variable, you
       must also use the :term:`BB_DISKMON_DIRS`
       variable and define its action as "WARN". During the build,
       subsequent warnings are issued each time disk space or number of free
       inodes further reduces by the respective interval.
 
-      If you do not provide a ``BB_DISKMON_WARNINTERVAL`` variable and you
-      do use ``BB_DISKMON_DIRS`` with the "WARN" action, the disk
+      If you do not provide a :term:`BB_DISKMON_WARNINTERVAL` variable and you
+      do use :term:`BB_DISKMON_DIRS` with the "WARN" action, the disk
       monitoring interval defaults to the following::
 
          BB_DISKMON_WARNINTERVAL = "50M,5K"
@@ -521,7 +521,7 @@ system and gives an overview of their function and contents.
       ``local.conf`` file in the :term:`Build Directory`.
 
       Once you have the tarballs containing your source files, you can
-      clean up your ``DL_DIR`` directory by deleting any Git or other
+      clean up your :term:`DL_DIR` directory by deleting any Git or other
       source control work directories.
 
    :term:`BB_NUMBER_THREADS`
@@ -529,13 +529,13 @@ system and gives an overview of their function and contents.
       time. The OpenEmbedded build system automatically configures this
       variable to be equal to the number of cores on the build system. For
       example, a system with a dual core processor that also uses
-      hyper-threading causes the ``BB_NUMBER_THREADS`` variable to default
+      hyper-threading causes the :term:`BB_NUMBER_THREADS` variable to default
       to "4".
 
       For single socket systems (i.e. one CPU), you should not have to
       override this variable to gain optimal parallelism during builds.
       However, if you have very large systems that employ multiple physical
-      CPUs, you might want to make sure the ``BB_NUMBER_THREADS`` variable
+      CPUs, you might want to make sure the :term:`BB_NUMBER_THREADS` variable
       is not set higher than "20".
 
       For more information on speeding up builds, see the
@@ -544,7 +544,7 @@ system and gives an overview of their function and contents.
 
    :term:`BB_SERVER_TIMEOUT`
       Specifies the time (in seconds) after which to unload the BitBake
-      server due to inactivity. Set ``BB_SERVER_TIMEOUT`` to determine how
+      server due to inactivity. Set :term:`BB_SERVER_TIMEOUT` to determine how
       long the BitBake server stays resident between invocations.
 
       For example, the following statement in your ``local.conf`` file
@@ -562,7 +562,7 @@ system and gives an overview of their function and contents.
       system; "crosses" such as ``gcc-cross``, which is a compiler built to
       run on the build machine but produces binaries that run on the target
       :term:`MACHINE`; "nativesdk", which targets the SDK
-      machine instead of ``MACHINE``; and "mulitlibs" in the form
+      machine instead of :term:`MACHINE`; and "mulitlibs" in the form
       "``multilib:``\ multilib_name".
 
       To build a different variant of the recipe with a minimal amount of
@@ -573,13 +573,13 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         Internally, the ``BBCLASSEXTEND`` mechanism generates recipe
+         Internally, the :term:`BBCLASSEXTEND` mechanism generates recipe
          variants by rewriting variable values and applying overrides such
          as ``_class-native``. For example, to generate a native version of
          a recipe, a :term:`DEPENDS` on "foo" is rewritten
          to a ``DEPENDS`` on "foo-native".
 
-         Even when using ``BBCLASSEXTEND``, the recipe is only parsed once.
+         Even when using :term:`BBCLASSEXTEND`, the recipe is only parsed once.
          Parsing once adds some limitations. For example, it is not
          possible to include a different file depending on the variant,
          since ``include`` statements are processed when the recipe is
@@ -605,14 +605,14 @@ system and gives an overview of their function and contents.
       - effectively letting you control the precedence for the multiple
       layers. The precedence established through this variable stands
       regardless of a recipe's version (:term:`PV` variable). For
-      example, a layer that has a recipe with a higher ``PV`` value but for
-      which the ``BBFILE_PRIORITY`` is set to have a lower precedence still
+      example, a layer that has a recipe with a higher :term:`PV` value but for
+      which the :term:`BBFILE_PRIORITY` is set to have a lower precedence still
       has a lower precedence.
 
-      A larger value for the ``BBFILE_PRIORITY`` variable results in a
+      A larger value for the :term:`BBFILE_PRIORITY` variable results in a
       higher precedence. For example, the value 6 has a higher precedence
-      than the value 5. If not specified, the ``BBFILE_PRIORITY`` variable
-      is set based on layer dependencies (see the ``LAYERDEPENDS`` variable
+      than the value 5. If not specified, the :term:`BBFILE_PRIORITY` variable
+      is set based on layer dependencies (see the :term:`LAYERDEPENDS` variable
       for more information. The default priority, if unspecified for a
       layer with no dependencies, is the lowest defined priority + 1 (or 1
       if no priorities are defined).
@@ -635,12 +635,12 @@ system and gives an overview of their function and contents.
       Activates content when identified layers are present. You identify
       the layers by the collections that the layers define.
 
-      Use the ``BBFILES_DYNAMIC`` variable to avoid ``.bbappend`` files
+      Use the :term:`BBFILES_DYNAMIC` variable to avoid ``.bbappend`` files
       whose corresponding ``.bb`` file is in a layer that attempts to
       modify other layers through ``.bbappend`` but does not want to
       introduce a hard dependency on those other layers.
 
-      Use the following form for ``BBFILES_DYNAMIC``:
+      Use the following form for :term:`BBFILES_DYNAMIC`:
       collection_name:filename_pattern The following example identifies two
       collection names and two filename patterns::
 
@@ -664,7 +664,7 @@ system and gives an overview of their function and contents.
    :term:`BBINCLUDELOGS_LINES`
       If :term:`BBINCLUDELOGS` is set, specifies the
       maximum number of lines from the task log file to print when
-      reporting a failed task. If you do not set ``BBINCLUDELOGS_LINES``,
+      reporting a failed task. If you do not set :term:`BBINCLUDELOGS_LINES`,
       the entire log is printed.
 
    :term:`BBLAYERS`
@@ -685,7 +685,7 @@ system and gives an overview of their function and contents.
    :term:`BBMASK`
       Prevents BitBake from processing recipes and recipe append files.
 
-      You can use the ``BBMASK`` variable to "hide" these ``.bb`` and
+      You can use the :term:`BBMASK` variable to "hide" these ``.bb`` and
       ``.bbappend`` files. BitBake ignores any recipe or recipe append
       files that match any of the expressions. It is as if BitBake does not
       see them at all. Consequently, matching files are not parsed or
@@ -732,7 +732,7 @@ system and gives an overview of their function and contents.
       ``conf/multiconfig`` directory (e.g.
       build_directory\ ``/conf/multiconfig/configA.conf``).
 
-      For information on how to use ``BBMULTICONFIG`` in an environment
+      For information on how to use :term:`BBMULTICONFIG` in an environment
       that supports building targets with multiple configurations, see the
       ":ref:`dev-manual/common-tasks:building images for multiple targets using multiple configurations`"
       section in the Yocto Project Development Tasks Manual.
@@ -744,7 +744,7 @@ system and gives an overview of their function and contents.
       .. note::
 
          If you run BitBake from a directory outside of the
-         :term:`Build Directory`, you must be sure to set ``BBPATH``
+         :term:`Build Directory`, you must be sure to set :term:`BBPATH`
          to point to the Build Directory. Set the variable as you would any
          environment variable and then run BitBake::
 
@@ -754,7 +754,7 @@ system and gives an overview of their function and contents.
 
 
    :term:`BBSERVER`
-      If defined in the BitBake environment, ``BBSERVER`` points to the
+      If defined in the BitBake environment, :term:`BBSERVER` points to the
       BitBake remote server.
 
       Use the following format to export the variable to the BitBake
@@ -762,9 +762,9 @@ system and gives an overview of their function and contents.
 
          export BBSERVER=localhost:$port
 
-      By default, ``BBSERVER`` also appears in
+      By default, :term:`BBSERVER` also appears in
       :term:`bitbake:BB_HASHBASE_WHITELIST`.
-      Consequently, ``BBSERVER`` is excluded from checksum and dependency
+      Consequently, :term:`BBSERVER` is excluded from checksum and dependency
       data.
 
    :term:`BINCONFIG`
@@ -791,7 +791,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         The ``BINCONFIG_GLOB`` variable uses
+         The :term:`BINCONFIG_GLOB` variable uses
          `shell globbing <https://tldp.org/LDP/abs/html/globbingref.html>`__,
          which is recognition and expansion of wildcards during pattern
          matching. Shell globbing is very similar to
@@ -806,7 +806,7 @@ system and gives an overview of their function and contents.
 
    :term:`BP`
       The base recipe name and version but without any special recipe name
-      suffix (i.e. ``-native``, ``lib64-``, and so forth). ``BP`` is
+      suffix (i.e. ``-native``, ``lib64-``, and so forth). :term:`BP` is
       comprised of the following::
 
          ${BPN}-${PV}
@@ -828,23 +828,23 @@ system and gives an overview of their function and contents.
 
    :term:`BUILD_ARCH`
       Specifies the architecture of the build host (e.g. ``i686``). The
-      OpenEmbedded build system sets the value of ``BUILD_ARCH`` from the
+      OpenEmbedded build system sets the value of :term:`BUILD_ARCH` from the
       machine name reported by the ``uname`` command.
 
    :term:`BUILD_AS_ARCH`
       Specifies the architecture-specific assembler flags for the build
-      host. By default, the value of ``BUILD_AS_ARCH`` is empty.
+      host. By default, the value of :term:`BUILD_AS_ARCH` is empty.
 
    :term:`BUILD_CC_ARCH`
       Specifies the architecture-specific C compiler flags for the build
-      host. By default, the value of ``BUILD_CC_ARCH`` is empty.
+      host. By default, the value of :term:`BUILD_CC_ARCH` is empty.
 
    :term:`BUILD_CCLD`
       Specifies the linker command to be used for the build host when the C
-      compiler is being used as the linker. By default, ``BUILD_CCLD``
+      compiler is being used as the linker. By default, :term:`BUILD_CCLD`
       points to GCC and passes as arguments the value of
       :term:`BUILD_CC_ARCH`, assuming
-      ``BUILD_CC_ARCH`` is set.
+      :term:`BUILD_CC_ARCH` is set.
 
    :term:`BUILD_CFLAGS`
       Specifies the flags to pass to the C compiler when building for the
@@ -866,19 +866,19 @@ system and gives an overview of their function and contents.
 
    :term:`BUILD_FC`
       Specifies the Fortran compiler command for the build host. By
-      default, ``BUILD_FC`` points to Gfortran and passes as arguments the
+      default, :term:`BUILD_FC` points to Gfortran and passes as arguments the
       value of :term:`BUILD_CC_ARCH`, assuming
-      ``BUILD_CC_ARCH`` is set.
+      :term:`BUILD_CC_ARCH` is set.
 
    :term:`BUILD_LD`
       Specifies the linker command for the build host. By default,
-      ``BUILD_LD`` points to the GNU linker (ld) and passes as arguments
+      :term:`BUILD_LD` points to the GNU linker (ld) and passes as arguments
       the value of :term:`BUILD_LD_ARCH`, assuming
-      ``BUILD_LD_ARCH`` is set.
+      :term:`BUILD_LD_ARCH` is set.
 
    :term:`BUILD_LD_ARCH`
       Specifies architecture-specific linker flags for the build host. By
-      default, the value of ``BUILD_LD_ARCH`` is empty.
+      default, the value of :term:`BUILD_LD_ARCH` is empty.
 
    :term:`BUILD_LDFLAGS`
       Specifies the flags to pass to the linker when building for the build
@@ -903,13 +903,13 @@ system and gives an overview of their function and contents.
 
    :term:`BUILD_PREFIX`
       The toolchain binary prefix used for native recipes. The OpenEmbedded
-      build system uses the ``BUILD_PREFIX`` value to set the
+      build system uses the :term:`BUILD_PREFIX` value to set the
       :term:`TARGET_PREFIX` when building for
       ``native`` recipes.
 
    :term:`BUILD_STRIP`
       Specifies the command to be used to strip debugging symbols from
-      binaries produced for the build host. By default, ``BUILD_STRIP``
+      binaries produced for the build host. By default, :term:`BUILD_STRIP`
       points to
       ``${``\ :term:`BUILD_PREFIX`\ ``}strip``.
 
@@ -922,7 +922,7 @@ system and gives an overview of their function and contents.
       on :term:`BUILD_ARCH`,
       :term:`BUILD_VENDOR`, and
       :term:`BUILD_OS`. You do not need to set the
-      ``BUILD_SYS`` variable yourself.
+      :term:`BUILD_SYS` variable yourself.
 
    :term:`BUILD_VENDOR`
       Specifies the vendor name to use when building for the build host.
@@ -933,7 +933,7 @@ system and gives an overview of their function and contents.
       You can define this directory indirectly through the
       :ref:`structure-core-script` script by passing in a Build
       Directory path when you run the script. If you run the script and do
-      not provide a Build Directory path, the ``BUILDDIR`` defaults to
+      not provide a Build Directory path, the :term:`BUILDDIR` defaults to
       ``build`` in the current directory.
 
    :term:`BUILDHISTORY_COMMIT`
@@ -954,12 +954,12 @@ system and gives an overview of their function and contents.
    :term:`BUILDHISTORY_COMMIT_AUTHOR`
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
       class, this variable specifies the author to use for each Git commit.
-      In order for the ``BUILDHISTORY_COMMIT_AUTHOR`` variable to work, the
+      In order for the :term:`BUILDHISTORY_COMMIT_AUTHOR` variable to work, the
       :term:`BUILDHISTORY_COMMIT` variable must
       be set to "1".
 
       Git requires that the value you provide for the
-      ``BUILDHISTORY_COMMIT_AUTHOR`` variable takes the form of "name
+      :term:`BUILDHISTORY_COMMIT_AUTHOR` variable takes the form of "name
       email@host". Providing an email address or host that is not valid
       does not produce an error.
 
@@ -1025,7 +1025,7 @@ system and gives an overview of their function and contents.
       When inheriting the :ref:`buildhistory <ref-classes-buildhistory>`
       class, this variable optionally specifies a remote repository to
       which build history pushes Git changes. In order for
-      ``BUILDHISTORY_PUSH_REPO`` to work,
+      :term:`BUILDHISTORY_PUSH_REPO` to work,
       :term:`BUILDHISTORY_COMMIT` must be set to
       "1".
 
@@ -1066,7 +1066,7 @@ system and gives an overview of their function and contents.
       Points to the location of the directory that holds build statistics
       when you use and enable the
       :ref:`buildstats <ref-classes-buildstats>` class. The
-      ``BUILDSTATS_BASE`` directory defaults to
+      :term:`BUILDSTATS_BASE` directory defaults to
       ``${``\ :term:`TMPDIR`\ ``}/buildstats/``.
 
    :term:`BUSYBOX_SPLIT_SUID`
@@ -1075,7 +1075,7 @@ system and gives an overview of their function and contents.
       ``setuid root``, and one for the remaining features (i.e. those that
       do not require ``setuid root``).
 
-      The ``BUSYBOX_SPLIT_SUID`` variable defaults to "1", which results in
+      The :term:`BUSYBOX_SPLIT_SUID` variable defaults to "1", which results in
       splitting the output executable file. Set the variable to "0" to get
       a single output executable file.
 
@@ -1092,7 +1092,7 @@ system and gives an overview of their function and contents.
       exported to an environment variable and thus made visible to the
       software being built during the compilation step.
 
-      Default initialization for ``CFLAGS`` varies depending on what is
+      Default initialization for :term:`CFLAGS` varies depending on what is
       being built:
 
       -  :term:`TARGET_CFLAGS` when building for the
@@ -1131,12 +1131,12 @@ system and gives an overview of their function and contents.
          FOO_class-native = "native"
          FOO = "other"
 
-      The underlying mechanism behind ``CLASSOVERRIDE`` is simply
+      The underlying mechanism behind :term:`CLASSOVERRIDE` is simply
       that it is included in the default value of
       :term:`OVERRIDES`.
 
    :term:`CLEANBROKEN`
-      If set to "1" within a recipe, ``CLEANBROKEN`` specifies that the
+      If set to "1" within a recipe, :term:`CLEANBROKEN` specifies that the
       ``make clean`` command does not work for the software being built.
       Consequently, the OpenEmbedded build system will not try to run
       ``make clean`` during the :ref:`ref-tasks-configure`
@@ -1185,7 +1185,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         The ``COMPLEMENTARY_GLOB`` variable uses Unix filename pattern matching
+         The :term:`COMPLEMENTARY_GLOB` variable uses Unix filename pattern matching
          (`fnmatch <https://docs.python.org/3/library/fnmatch.html#module-fnmatch>`__),
          which is similar to the Unix style pathname pattern expansion
          (`glob <https://docs.python.org/3/library/glob.html>`__).
@@ -1193,7 +1193,7 @@ system and gives an overview of their function and contents.
       The resulting list of complementary packages is associated with an
       item that can be added to
       :term:`IMAGE_FEATURES`. An example usage of
-      this is the "dev-pkgs" item that when added to ``IMAGE_FEATURES``
+      this is the "dev-pkgs" item that when added to :term:`IMAGE_FEATURES`
       will install -dev packages (containing headers and other development
       files) for every package in the image.
 
@@ -1215,7 +1215,7 @@ system and gives an overview of their function and contents.
 
    :term:`CONF_VERSION`
       Tracks the version of the local configuration file (i.e.
-      ``local.conf``). The value for ``CONF_VERSION`` increments each time
+      ``local.conf``). The value for :term:`CONF_VERSION` increments each time
       ``build/conf/`` compatibility changes.
 
    :term:`CONFFILES`
@@ -1225,28 +1225,28 @@ system and gives an overview of their function and contents.
       files you have changed after the original installation and that you
       now want to remain unchanged are overwritten. In other words,
       editable files might exist in the package that you do not want reset
-      as part of the package update process. You can use the ``CONFFILES``
+      as part of the package update process. You can use the :term:`CONFFILES`
       variable to list the files in the package that you wish to prevent
       the PMS from overwriting during this update process.
 
-      To use the ``CONFFILES`` variable, provide a package name override
+      To use the :term:`CONFFILES` variable, provide a package name override
       that identifies the resulting package. Then, provide a
       space-separated list of files. Here is an example::
 
          CONFFILES_${PN} += "${sysconfdir}/file1 \
              ${sysconfdir}/file2 ${sysconfdir}/file3"
 
-      There is a relationship between the ``CONFFILES`` and ``FILES``
-      variables. The files listed within ``CONFFILES`` must be a subset of
-      the files listed within ``FILES``. Because the configuration files
-      you provide with ``CONFFILES`` are simply being identified so that
+      There is a relationship between the :term:`CONFFILES` and :term:`FILES`
+      variables. The files listed within :term:`CONFFILES` must be a subset of
+      the files listed within :term:`FILES`. Because the configuration files
+      you provide with :term:`CONFFILES` are simply being identified so that
       the PMS will not overwrite them, it makes sense that the files must
-      already be included as part of the package through the ``FILES``
+      already be included as part of the package through the :term:`FILES`
       variable.
 
       .. note::
 
-         When specifying paths as part of the ``CONFFILES`` variable, it is
+         When specifying paths as part of the :term:`CONFFILES` variable, it is
          good practice to use appropriate path variables.
          For example, ``${sysconfdir}`` rather than ``/etc`` or ``${bindir}``
          rather than ``/usr/bin``. You can find a list of these variables at
@@ -1259,7 +1259,7 @@ system and gives an overview of their function and contents.
       variable as an environment variable. By default, the variable is set
       to null ("").
 
-      The ``CONFIG_INITRAMFS_SOURCE`` can be either a single cpio archive
+      The :term:`CONFIG_INITRAMFS_SOURCE` can be either a single cpio archive
       with a ``.cpio`` suffix or a space-separated list of directories and
       files for building the initramfs image. A cpio archive should contain
       a filesystem archive to be used as an initramfs image. Directories
@@ -1287,8 +1287,8 @@ system and gives an overview of their function and contents.
       :ref:`features_check <ref-classes-features_check>`
       class, this variable identifies distribution features that would be
       in conflict should the recipe be built. In other words, if the
-      ``CONFLICT_DISTRO_FEATURES`` variable lists a feature that also
-      appears in ``DISTRO_FEATURES`` within the current configuration, then
+      :term:`CONFLICT_DISTRO_FEATURES` variable lists a feature that also
+      appears in :term:`DISTRO_FEATURES` within the current configuration, then
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
@@ -1297,16 +1297,16 @@ system and gives an overview of their function and contents.
       archived by the :ref:`archiver <ref-classes-archiver>` class. In
       other words, if a license in a recipe's
       :term:`LICENSE` value is in the value of
-      ``COPYLEFT_LICENSE_EXCLUDE``, then its source is not archived by the
+      :term:`COPYLEFT_LICENSE_EXCLUDE`, then its source is not archived by the
       class.
 
       .. note::
 
-         The ``COPYLEFT_LICENSE_EXCLUDE`` variable takes precedence over the
+         The :term:`COPYLEFT_LICENSE_EXCLUDE` variable takes precedence over the
          :term:`COPYLEFT_LICENSE_INCLUDE` variable.
 
       The default value, which is "CLOSED Proprietary", for
-      ``COPYLEFT_LICENSE_EXCLUDE`` is set by the
+      :term:`COPYLEFT_LICENSE_EXCLUDE` is set by the
       :ref:`copyleft_filter <ref-classes-copyleft_filter>` class, which
       is inherited by the ``archiver`` class.
 
@@ -1314,7 +1314,7 @@ system and gives an overview of their function and contents.
       A space-separated list of licenses to include in the source archived
       by the :ref:`archiver <ref-classes-archiver>` class. In other
       words, if a license in a recipe's :term:`LICENSE`
-      value is in the value of ``COPYLEFT_LICENSE_INCLUDE``, then its
+      value is in the value of :term:`COPYLEFT_LICENSE_INCLUDE`, then its
       source is archived by the class.
 
       The default value is set by the
@@ -1325,28 +1325,28 @@ system and gives an overview of their function and contents.
    :term:`COPYLEFT_PN_EXCLUDE`
       A list of recipes to exclude in the source archived by the
       :ref:`archiver <ref-classes-archiver>` class. The
-      ``COPYLEFT_PN_EXCLUDE`` variable overrides the license inclusion and
+      :term:`COPYLEFT_PN_EXCLUDE` variable overrides the license inclusion and
       exclusion caused through the
       :term:`COPYLEFT_LICENSE_INCLUDE` and
       :term:`COPYLEFT_LICENSE_EXCLUDE`
       variables, respectively.
 
       The default value, which is "" indicating to not explicitly exclude
-      any recipes by name, for ``COPYLEFT_PN_EXCLUDE`` is set by the
+      any recipes by name, for :term:`COPYLEFT_PN_EXCLUDE` is set by the
       :ref:`copyleft_filter <ref-classes-copyleft_filter>` class, which
       is inherited by the ``archiver`` class.
 
    :term:`COPYLEFT_PN_INCLUDE`
       A list of recipes to include in the source archived by the
       :ref:`archiver <ref-classes-archiver>` class. The
-      ``COPYLEFT_PN_INCLUDE`` variable overrides the license inclusion and
+      :term:`COPYLEFT_PN_INCLUDE` variable overrides the license inclusion and
       exclusion caused through the
       :term:`COPYLEFT_LICENSE_INCLUDE` and
       :term:`COPYLEFT_LICENSE_EXCLUDE`
       variables, respectively.
 
       The default value, which is "" indicating to not explicitly include
-      any recipes by name, for ``COPYLEFT_PN_INCLUDE`` is set by the
+      any recipes by name, for :term:`COPYLEFT_PN_INCLUDE` is set by the
       :ref:`copyleft_filter <ref-classes-copyleft_filter>` class, which
       is inherited by the ``archiver`` class.
 
@@ -1356,7 +1356,7 @@ system and gives an overview of their function and contents.
       Recipe types are ``target``, ``native``, ``nativesdk``, ``cross``,
       ``crosssdk``, and ``cross-canadian``.
 
-      The default value, which is "target*", for ``COPYLEFT_RECIPE_TYPES``
+      The default value, which is "target*", for :term:`COPYLEFT_RECIPE_TYPES`
       is set by the :ref:`copyleft_filter <ref-classes-copyleft_filter>`
       class, which is inherited by the ``archiver`` class.
 
@@ -1370,7 +1370,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         The ``COPY_LIC_DIRS`` does not offer a path for adding licenses for
+         The :term:`COPY_LIC_DIRS` does not offer a path for adding licenses for
          newly installed packages to an image, which might be most suitable for
          read-only filesystems that cannot be upgraded. See the
          :term:`LICENSE_CREATE_PACKAGE` variable for additional information.
@@ -1386,7 +1386,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         The ``COPY_LIC_MANIFEST`` does not offer a path for adding licenses for
+         The :term:`COPY_LIC_MANIFEST` does not offer a path for adding licenses for
          newly installed packages to an image, which might be most suitable for
          read-only filesystems that cannot be upgraded. See the
          :term:`LICENSE_CREATE_PACKAGE` variable for additional information.
@@ -1406,24 +1406,24 @@ system and gives an overview of their function and contents.
       Specifies the parent directory of the OpenEmbedded-Core Metadata
       layer (i.e. ``meta``).
 
-      It is an important distinction that ``COREBASE`` points to the parent
+      It is an important distinction that :term:`COREBASE` points to the parent
       of this layer and not the layer itself. Consider an example where you
       have cloned the Poky Git repository and retained the ``poky`` name
-      for your local copy of the repository. In this case, ``COREBASE``
+      for your local copy of the repository. In this case, :term:`COREBASE`
       points to the ``poky`` folder because it is the parent directory of
       the ``poky/meta`` layer.
 
    :term:`COREBASE_FILES`
       Lists files from the :term:`COREBASE` directory that
       should be copied other than the layers listed in the
-      ``bblayers.conf`` file. The ``COREBASE_FILES`` variable allows
+      ``bblayers.conf`` file. The :term:`COREBASE_FILES` variable allows
       to copy metadata from the OpenEmbedded build system
       into the extensible SDK.
 
-      Explicitly listing files in ``COREBASE`` is needed because it
+      Explicitly listing files in :term:`COREBASE` is needed because it
       typically contains build directories and other files that should not
       normally be copied into the extensible SDK. Consequently, the value
-      of ``COREBASE_FILES`` is used in order to only copy the files that
+      of :term:`COREBASE_FILES` is used in order to only copy the files that
       are actually needed.
 
    :term:`CPP`
@@ -1435,7 +1435,7 @@ system and gives an overview of their function and contents.
       variable and thus made visible to the software being built during the
       compilation step.
 
-      Default initialization for ``CPPFLAGS`` varies depending on what is
+      Default initialization for :term:`CPPFLAGS` varies depending on what is
       being built:
 
       -  :term:`TARGET_CPPFLAGS` when building for
@@ -1449,12 +1449,12 @@ system and gives an overview of their function and contents.
 
    :term:`CROSS_COMPILE`
       The toolchain binary prefix for the target tools. The
-      ``CROSS_COMPILE`` variable is the same as the
+      :term:`CROSS_COMPILE` variable is the same as the
       :term:`TARGET_PREFIX` variable.
 
       .. note::
 
-         The OpenEmbedded build system sets the ``CROSS_COMPILE``
+         The OpenEmbedded build system sets the :term:`CROSS_COMPILE`
          variable only in certain contexts (e.g. when building for kernel
          and kernel module recipes).
 
@@ -1470,7 +1470,7 @@ system and gives an overview of their function and contents.
       exported to an environment variable and thus made visible to the
       software being built during the compilation step.
 
-      Default initialization for ``CXXFLAGS`` varies depending on what is
+      Default initialization for :term:`CXXFLAGS` varies depending on what is
       being built:
 
       -  :term:`TARGET_CXXFLAGS` when building for
@@ -1505,7 +1505,7 @@ system and gives an overview of their function and contents.
 
    :term:`DEBIAN_NOAUTONAME`
       When the :ref:`debian <ref-classes-debian>` class is inherited,
-      which is the default behavior, ``DEBIAN_NOAUTONAME`` specifies a
+      which is the default behavior, :term:`DEBIAN_NOAUTONAME` specifies a
       particular package should not be renamed according to Debian library
       package naming. You must use the package name as an override when you
       set this variable. Here is an example from the ``fontconfig`` recipe::
@@ -1514,7 +1514,7 @@ system and gives an overview of their function and contents.
 
    :term:`DEBIANNAME`
       When the :ref:`debian <ref-classes-debian>` class is inherited,
-      which is the default behavior, ``DEBIANNAME`` allows you to override
+      which is the default behavior, :term:`DEBIANNAME` allows you to override
       the library name for an individual package. Overriding the library
       name in these cases is rare. You must use the package name as an
       override when you set this variable. Here is an example from the
@@ -1542,14 +1542,14 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         The bias provided by ``DEFAULT_PREFERENCE`` is weak and is overridden
+         The bias provided by :term:`DEFAULT_PREFERENCE` is weak and is overridden
          by :term:`BBFILE_PRIORITY` if that variable is different between two
          layers that contain different versions of the same recipe.
 
    :term:`DEFAULTTUNE`
       The default CPU and Application Binary Interface (ABI) tunings (i.e.
       the "tune") used by the OpenEmbedded build system. The
-      ``DEFAULTTUNE`` helps define
+      :term:`DEFAULTTUNE` helps define
       :term:`TUNE_FEATURES`.
 
       The default tune is either implicitly or explicitly set by the
@@ -1574,17 +1574,17 @@ system and gives an overview of their function and contents.
       :ref:`ref-tasks-configure` task for ``foo`` runs.
       This mechanism is implemented by having ``do_configure`` depend on
       the :ref:`ref-tasks-populate_sysroot` task of
-      each recipe listed in ``DEPENDS``, through a
+      each recipe listed in :term:`DEPENDS`, through a
       ``[``\ :ref:`deptask <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`\ ``]``
       declaration in the :ref:`base <ref-classes-base>` class.
 
       .. note::
 
-         It seldom is necessary to reference, for example, ``STAGING_DIR_HOST``
+         It seldom is necessary to reference, for example, :term:`STAGING_DIR_HOST`
          explicitly. The standard classes and build-related variables are
          configured to automatically use the appropriate staging sysroots.
 
-      As another example, ``DEPENDS`` can also be used to add utilities
+      As another example, :term:`DEPENDS` can also be used to add utilities
       that run on the build machine during the build. For example, a recipe
       that makes use of a code generator built by the recipe ``codegen``
       might have the following::
@@ -1597,15 +1597,15 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         -  ``DEPENDS`` is a list of recipe names. Or, to be more precise,
+         -  :term:`DEPENDS` is a list of recipe names. Or, to be more precise,
             it is a list of :term:`PROVIDES` names, which
             usually match recipe names. Putting a package name such as
-            "foo-dev" in ``DEPENDS`` does not make sense. Use "foo"
+            "foo-dev" in :term:`DEPENDS` does not make sense. Use "foo"
             instead, as this will put files from all the packages that make
             up ``foo``, which includes those from ``foo-dev``, into the
             sysroot.
 
-         -  One recipe having another recipe in ``DEPENDS`` does not by
+         -  One recipe having another recipe in :term:`DEPENDS` does not by
             itself add any runtime dependencies between the packages
             produced by the two recipes. However, as explained in the
             ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
@@ -1613,12 +1613,12 @@ system and gives an overview of their function and contents.
             runtime dependencies will often be added automatically, meaning
             ``DEPENDS`` alone is sufficient for most recipes.
 
-         -  Counterintuitively, ``DEPENDS`` is often necessary even for
+         -  Counterintuitively, :term:`DEPENDS` is often necessary even for
             recipes that install precompiled components. For example, if
             ``libfoo`` is a precompiled library that links against
             ``libbar``, then linking against ``libfoo`` requires both
             ``libfoo`` and ``libbar`` to be available in the sysroot.
-            Without a ``DEPENDS`` from the recipe that installs ``libfoo``
+            Without a :term:`DEPENDS` from the recipe that installs ``libfoo``
             to the recipe that installs ``libbar``, other recipes might
             fail to link against ``libfoo``.
 
@@ -1658,7 +1658,7 @@ system and gives an overview of their function and contents.
          DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
 
       The :ref:`package_deb <ref-classes-package_deb>` class uses the
-      ``DEPLOY_DIR_DEB`` variable to make sure the
+      :term:`DEPLOY_DIR_DEB` variable to make sure the
       :ref:`ref-tasks-package_write_deb` task
       writes Debian packages into the appropriate folder. For more
       information on how packaging works, see the
@@ -1693,7 +1693,7 @@ system and gives an overview of their function and contents.
          DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
 
       The :ref:`package_ipk <ref-classes-package_ipk>` class uses the
-      ``DEPLOY_DIR_IPK`` variable to make sure the
+      :term:`DEPLOY_DIR_IPK` variable to make sure the
       :ref:`ref-tasks-package_write_ipk` task
       writes IPK packages into the appropriate folder. For more information
       on how packaging works, see the
@@ -1713,7 +1713,7 @@ system and gives an overview of their function and contents.
          DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
 
       The :ref:`package_rpm <ref-classes-package_rpm>` class uses the
-      ``DEPLOY_DIR_RPM`` variable to make sure the
+      :term:`DEPLOY_DIR_RPM` variable to make sure the
       :ref:`ref-tasks-package_write_rpm` task
       writes RPM packages into the appropriate folder. For more information
       on how packaging works, see the
@@ -1733,7 +1733,7 @@ system and gives an overview of their function and contents.
          DEPLOY_DIR_TAR = "${DEPLOY_DIR}/tar"
 
       The :ref:`package_tar <ref-classes-package_tar>` class uses the
-      ``DEPLOY_DIR_TAR`` variable to make sure the
+      :term:`DEPLOY_DIR_TAR` variable to make sure the
       :ref:`ref-tasks-package_write_tar` task
       writes TAR packages into the appropriate folder. For more information
       on how packaging works, see the
@@ -1742,19 +1742,19 @@ system and gives an overview of their function and contents.
 
    :term:`DEPLOYDIR`
       When inheriting the :ref:`deploy <ref-classes-deploy>` class, the
-      ``DEPLOYDIR`` points to a temporary work area for deployed files that
+      :term:`DEPLOYDIR` points to a temporary work area for deployed files that
       is set in the ``deploy`` class as follows::
 
          DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
 
       Recipes inheriting the ``deploy`` class should copy files to be
-      deployed into ``DEPLOYDIR``, and the class will take care of copying
+      deployed into :term:`DEPLOYDIR`, and the class will take care of copying
       them into :term:`DEPLOY_DIR_IMAGE`
       afterwards.
 
    :term:`DESCRIPTION`
       The package description used by package managers. If not set,
-      ``DESCRIPTION`` takes the value of the :term:`SUMMARY`
+      :term:`DESCRIPTION` takes the value of the :term:`SUMMARY`
       variable.
 
    :term:`DISTRO`
@@ -1762,26 +1762,26 @@ system and gives an overview of their function and contents.
       of the distribution, see the :term:`DISTRO_NAME`
       variable.
 
-      The ``DISTRO`` variable corresponds to a distribution configuration
+      The :term:`DISTRO` variable corresponds to a distribution configuration
       file whose root name is the same as the variable's argument and whose
       filename extension is ``.conf``. For example, the distribution
       configuration file for the Poky distribution is named ``poky.conf``
       and resides in the ``meta-poky/conf/distro`` directory of the
       :term:`Source Directory`.
 
-      Within that ``poky.conf`` file, the ``DISTRO`` variable is set as
+      Within that ``poky.conf`` file, the :term:`DISTRO` variable is set as
       follows::
 
          DISTRO = "poky"
 
       Distribution configuration files are located in a ``conf/distro``
       directory within the :term:`Metadata` that contains the
-      distribution configuration. The value for ``DISTRO`` must not contain
+      distribution configuration. The value for :term:`DISTRO` must not contain
       spaces, and is typically all lower-case.
 
       .. note::
 
-         If the ``DISTRO`` variable is blank, a set of default configurations
+         If the :term:`DISTRO` variable is blank, a set of default configurations
          are used, which are specified within
          ``meta/conf/distro/defaultsetup.conf`` also in the Source Directory.
 
@@ -1808,11 +1808,11 @@ system and gives an overview of their function and contents.
       configuration file.
 
       In most cases, the presence or absence of a feature in
-      ``DISTRO_FEATURES`` is translated to the appropriate option supplied
+      :term:`DISTRO_FEATURES` is translated to the appropriate option supplied
       to the configure script during the
       :ref:`ref-tasks-configure` task for recipes that
       optionally support the feature. For example, specifying "x11" in
-      ``DISTRO_FEATURES``, causes every piece of software built for the
+      :term:`DISTRO_FEATURES`, causes every piece of software built for the
       target that can optionally support X11 to have its X11 support
       enabled.
 
@@ -1821,8 +1821,8 @@ system and gives an overview of their function and contents.
       provide with this variable, see the ":ref:`ref-features-distro`" section.
 
    :term:`DISTRO_FEATURES_BACKFILL`
-      Features to be added to ``DISTRO_FEATURES`` if not also present in
-      ``DISTRO_FEATURES_BACKFILL_CONSIDERED``.
+      Features to be added to :term:`DISTRO_FEATURES` if not also present in
+      :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`.
 
       This variable is set in the ``meta/conf/bitbake.conf`` file. It is
       not intended to be user-configurable. It is best to just reference
@@ -1831,8 +1831,8 @@ system and gives an overview of their function and contents.
       for more information.
 
    :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`
-      Features from ``DISTRO_FEATURES_BACKFILL`` that should not be
-      backfilled (i.e. added to ``DISTRO_FEATURES``) during the build. See
+      Features from :term:`DISTRO_FEATURES_BACKFILL` that should not be
+      backfilled (i.e. added to :term:`DISTRO_FEATURES`) during the build. See
       the ":ref:`ref-features-backfill`" section for more information.
 
    :term:`DISTRO_FEATURES_DEFAULT`
@@ -1844,14 +1844,14 @@ system and gives an overview of their function and contents.
       able to reuse the default
       :term:`DISTRO_FEATURES` options without the
       need to write out the full set. Here is an example that uses
-      ``DISTRO_FEATURES_DEFAULT`` from a custom distro configuration file::
+      :term:`DISTRO_FEATURES_DEFAULT` from a custom distro configuration file::
 
          DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} myfeature"
 
    :term:`DISTRO_FEATURES_FILTER_NATIVE`
       Specifies a list of features that if present in the target
       :term:`DISTRO_FEATURES` value should be
-      included in ``DISTRO_FEATURES`` when building native recipes. This
+      included in :term:`DISTRO_FEATURES` when building native recipes. This
       variable is used in addition to the features filtered using the
       :term:`DISTRO_FEATURES_NATIVE`
       variable.
@@ -1859,7 +1859,7 @@ system and gives an overview of their function and contents.
    :term:`DISTRO_FEATURES_FILTER_NATIVESDK`
       Specifies a list of features that if present in the target
       :term:`DISTRO_FEATURES` value should be
-      included in ``DISTRO_FEATURES`` when building nativesdk recipes. This
+      included in :term:`DISTRO_FEATURES` when building nativesdk recipes. This
       variable is used in addition to the features filtered using the
       :term:`DISTRO_FEATURES_NATIVESDK`
       variable.
@@ -1884,14 +1884,14 @@ system and gives an overview of their function and contents.
       The long name of the distribution. For information on the short name
       of the distribution, see the :term:`DISTRO` variable.
 
-      The ``DISTRO_NAME`` variable corresponds to a distribution
+      The :term:`DISTRO_NAME` variable corresponds to a distribution
       configuration file whose root name is the same as the variable's
       argument and whose filename extension is ``.conf``. For example, the
       distribution configuration file for the Poky distribution is named
       ``poky.conf`` and resides in the ``meta-poky/conf/distro`` directory
       of the :term:`Source Directory`.
 
-      Within that ``poky.conf`` file, the ``DISTRO_NAME`` variable is set
+      Within that ``poky.conf`` file, the :term:`DISTRO_NAME` variable is set
       as follows::
 
          DISTRO_NAME = "Poky (Yocto Project Reference Distro)"
@@ -1902,7 +1902,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         If the ``DISTRO_NAME`` variable is blank, a set of default
+         If the :term:`DISTRO_NAME` variable is blank, a set of default
          configurations are used, which are specified within
          ``meta/conf/distro/defaultsetup.conf`` also in the Source Directory.
 
@@ -1914,10 +1914,10 @@ system and gives an overview of their function and contents.
       distribution. By default, this list includes the value of
       :term:`DISTRO`.
 
-      You can extend ``DISTROOVERRIDES`` to add extra overrides that should
+      You can extend :term:`DISTROOVERRIDES` to add extra overrides that should
       apply to the distribution.
 
-      The underlying mechanism behind ``DISTROOVERRIDES`` is simply that it
+      The underlying mechanism behind :term:`DISTROOVERRIDES` is simply that it
       is included in the default value of
       :term:`OVERRIDES`.
 
@@ -1936,13 +1936,13 @@ system and gives an overview of their function and contents.
 
    :term:`DL_DIR`
       The central download directory used by the build process to store
-      downloads. By default, ``DL_DIR`` gets files suitable for mirroring
+      downloads. By default, :term:`DL_DIR` gets files suitable for mirroring
       for everything except Git repositories. If you want tarballs of Git
       repositories, use the
       :term:`BB_GENERATE_MIRROR_TARBALLS`
       variable.
 
-      You can set this directory by defining the ``DL_DIR`` variable in the
+      You can set this directory by defining the :term:`DL_DIR` variable in the
       ``conf/local.conf`` file. This directory is self-maintaining and you
       should not have to touch it. By default, the directory is
       ``downloads`` in the :term:`Build Directory`.
@@ -1956,7 +1956,7 @@ system and gives an overview of their function and contents.
       During a first build, the system downloads many different source code
       tarballs from various upstream projects. Downloading can take a
       while, particularly if your network connection is slow. Tarballs are
-      all stored in the directory defined by ``DL_DIR`` and the build
+      all stored in the directory defined by :term:`DL_DIR` and the build
       system looks there first to find source tarballs.
 
       .. note::
@@ -1985,7 +1985,7 @@ system and gives an overview of their function and contents.
    :term:`EFI_PROVIDER`
       When building bootable images (i.e. where ``hddimg``, ``iso``, or
       ``wic.vmdk`` is in :term:`IMAGE_FSTYPES`), the
-      ``EFI_PROVIDER`` variable specifies the EFI bootloader to use. The
+      :term:`EFI_PROVIDER` variable specifies the EFI bootloader to use. The
       default is "grub-efi", but "systemd-boot" can be used instead.
 
       See the :ref:`systemd-boot <ref-classes-systemd-boot>` and
@@ -2006,7 +2006,7 @@ system and gives an overview of their function and contents.
       database. By default, the value of this variable is
       ``${``\ :term:`LOG_DIR`\ ``}/error-report``.
 
-      You can set ``ERR_REPORT_DIR`` to the path you want the error
+      You can set :term:`ERR_REPORT_DIR` to the path you want the error
       reporting tool to store the debug files as follows in your
       ``local.conf`` file::
 
@@ -2031,11 +2031,11 @@ system and gives an overview of their function and contents.
          libraries resolver might implicitly define some dependencies between
          packages.
 
-      The ``EXCLUDE_FROM_SHLIBS`` variable is similar to the
+      The :term:`EXCLUDE_FROM_SHLIBS` variable is similar to the
       :term:`PRIVATE_LIBS` variable, which excludes a
       package's particular libraries only and not the whole package.
 
-      Use the ``EXCLUDE_FROM_SHLIBS`` variable by setting it to "1" for a
+      Use the :term:`EXCLUDE_FROM_SHLIBS` variable by setting it to "1" for a
       particular package::
 
          EXCLUDE_FROM_SHLIBS = "1"
@@ -2051,18 +2051,18 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         Recipes added to ``EXCLUDE_FROM_WORLD`` may still be built during a
+         Recipes added to :term:`EXCLUDE_FROM_WORLD` may still be built during a
          world build in order to satisfy dependencies of other recipes. Adding
-         a recipe to ``EXCLUDE_FROM_WORLD`` only ensures that the recipe is not
+         a recipe to :term:`EXCLUDE_FROM_WORLD` only ensures that the recipe is not
          explicitly added to the list of build targets in a world build.
 
    :term:`EXTENDPE`
       Used with file and pathnames to create a prefix for a recipe's
-      version based on the recipe's :term:`PE` value. If ``PE``
-      is set and greater than zero for a recipe, ``EXTENDPE`` becomes that
-      value (e.g if ``PE`` is equal to "1" then ``EXTENDPE`` becomes "1").
-      If a recipe's ``PE`` is not set (the default) or is equal to zero,
-      ``EXTENDPE`` becomes "".
+      version based on the recipe's :term:`PE` value. If :term:`PE`
+      is set and greater than zero for a recipe, :term:`EXTENDPE` becomes that
+      value (e.g if :term:`PE` is equal to "1" then :term:`EXTENDPE` becomes "1").
+      If a recipe's :term:`PE` is not set (the default) or is equal to zero,
+      :term:`EXTENDPE` becomes "".
 
       See the :term:`STAMP` variable for an example.
 
@@ -2078,11 +2078,11 @@ system and gives an overview of their function and contents.
       manager to upgrade these types of packages in lock-step.
 
    :term:`EXTERNAL_KERNEL_TOOLS`
-      When set, the ``EXTERNAL_KERNEL_TOOLS`` variable indicates that these
+      When set, the :term:`EXTERNAL_KERNEL_TOOLS` variable indicates that these
       tools are not in the source tree.
 
       When kernel tools are available in the tree, they are preferred over
-      any externally installed tools. Setting the ``EXTERNAL_KERNEL_TOOLS``
+      any externally installed tools. Setting the :term:`EXTERNAL_KERNEL_TOOLS`
       variable tells the OpenEmbedded build system to prefer the installed
       external tools. See the
       :ref:`kernel-yocto <ref-classes-kernel-yocto>` class in
@@ -2117,7 +2117,7 @@ system and gives an overview of their function and contents.
 
    :term:`EXTRA_AUTORECONF`
       For recipes inheriting the :ref:`autotools <ref-classes-autotools>`
-      class, you can use ``EXTRA_AUTORECONF`` to specify extra options to
+      class, you can use :term:`EXTRA_AUTORECONF` to specify extra options to
       pass to the ``autoreconf`` command that is executed during the
       :ref:`ref-tasks-configure` task.
 
@@ -2179,7 +2179,7 @@ system and gives an overview of their function and contents.
       installing into the root filesystem.
 
       Sometimes a recipe is required to build the final image but is not
-      needed in the root filesystem. You can use the ``EXTRA_IMAGEDEPENDS``
+      needed in the root filesystem. You can use the :term:`EXTRA_IMAGEDEPENDS`
       variable to list these recipes and thus specify the dependencies. A
       typical example is a required bootloader in a machine configuration.
 
@@ -2210,12 +2210,12 @@ system and gives an overview of their function and contents.
    :term:`EXTRA_OEMAKE`
       Additional GNU ``make`` options.
 
-      Because the ``EXTRA_OEMAKE`` defaults to "", you need to set the
+      Because the :term:`EXTRA_OEMAKE` defaults to "", you need to set the
       variable to specify any required GNU options.
 
       :term:`PARALLEL_MAKE` and
       :term:`PARALLEL_MAKEINST` also make use of
-      ``EXTRA_OEMAKE`` to pass the required flags.
+      :term:`EXTRA_OEMAKE` to pass the required flags.
 
    :term:`EXTRA_OESCONS`
       When inheriting the :ref:`scons <ref-classes-scons>` class, this
@@ -2231,7 +2231,7 @@ system and gives an overview of their function and contents.
       group configurations to a specific recipe.
 
       The set list of commands you can configure using the
-      ``EXTRA_USERS_PARAMS`` is shown in the ``extrausers`` class. These
+      :term:`EXTRA_USERS_PARAMS` is shown in the ``extrausers`` class. These
       commands map to the normal Unix commands of the same names::
 
          # EXTRA_USERS_PARAMS = "\
@@ -2257,19 +2257,19 @@ system and gives an overview of their function and contents.
    :term:`FEATURE_PACKAGES`
       Defines one or more packages to include in an image when a specific
       item is included in :term:`IMAGE_FEATURES`.
-      When setting the value, ``FEATURE_PACKAGES`` should have the name of
+      When setting the value, :term:`FEATURE_PACKAGES` should have the name of
       the feature item as an override. Here is an example::
 
          FEATURE_PACKAGES_widget = "package1 package2"
 
-      In this example, if "widget" were added to ``IMAGE_FEATURES``,
+      In this example, if "widget" were added to :term:`IMAGE_FEATURES`,
       package1 and package2 would be included in the image.
 
       .. note::
 
-         Packages installed by features defined through ``FEATURE_PACKAGES``
+         Packages installed by features defined through :term:`FEATURE_PACKAGES`
          are often package groups. While similarly named, you should not
-         confuse the ``FEATURE_PACKAGES`` variable with package groups, which
+         confuse the :term:`FEATURE_PACKAGES` variable with package groups, which
          are discussed elsewhere in the documentation.
 
    :term:`FEED_DEPLOYDIR_BASE_URI`
@@ -2294,7 +2294,7 @@ system and gives an overview of their function and contents.
       :term:`PACKAGES` variable lists the packages
       generated by a recipe.
 
-      To use the ``FILES`` variable, provide a package name override that
+      To use the :term:`FILES` variable, provide a package name override that
       identifies the resulting package. Then, provide a space-separated
       list of files or paths that identify the files you want included as
       part of the resulting package. Here is an example::
@@ -2309,7 +2309,7 @@ system and gives an overview of their function and contents.
             syntax. For details on the syntax, see the documentation by
             following the previous link.
 
-         -  When specifying paths as part of the ``FILES`` variable, it is
+         -  When specifying paths as part of the :term:`FILES` variable, it is
             good practice to use appropriate path variables. For example,
             use ``${sysconfdir}`` rather than ``/etc``, or ``${bindir}``
             rather than ``/usr/bin``. You can find a list of these
@@ -2318,7 +2318,7 @@ system and gives an overview of their function and contents.
             find the default values of the various ``FILES_*`` variables in
             this file.
 
-      If some of the files you provide with the ``FILES`` variable are
+      If some of the files you provide with the :term:`FILES` variable are
       editable and you know they should not be overwritten during the
       package update process by the Package Management System (PMS), you
       can identify these files so that the PMS will not overwrite them. See
@@ -2328,7 +2328,7 @@ system and gives an overview of their function and contents.
    :term:`FILES_SOLIBSDEV`
       Defines the file specification to match
       :term:`SOLIBSDEV`. In other words,
-      ``FILES_SOLIBSDEV`` defines the full path name of the development
+      :term:`FILES_SOLIBSDEV` defines the full path name of the development
       symbolic link (symlink) for shared libraries on the target platform.
 
       The following statement from the ``bitbake.conf`` shows how it is
@@ -2341,11 +2341,11 @@ system and gives an overview of their function and contents.
       looking for files and patches as it processes recipes and append
       files. The default directories BitBake uses when it processes recipes
       are initially defined by the :term:`FILESPATH`
-      variable. You can extend ``FILESPATH`` variable by using
-      ``FILESEXTRAPATHS``.
+      variable. You can extend :term:`FILESPATH` variable by using
+      :term:`FILESEXTRAPATHS`.
 
       Best practices dictate that you accomplish this by using
-      ``FILESEXTRAPATHS`` from within a ``.bbappend`` file and that you
+      :term:`FILESEXTRAPATHS` from within a ``.bbappend`` file and that you
       prepend paths as follows::
 
          FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
@@ -2356,7 +2356,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         When extending ``FILESEXTRAPATHS``, be sure to use the immediate
+         When extending :term:`FILESEXTRAPATHS`, be sure to use the immediate
          expansion (``:=``) operator. Immediate expansion makes sure that
          BitBake evaluates :term:`THISDIR` at the time the
          directive is encountered rather than at some later time when
@@ -2373,7 +2373,7 @@ system and gives an overview of their function and contents.
          FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
       In this example, the build system extends the
-      ``FILESPATH`` variable to include a directory named ``files`` that is
+      :term:`FILESPATH` variable to include a directory named ``files`` that is
       in the same directory as the corresponding append file.
 
       This next example specifically adds three paths::
@@ -2396,7 +2396,7 @@ system and gives an overview of their function and contents.
       .. note::
 
          For a layer that supports a single BSP, the override could just be
-         the value of ``MACHINE``.
+         the value of :term:`MACHINE`.
 
       By prepending paths in ``.bbappend`` files, you allow multiple append
       files that reside in different layers but are used for the same
@@ -2405,7 +2405,7 @@ system and gives an overview of their function and contents.
    :term:`FILESOVERRIDES`
       A subset of :term:`OVERRIDES` used by the
       OpenEmbedded build system for creating
-      :term:`FILESPATH`. The ``FILESOVERRIDES`` variable
+      :term:`FILESPATH`. The :term:`FILESOVERRIDES` variable
       uses overrides to automatically extend the
       :term:`FILESPATH` variable. For an example of how
       that works, see the :term:`FILESPATH` variable
@@ -2414,13 +2414,13 @@ system and gives an overview of their function and contents.
       ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:conditional syntax (overrides)`"
       section of the BitBake User Manual.
 
-      By default, the ``FILESOVERRIDES`` variable is defined as::
+      By default, the :term:`FILESOVERRIDES` variable is defined as::
 
          FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}"
 
       .. note::
 
-         Do not hand-edit the ``FILESOVERRIDES`` variable. The values match up
+         Do not hand-edit the :term:`FILESOVERRIDES` variable. The values match up
          with expected overrides and are used in an expected manner by the
          build system.
 
@@ -2429,11 +2429,11 @@ system and gives an overview of their function and contents.
       when searching for patches and files.
 
       During the build process, BitBake searches each directory in
-      ``FILESPATH`` in the specified order when looking for files and
+      :term:`FILESPATH` in the specified order when looking for files and
       patches specified by each ``file://`` URI in a recipe's
       :term:`SRC_URI` statements.
 
-      The default value for the ``FILESPATH`` variable is defined in the
+      The default value for the :term:`FILESPATH` variable is defined in the
       ``base.bbclass`` class found in ``meta/classes`` in the
       :term:`Source Directory`::
 
@@ -2441,22 +2441,22 @@ system and gives an overview of their function and contents.
              "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
 
       The
-      ``FILESPATH`` variable is automatically extended using the overrides
+      :term:`FILESPATH` variable is automatically extended using the overrides
       from the :term:`FILESOVERRIDES` variable.
 
       .. note::
 
-         -  Do not hand-edit the ``FILESPATH`` variable. If you want the
+         -  Do not hand-edit the :term:`FILESPATH` variable. If you want the
             build system to look in directories other than the defaults,
-            extend the ``FILESPATH`` variable by using the
+            extend the :term:`FILESPATH` variable by using the
             :term:`FILESEXTRAPATHS` variable.
 
-         -  Be aware that the default ``FILESPATH`` directories do not map
+         -  Be aware that the default :term:`FILESPATH` directories do not map
             to directories in custom layers where append files
             (``.bbappend``) are used. If you want the build system to find
             patches or files that reside with your append files, you need
-            to extend the ``FILESPATH`` variable by using the
-            ``FILESEXTRAPATHS`` variable.
+            to extend the :term:`FILESPATH` variable by using the
+            :term:`FILESEXTRAPATHS` variable.
 
       You can take advantage of this searching behavior in useful ways. For
       example, consider a case where there is the following directory structure
@@ -2466,10 +2466,10 @@ system and gives an overview of their function and contents.
          files/MACHINEA/defconfig
          files/MACHINEB/defconfig
 
-      Also in the example, the ``SRC_URI`` statement contains
+      Also in the example, the :term:`SRC_URI` statement contains
       "file://defconfig". Given this scenario, you can set
       :term:`MACHINE` to "MACHINEA" and cause the build
-      system to use files from ``files/MACHINEA``. Set ``MACHINE`` to
+      system to use files from ``files/MACHINEA``. Set :term:`MACHINE` to
       "MACHINEB" and the build system uses files from ``files/MACHINEB``.
       Finally, for any machine other than "MACHINEA" and "MACHINEB", the
       build system uses files from ``files/defconfig``.
@@ -2494,7 +2494,7 @@ system and gives an overview of their function and contents.
       permissions setting table, you should place it in your layer or the
       distro's layer.
 
-      You define the ``FILESYSTEM_PERMS_TABLES`` variable in the
+      You define the :term:`FILESYSTEM_PERMS_TABLES` variable in the
       ``conf/local.conf`` file, which is found in the :term:`Build Directory`,
       to point to your custom
       ``fs-perms.txt``. You can specify more than a single file permissions
@@ -2513,7 +2513,7 @@ system and gives an overview of their function and contents.
 
    :term:`FIT_GENERATE_KEYS`
       Decides whether to generate the keys for signing fitImage if they
-      don't already exist. The keys are created in ``UBOOT_SIGN_KEYDIR``.
+      don't already exist. The keys are created in :term:`UBOOT_SIGN_KEYDIR`.
       The default value is 0.
 
    :term:`FIT_HASH_ALG`
@@ -2594,7 +2594,7 @@ system and gives an overview of their function and contents.
 
    :term:`GCCVERSION`
       Specifies the default version of the GNU C Compiler (GCC) used for
-      compilation. By default, ``GCCVERSION`` is set to "8.x" in the
+      compilation. By default, :term:`GCCVERSION` is set to "8.x" in the
       ``meta/conf/distro/include/tcmode-default.inc`` include file::
 
          GCCVERSION ?= "8.%"
@@ -2618,7 +2618,7 @@ system and gives an overview of their function and contents.
          If you specifically remove the locale ``en_US.UTF-8``, you must set
          :term:`IMAGE_LINGUAS` appropriately.
 
-      You can set ``GLIBC_GENERATE_LOCALES`` in your ``local.conf`` file.
+      You can set :term:`GLIBC_GENERATE_LOCALES` in your ``local.conf`` file.
       By default, all locales are generated.
       ::
 
@@ -2660,7 +2660,7 @@ system and gives an overview of their function and contents.
       configuration. Use a semi-colon character (``;``) to separate
       multiple options.
 
-      The ``GRUB_OPTS`` variable is optional. See the
+      The :term:`GRUB_OPTS` variable is optional. See the
       :ref:`grub-efi <ref-classes-grub-efi>` class for more information
       on how this variable is used.
 
@@ -2668,7 +2668,7 @@ system and gives an overview of their function and contents.
       Specifies the timeout before executing the default ``LABEL`` in the
       GNU GRand Unified Bootloader (GRUB).
 
-      The ``GRUB_TIMEOUT`` variable is optional. See the
+      The :term:`GRUB_TIMEOUT` variable is optional. See the
       :ref:`grub-efi <ref-classes-grub-efi>` class for more information
       on how this variable is used.
 
@@ -2702,7 +2702,7 @@ system and gives an overview of their function and contents.
       Specifies architecture-specific compiler flags that are passed to the
       C compiler.
 
-      Default initialization for ``HOST_CC_ARCH`` varies depending on what
+      Default initialization for :term:`HOST_CC_ARCH` varies depending on what
       is being built:
 
       -  :term:`TARGET_CC_ARCH` when building for the
@@ -2722,7 +2722,7 @@ system and gives an overview of their function and contents.
       "linux-musleabi" values possible.
 
    :term:`HOST_PREFIX`
-      Specifies the prefix for the cross-compile toolchain. ``HOST_PREFIX``
+      Specifies the prefix for the cross-compile toolchain. :term:`HOST_PREFIX`
       is normally the same as :term:`TARGET_PREFIX`.
 
    :term:`HOST_SYS`
@@ -2751,7 +2751,7 @@ system and gives an overview of their function and contents.
       A space-separated list (filter) of tools on the build host that
       should be allowed to be called from within build tasks. Using this
       filter helps reduce the possibility of host contamination. If a tool
-      specified in the value of ``HOSTTOOLS`` is not found on the build
+      specified in the value of :term:`HOSTTOOLS` is not found on the build
       host, the OpenEmbedded build system produces an error and the build
       is not started.
 
@@ -2764,11 +2764,11 @@ system and gives an overview of their function and contents.
       filter helps reduce the possibility of host contamination. Unlike
       :term:`HOSTTOOLS`, the OpenEmbedded build system
       does not produce an error if a tool specified in the value of
-      ``HOSTTOOLS_NONFATAL`` is not found on the build host. Thus, you can
-      use ``HOSTTOOLS_NONFATAL`` to filter optional host tools.
+      :term:`HOSTTOOLS_NONFATAL` is not found on the build host. Thus, you can
+      use :term:`HOSTTOOLS_NONFATAL` to filter optional host tools.
 
    :term:`HOST_VENDOR`
-      Specifies the name of the vendor. ``HOST_VENDOR`` is normally the
+      Specifies the name of the vendor. :term:`HOST_VENDOR` is normally the
       same as :term:`TARGET_VENDOR`.
 
    :term:`ICECC_DISABLED`
@@ -2813,12 +2813,12 @@ system and gives an overview of their function and contents.
       network lag, available memory, and existing machine loads can all
       affect build time. Consequently, unlike the
       :term:`PARALLEL_MAKE` variable, there is no
-      rule-of-thumb for setting ``ICECC_PARALLEL_MAKE`` to achieve optimal
+      rule-of-thumb for setting :term:`ICECC_PARALLEL_MAKE` to achieve optimal
       performance.
 
-      If you do not set ``ICECC_PARALLEL_MAKE``, the build system does not
+      If you do not set :term:`ICECC_PARALLEL_MAKE`, the build system does not
       use it (i.e. the system does not detect and assign the number of
-      cores as is done with ``PARALLEL_MAKE``).
+      cores as is done with :term:`PARALLEL_MAKE`).
 
    :term:`ICECC_PATH`
       The location of the ``icecc`` binary. You can set this variable in
@@ -2931,7 +2931,7 @@ system and gives an overview of their function and contents.
       this variable to specify the list of classes that register the
       different types of images the OpenEmbedded build system creates.
 
-      The default value for ``IMAGE_CLASSES`` is ``image_types``. You can
+      The default value for :term:`IMAGE_CLASSES` is ``image_types``. You can
       set this variable in your ``local.conf`` or in a distribution
       configuration file.
 
@@ -2958,7 +2958,7 @@ system and gives an overview of their function and contents.
       Specifies one or more files that contain custom device tables that
       are passed to the ``makedevs`` command as part of creating an image.
       These files list basic device nodes that should be created under
-      ``/dev`` within the image. If ``IMAGE_DEVICE_TABLES`` is not set,
+      ``/dev`` within the image. If :term:`IMAGE_DEVICE_TABLES` is not set,
       ``files/device_table-minimal.txt`` is used, which is located by
       :term:`BBPATH`. For details on how you should write
       device table files, see ``meta/files/device_table-minimal.txt`` as an
@@ -2986,7 +2986,7 @@ system and gives an overview of their function and contents.
    :term:`IMAGE_FSTYPES`
       Specifies the formats the OpenEmbedded build system uses during the
       build when creating the root filesystem. For example, setting
-      ``IMAGE_FSTYPES`` as follows causes the build system to create root
+      :term:`IMAGE_FSTYPES` as follows causes the build system to create root
       filesystems using two formats: ``.ext3`` and ``.tar.bz2``::
 
          IMAGE_FSTYPES = "ext3 tar.bz2"
@@ -2997,25 +2997,25 @@ system and gives an overview of their function and contents.
       .. note::
 
          -  If an image recipe uses the "inherit image" line and you are
-            setting ``IMAGE_FSTYPES`` inside the recipe, you must set
+            setting :term:`IMAGE_FSTYPES` inside the recipe, you must set
             ``IMAGE_FSTYPES`` prior to using the "inherit image" line.
 
          -  Due to the way the OpenEmbedded build system processes this
             variable, you cannot update its contents by using ``_append``
             or ``_prepend``. You must use the ``+=`` operator to add one or
-            more options to the ``IMAGE_FSTYPES`` variable.
+            more options to the :term:`IMAGE_FSTYPES` variable.
 
    :term:`IMAGE_INSTALL`
       Used by recipes to specify the packages to install into an image
       through the :ref:`image <ref-classes-image>` class. Use the
-      ``IMAGE_INSTALL`` variable with care to avoid ordering issues.
+      :term:`IMAGE_INSTALL` variable with care to avoid ordering issues.
 
-      Image recipes set ``IMAGE_INSTALL`` to specify the packages to
+      Image recipes set :term:`IMAGE_INSTALL` to specify the packages to
       install into an image through ``image.bbclass``. Additionally,
       there are "helper" classes such as the
       :ref:`core-image <ref-classes-core-image>` class which can
-      take lists used with ``IMAGE_FEATURES`` and turn them into
-      auto-generated entries in ``IMAGE_INSTALL`` in addition to its
+      take lists used with :term:`IMAGE_FEATURES` and turn them into
+      auto-generated entries in :term:`IMAGE_INSTALL` in addition to its
       default contents.
 
       When you use this variable, it is best to use it as follows::
@@ -3030,24 +3030,24 @@ system and gives an overview of their function and contents.
 
          -  When working with a
             :ref:`core-image-minimal-initramfs <ref-manual/images:images>`
-            image, do not use the ``IMAGE_INSTALL`` variable to specify
+            image, do not use the :term:`IMAGE_INSTALL` variable to specify
             packages for installation. Instead, use the
             :term:`PACKAGE_INSTALL` variable, which
             allows the initial RAM filesystem (initramfs) recipe to use a
-            fixed set of packages and not be affected by ``IMAGE_INSTALL``.
+            fixed set of packages and not be affected by :term:`IMAGE_INSTALL`.
             For information on creating an initramfs, see the
             ":ref:`dev-manual/common-tasks:building an initial ram filesystem (initramfs) image`"
             section in the Yocto Project Development Tasks Manual.
 
-         -  Using ``IMAGE_INSTALL`` with the
+         -  Using :term:`IMAGE_INSTALL` with the
             :ref:`+= <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:appending (+=) and prepending (=+) with spaces>`
             BitBake operator within the ``/conf/local.conf`` file or from
             within an image recipe is not recommended. Use of this operator
             in these ways can cause ordering issues. Since
-            ``core-image.bbclass`` sets ``IMAGE_INSTALL`` to a default
+            ``core-image.bbclass`` sets :term:`IMAGE_INSTALL` to a default
             value using the
             :ref:`?= <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:setting a default value (?=)>`
-            operator, using a ``+=`` operation against ``IMAGE_INSTALL``
+            operator, using a ``+=`` operation against :term:`IMAGE_INSTALL`
             results in unexpected behavior when used within
             ``conf/local.conf``. Furthermore, the same operation from
             within an image recipe may or may not succeed depending on the
@@ -3058,7 +3058,7 @@ system and gives an overview of their function and contents.
       Specifies the list of locales to install into the image during the
       root filesystem construction process. The OpenEmbedded build system
       automatically splits locale files, which are used for localization,
-      into separate packages. Setting the ``IMAGE_LINGUAS`` variable
+      into separate packages. Setting the :term:`IMAGE_LINGUAS` variable
       ensures that any locale packages that correspond to packages already
       selected for installation into the image are also installed. Here is
       an example::
@@ -3122,7 +3122,7 @@ system and gives an overview of their function and contents.
       Defines a multiplier that the build system applies to the initial
       image size for cases when the multiplier times the returned disk
       usage value for the image is greater than the sum of
-      ``IMAGE_ROOTFS_SIZE`` and ``IMAGE_ROOTFS_EXTRA_SPACE``. The result of
+      :term:`IMAGE_ROOTFS_SIZE` and :term:`IMAGE_ROOTFS_EXTRA_SPACE`. The result of
       the multiplier applied to the initial image size creates free disk
       space in the image as overhead. By default, the build process uses a
       multiplier of 1.3 for this variable. This default value results in
@@ -3131,7 +3131,7 @@ system and gives an overview of their function and contents.
       post install scripts and the package management system uses disk
       space inside this overhead area. Consequently, the multiplier does
       not produce an image with all the theoretical free disk space. See
-      ``IMAGE_ROOTFS_SIZE`` for information on how the build system
+      :term:`IMAGE_ROOTFS_SIZE` for information on how the build system
       determines the overall image size.
 
       The default 30% free disk space typically gives the image enough room
@@ -3143,7 +3143,7 @@ system and gives an overview of their function and contents.
          IMAGE_OVERHEAD_FACTOR = "1.5"
 
       Alternatively, you can ensure a specific amount of free disk space is
-      added to the image by using the ``IMAGE_ROOTFS_EXTRA_SPACE``
+      added to the image by using the :term:`IMAGE_ROOTFS_EXTRA_SPACE`
       variable.
 
    :term:`IMAGE_PKGTYPE`
@@ -3160,10 +3160,10 @@ system and gives an overview of their function and contents.
          recommended that you do not use it.
 
       The :ref:`populate_sdk_* <ref-classes-populate-sdk-*>` and
-      :ref:`image <ref-classes-image>` classes use the ``IMAGE_PKGTYPE``
+      :ref:`image <ref-classes-image>` classes use the :term:`IMAGE_PKGTYPE`
       for packaging up images and SDKs.
 
-      You should not set the ``IMAGE_PKGTYPE`` manually. Rather, the
+      You should not set the :term:`IMAGE_PKGTYPE` manually. Rather, the
       variable is set indirectly through the appropriate
       :ref:`package_* <ref-classes-package>` class using the
       :term:`PACKAGE_CLASSES` variable. The
@@ -3218,7 +3218,7 @@ system and gives an overview of their function and contents.
       Defines additional free disk space created in the image in Kbytes. By
       default, this variable is set to "0". This free disk space is added
       to the image after the build system determines the image size as
-      described in ``IMAGE_ROOTFS_SIZE``.
+      described in :term:`IMAGE_ROOTFS_SIZE`.
 
       This variable is particularly useful when you want to ensure that a
       specific amount of free disk space is available on a device after an
@@ -3336,16 +3336,16 @@ system and gives an overview of their function and contents.
       common functionality are upgraded to a new revision.
 
       A more efficient way of dealing with this situation is to set the
-      ``INC_PR`` variable inside the ``include`` files that the recipes
-      share and then expand the ``INC_PR`` variable within the recipes to
+      :term:`INC_PR` variable inside the ``include`` files that the recipes
+      share and then expand the :term:`INC_PR` variable within the recipes to
       help define the recipe revision.
 
       The following provides an example that shows how to use the
-      ``INC_PR`` variable given a common ``include`` file that defines the
+      :term:`INC_PR` variable given a common ``include`` file that defines the
       variable. Once the variable is defined in the ``include`` file, you
-      can use the variable to set the ``PR`` values in each recipe. You
-      will notice that when you set a recipe's ``PR`` you can provide more
-      granular revisioning by appending values to the ``INC_PR`` variable::
+      can use the variable to set the :term:`PR` values in each recipe. You
+      will notice that when you set a recipe's :term:`PR` you can provide more
+      granular revisioning by appending values to the :term:`INC_PR` variable::
 
          recipes-graphics/xorg-font/xorg-font-common.inc:INC_PR = "r2"
          recipes-graphics/xorg-font/encodings_1.0.4.bb:PR = "${INC_PR}.1"
@@ -3356,7 +3356,7 @@ system and gives an overview of their function and contents.
       first line of the example establishes the baseline revision to be
       used for all recipes that use the ``include`` file. The remaining
       lines in the example are from individual recipes and show how the
-      ``PR`` value is set.
+      :term:`PR` value is set.
 
    :term:`INCOMPATIBLE_LICENSE`
       Specifies a space-separated list of license names (as they would
@@ -3382,12 +3382,12 @@ system and gives an overview of their function and contents.
          It is possible to define a list of licenses that are allowed to be
          used instead of the licenses that are excluded. To do this, define
          a variable ``COMPATIBLE_LICENSES`` with the names of the licenses
-         that are allowed. Then define ``INCOMPATIBLE_LICENSE`` as::
+         that are allowed. Then define :term:`INCOMPATIBLE_LICENSE` as::
 
                  INCOMPATIBLE_LICENSE = "${@' '.join(sorted(set(d.getVar('AVAILABLE_LICENSES').split()) - set(d.getVar('COMPATIBLE_LICENSES').split())))}"
 
 
-         This will result in ``INCOMPATIBLE_LICENSE`` containing the names of
+         This will result in :term:`INCOMPATIBLE_LICENSE` containing the names of
          all licenses from :term:`AVAILABLE_LICENSES` except the ones specified
          in ``COMPATIBLE_LICENSES``, thus only allowing the latter licenses to
          be used.
@@ -3396,9 +3396,9 @@ system and gives an overview of their function and contents.
       Causes the named class or classes to be inherited globally. Anonymous
       functions in the class or classes are not executed for the base
       configuration and in each individual recipe. The OpenEmbedded build
-      system ignores changes to ``INHERIT`` in individual recipes.
+      system ignores changes to :term:`INHERIT` in individual recipes.
 
-      For more information on ``INHERIT``, see the
+      For more information on :term:`INHERIT`, see the
       :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:\`\`inherit\`\` configuration directive`"
       section in the Bitbake User Manual.
 
@@ -3430,7 +3430,7 @@ system and gives an overview of their function and contents.
       variable.
 
       To prevent the build system from splitting out debug information
-      during packaging, set the ``INHIBIT_PACKAGE_DEBUG_SPLIT`` variable as
+      during packaging, set the :term:`INHIBIT_PACKAGE_DEBUG_SPLIT` variable as
       follows::
 
          INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
@@ -3442,7 +3442,7 @@ system and gives an overview of their function and contents.
 
       By default, the OpenEmbedded build system strips binaries and puts
       the debugging symbols into ``${``\ :term:`PN`\ ``}-dbg``.
-      Consequently, you should not set ``INHIBIT_PACKAGE_STRIP`` when you
+      Consequently, you should not set :term:`INHIBIT_PACKAGE_STRIP` when you
       plan to debug in general.
 
    :term:`INHIBIT_SYSROOT_STRIP`
@@ -3451,7 +3451,7 @@ system and gives an overview of their function and contents.
 
       By default, the OpenEmbedded build system strips binaries in the
       resulting sysroot. When you specifically set the
-      ``INHIBIT_SYSROOT_STRIP`` variable to "1" in your recipe, you inhibit
+      :term:`INHIBIT_SYSROOT_STRIP` variable to "1" in your recipe, you inhibit
       this stripping.
 
       If you want to use this variable, include the
@@ -3461,7 +3461,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         Use of the ``INHIBIT_SYSROOT_STRIP`` variable occurs in rare and
+         Use of the :term:`INHIBIT_SYSROOT_STRIP` variable occurs in rare and
          special circumstances. For example, suppose you are building
          bare-metal firmware by using an external GCC toolchain. Furthermore,
          even if the toolchain's binaries are strippable, there are other files
@@ -3483,7 +3483,7 @@ system and gives an overview of their function and contents.
    :term:`INITRAMFS_IMAGE`
       Specifies the :term:`PROVIDES` name of an image
       recipe that is used to build an initial RAM filesystem (initramfs)
-      image. In other words, the ``INITRAMFS_IMAGE`` variable causes an
+      image. In other words, the :term:`INITRAMFS_IMAGE` variable causes an
       additional recipe to be built as a dependency to whatever root
       filesystem recipe you might be using (e.g. ``core-image-sato``). The
       initramfs image recipe you provide should set
@@ -3499,16 +3499,16 @@ system and gives an overview of their function and contents.
          See the ``meta/recipes-core/images/core-image-minimal-initramfs.bb``
          recipe in the :term:`Source Directory`
          for an example initramfs recipe. To select this sample recipe as
-         the one built to provide the initramfs image, set ``INITRAMFS_IMAGE``
+         the one built to provide the initramfs image, set :term:`INITRAMFS_IMAGE`
          to "core-image-minimal-initramfs".
 
       You can also find more information by referencing the
       ``meta-poky/conf/local.conf.sample.extended`` configuration file in
       the Source Directory, the :ref:`image <ref-classes-image>` class,
       and the :ref:`kernel <ref-classes-kernel>` class to see how to use
-      the ``INITRAMFS_IMAGE`` variable.
+      the :term:`INITRAMFS_IMAGE` variable.
 
-      If ``INITRAMFS_IMAGE`` is empty, which is the default, then no
+      If :term:`INITRAMFS_IMAGE` is empty, which is the default, then no
       initramfs image is built.
 
       For more information, you can also see the
@@ -3543,7 +3543,7 @@ system and gives an overview of their function and contents.
 
       Setting the variable to "1" in a configuration file causes the
       OpenEmbedded build system to generate a kernel image with the
-      initramfs specified in ``INITRAMFS_IMAGE`` bundled within::
+      initramfs specified in :term:`INITRAMFS_IMAGE` bundled within::
 
          INITRAMFS_IMAGE_BUNDLE = "1"
 
@@ -3555,7 +3555,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         You must set the ``INITRAMFS_IMAGE_BUNDLE`` variable in a
+         You must set the :term:`INITRAMFS_IMAGE_BUNDLE` variable in a
          configuration file. You cannot set the variable in a recipe file.
 
       See the
@@ -3596,13 +3596,13 @@ system and gives an overview of their function and contents.
       Indicates list of filesystem images to concatenate and use as an
       initial RAM disk (``initrd``).
 
-      The ``INITRD`` variable is an optional variable used with the
+      The :term:`INITRD` variable is an optional variable used with the
       :ref:`image-live <ref-classes-image-live>` class.
 
    :term:`INITRD_IMAGE`
       When building a "live" bootable image (i.e. when
       :term:`IMAGE_FSTYPES` contains "live"),
-      ``INITRD_IMAGE`` specifies the image recipe that should be built to
+      :term:`INITRD_IMAGE` specifies the image recipe that should be built to
       provide the initial RAM disk image. The default value is
       "core-image-minimal-initramfs".
 
@@ -3636,7 +3636,7 @@ system and gives an overview of their function and contents.
       The variable's default value is "defaults", which is set in the
       :ref:`update-rc.d <ref-classes-update-rc.d>` class.
 
-      The value in ``INITSCRIPT_PARAMS`` is passed through to the
+      The value in :term:`INITSCRIPT_PARAMS` is passed through to the
       ``update-rc.d`` command. For more information on valid parameters,
       please see the ``update-rc.d`` manual page at
       https://manpages.debian.org/buster/init-system-helpers/update-rc.d.8.en.html
@@ -3655,7 +3655,7 @@ system and gives an overview of their function and contents.
 
    :term:`INSTALL_TIMEZONE_FILE`
       By default, the ``tzdata`` recipe packages an ``/etc/timezone`` file.
-      Set the ``INSTALL_TIMEZONE_FILE`` variable to "0" at the
+      Set the :term:`INSTALL_TIMEZONE_FILE` variable to "0" at the
       configuration level to disable this behavior.
 
    :term:`IPK_FEED_URIS`
@@ -3687,7 +3687,7 @@ system and gives an overview of their function and contents.
       Values for this variable are set in the kernel's recipe file and the
       kernel's append file. For example, if you are using the
       ``linux-yocto_4.12`` kernel, the kernel recipe file is the
-      ``meta/recipes-kernel/linux/linux-yocto_4.12.bb`` file. ``KBRANCH``
+      ``meta/recipes-kernel/linux/linux-yocto_4.12.bb`` file. :term:`KBRANCH`
       is set as follows in that kernel recipe file::
 
          KBRANCH ?= "standard/base"
@@ -3707,7 +3707,7 @@ system and gives an overview of their function and contents.
          KBRANCH_edgerouter = "standard/edgerouter"
          KBRANCH_beaglebone = "standard/beaglebone"
 
-      The ``KBRANCH`` statements
+      The :term:`KBRANCH` statements
       identify the kernel branch to use when building for each supported
       BSP.
 
@@ -3721,7 +3721,7 @@ system and gives an overview of their function and contents.
       would place patch files and configuration fragment files (i.e.
       "out-of-tree"). However, if you want to use a ``defconfig`` file that
       is part of the kernel tree (i.e. "in-tree"), you can use the
-      ``KBUILD_DEFCONFIG`` variable and append the
+      :term:`KBUILD_DEFCONFIG` variable and append the
       :term:`KMACHINE` variable to point to the
       ``defconfig`` file.
 
@@ -3730,7 +3730,7 @@ system and gives an overview of their function and contents.
 
          KBUILD_DEFCONFIG_KMACHINE ?= defconfig_file
 
-      Here is an example from a "raspberrypi2" ``KMACHINE`` build that uses
+      Here is an example from a "raspberrypi2" :term:`KMACHINE` build that uses
       a ``defconfig`` file named "bcm2709_defconfig"::
 
          KBUILD_DEFCONFIG_raspberrypi2 = "bcm2709_defconfig"
@@ -3740,7 +3740,7 @@ system and gives an overview of their function and contents.
          KBUILD_DEFCONFIG_pn-linux-yocto ?= defconfig_file
 
       For more
-      information on how to use the ``KBUILD_DEFCONFIG`` variable, see the
+      information on how to use the :term:`KBUILD_DEFCONFIG` variable, see the
       ":ref:`kernel-dev/common:using an "in-tree" \`\`defconfig\`\` file`"
       section in the Yocto Project Linux Kernel Development Manual.
 
@@ -3757,27 +3757,27 @@ system and gives an overview of their function and contents.
       options not explicitly specified will be disabled in the kernel
       config.
 
-      In case ``KCONFIG_MODE`` is not set the behaviour will depend on where
+      In case :term:`KCONFIG_MODE` is not set the behaviour will depend on where
       the ``defconfig`` file is coming from. An "in-tree" ``defconfig`` file
       will be handled in ``alldefconfig`` mode, a ``defconfig`` file placed
       in ``${WORKDIR}`` through a meta-layer will be handled in
       ``allnoconfig`` mode.
 
       An "in-tree" ``defconfig`` file can be selected via the
-      :term:`KBUILD_DEFCONFIG` variable. ``KCONFIG_MODE`` does not need to
+      :term:`KBUILD_DEFCONFIG` variable. :term:`KCONFIG_MODE` does not need to
       be explicitly set.
 
       A ``defconfig`` file compatible with ``allnoconfig`` mode can be
       generated by copying the ``.config`` file from a working Linux kernel
       build, renaming it to ``defconfig`` and placing it into the Linux
-      kernel ``${WORKDIR}`` through your meta-layer. ``KCONFIG_MODE`` does
+      kernel ``${WORKDIR}`` through your meta-layer. :term:`KCONFIG_MODE` does
       not need to be explicitly set.
 
       A ``defconfig`` file compatible with ``alldefconfig`` mode can be
       generated using the
       :ref:`ref-tasks-savedefconfig`
       task and placed into the Linux kernel ``${WORKDIR}`` through your
-      meta-layer. Explicitely set ``KCONFIG_MODE``::
+      meta-layer. Explicitely set :term:`KCONFIG_MODE`::
 
          KCONFIG_MODE = "alldefconfig"
 
@@ -3789,10 +3789,10 @@ system and gives an overview of their function and contents.
 
    :term:`KERNEL_ARTIFACT_NAME`
       Specifies the name of all of the build artifacts. You can change the
-      name of the artifacts by changing the ``KERNEL_ARTIFACT_NAME``
+      name of the artifacts by changing the :term:`KERNEL_ARTIFACT_NAME`
       variable.
 
-      The value of ``KERNEL_ARTIFACT_NAME``, which is set in the
+      The value of :term:`KERNEL_ARTIFACT_NAME`, which is set in the
       ``meta/classes/kernel-artifact-names.bbclass`` file, has the
       following default value::
 
@@ -3869,13 +3869,13 @@ system and gives an overview of their function and contents.
       system, the default Board Support Packages (BSPs)
       :term:`Metadata` is provided through the
       :term:`KMACHINE` and :term:`KBRANCH`
-      variables. You can use the ``KERNEL_FEATURES`` variable from within
+      variables. You can use the :term:`KERNEL_FEATURES` variable from within
       the kernel recipe or kernel append file to further add metadata for
       all BSPs or specific BSPs.
 
       The metadata you add through this variable includes config fragments
       and features descriptions, which usually includes patches as well as
-      config fragments. You typically override the ``KERNEL_FEATURES``
+      config fragments. You typically override the :term:`KERNEL_FEATURES`
       variable for a specific machine. In this way, you can provide
       validated, but optional, sets of kernel configurations and features.
 
@@ -3935,12 +3935,12 @@ system and gives an overview of their function and contents.
 
    :term:`KERNEL_IMAGE_MAXSIZE`
       Specifies the maximum size of the kernel image file in kilobytes. If
-      ``KERNEL_IMAGE_MAXSIZE`` is set, the size of the kernel image file is
+      :term:`KERNEL_IMAGE_MAXSIZE` is set, the size of the kernel image file is
       checked against the set value during the
       :ref:`ref-tasks-sizecheck` task. The task fails if
       the kernel image file is larger than the setting.
 
-      ``KERNEL_IMAGE_MAXSIZE`` is useful for target devices that have a
+      :term:`KERNEL_IMAGE_MAXSIZE` is useful for target devices that have a
       limited amount of space in which the kernel image must be stored.
 
       By default, this variable is not set, which means the size of the
@@ -3965,7 +3965,7 @@ system and gives an overview of their function and contents.
       build.
 
       If you want to build an alternate kernel image type in addition to that
-      specified by ``KERNEL_IMAGETYPE``, use the :term:`KERNEL_ALT_IMAGETYPE`
+      specified by :term:`KERNEL_IMAGETYPE`, use the :term:`KERNEL_ALT_IMAGETYPE`
       variable.
 
    :term:`KERNEL_MODULE_AUTOLOAD`
@@ -3976,7 +3976,7 @@ system and gives an overview of their function and contents.
          This variable replaces the deprecated :term:`module_autoload`
          variable.
 
-      You can use the ``KERNEL_MODULE_AUTOLOAD`` variable anywhere that it
+      You can use the :term:`KERNEL_MODULE_AUTOLOAD` variable anywhere that it
       can be recognized by the kernel recipe or by an out-of-tree kernel
       module recipe (e.g. a machine configuration file, a distribution
       configuration file, an append file for the recipe, or the recipe
@@ -3986,7 +3986,7 @@ system and gives an overview of their function and contents.
 
          KERNEL_MODULE_AUTOLOAD += "module_name1 module_name2 module_name3"
 
-      Including ``KERNEL_MODULE_AUTOLOAD`` causes the OpenEmbedded build
+      Including :term:`KERNEL_MODULE_AUTOLOAD` causes the OpenEmbedded build
       system to populate the ``/etc/modules-load.d/modname.conf`` file with
       the list of modules to be auto-loaded on boot. The modules appear
       one-per-line in the file. Here is an example of the most common use
@@ -4015,7 +4015,7 @@ system and gives an overview of their function and contents.
       To help maximize compatibility with out-of-tree drivers used to build
       modules, the OpenEmbedded build system also recognizes and uses the
       :term:`KERNEL_SRC` variable, which is identical to
-      the ``KERNEL_PATH`` variable. Both variables are common variables
+      the :term:`KERNEL_PATH` variable. Both variables are common variables
       used by external Makefiles to point to the kernel source directory.
 
    :term:`KERNEL_SRC`
@@ -4029,7 +4029,7 @@ system and gives an overview of their function and contents.
       To help maximize compatibility with out-of-tree drivers used to build
       modules, the OpenEmbedded build system also recognizes and uses the
       :term:`KERNEL_PATH` variable, which is identical
-      to the ``KERNEL_SRC`` variable. Both variables are common variables
+      to the :term:`KERNEL_SRC` variable. Both variables are common variables
       used by external Makefiles to point to the kernel source directory.
 
    :term:`KERNEL_VERSION`
@@ -4042,9 +4042,9 @@ system and gives an overview of their function and contents.
    :term:`KERNELDEPMODDEPEND`
       Specifies whether the data referenced through
       :term:`PKGDATA_DIR` is needed or not.
-      ``KERNELDEPMODDEPEND`` does not control whether or not that data
+      :term:`KERNELDEPMODDEPEND` does not control whether or not that data
       exists, but simply whether or not it is used. If you do not need to
-      use the data, set the ``KERNELDEPMODDEPEND`` variable in your
+      use the data, set the :term:`KERNELDEPMODDEPEND` variable in your
       ``initramfs`` recipe. Setting the variable there when the data is not
       needed avoids a potential dependency loop.
 
@@ -4063,7 +4063,7 @@ system and gives an overview of their function and contents.
       OpenEmbedded build system understands as ``core2-32-intel-common``
       goes by a different name in the Linux Yocto kernel. The kernel
       understands that machine as ``intel-core2-32``. For cases like these,
-      the ``KMACHINE`` variable maps the kernel machine name to the
+      the :term:`KMACHINE` variable maps the kernel machine name to the
       OpenEmbedded build system machine name.
 
       These mappings between different names occur in the Yocto Linux
@@ -4078,7 +4078,7 @@ system and gives an overview of their function and contents.
          KBRANCH_core2-32-intel-common = "standard/base"
          KERNEL_FEATURES_append_core2-32-intel-common = "${KERNEL_FEATURES_INTEL_COMMON}"
 
-      The ``KMACHINE`` statement says
+      The :term:`KMACHINE` statement says
       that the kernel understands the machine name as "intel-core2-32".
       However, the OpenEmbedded build system understands the machine as
       "core2-32-intel-common".
@@ -4091,7 +4091,7 @@ system and gives an overview of their function and contents.
       Yocto Project Linux Kernel Development Manual for more information on
       kernel types.
 
-      You define the ``KTYPE`` variable in the
+      You define the :term:`KTYPE` variable in the
       :ref:`kernel-dev/advanced:bsp descriptions`. The
       value you use must match the value used for the
       :term:`LINUX_KERNEL_TYPE` value used by the
@@ -4144,7 +4144,7 @@ system and gives an overview of their function and contents.
 
    :term:`LAYERSERIES_COMPAT`
       Lists the versions of the :term:`OpenEmbedded-Core (OE-Core)` for which
-      a layer is compatible. Using the ``LAYERSERIES_COMPAT`` variable
+      a layer is compatible. Using the :term:`LAYERSERIES_COMPAT` variable
       allows the layer maintainer to indicate which combinations of the
       layer and OE-Core can be expected to work. The variable gives the
       system a way to detect when a layer has not been tested with new
@@ -4161,7 +4161,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         Setting ``LAYERSERIES_COMPAT`` is required by the Yocto Project
+         Setting :term:`LAYERSERIES_COMPAT` is required by the Yocto Project
          Compatible version 2 standard.
          The OpenEmbedded build system produces a warning if the variable
          is not set for any given layer.
@@ -4185,7 +4185,7 @@ system and gives an overview of their function and contents.
       to an environment variable and thus made visible to the software
       being built during the compilation step.
 
-      Default initialization for ``LDFLAGS`` varies depending on what is
+      Default initialization for :term:`LDFLAGS` varies depending on what is
       being built:
 
       -  :term:`TARGET_LDFLAGS` when building for the
@@ -4260,7 +4260,7 @@ system and gives an overview of their function and contents.
          LICENSE_${PN}-doc = "GFDL-1.2"
 
    :term:`LICENSE_CREATE_PACKAGE`
-      Setting ``LICENSE_CREATE_PACKAGE`` to "1" causes the OpenEmbedded
+      Setting :term:`LICENSE_CREATE_PACKAGE` to "1" causes the OpenEmbedded
       build system to create an extra package (i.e.
       ``${``\ :term:`PN`\ ``}-lic``) for each recipe and to add
       those packages to the
@@ -4305,9 +4305,9 @@ system and gives an overview of their function and contents.
 
    :term:`LICENSE_PATH`
       Path to additional licenses used during the build. By default, the
-      OpenEmbedded build system uses ``COMMON_LICENSE_DIR`` to define the
+      OpenEmbedded build system uses :term:`COMMON_LICENSE_DIR` to define the
       directory that holds common license text used during the build. The
-      ``LICENSE_PATH`` variable allows you to extend that location to other
+      :term:`LICENSE_PATH` variable allows you to extend that location to other
       areas that have additional licenses::
 
          LICENSE_PATH += "path-to-additional-common-licenses"
@@ -4320,9 +4320,9 @@ system and gives an overview of their function and contents.
       Yocto Project Linux Kernel Development Manual for more information on
       kernel types.
 
-      If you do not specify a ``LINUX_KERNEL_TYPE``, it defaults to
+      If you do not specify a :term:`LINUX_KERNEL_TYPE`, it defaults to
       "standard". Together with :term:`KMACHINE`, the
-      ``LINUX_KERNEL_TYPE`` variable defines the search arguments used by
+      :term:`LINUX_KERNEL_TYPE` variable defines the search arguments used by
       the kernel tools to find the appropriate description within the
       kernel :term:`Metadata` with which to build out the sources
       and configuration.
@@ -4336,7 +4336,7 @@ system and gives an overview of their function and contents.
 
          LINUX_VERSION ?= "3.4.24"
 
-      The ``LINUX_VERSION`` variable is used to define :term:`PV`
+      The :term:`LINUX_VERSION` variable is used to define :term:`PV`
       for the recipe::
 
          PV = "${LINUX_VERSION}+git${SRCPV}"
@@ -4366,8 +4366,8 @@ system and gives an overview of their function and contents.
 
    :term:`MACHINE`
       Specifies the target device for which the image is built. You define
-      ``MACHINE`` in the ``local.conf`` file found in the
-      :term:`Build Directory`. By default, ``MACHINE`` is set to
+      :term:`MACHINE` in the ``local.conf`` file found in the
+      :term:`Build Directory`. By default, :term:`MACHINE` is set to
       "qemux86", which is an x86-based architecture machine to be emulated
       using QEMU::
 
@@ -4375,7 +4375,7 @@ system and gives an overview of their function and contents.
 
       The variable corresponds to a machine configuration file of the same
       name, through which machine-specific configurations are set. Thus,
-      when ``MACHINE`` is set to "qemux86", the corresponding
+      when :term:`MACHINE` is set to "qemux86", the corresponding
       ``qemux86.conf`` machine configuration file can be found in
       the :term:`Source Directory` in
       ``meta/conf/machine``.
@@ -4401,13 +4401,13 @@ system and gives an overview of their function and contents.
       .. note::
 
          Adding additional Board Support Package (BSP) layers to your
-         configuration adds new possible settings for ``MACHINE``.
+         configuration adds new possible settings for :term:`MACHINE`.
 
    :term:`MACHINE_ARCH`
       Specifies the name of the machine-specific architecture. This
       variable is set automatically from :term:`MACHINE` or
       :term:`TUNE_PKGARCH`. You should not hand-edit
-      the ``MACHINE_ARCH`` variable.
+      the :term:`MACHINE_ARCH` variable.
 
    :term:`MACHINE_ESSENTIAL_EXTRA_RDEPENDS`
       A list of required machine-specific packages to install as part of
@@ -4419,7 +4419,7 @@ system and gives an overview of their function and contents.
       image.
 
       This variable is similar to the
-      ``MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS`` variable with the exception
+      :term:`MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS` variable with the exception
       that the image being built has a build dependency on the variable's
       list of packages. In other words, the image will not build if a file
       in this list is not found.
@@ -4440,7 +4440,7 @@ system and gives an overview of their function and contents.
       on ``packagegroup-core-boot``, including the ``core-image-minimal``
       image.
 
-      This variable is similar to the ``MACHINE_ESSENTIAL_EXTRA_RDEPENDS``
+      This variable is similar to the :term:`MACHINE_ESSENTIAL_EXTRA_RDEPENDS`
       variable with the exception that the image being built does not have
       a build dependency on the variable's list of packages. In other
       words, the image will still build if a package in this list is not
@@ -4482,7 +4482,7 @@ system and gives an overview of their function and contents.
       which does not include the ``core-image-minimal`` or
       ``core-image-full-cmdline`` images.
 
-      The variable is similar to the ``MACHINE_EXTRA_RRECOMMENDS`` variable
+      The variable is similar to the :term:`MACHINE_EXTRA_RRECOMMENDS` variable
       with the exception that the image being built has a build dependency
       on the variable's list of packages. In other words, the image will
       not build if a file in this list is not found.
@@ -4507,7 +4507,7 @@ system and gives an overview of their function and contents.
       which does not include the ``core-image-minimal`` or
       ``core-image-full-cmdline`` images.
 
-      This variable is similar to the ``MACHINE_EXTRA_RDEPENDS`` variable
+      This variable is similar to the :term:`MACHINE_EXTRA_RDEPENDS` variable
       with the exception that the image being built does not have a build
       dependency on the variable's list of packages. In other words, the
       image will build if a file in this list is not found.
@@ -4536,8 +4536,8 @@ system and gives an overview of their function and contents.
       shipped, see the ":ref:`ref-features-machine`" section.
 
    :term:`MACHINE_FEATURES_BACKFILL`
-      Features to be added to ``MACHINE_FEATURES`` if not also present in
-      ``MACHINE_FEATURES_BACKFILL_CONSIDERED``.
+      Features to be added to :term:`MACHINE_FEATURES` if not also present in
+      :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`.
 
       This variable is set in the ``meta/conf/bitbake.conf`` file. It is
       not intended to be user-configurable. It is best to just reference
@@ -4546,8 +4546,8 @@ system and gives an overview of their function and contents.
       section for more information.
 
    :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`
-      Features from ``MACHINE_FEATURES_BACKFILL`` that should not be
-      backfilled (i.e. added to ``MACHINE_FEATURES``) during the build. See
+      Features from :term:`MACHINE_FEATURES_BACKFILL` that should not be
+      backfilled (i.e. added to :term:`MACHINE_FEATURES`) during the build. See
       the ":ref:`ref-features-backfill`" section for more information.
 
    :term:`MACHINEOVERRIDES`
@@ -4555,11 +4555,11 @@ system and gives an overview of their function and contents.
       machine. By default, this list includes the value of
       :term:`MACHINE`.
 
-      You can extend ``MACHINEOVERRIDES`` to add extra overrides that
+      You can extend :term:`MACHINEOVERRIDES` to add extra overrides that
       should apply to a machine. For example, all machines emulated in QEMU
       (e.g. ``qemuarm``, ``qemux86``, and so forth) include a file named
       ``meta/conf/machine/include/qemu.inc`` that prepends the following
-      override to ``MACHINEOVERRIDES``::
+      override to :term:`MACHINEOVERRIDES`::
 
          MACHINEOVERRIDES =. "qemuall:"
 
@@ -4573,7 +4573,7 @@ system and gives an overview of their function and contents.
              "
 
       The underlying mechanism behind
-      ``MACHINEOVERRIDES`` is simply that it is included in the default
+      :term:`MACHINEOVERRIDES` is simply that it is included in the default
       value of :term:`OVERRIDES`.
 
    :term:`MAINTAINER`
@@ -4593,10 +4593,10 @@ system and gives an overview of their function and contents.
       first tries the local download directory. If that location fails, the
       build system tries locations defined by
       :term:`PREMIRRORS`, the upstream source, and then
-      locations specified by ``MIRRORS`` in that order.
+      locations specified by :term:`MIRRORS` in that order.
 
       Assuming your distribution (:term:`DISTRO`) is "poky",
-      the default value for ``MIRRORS`` is defined in the
+      the default value for :term:`MIRRORS` is defined in the
       ``conf/distro/poky.conf`` file in the ``meta-poky`` Git repository.
 
    :term:`MLPREFIX`
@@ -4604,16 +4604,16 @@ system and gives an overview of their function and contents.
       special version of a recipe or package (i.e. a Multilib version). The
       variable is used in places where the prefix needs to be added to or
       removed from a the name (e.g. the :term:`BPN` variable).
-      ``MLPREFIX`` gets set when a prefix has been added to ``PN``.
+      :term:`MLPREFIX` gets set when a prefix has been added to :term:`PN`.
 
       .. note::
 
-         The "ML" in ``MLPREFIX`` stands for "MultiLib". This representation is
+         The "ML" in :term:`MLPREFIX` stands for "MultiLib". This representation is
          historical and comes from a time when ``nativesdk`` was a suffix
          rather than a prefix on the recipe name. When ``nativesdk`` was turned
-         into a prefix, it made sense to set ``MLPREFIX`` for it as well.
+         into a prefix, it made sense to set :term:`MLPREFIX` for it as well.
 
-      To help understand when ``MLPREFIX`` might be needed, consider when
+      To help understand when :term:`MLPREFIX` might be needed, consider when
       :term:`BBCLASSEXTEND` is used to provide a
       ``nativesdk`` version of a recipe in addition to the target version.
       If that recipe declares build-time dependencies on tasks in other
@@ -4630,9 +4630,9 @@ system and gives an overview of their function and contents.
          do_foo[depends] += "${MLPREFIX}recipe:do_foo"
 
    module_autoload
-      This variable has been replaced by the ``KERNEL_MODULE_AUTOLOAD``
+      This variable has been replaced by the :term:`KERNEL_MODULE_AUTOLOAD`
       variable. You should replace all occurrences of ``module_autoload``
-      with additions to ``KERNEL_MODULE_AUTOLOAD``, for example::
+      with additions to :term:`KERNEL_MODULE_AUTOLOAD`, for example::
 
          module_autoload_rfcomm = "rfcomm"
 
@@ -4716,7 +4716,7 @@ system and gives an overview of their function and contents.
 
       Some classes (e.g.
       :ref:`cross-canadian <ref-classes-cross-canadian>`) modify the
-      ``MULTIMACH_TARGET_SYS`` value.
+      :term:`MULTIMACH_TARGET_SYS` value.
 
       See the :term:`STAMP` variable for an example. See the
       :term:`STAGING_DIR_TARGET` variable for more information.
@@ -4745,10 +4745,10 @@ system and gives an overview of their function and contents.
       licenses that are not in any way common. Also, new licenses are added
       occasionally to avoid introducing a lot of common license files,
       which are only applicable to a specific package.
-      ``NO_GENERIC_LICENSE`` is used to allow copying a license that does
+      :term:`NO_GENERIC_LICENSE` is used to allow copying a license that does
       not exist in common licenses.
 
-      The following example shows how to add ``NO_GENERIC_LICENSE`` to a
+      The following example shows how to add :term:`NO_GENERIC_LICENSE` to a
       recipe::
 
          NO_GENERIC_LICENSE[license_name] = "license_file_in_fetched_source"
@@ -4763,7 +4763,7 @@ system and gives an overview of their function and contents.
       Prevents installation of all "recommended-only" packages.
       Recommended-only packages are packages installed only through the
       :term:`RRECOMMENDS` variable). Setting the
-      ``NO_RECOMMENDATIONS`` variable to "1" turns this feature on::
+      :term:`NO_RECOMMENDATIONS` variable to "1" turns this feature on::
 
          NO_RECOMMENDATIONS = "1"
 
@@ -4795,7 +4795,7 @@ system and gives an overview of their function and contents.
    :term:`NOAUTOPACKAGEDEBUG`
       Disables auto package from splitting ``.debug`` files. If a recipe
       requires ``FILES_${PN}-dbg`` to be set manually, the
-      ``NOAUTOPACKAGEDEBUG`` can be defined allowing you to define the
+      :term:`NOAUTOPACKAGEDEBUG` can be defined allowing you to define the
       content of the debug package. For example::
 
          NOAUTOPACKAGEDEBUG = "1"
@@ -4838,7 +4838,7 @@ system and gives an overview of their function and contents.
       value is "oe-init-build-env".
 
       If you use a custom script to set up your build environment, set the
-      ``OE_INIT_ENV_SCRIPT`` variable to its name.
+      :term:`OE_INIT_ENV_SCRIPT` variable to its name.
 
    :term:`OE_TERMINAL`
       Controls how the OpenEmbedded build system spawns interactive
@@ -4861,7 +4861,7 @@ system and gives an overview of their function and contents.
       The directory from which the top-level build environment setup script
       is sourced. The Yocto Project provides a top-level build environment
       setup script: :ref:`structure-core-script`. When you run this
-      script, the ``OEROOT`` variable resolves to the directory that
+      script, the :term:`OEROOT` variable resolves to the directory that
       contains the script.
 
       For additional information on how this variable is used, see the
@@ -4881,12 +4881,12 @@ system and gives an overview of their function and contents.
       A colon-separated list of overrides that currently apply. Overrides
       are a BitBake mechanism that allows variables to be selectively
       overridden at the end of parsing. The set of overrides in
-      ``OVERRIDES`` represents the "state" during building, which includes
+      :term:`OVERRIDES` represents the "state" during building, which includes
       the current recipe being built, the machine for which it is being
       built, and so forth.
 
       As an example, if the string "an-override" appears as an element in
-      the colon-separated list in ``OVERRIDES``, then the following
+      the colon-separated list in :term:`OVERRIDES`, then the following
       assignment will override ``FOO`` with the value "overridden" at the
       end of parsing::
 
@@ -4897,7 +4897,7 @@ system and gives an overview of their function and contents.
       section in the BitBake User Manual for more information on the
       overrides mechanism.
 
-      The default value of ``OVERRIDES`` includes the values of the
+      The default value of :term:`OVERRIDES` includes the values of the
       :term:`CLASSOVERRIDE`,
       :term:`MACHINEOVERRIDES`, and
       :term:`DISTROOVERRIDES` variables. Another
@@ -4909,13 +4909,13 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         An easy way to see what overrides apply is to search for ``OVERRIDES``
+         An easy way to see what overrides apply is to search for :term:`OVERRIDES`
          in the output of the ``bitbake -e`` command. See the
          ":ref:`dev-manual/common-tasks:viewing variable values`" section in the Yocto
          Project Development Tasks Manual for more information.
 
    :term:`P`
-      The recipe name and version. ``P`` is comprised of the following::
+      The recipe name and version. :term:`P` is comprised of the following::
 
          ${PN}-${PV}
 
@@ -4950,7 +4950,7 @@ system and gives an overview of their function and contents.
 
       However, if your recipe's output packages are built specific to the
       target machine rather than generally for the architecture of the
-      machine, you should set ``PACKAGE_ARCH`` to the value of
+      machine, you should set :term:`PACKAGE_ARCH` to the value of
       :term:`MACHINE_ARCH` in the recipe as follows::
 
          PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -4959,11 +4959,11 @@ system and gives an overview of their function and contents.
       Specifies a list of architectures compatible with the target machine.
       This variable is set automatically and should not normally be
       hand-edited. Entries are separated using spaces and listed in order
-      of priority. The default value for ``PACKAGE_ARCHS`` is "all any
+      of priority. The default value for :term:`PACKAGE_ARCHS` is "all any
       noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}".
 
    :term:`PACKAGE_BEFORE_PN`
-      Enables easily adding packages to ``PACKAGES`` before ``${PN}`` so
+      Enables easily adding packages to :term:`PACKAGES` before ``${PN}`` so
       that those added packages can pick up files that would normally be
       included in the default package.
 
@@ -5003,7 +5003,7 @@ system and gives an overview of their function and contents.
       creating ``*-dbg`` packages to be used with the GNU Project Debugger
       (GDB).
 
-      With the ``PACKAGE_DEBUG_SPLIT_STYLE`` variable, you can control
+      With the :term:`PACKAGE_DEBUG_SPLIT_STYLE` variable, you can control
       where debug information, which can include or exclude source files,
       is stored:
 
@@ -5040,7 +5040,7 @@ system and gives an overview of their function and contents.
       are using :term:`IMAGE_FEATURES` to install
       ``dev-pkgs``, you might not want to install all packages from a
       particular multilib. If you find yourself in this situation, you can
-      use the ``PACKAGE_EXCLUDE_COMPLEMENTARY`` variable to specify regular
+      use the :term:`PACKAGE_EXCLUDE_COMPLEMENTARY` variable to specify regular
       expressions to match the packages you want to exclude.
 
    :term:`PACKAGE_EXCLUDE`
@@ -5078,7 +5078,7 @@ system and gives an overview of their function and contents.
    :term:`PACKAGE_FEED_ARCHS`
       Optionally specifies the package architectures used as part of the
       package feed URIs during the build. When used, the
-      ``PACKAGE_FEED_ARCHS`` variable is appended to the final package feed
+      :term:`PACKAGE_FEED_ARCHS` variable is appended to the final package feed
       URI, which is constructed using the
       :term:`PACKAGE_FEED_URIS` and
       :term:`PACKAGE_FEED_BASE_PATHS`
@@ -5086,15 +5086,15 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         You can use the ``PACKAGE_FEED_ARCHS``
+         You can use the :term:`PACKAGE_FEED_ARCHS`
          variable to whitelist specific package architectures. If you do
          not need to whitelist specific architectures, which is a common
          case, you can omit this variable. Omitting the variable results in
          all available architectures for the current machine being included
          into remote package feeds.
 
-      Consider the following example where the ``PACKAGE_FEED_URIS``,
-      ``PACKAGE_FEED_BASE_PATHS``, and ``PACKAGE_FEED_ARCHS`` variables are
+      Consider the following example where the :term:`PACKAGE_FEED_URIS`,
+      :term:`PACKAGE_FEED_BASE_PATHS`, and :term:`PACKAGE_FEED_ARCHS` variables are
       defined in your ``local.conf`` file::
 
          PACKAGE_FEED_URIS = "https://example.com/packagerepos/release \
@@ -5117,13 +5117,13 @@ system and gives an overview of their function and contents.
 
    :term:`PACKAGE_FEED_BASE_PATHS`
       Specifies the base path used when constructing package feed URIs. The
-      ``PACKAGE_FEED_BASE_PATHS`` variable makes up the middle portion of a
+      :term:`PACKAGE_FEED_BASE_PATHS` variable makes up the middle portion of a
       package feed URI used by the OpenEmbedded build system. The base path
       lies between the :term:`PACKAGE_FEED_URIS`
       and :term:`PACKAGE_FEED_ARCHS` variables.
 
-      Consider the following example where the ``PACKAGE_FEED_URIS``,
-      ``PACKAGE_FEED_BASE_PATHS``, and ``PACKAGE_FEED_ARCHS`` variables are
+      Consider the following example where the :term:`PACKAGE_FEED_URIS`,
+      :term:`PACKAGE_FEED_BASE_PATHS`, and :term:`PACKAGE_FEED_ARCHS` variables are
       defined in your ``local.conf`` file::
 
          PACKAGE_FEED_URIS = "https://example.com/packagerepos/release \
@@ -5147,12 +5147,12 @@ system and gives an overview of their function and contents.
    :term:`PACKAGE_FEED_URIS`
       Specifies the front portion of the package feed URI used by the
       OpenEmbedded build system. Each final package feed URI is comprised
-      of ``PACKAGE_FEED_URIS``,
+      of :term:`PACKAGE_FEED_URIS`,
       :term:`PACKAGE_FEED_BASE_PATHS`, and
       :term:`PACKAGE_FEED_ARCHS` variables.
 
-      Consider the following example where the ``PACKAGE_FEED_URIS``,
-      ``PACKAGE_FEED_BASE_PATHS``, and ``PACKAGE_FEED_ARCHS`` variables are
+      Consider the following example where the :term:`PACKAGE_FEED_URIS`,
+      :term:`PACKAGE_FEED_BASE_PATHS`, and :term:`PACKAGE_FEED_ARCHS` variables are
       defined in your ``local.conf`` file::
 
          PACKAGE_FEED_URIS = "https://example.com/packagerepos/release \
@@ -5178,7 +5178,7 @@ system and gives an overview of their function and contents.
       installation into the image.
 
       Because the package manager controls actual installation of all
-      packages, the list of packages passed using ``PACKAGE_INSTALL`` is
+      packages, the list of packages passed using :term:`PACKAGE_INSTALL` is
       not the final list of packages that are actually installed. This
       variable is internal to the image construction code. Consequently, in
       general, you should use the
@@ -5186,7 +5186,7 @@ system and gives an overview of their function and contents.
       packages for installation. The exception to this is when working with
       the :ref:`core-image-minimal-initramfs <ref-manual/images:images>`
       image. When working with an initial RAM filesystem (initramfs) image,
-      use the ``PACKAGE_INSTALL`` variable. For information on creating an
+      use the :term:`PACKAGE_INSTALL` variable. For information on creating an
       initramfs, see the ":ref:`dev-manual/common-tasks:building an initial ram filesystem (initramfs) image`" section
       in the Yocto Project Development Tasks Manual.
 
@@ -5207,7 +5207,7 @@ system and gives an overview of their function and contents.
       post-installation or pre-installation script can execute at rootfs
       creation time rather than on the target but depends on a native tool
       in order to execute, you need to list the tools in
-      ``PACKAGE_WRITE_DEPS``.
+      :term:`PACKAGE_WRITE_DEPS`.
 
       For information on running post-installation scripts, see the
       ":ref:`dev-manual/common-tasks:post-installation scripts`"
@@ -5215,7 +5215,7 @@ system and gives an overview of their function and contents.
 
    :term:`PACKAGECONFIG`
       This variable provides a means of enabling or disabling features of a
-      recipe on a per-recipe basis. ``PACKAGECONFIG`` blocks are defined in
+      recipe on a per-recipe basis. :term:`PACKAGECONFIG` blocks are defined in
       recipes when you specify features and then arguments that define
       feature behaviors. Here is the basic block structure (broken over
       multiple lines for readability)::
@@ -5243,8 +5243,8 @@ system and gives an overview of their function and contents.
          :term:`PACKAGECONFIG_CONFARGS`) if
          the feature is enabled.
 
-      2. Extra arguments that should be added to ``EXTRA_OECONF`` or
-         ``PACKAGECONFIG_CONFARGS`` if the feature is disabled.
+      2. Extra arguments that should be added to :term:`EXTRA_OECONF` or
+         :term:`PACKAGECONFIG_CONFARGS` if the feature is disabled.
 
       3. Additional build dependencies (:term:`DEPENDS`)
          that should be added if the feature is enabled.
@@ -5256,10 +5256,10 @@ system and gives an overview of their function and contents.
          (:term:`RRECOMMENDS`) that should be added if
          the feature is enabled.
 
-      6. Any conflicting (that is, mutually exclusive) ``PACKAGECONFIG``
+      6. Any conflicting (that is, mutually exclusive) :term:`PACKAGECONFIG`
          settings for this feature.
 
-      Consider the following ``PACKAGECONFIG`` block taken from the
+      Consider the following :term:`PACKAGECONFIG` block taken from the
       ``librsvg`` recipe. In this example the feature is ``gtk``, which has
       three arguments that determine the feature's behavior.
       ::
@@ -5269,21 +5269,21 @@ system and gives an overview of their function and contents.
       The
       ``--with-gtk3`` and ``gtk+3`` arguments apply only if the feature is
       enabled. In this case, ``--with-gtk3`` is added to the configure
-      script argument list and ``gtk+3`` is added to ``DEPENDS``. On the
+      script argument list and ``gtk+3`` is added to :term:`DEPENDS`. On the
       other hand, if the feature is disabled say through a ``.bbappend``
       file in another layer, then the second argument ``--without-gtk3`` is
       added to the configure script instead.
 
-      The basic ``PACKAGECONFIG`` structure previously described holds true
+      The basic :term:`PACKAGECONFIG` structure previously described holds true
       regardless of whether you are creating a block or changing a block.
       When creating a block, use the structure inside your recipe.
 
-      If you want to change an existing ``PACKAGECONFIG`` block, you can do
+      If you want to change an existing :term:`PACKAGECONFIG` block, you can do
       so one of two ways:
 
       -  *Append file:* Create an append file named
          recipename\ ``.bbappend`` in your layer and override the value of
-         ``PACKAGECONFIG``. You can either completely override the
+         :term:`PACKAGECONFIG`. You can either completely override the
          variable::
 
             PACKAGECONFIG = "f4 f5"
@@ -5308,16 +5308,16 @@ system and gives an overview of their function and contents.
       :term:`PACKAGECONFIG` setting.
 
       Classes such as :ref:`autotools <ref-classes-autotools>` and
-      :ref:`cmake <ref-classes-cmake>` use ``PACKAGECONFIG_CONFARGS`` to
-      pass ``PACKAGECONFIG`` options to ``configure`` and ``cmake``,
-      respectively. If you are using ``PACKAGECONFIG`` but not a class that
+      :ref:`cmake <ref-classes-cmake>` use :term:`PACKAGECONFIG_CONFARGS` to
+      pass :term:`PACKAGECONFIG` options to ``configure`` and ``cmake``,
+      respectively. If you are using :term:`PACKAGECONFIG` but not a class that
       handles the ``do_configure`` task, then you need to use
-      ``PACKAGECONFIG_CONFARGS`` appropriately.
+      :term:`PACKAGECONFIG_CONFARGS` appropriately.
 
    :term:`PACKAGEGROUP_DISABLE_COMPLEMENTARY`
       For recipes inheriting the
       :ref:`packagegroup <ref-classes-packagegroup>` class, setting
-      ``PACKAGEGROUP_DISABLE_COMPLEMENTARY`` to "1" specifies that the
+      :term:`PACKAGEGROUP_DISABLE_COMPLEMENTARY` to "1" specifies that the
       normal complementary packages (i.e. ``-dev``, ``-dbg``, and so forth)
       should not be automatically created by the ``packagegroup`` recipe,
       which is the default behavior.
@@ -5329,10 +5329,10 @@ system and gives an overview of their function and contents.
          ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}
 
       During packaging, the :ref:`ref-tasks-package` task
-      goes through ``PACKAGES`` and uses the :term:`FILES`
+      goes through :term:`PACKAGES` and uses the :term:`FILES`
       variable corresponding to each package to assign files to the
-      package. If a file matches the ``FILES`` variable for more than one
-      package in ``PACKAGES``, it will be assigned to the earliest
+      package. If a file matches the :term:`FILES` variable for more than one
+      package in :term:`PACKAGES`, it will be assigned to the earliest
       (leftmost) package.
 
       Packages in the variable's list that are empty (i.e. where none of
@@ -5344,10 +5344,10 @@ system and gives an overview of their function and contents.
    :term:`PACKAGES_DYNAMIC`
       A promise that your recipe satisfies runtime dependencies for
       optional modules that are found in other recipes.
-      ``PACKAGES_DYNAMIC`` does not actually satisfy the dependencies, it
+      :term:`PACKAGES_DYNAMIC` does not actually satisfy the dependencies, it
       only states that they should be satisfied. For example, if a hard,
       runtime dependency (:term:`RDEPENDS`) of another
-      package is satisfied at build time through the ``PACKAGES_DYNAMIC``
+      package is satisfied at build time through the :term:`PACKAGES_DYNAMIC`
       variable, but a package with the module name is never actually
       produced, then the other package will be broken. Thus, if you attempt
       to include that package in an image, you will get a dependency
@@ -5357,9 +5357,9 @@ system and gives an overview of their function and contents.
       Typically, if there is a chance that such a situation can occur and
       the package that is not created is valid without the dependency being
       satisfied, then you should use :term:`RRECOMMENDS`
-      (a soft runtime dependency) instead of ``RDEPENDS``.
+      (a soft runtime dependency) instead of :term:`RDEPENDS`.
 
-      For an example of how to use the ``PACKAGES_DYNAMIC`` variable when
+      For an example of how to use the :term:`PACKAGES_DYNAMIC` variable when
       you are splitting packages, see the
       ":ref:`dev-manual/common-tasks:handling optional module packaging`"
       section in the Yocto Project Development Tasks Manual.
@@ -5383,7 +5383,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         In order for ``PARALLEL_MAKE`` to be effective, ``make`` must be
+         In order for :term:`PARALLEL_MAKE` to be effective, ``make`` must be
          called with ``${``\ :term:`EXTRA_OEMAKE`\ ``}``. An easy way to ensure
          this is to use the ``oe_runmake`` function.
 
@@ -5394,7 +5394,7 @@ system and gives an overview of their function and contents.
 
          If the software being built experiences dependency issues during
          the ``do_compile`` task that result in race conditions, you can clear
-         the ``PARALLEL_MAKE`` variable within the recipe as a workaround. For
+         the :term:`PARALLEL_MAKE` variable within the recipe as a workaround. For
          information on addressing race conditions, see the
          ":ref:`dev-manual/common-tasks:debugging parallel make races`"
          section in the Yocto Project Development Tasks Manual.
@@ -5402,7 +5402,7 @@ system and gives an overview of their function and contents.
       For single socket systems (i.e. one CPU), you should not have to
       override this variable to gain optimal parallelism during builds.
       However, if you have very large systems that employ multiple physical
-      CPUs, you might want to make sure the ``PARALLEL_MAKE`` variable is
+      CPUs, you might want to make sure the :term:`PARALLEL_MAKE` variable is
       not set higher than "-j 20".
 
       For more information on speeding up builds, see the
@@ -5417,14 +5417,14 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         In order for ``PARALLEL_MAKEINST`` to be effective, ``make`` must
+         In order for :term:`PARALLEL_MAKEINST` to be effective, ``make`` must
          be called with
          ``${``\ :term:`EXTRA_OEMAKE`\ ``}``. An easy
          way to ensure this is to use the ``oe_runmake`` function.
 
          If the software being built experiences dependency issues during
          the ``do_install`` task that result in race conditions, you can
-         clear the ``PARALLEL_MAKEINST`` variable within the recipe as a
+         clear the :term:`PARALLEL_MAKEINST` variable within the recipe as a
          workaround. For information on addressing race conditions, see the
          ":ref:`dev-manual/common-tasks:debugging parallel make races`"
          section in the Yocto Project Development Tasks Manual.
@@ -5461,7 +5461,7 @@ system and gives an overview of their function and contents.
       variable is used to make upgrades possible when the versioning scheme
       changes in some backwards incompatible way.
 
-      ``PE`` is the default value of the :term:`PKGE` variable.
+      :term:`PE` is the default value of the :term:`PKGE` variable.
 
    :term:`PF`
       Specifies the recipe or package name and includes all version and
@@ -5483,7 +5483,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         When using the ``PKG`` variable, you must use a package name override.
+         When using the :term:`PKG` variable, you must use a package name override.
 
       For example, when the :ref:`debian <ref-classes-debian>` class
       renames the output package, it does so by setting
@@ -5534,45 +5534,45 @@ system and gives an overview of their function and contents.
    :term:`PKGDESTWORK`
       Points to a temporary work area where the
       :ref:`ref-tasks-package` task saves package metadata.
-      The ``PKGDESTWORK`` location defaults to the following::
+      The :term:`PKGDESTWORK` location defaults to the following::
 
          ${WORKDIR}/pkgdata
 
       Do not change this default.
 
       The :ref:`ref-tasks-packagedata` task copies the
-      package metadata from ``PKGDESTWORK`` to
+      package metadata from :term:`PKGDESTWORK` to
       :term:`PKGDATA_DIR` to make it available globally.
 
    :term:`PKGE`
-      The epoch of the package(s) built by the recipe. By default, ``PKGE``
+      The epoch of the package(s) built by the recipe. By default, :term:`PKGE`
       is set to :term:`PE`.
 
    :term:`PKGR`
       The revision of the package(s) built by the recipe. By default,
-      ``PKGR`` is set to :term:`PR`.
+      :term:`PKGR` is set to :term:`PR`.
 
    :term:`PKGV`
       The version of the package(s) built by the recipe. By default,
-      ``PKGV`` is set to :term:`PV`.
+      :term:`PKGV` is set to :term:`PV`.
 
    :term:`PN`
       This variable can have two separate functions depending on the
       context: a recipe name or a resulting package name.
 
-      ``PN`` refers to a recipe name in the context of a file used by the
+      :term:`PN` refers to a recipe name in the context of a file used by the
       OpenEmbedded build system as input to create a package. The name is
       normally extracted from the recipe file name. For example, if the
-      recipe is named ``expat_2.0.1.bb``, then the default value of ``PN``
+      recipe is named ``expat_2.0.1.bb``, then the default value of :term:`PN`
       will be "expat".
 
       The variable refers to a package name in the context of a file
       created or produced by the OpenEmbedded build system.
 
-      If applicable, the ``PN`` variable also contains any special suffix
+      If applicable, the :term:`PN` variable also contains any special suffix
       or prefix. For example, using ``bash`` to build packages for the
       native machine, ``PN`` is ``bash-native``. Using ``bash`` to build
-      packages for the target and for Multilib, ``PN`` would be ``bash``
+      packages for the target and for Multilib, :term:`PN` would be ``bash``
       and ``lib64-bash``, respectively.
 
    :term:`PNBLACKLIST`
@@ -5581,7 +5581,7 @@ system and gives an overview of their function and contents.
       :ref:`blacklist <ref-classes-blacklist>` class, which is inherited
       globally.
 
-      To prevent a recipe from being built, use the ``PNBLACKLIST``
+      To prevent a recipe from being built, use the :term:`PNBLACKLIST`
       variable in your ``local.conf`` file. Here is an example that
       prevents ``myrecipe`` from being built::
 
@@ -5615,30 +5615,30 @@ system and gives an overview of their function and contents.
       The revision of the recipe. The default value for this variable is
       "r0". Subsequent revisions of the recipe conventionally have the
       values "r1", "r2", and so forth. When :term:`PV` increases,
-      ``PR`` is conventionally reset to "r0".
+      :term:`PR` is conventionally reset to "r0".
 
       .. note::
 
-         The OpenEmbedded build system does not need the aid of ``PR``
+         The OpenEmbedded build system does not need the aid of :term:`PR`
          to know when to rebuild a recipe. The build system uses the task
          :ref:`input checksums <overview-manual/concepts:checksums (signatures)>` along with the
          :ref:`stamp <structure-build-tmp-stamps>` and
          :ref:`overview-manual/concepts:shared state cache`
          mechanisms.
 
-      The ``PR`` variable primarily becomes significant when a package
+      The :term:`PR` variable primarily becomes significant when a package
       manager dynamically installs packages on an already built image. In
-      this case, ``PR``, which is the default value of
+      this case, :term:`PR`, which is the default value of
       :term:`PKGR`, helps the package manager distinguish which
       package is the most recent one in cases where many packages have the
-      same ``PV`` (i.e. ``PKGV``). A component having many packages with
-      the same ``PV`` usually means that the packages all install the same
-      upstream version, but with later (``PR``) version packages including
+      same :term:`PV` (i.e. :term:`PKGV`). A component having many packages with
+      the same :term:`PV` usually means that the packages all install the same
+      upstream version, but with later (:term:`PR`) version packages including
       packaging fixes.
 
       .. note::
 
-         ``PR`` does not need to be increased for changes that do not change the
+         :term:`PR` does not need to be increased for changes that do not change the
          package contents or metadata.
 
       Because manually managing ``PR`` can be cumbersome and error-prone,
@@ -5657,7 +5657,7 @@ system and gives an overview of their function and contents.
          PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 
       In the previous example, multiple recipes are providing "virtual/kernel".
-      The ``PREFERRED_PROVIDER`` variable is set with the name (``PN``) of
+      The :term:`PREFERRED_PROVIDER` variable is set with the name (:term:`PN`) of
       the recipe you prefer to provide "virtual/kernel".
 
       Following are more examples::
@@ -5671,9 +5671,9 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         If you use a ``virtual/\*`` item with ``PREFERRED_PROVIDER``, then any
+         If you use a ``virtual/\*`` item with :term:`PREFERRED_PROVIDER`, then any
          recipe that :term:`PROVIDES` that item but is not selected (defined)
-         by ``PREFERRED_PROVIDER`` is prevented from building, which is usually
+         by :term:`PREFERRED_PROVIDER` is prevented from building, which is usually
          desirable since this mechanism is designed to select between mutually
          exclusive alternative providers.
 
@@ -5684,7 +5684,7 @@ system and gives an overview of their function and contents.
       the first example below), and you should specify the :term:`PV`
       accordingly (`3.4.0` in the example).
 
-      The ``PREFERRED_VERSION`` variable supports limited wildcard use
+      The :term:`PREFERRED_VERSION` variable supports limited wildcard use
       through the "``%``" character. You can use the character to match any
       number of characters, which can be useful when specifying versions
       that contain long revision numbers that potentially change. Here are
@@ -5716,7 +5716,7 @@ system and gives an overview of their function and contents.
 
          PREFERRED_VERSION_foo = "git"
 
-      Sometimes the ``PREFERRED_VERSION`` variable can be set by
+      Sometimes the :term:`PREFERRED_VERSION` variable can be set by
       configuration files in a way that is hard to change. You can use
       :term:`OVERRIDES` to set a machine-specific
       override. Here is an example::
@@ -5732,7 +5732,7 @@ system and gives an overview of their function and contents.
       .. note::
 
          The ``\_forcevariable`` override is not handled specially. This override
-         only works because the default value of ``OVERRIDES`` includes "forcevariable".
+         only works because the default value of :term:`OVERRIDES` includes "forcevariable".
 
       If a recipe with the specified version is not available, a warning
       message will be shown. See :term:`REQUIRED_VERSION` if you want this
@@ -5742,12 +5742,12 @@ system and gives an overview of their function and contents.
       Specifies additional paths from which the OpenEmbedded build system
       gets source code. When the build system searches for source code, it
       first tries the local download directory. If that location fails, the
-      build system tries locations defined by ``PREMIRRORS``, the upstream
+      build system tries locations defined by :term:`PREMIRRORS`, the upstream
       source, and then locations specified by
       :term:`MIRRORS` in that order.
 
       Assuming your distribution (:term:`DISTRO`) is "poky",
-      the default value for ``PREMIRRORS`` is defined in the
+      the default value for :term:`PREMIRRORS` is defined in the
       ``conf/distro/poky.conf`` file in the ``meta-poky`` Git repository.
 
       Typically, you could add a specific server for the build system to
@@ -5770,12 +5770,12 @@ system and gives an overview of their function and contents.
    :term:`PRIORITY`
       Indicates the importance of a package.
 
-      ``PRIORITY`` is considered to be part of the distribution policy
+      :term:`PRIORITY` is considered to be part of the distribution policy
       because the importance of any given recipe depends on the purpose for
-      which the distribution is being produced. Thus, ``PRIORITY`` is not
+      which the distribution is being produced. Thus, :term:`PRIORITY` is not
       normally set within recipes.
 
-      You can set ``PRIORITY`` to "required", "standard", "extra", and
+      You can set :term:`PRIORITY` to "required", "standard", "extra", and
       "optional", which is the default.
 
    :term:`PRIVATE_LIBS`
@@ -5805,19 +5805,19 @@ system and gives an overview of their function and contents.
 
    :term:`PROVIDES`
       A list of aliases by which a particular recipe can be known. By
-      default, a recipe's own ``PN`` is implicitly already in its
-      ``PROVIDES`` list and therefore does not need to mention that it
-      provides itself. If a recipe uses ``PROVIDES``, the additional
+      default, a recipe's own :term:`PN` is implicitly already in its
+      :term:`PROVIDES` list and therefore does not need to mention that it
+      provides itself. If a recipe uses :term:`PROVIDES`, the additional
       aliases are synonyms for the recipe and can be useful for satisfying
       dependencies of other recipes during the build as specified by
-      ``DEPENDS``.
+      :term:`DEPENDS`.
 
-      Consider the following example ``PROVIDES`` statement from the recipe
+      Consider the following example :term:`PROVIDES` statement from the recipe
       file ``eudev_3.2.9.bb``::
 
          PROVIDES += "udev"
 
-      The ``PROVIDES`` statement
+      The :term:`PROVIDES` statement
       results in the "eudev" recipe also being available as simply "udev".
 
       .. note::
@@ -5827,12 +5827,12 @@ system and gives an overview of their function and contents.
          strictly necessary it is recommended to avoid confusion.
 
       In addition to providing recipes under alternate names, the
-      ``PROVIDES`` mechanism is also used to implement virtual targets. A
+      :term:`PROVIDES` mechanism is also used to implement virtual targets. A
       virtual target is a name that corresponds to some particular
       functionality (e.g. a Linux kernel). Recipes that provide the
-      functionality in question list the virtual target in ``PROVIDES``.
+      functionality in question list the virtual target in :term:`PROVIDES`.
       Recipes that depend on the functionality in question can include the
-      virtual target in ``DEPENDS`` to leave the choice of provider open.
+      virtual target in :term:`DEPENDS` to leave the choice of provider open.
 
       Conventionally, virtual targets have names on the form
       "virtual/function" (e.g. "virtual/kernel"). The slash is simply part
@@ -5860,14 +5860,14 @@ system and gives an overview of their function and contents.
 
       The ``conf/local.conf.sample.extended`` configuration file in the
       :term:`Source Directory` shows how the
-      ``PRSERV_HOST`` variable is set::
+      :term:`PRSERV_HOST` variable is set::
 
          PRSERV_HOST = "localhost:0"
 
       You must
       set the variable if you want to automatically start a local :ref:`PR
       service <dev-manual/common-tasks:working with a pr service>`. You can
-      set ``PRSERV_HOST`` to other values to use a remote PR service.
+      set :term:`PRSERV_HOST` to other values to use a remote PR service.
 
 
    :term:`PSEUDO_IGNORE_PATHS`
@@ -5889,12 +5889,12 @@ system and gives an overview of their function and contents.
    :term:`PV`
       The version of the recipe. The version is normally extracted from the
       recipe filename. For example, if the recipe is named
-      ``expat_2.0.1.bb``, then the default value of ``PV`` will be "2.0.1".
-      ``PV`` is generally not overridden within a recipe unless it is
+      ``expat_2.0.1.bb``, then the default value of :term:`PV` will be "2.0.1".
+      :term:`PV` is generally not overridden within a recipe unless it is
       building an unstable (i.e. development) version from a source code
       repository (e.g. Git or Subversion).
 
-      ``PV`` is the default value of the :term:`PKGV` variable.
+      :term:`PV` is the default value of the :term:`PKGV` variable.
 
    :term:`PYTHON_ABI`
       When used by recipes that inherit the
@@ -5916,7 +5916,7 @@ system and gives an overview of their function and contents.
       When used by recipes that inherit the
       `distutils3 <ref-classes-distutils3>`,
       :ref:`setuptools3 <ref-classes-setuptools3>` classes, specifies the
-      major Python version being built. For Python 3.x, ``PYTHON_PN`` would
+      major Python version being built. For Python 3.x, :term:`PYTHON_PN` would
       be "python3". You do not have to set this variable as the
       OpenEmbedded build system automatically sets it for you.
 
@@ -5926,7 +5926,7 @@ system and gives an overview of their function and contents.
          DEPENDS += "${PYTHON_PN}-native"
 
       In the previous example,
-      the version of the dependency is ``PYTHON_PN``.
+      the version of the dependency is :term:`PYTHON_PN`.
 
    :term:`RANLIB`
       The minimal command and arguments to run ``ranlib``.
@@ -5944,7 +5944,7 @@ system and gives an overview of their function and contents.
       specifying versioned dependencies. Although the syntax varies
       depending on the packaging format, BitBake hides these differences
       from you. Here is the general syntax to specify versions with the
-      ``RCONFLICTS`` variable::
+      :term:`RCONFLICTS` variable::
 
          RCONFLICTS_${PN} = "package (operator version)"
 
@@ -5972,12 +5972,12 @@ system and gives an overview of their function and contents.
 
       The most common types of package
       runtime dependencies are automatically detected and added. Therefore,
-      most recipes do not need to set ``RDEPENDS``. For more information,
+      most recipes do not need to set :term:`RDEPENDS`. For more information,
       see the
       ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
       section in the Yocto Project Overview and Concepts Manual.
 
-      The practical effect of the above ``RDEPENDS`` assignment is that
+      The practical effect of the above :term:`RDEPENDS` assignment is that
       ``bar`` and ``baz`` will be declared as dependencies inside the
       package ``foo`` when it is written out by one of the
       :ref:`do_package_write_\* <ref-tasks-package_write_deb>` tasks.
@@ -5988,26 +5988,26 @@ system and gives an overview of their function and contents.
       also install the packages on which it depends.
 
       To ensure that the packages ``bar`` and ``baz`` get built, the
-      previous ``RDEPENDS`` assignment also causes a task dependency to be
+      previous :term:`RDEPENDS` assignment also causes a task dependency to be
       added. This dependency is from the recipe's
       :ref:`ref-tasks-build` (not to be confused with
       :ref:`ref-tasks-compile`) task to the
       ``do_package_write_*`` task of the recipes that build ``bar`` and
       ``baz``.
 
-      The names of the packages you list within ``RDEPENDS`` must be the
+      The names of the packages you list within :term:`RDEPENDS` must be the
       names of other packages - they cannot be recipe names. Although
       package names and recipe names usually match, the important point
-      here is that you are providing package names within the ``RDEPENDS``
+      here is that you are providing package names within the :term:`RDEPENDS`
       variable. For an example of the default list of packages created from
       a recipe, see the :term:`PACKAGES` variable.
 
-      Because the ``RDEPENDS`` variable applies to packages being built,
+      Because the :term:`RDEPENDS` variable applies to packages being built,
       you should always use the variable in a form with an attached package
       name (remember that a single recipe can build multiple packages). For
       example, suppose you are building a development package that depends
       on the ``perl`` package. In this case, you would use the following
-      ``RDEPENDS`` statement::
+      :term:`RDEPENDS` statement::
 
          RDEPENDS_${PN}-dev += "perl"
 
@@ -6024,19 +6024,19 @@ system and gives an overview of their function and contents.
          ``${PN}`` when modifying ``RDEPENDS_${PN}-dev``. Use the "+=" operator
          rather than the "=" operator.
 
-      The package names you use with ``RDEPENDS`` must appear as they would
-      in the ``PACKAGES`` variable. The :term:`PKG` variable
+      The package names you use with :term:`RDEPENDS` must appear as they would
+      in the :term:`PACKAGES` variable. The :term:`PKG` variable
       allows a different name to be used for the final package (e.g. the
       :ref:`debian <ref-classes-debian>` class uses this to rename
       packages), but this final package name cannot be used with
-      ``RDEPENDS``, which makes sense as ``RDEPENDS`` is meant to be
+      :term:`RDEPENDS`, which makes sense as :term:`RDEPENDS` is meant to be
       independent of the package format used.
 
       BitBake, which the OpenEmbedded build system uses, supports
       specifying versioned dependencies. Although the syntax varies
       depending on the packaging format, BitBake hides these differences
       from you. Here is the general syntax to specify versions with the
-      ``RDEPENDS`` variable::
+      :term:`RDEPENDS` variable::
 
          RDEPENDS_${PN} = "package (operator version)"
 
@@ -6052,7 +6052,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         You can use ``EXTENDPKGV`` to provide a full package version
+         You can use :term:`EXTENDPKGV` to provide a full package version
          specification.
 
       For example, the following sets up a dependency on version 1.2 or
@@ -6073,8 +6073,8 @@ system and gives an overview of their function and contents.
       class, this variable identifies distribution features that must exist
       in the current configuration in order for the OpenEmbedded build
       system to build the recipe. In other words, if the
-      ``REQUIRED_DISTRO_FEATURES`` variable lists a feature that does not
-      appear in ``DISTRO_FEATURES`` within the current configuration, then
+      :term:`REQUIRED_DISTRO_FEATURES` variable lists a feature that does not
+      appear in :term:`DISTRO_FEATURES` within the current configuration, then
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
@@ -6122,7 +6122,7 @@ system and gives an overview of their function and contents.
    :term:`ROOTFS`
       Indicates a filesystem image to include as the root filesystem.
 
-      The ``ROOTFS`` variable is an optional variable used with the
+      The :term:`ROOTFS` variable is an optional variable used with the
       :ref:`image-live <ref-classes-image-live>` class.
 
    :term:`ROOTFS_POSTINSTALL_COMMAND`
@@ -6183,11 +6183,11 @@ system and gives an overview of their function and contents.
       A list of package name aliases that a package also provides. These
       aliases are useful for satisfying runtime dependencies of other
       packages both during the build and on the target (as specified by
-      ``RDEPENDS``).
+      :term:`RDEPENDS`).
 
       .. note::
 
-         A package's own name is implicitly already in its ``RPROVIDES`` list.
+         A package's own name is implicitly already in its :term:`RPROVIDES` list.
 
       As with all package-controlling variables, you must always use the
       variable in conjunction with a package name override. Here is an
@@ -6200,16 +6200,16 @@ system and gives an overview of their function and contents.
       built. The package being built does not depend on this list of
       packages in order to successfully build, but rather uses them for
       extended usability. To specify runtime dependencies for packages, see
-      the ``RDEPENDS`` variable.
+      the :term:`RDEPENDS` variable.
 
-      The package manager will automatically install the ``RRECOMMENDS``
+      The package manager will automatically install the :term:`RRECOMMENDS`
       list of packages when installing the built package. However, you can
       prevent listed packages from being installed by using the
       :term:`BAD_RECOMMENDATIONS`,
       :term:`NO_RECOMMENDATIONS`, and
       :term:`PACKAGE_EXCLUDE` variables.
 
-      Packages specified in ``RRECOMMENDS`` need not actually be produced.
+      Packages specified in :term:`RRECOMMENDS` need not actually be produced.
       However, there must be a recipe providing each package, either
       through the :term:`PACKAGES` or
       :term:`PACKAGES_DYNAMIC` variables or the
@@ -6217,7 +6217,7 @@ system and gives an overview of their function and contents.
       during the build. If such a recipe does exist and the package is not
       produced, the build continues without error.
 
-      Because the ``RRECOMMENDS`` variable applies to packages being built,
+      Because the :term:`RRECOMMENDS` variable applies to packages being built,
       you should always attach an override to the variable to specify the
       particular package whose usability is being extended. For example,
       suppose you are building a development package that is extended to
@@ -6228,14 +6228,14 @@ system and gives an overview of their function and contents.
 
       In the
       example, the package name (``${PN}-dev``) must appear as it would in
-      the ``PACKAGES`` namespace before any renaming of the output package
+      the :term:`PACKAGES` namespace before any renaming of the output package
       by classes such as ``debian.bbclass``.
 
       BitBake, which the OpenEmbedded build system uses, supports
       specifying versioned recommends. Although the syntax varies depending
       on the packaging format, BitBake hides these differences from you.
       Here is the general syntax to specify versions with the
-      ``RRECOMMENDS`` variable::
+      :term:`RRECOMMENDS` variable::
 
          RRECOMMENDS_${PN} = "package (operator version)"
 
@@ -6257,7 +6257,7 @@ system and gives an overview of their function and contents.
       this variable to determine which package should be installed to
       replace other package(s) during an upgrade. In order to also have the
       other package(s) removed at the same time, you must add the name of
-      the other package to the ``RCONFLICTS`` variable.
+      the other package to the :term:`RCONFLICTS` variable.
 
       As with all package-controlling variables, you must use this variable
       in conjunction with a package name override. Here is an example::
@@ -6268,7 +6268,7 @@ system and gives an overview of their function and contents.
       specifying versioned replacements. Although the syntax varies
       depending on the packaging format, BitBake hides these differences
       from you. Here is the general syntax to specify versions with the
-      ``RREPLACES`` variable::
+      :term:`RREPLACES` variable::
 
          RREPLACES_${PN} = "package (operator version)"
 
@@ -6304,7 +6304,7 @@ system and gives an overview of their function and contents.
       version. If the source tarball extracts the code to a directory named
       anything other than ``${BPN}-${PV}``, or if the source code is
       fetched from an SCM such as Git or Subversion, then you must set
-      ``S`` in the recipe so that the OpenEmbedded build system knows where
+      :term:`S` in the recipe so that the OpenEmbedded build system knows where
       to find the unpacked source.
 
       As an example, assume a :term:`Source Directory`
@@ -6319,7 +6319,7 @@ system and gives an overview of their function and contents.
       This next example assumes a Git repository. By default, Git
       repositories are cloned to ``${WORKDIR}/git`` during
       :ref:`ref-tasks-fetch`. Since this path is different
-      from the default value of ``S``, you must set it specifically so the
+      from the default value of :term:`S`, you must set it specifically so the
       source can be located::
 
          SRC_URI = "git://path/to/repo.git"
@@ -6336,7 +6336,7 @@ system and gives an overview of their function and contents.
       been tested against. Identifiers consist of the host distributor ID
       followed by the release, as reported by the ``lsb_release`` tool or
       as read from ``/etc/lsb-release``. Separate the list items with
-      explicit newline characters (``\n``). If ``SANITY_TESTED_DISTROS`` is
+      explicit newline characters (``\n``). If :term:`SANITY_TESTED_DISTROS` is
       not empty and the current value of
       :term:`NATIVELSBSTRING` does not appear in the
       list, then the build system reports a warning that indicates the
@@ -6347,7 +6347,7 @@ system and gives an overview of their function and contents.
       set this variable. Instead, use :term:`SDKMACHINE`.
 
    :term:`SDK_CUSTOM_TEMPLATECONF`
-      When building the extensible SDK, if ``SDK_CUSTOM_TEMPLATECONF`` is set to
+      When building the extensible SDK, if :term:`SDK_CUSTOM_TEMPLATECONF` is set to
       "1" and a ``conf/templateconf.conf`` file exists in the build directory
       (:term:`TOPDIR`) then this will be copied into the SDK.
 
@@ -6355,7 +6355,7 @@ system and gives an overview of their function and contents.
       The directory set up and used by the
       :ref:`populate_sdk_base <ref-classes-populate-sdk>` class to which
       the SDK is deployed. The ``populate_sdk_base`` class defines
-      ``SDK_DEPLOY`` as follows::
+      :term:`SDK_DEPLOY` as follows::
 
          SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 
@@ -6369,8 +6369,8 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         The ``SDK_DIR`` directory is a temporary directory as it is part of
-         ``WORKDIR``. The final output directory is :term:`SDK_DEPLOY`.
+         The :term:`SDK_DIR` directory is a temporary directory as it is part of
+         :term:`WORKDIR`. The final output directory is :term:`SDK_DEPLOY`.
 
    :term:`SDK_EXT_TYPE`
       Controls whether or not shared state artifacts are copied into the
@@ -6409,7 +6409,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         Enabling the ``SDK_INCLUDE_PKGDATA``
+         Enabling the :term:`SDK_INCLUDE_PKGDATA`
          variable significantly increases build time because all of world
          needs to be built. Enabling the variable also slightly increases
          the size of the extensible SDK.
@@ -6423,9 +6423,9 @@ system and gives an overview of their function and contents.
       IDE or from other tools and you do not want to perform additional
       steps to install the toolchain.
 
-      The ``SDK_INCLUDE_TOOLCHAIN`` variable defaults to "0" if
-      ``SDK_EXT_TYPE`` is set to "minimal", and defaults to "1" if
-      ``SDK_EXT_TYPE`` is set to "full".
+      The :term:`SDK_INCLUDE_TOOLCHAIN` variable defaults to "0" if
+      :term:`SDK_EXT_TYPE` is set to "minimal", and defaults to "1" if
+      :term:`SDK_EXT_TYPE` is set to "full".
 
    :term:`SDK_INHERIT_BLACKLIST`
       A list of classes to remove from the :term:`INHERIT`
@@ -6451,7 +6451,7 @@ system and gives an overview of their function and contents.
       build system is running and thus would be potentially problematic
       within the extensible SDK.
 
-      By default, ``SDK_LOCAL_CONF_BLACKLIST`` is set in the
+      By default, :term:`SDK_LOCAL_CONF_BLACKLIST` is set in the
       :ref:`populate-sdk-ext <ref-classes-populate-sdk-*>` class and
       excludes the following variables:
 
@@ -6513,7 +6513,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         The ``SDK_OUTPUT`` directory is a temporary directory as it is part of
+         The :term:`SDK_OUTPUT` directory is a temporary directory as it is part of
          :term:`WORKDIR` by way of :term:`SDK_DIR`. The final output directory is
          :term:`SDK_DEPLOY`.
 
@@ -6521,7 +6521,7 @@ system and gives an overview of their function and contents.
       Specifies a list of architectures compatible with the SDK machine.
       This variable is set automatically and should not normally be
       hand-edited. Entries are separated using spaces and listed in order
-      of priority. The default value for ``SDK_PACKAGE_ARCHS`` is "all any
+      of priority. The default value for :term:`SDK_PACKAGE_ARCHS` is "all any
       noarch ${SDK_ARCH}-${SDKPKGSUFFIX}".
 
    :term:`SDK_POSTPROCESS_COMMAND`
@@ -6536,7 +6536,7 @@ system and gives an overview of their function and contents.
 
    :term:`SDK_PREFIX`
       The toolchain binary prefix used for ``nativesdk`` recipes. The
-      OpenEmbedded build system uses the ``SDK_PREFIX`` value to set the
+      OpenEmbedded build system uses the :term:`SDK_PREFIX` value to set the
       :term:`TARGET_PREFIX` when building
       ``nativesdk`` recipes. The default value is "${SDK_SYS}-".
 
@@ -6550,9 +6550,9 @@ system and gives an overview of their function and contents.
       - do_deploy
 
       Despite the default value of "" for the
-      ``SDK_RECRDEP_TASKS`` variable, the above four tasks are always added
+      :term:`SDK_RECRDEP_TASKS` variable, the above four tasks are always added
       to the SDK. To specify tasks beyond these four, you need to use the
-      ``SDK_RECRDEP_TASKS`` variable (e.g. you are defining additional
+      :term:`SDK_RECRDEP_TASKS` variable (e.g. you are defining additional
       tasks that are needed in order to build
       :term:`SDK_TARGETS`).
 
@@ -6563,7 +6563,7 @@ system and gives an overview of their function and contents.
       The OpenEmbedded build system automatically sets this variable based
       on :term:`SDK_ARCH`,
       :term:`SDK_VENDOR`, and
-      :term:`SDK_OS`. You do not need to set the ``SDK_SYS``
+      :term:`SDK_OS`. You do not need to set the :term:`SDK_SYS`
       variable yourself.
 
    :term:`SDK_TARGET_MANIFEST`
@@ -6587,7 +6587,7 @@ system and gives an overview of their function and contents.
       standard or extensible SDK installation. The default value is "${PN}"
       (i.e. the image from which the SDK is built).
 
-      The ``SDK_TARGETS`` variable is an internal variable and typically
+      The :term:`SDK_TARGETS` variable is an internal variable and typically
       would not be changed.
 
    :term:`SDK_TITLE`
@@ -6600,7 +6600,7 @@ system and gives an overview of their function and contents.
          SDK_TITLE ??= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
 
       For the default distribution "poky",
-      ``SDK_TITLE`` is set to "Poky (Yocto Project Reference Distro)".
+      :term:`SDK_TITLE` is set to "Poky (Yocto Project Reference Distro)".
 
       For information on how to change this default title, see the
       ":ref:`sdk-manual/appendix-customizing:changing the extensible sdk installer title`"
@@ -6618,7 +6618,7 @@ system and gives an overview of their function and contents.
    :term:`SDK_VERSION`
       Specifies the version of the SDK. The Poky distribution configuration file
       (``/meta-poky/conf/distro/poky.conf``) sets the default
-      ``SDK_VERSION`` as follows::
+      :term:`SDK_VERSION` as follows::
 
          SDK_VERSION = "${@d.getVar('DISTRO_VERSION').replace('snapshot-${METADATA_REVISION}', 'snapshot')}"
 
@@ -6636,7 +6636,7 @@ system and gives an overview of their function and contents.
          SDKEXTPATH ??= "~/${@d.getVar('DISTRO')}_sdk"
 
       For the
-      default distribution "poky", the ``SDKEXTPATH`` is set to "poky_sdk".
+      default distribution "poky", the :term:`SDKEXTPATH` is set to "poky_sdk".
 
       For information on how to change this default directory, see the
       ":ref:`sdk-manual/appendix-customizing:changing the default sdk installation directory`"
@@ -6644,7 +6644,7 @@ system and gives an overview of their function and contents.
       Extensible Software Development Kit (eSDK) manual.
 
    :term:`SDKIMAGE_FEATURES`
-      Equivalent to ``IMAGE_FEATURES``. However, this variable applies to
+      Equivalent to :term:`IMAGE_FEATURES`. However, this variable applies to
       the SDK generated from an image using the following command::
 
          $ bitbake -c populate_sdk imagename
@@ -6652,7 +6652,7 @@ system and gives an overview of their function and contents.
    :term:`SDKMACHINE`
       The machine for which the SDK is built. In other words, the SDK is
       built such that it runs on the target you specify with the
-      ``SDKMACHINE`` value. The value points to a corresponding ``.conf``
+      :term:`SDKMACHINE` value. The value points to a corresponding ``.conf``
       file under ``conf/machine-sdk/``.
 
       You can use "i686" and "x86_64" as possible values for this variable.
@@ -6664,7 +6664,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         You cannot set the ``SDKMACHINE``
+         You cannot set the :term:`SDKMACHINE`
          variable in your distribution configuration file. If you do, the
          configuration will not take affect.
 
@@ -6689,7 +6689,7 @@ system and gives an overview of their function and contents.
       building for the target. The flags are passed through the default
       value of the :term:`TARGET_CFLAGS` variable.
 
-      The ``SELECTED_OPTIMIZATION`` variable takes the value of
+      The :term:`SELECTED_OPTIMIZATION` variable takes the value of
       :term:`FULL_OPTIMIZATION` unless :term:`DEBUG_BUILD` = "1", in which
       case the value of :term:`DEBUG_OPTIMIZATION` is used.
 
@@ -6703,7 +6703,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         The ``SERIAL_CONSOLE`` variable is deprecated. Please use the
+         The :term:`SERIAL_CONSOLE` variable is deprecated. Please use the
          :term:`SERIAL_CONSOLES` variable.
 
    :term:`SERIAL_CONSOLES`
@@ -6821,7 +6821,7 @@ system and gives an overview of their function and contents.
 
    :term:`SOURCE_MIRROR_FETCH`
       When you are fetching files to create a mirror of sources (i.e.
-      creating a source mirror), setting ``SOURCE_MIRROR_FETCH`` to "1" in
+      creating a source mirror), setting :term:`SOURCE_MIRROR_FETCH` to "1" in
       your ``local.conf`` configuration file ensures the source for all
       recipes are fetched regardless of whether or not a recipe is
       compatible with the configuration. A recipe is considered
@@ -6833,7 +6833,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         Do not set the ``SOURCE_MIRROR_FETCH``
+         Do not set the :term:`SOURCE_MIRROR_FETCH`
          variable unless you are creating a source mirror. In other words,
          do not set the variable during a normal build.
 
@@ -6851,11 +6851,11 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         You can specify only a single URL in ``SOURCE_MIRROR_URL``.
+         You can specify only a single URL in :term:`SOURCE_MIRROR_URL`.
 
    :term:`SPDXLICENSEMAP`
       Maps commonly used license names to their SPDX counterparts found in
-      ``meta/files/common-licenses/``. For the default ``SPDXLICENSEMAP``
+      ``meta/files/common-licenses/``. For the default :term:`SPDXLICENSEMAP`
       mappings, see the ``meta/conf/licenses.conf`` file.
 
       For additional information, see the :term:`LICENSE`
@@ -6886,7 +6886,7 @@ system and gives an overview of their function and contents.
          SPL_IMAGE ?= "${SPL_BINARYNAME}-${MACHINE}-${PV}-${PR}"
          SPL_SYMLINK ?= "${SPL_BINARYNAME}-${MACHINE}"
 
-      The ``SPL_BINARY`` variable helps form
+      The :term:`SPL_BINARY` variable helps form
       various ``SPL_*`` variables used by the OpenEmbedded build system.
 
       See the BeagleBone machine configuration example in the
@@ -6899,7 +6899,7 @@ system and gives an overview of their function and contents.
       OpenEmbedded build system which bits to pull in for the build and how
       to pull them in. For example, if the recipe or append file only needs
       to fetch a tarball from the Internet, the recipe or append file uses
-      a single ``SRC_URI`` entry. On the other hand, if the recipe or
+      a single :term:`SRC_URI` entry. On the other hand, if the recipe or
       append file needs to fetch a tarball, apply two patches, and include
       a custom file, the recipe or append file would include four instances
       of the variable.
@@ -6978,7 +6978,7 @@ system and gives an overview of their function and contents.
 
       -  ``az://`` - Fetches files from an Azure Storage account.
 
-      There are standard and recipe-specific options for ``SRC_URI``. Here are
+      There are standard and recipe-specific options for :term:`SRC_URI`. Here are
       standard ones:
 
       -  ``apply`` - Whether to apply the patch or not. The default
@@ -6997,19 +6997,19 @@ system and gives an overview of their function and contents.
          :term:`SRCDATE` is equal to or greater than
          ``mindate``.
 
-      -  ``maxdate`` - Apply the patch only if ``SRCDATE`` is not later
+      -  ``maxdate`` - Apply the patch only if :term:`SRCDATE` is not later
          than ``maxdate``.
 
-      -  ``minrev`` - Apply the patch only if ``SRCREV`` is equal to or
+      -  ``minrev`` - Apply the patch only if :term:`SRCREV` is equal to or
          greater than ``minrev``.
 
-      -  ``maxrev`` - Apply the patch only if ``SRCREV`` is not later
+      -  ``maxrev`` - Apply the patch only if :term:`SRCREV` is not later
          than ``maxrev``.
 
-      -  ``rev`` - Apply the patch only if ``SRCREV`` is equal to
+      -  ``rev`` - Apply the patch only if :term:`SRCREV` is equal to
          ``rev``.
 
-      -  ``notrev`` - Apply the patch only if ``SRCREV`` is not equal to
+      -  ``notrev`` - Apply the patch only if :term:`SRCREV` is not equal to
          ``rev``.
 
       Here are some additional options worth mentioning:
@@ -7022,19 +7022,19 @@ system and gives an overview of their function and contents.
          the Git fetcher is used.
 
       -  ``subdir`` - Places the file (or extracts its contents) into the
-         specified subdirectory of ``WORKDIR`` when the local (``file://``)
+         specified subdirectory of :term:`WORKDIR` when the local (``file://``)
          fetcher is used.
 
       -  ``localdir`` - Places the file (or extracts its contents) into
-         the specified subdirectory of ``WORKDIR`` when the CVS fetcher is
+         the specified subdirectory of :term:`WORKDIR` when the CVS fetcher is
          used.
 
       -  ``subpath`` - Limits the checkout to a specific subpath of the
          tree when using the Git fetcher is used.
 
       -  ``name`` - Specifies a name to be used for association with
-         ``SRC_URI`` checksums or :term:`SRCREV` when you have more than one
-         file or git repository specified in ``SRC_URI``. For example::
+         :term:`SRC_URI` checksums or :term:`SRCREV` when you have more than one
+         file or git repository specified in :term:`SRC_URI`. For example::
 
             SRC_URI = "git://example.com/foo.git;name=first \
                        git://example.com/bar.git;name=second \
@@ -7051,7 +7051,7 @@ system and gives an overview of their function and contents.
    :term:`SRC_URI_OVERRIDES_PACKAGE_ARCH`
       By default, the OpenEmbedded build system automatically detects
       whether ``SRC_URI`` contains files that are machine-specific. If so,
-      the build system automatically changes ``PACKAGE_ARCH``. Setting this
+      the build system automatically changes :term:`PACKAGE_ARCH`. Setting this
       variable to "0" disables this behavior.
 
    :term:`SRCDATE`
@@ -7063,16 +7063,16 @@ system and gives an overview of their function and contents.
       Returns the version string of the current package. This string is
       used to help define the value of :term:`PV`.
 
-      The ``SRCPV`` variable is defined in the ``meta/conf/bitbake.conf``
+      The :term:`SRCPV` variable is defined in the ``meta/conf/bitbake.conf``
       configuration file in the :term:`Source Directory` as
       follows::
 
          SRCPV = "${@bb.fetch2.get_srcrev(d)}"
 
-      Recipes that need to define ``PV`` do so with the help of the
-      ``SRCPV``. For example, the ``ofono`` recipe (``ofono_git.bb``)
+      Recipes that need to define :term:`PV` do so with the help of the
+      :term:`SRCPV`. For example, the ``ofono`` recipe (``ofono_git.bb``)
       located in ``meta/recipes-connectivity`` in the Source Directory
-      defines ``PV`` as follows::
+      defines :term:`PV` as follows::
 
          PV = "0.12-git${SRCPV}"
 
@@ -7081,13 +7081,13 @@ system and gives an overview of their function and contents.
       variable applies to Subversion, Git, Mercurial, and Bazaar only. Note
       that if you want to build a fixed revision and you want to avoid
       performing a query on the remote repository every time BitBake parses
-      your recipe, you should specify a ``SRCREV`` that is a full revision
+      your recipe, you should specify a :term:`SRCREV` that is a full revision
       identifier and not just a tag.
 
       .. note::
 
          For information on limitations when inheriting the latest revision
-         of software using ``SRCREV``, see the :term:`AUTOREV` variable
+         of software using :term:`SRCREV`, see the :term:`AUTOREV` variable
          description and the
          ":ref:`dev-manual/common-tasks:automatically incrementing a package version number`"
          section, which is in the Yocto Project Development Tasks Manual.
@@ -7098,9 +7098,9 @@ system and gives an overview of their function and contents.
    :term:`SSTATE_MIRROR_ALLOW_NETWORK`
       If set to "1", allows fetches from mirrors that are specified in
       :term:`SSTATE_MIRRORS` to work even when
-      fetching from the network is disabled by setting ``BB_NO_NETWORK`` to
-      "1". Using the ``SSTATE_MIRROR_ALLOW_NETWORK`` variable is useful if
-      you have set ``SSTATE_MIRRORS`` to point to an internal server for
+      fetching from the network is disabled by setting :term:`BB_NO_NETWORK` to
+      "1". Using the :term:`SSTATE_MIRROR_ALLOW_NETWORK` variable is useful if
+      you have set :term:`SSTATE_MIRRORS` to point to an internal server for
       your shared state cache, but you want to disable any other fetching
       from the network.
 
@@ -7118,7 +7118,7 @@ system and gives an overview of their function and contents.
 
       When pointing to sstate build artifacts on another machine that uses
       a different GCC version for native builds, you must configure
-      ``SSTATE_MIRRORS`` with a regular expression that maps local search
+      :term:`SSTATE_MIRRORS` with a regular expression that maps local search
       paths to server paths. The paths need to take into account
       :term:`NATIVELSBSTRING` set by the
       :ref:`uninative <ref-classes-uninative>` class. For example, the
@@ -7147,8 +7147,8 @@ system and gives an overview of their function and contents.
       (sstate) object during the first stage of preparing the sysroots.
       That object is scanned for hardcoded paths for original installation
       locations. The list of files that are scanned for paths is controlled
-      by the ``SSTATE_SCAN_FILES`` variable. Typically, recipes add files
-      they want to be scanned to the value of ``SSTATE_SCAN_FILES`` rather
+      by the :term:`SSTATE_SCAN_FILES` variable. Typically, recipes add files
+      they want to be scanned to the value of :term:`SSTATE_SCAN_FILES` rather
       than the variable being comprehensively set. The
       :ref:`sstate <ref-classes-sstate>` class specifies the default list
       of files.
@@ -7210,7 +7210,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         Recipes should never write files directly under the ``STAGING_DIR``
+         Recipes should never write files directly under the :term:`STAGING_DIR`
          directory because the OpenEmbedded build system manages the
          directory automatically. Instead, files should be installed to
          ``${``\ :term:`D`\ ``}`` within your recipe's :ref:`ref-tasks-install`
@@ -7225,7 +7225,7 @@ system and gives an overview of their function and contents.
       files. Exceptions include ``-native`` recipes, where the
       ``do_populate_sysroot`` task instead uses
       :term:`STAGING_DIR_NATIVE`. Depending on
-      the type of recipe and the build target, ``STAGING_DIR_HOST`` can
+      the type of recipe and the build target, :term:`STAGING_DIR_HOST` can
       have the following values:
 
       -  For recipes building for the target machine, the value is
@@ -7243,7 +7243,7 @@ system and gives an overview of their function and contents.
             standard build environment variables such as
             :term:`CPPFLAGS` and
             :term:`CFLAGS` are set up so that both host paths
-            and ``STAGING_DIR_NATIVE`` are searched for libraries and
+            and :term:`STAGING_DIR_NATIVE` are searched for libraries and
             headers using, for example, GCC's ``-isystem`` option.
 
             Thus, the emphasis is that the ``STAGING_DIR*`` variables
@@ -7251,7 +7251,7 @@ system and gives an overview of their function and contents.
             :ref:`ref-tasks-configure`,
             :ref:`ref-tasks-compile`, and
             :ref:`ref-tasks-install`. Having the real system
-            root correspond to ``STAGING_DIR_HOST`` makes conceptual sense
+            root correspond to :term:`STAGING_DIR_HOST` makes conceptual sense
             for ``-native`` recipes, as they make use of host headers and
             libraries.
 
@@ -7262,7 +7262,7 @@ system and gives an overview of their function and contents.
    :term:`STAGING_DIR_TARGET`
       Specifies the path to the sysroot used for the system for which the
       component generates code. For components that do not generate code,
-      which is the majority, ``STAGING_DIR_TARGET`` is set to match
+      which is the majority, :term:`STAGING_DIR_TARGET` is set to match
       :term:`STAGING_DIR_HOST`.
 
       Some recipes build binaries that can run on the target system but
@@ -7271,8 +7271,8 @@ system and gives an overview of their function and contents.
       primary system is referred to as the "HOST" and the secondary, or
       different, system is referred to as the "TARGET". Thus, the binaries
       run on the "HOST" system and generate binaries for the "TARGET"
-      system. The ``STAGING_DIR_HOST`` variable points to the sysroot used
-      for the "HOST" system, while ``STAGING_DIR_TARGET`` points to the
+      system. The :term:`STAGING_DIR_HOST` variable points to the sysroot used
+      for the "HOST" system, while :term:`STAGING_DIR_TARGET` points to the
       sysroot used for the "TARGET" system.
 
    :term:`STAGING_ETCDIR_NATIVE`
@@ -7297,7 +7297,7 @@ system and gives an overview of their function and contents.
       Points to the directory containing the kernel build artifacts.
       Recipes building software that needs to access kernel build artifacts
       (e.g. ``systemtap-uprobes``) can look in the directory specified with
-      the ``STAGING_KERNEL_BUILDDIR`` variable to find these artifacts
+      the :term:`STAGING_KERNEL_BUILDDIR` variable to find these artifacts
       after the kernel has been built.
 
    :term:`STAGING_KERNEL_DIR`
@@ -7317,7 +7317,7 @@ system and gives an overview of their function and contents.
       Specifies the base path used to create recipe stamp files. The path
       to an actual stamp file is constructed by evaluating this string and
       then appending additional information. Currently, the default
-      assignment for ``STAMP`` as set in the ``meta/conf/bitbake.conf``
+      assignment for :term:`STAMP` as set in the ``meta/conf/bitbake.conf``
       file is::
 
          STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
@@ -7344,8 +7344,8 @@ system and gives an overview of their function and contents.
    :term:`SUMMARY`
       The short (72 characters or less) summary of the binary package for
       packaging systems such as ``opkg``, ``rpm``, or ``dpkg``. By default,
-      ``SUMMARY`` is used to define the
-      :term:`DESCRIPTION` variable if ``DESCRIPTION`` is
+      :term:`SUMMARY` is used to define the
+      :term:`DESCRIPTION` variable if :term:`DESCRIPTION` is
       not set in the recipe.
 
    :term:`SVNDIR`
@@ -7475,10 +7475,10 @@ system and gives an overview of their function and contents.
 
    :term:`SYSTEMD_BOOT_CFG`
       When :term:`EFI_PROVIDER` is set to
-      "systemd-boot", the ``SYSTEMD_BOOT_CFG`` variable specifies the
+      "systemd-boot", the :term:`SYSTEMD_BOOT_CFG` variable specifies the
       configuration file that should be used. By default, the
       :ref:`systemd-boot <ref-classes-systemd-boot>` class sets the
-      ``SYSTEMD_BOOT_CFG`` as follows::
+      :term:`SYSTEMD_BOOT_CFG` as follows::
 
          SYSTEMD_BOOT_CFG ?= "${:term:`S`}/loader.conf"
 
@@ -7487,11 +7487,11 @@ system and gives an overview of their function and contents.
 
    :term:`SYSTEMD_BOOT_ENTRIES`
       When :term:`EFI_PROVIDER` is set to
-      "systemd-boot", the ``SYSTEMD_BOOT_ENTRIES`` variable specifies a
+      "systemd-boot", the :term:`SYSTEMD_BOOT_ENTRIES` variable specifies a
       list of entry files (``*.conf``) to install that contain one boot
       entry per file. By default, the
       :ref:`systemd-boot <ref-classes-systemd-boot>` class sets the
-      ``SYSTEMD_BOOT_ENTRIES`` as follows::
+      :term:`SYSTEMD_BOOT_ENTRIES` as follows::
 
           SYSTEMD_BOOT_ENTRIES ?= ""
 
@@ -7500,10 +7500,10 @@ system and gives an overview of their function and contents.
 
    :term:`SYSTEMD_BOOT_TIMEOUT`
       When :term:`EFI_PROVIDER` is set to
-      "systemd-boot", the ``SYSTEMD_BOOT_TIMEOUT`` variable specifies the
+      "systemd-boot", the :term:`SYSTEMD_BOOT_TIMEOUT` variable specifies the
       boot menu timeout in seconds. By default, the
       :ref:`systemd-boot <ref-classes-systemd-boot>` class sets the
-      ``SYSTEMD_BOOT_TIMEOUT`` as follows::
+      :term:`SYSTEMD_BOOT_TIMEOUT` as follows::
 
          SYSTEMD_BOOT_TIMEOUT ?= "10"
 
@@ -7513,14 +7513,14 @@ system and gives an overview of their function and contents.
    :term:`SYSTEMD_PACKAGES`
       When inheriting the :ref:`systemd <ref-classes-systemd>` class,
       this variable locates the systemd unit files when they are not found
-      in the main recipe's package. By default, the ``SYSTEMD_PACKAGES``
+      in the main recipe's package. By default, the :term:`SYSTEMD_PACKAGES`
       variable is set such that the systemd unit files are assumed to
       reside in the recipes main package::
 
          SYSTEMD_PACKAGES ?= "${PN}"
 
       If these unit files are not in this recipe's main package, you need
-      to use ``SYSTEMD_PACKAGES`` to list the package or packages in which
+      to use :term:`SYSTEMD_PACKAGES` to list the package or packages in which
       the build system can find the systemd unit files.
 
    :term:`SYSTEMD_SERVICE`
@@ -7541,7 +7541,7 @@ system and gives an overview of their function and contents.
       (allowing login), assuming :term:`USE_VT` is not set to
       "0".
 
-      The default value for ``SYSVINIT_ENABLED_GETTYS`` is "1" (i.e. only
+      The default value for :term:`SYSVINIT_ENABLED_GETTYS` is "1" (i.e. only
       run a getty on the first virtual terminal).
 
    :term:`T`
@@ -7555,7 +7555,7 @@ system and gives an overview of their function and contents.
       BitBake unpacks and builds the recipe. The default ``bitbake.conf``
       file sets this variable.
 
-      The ``T`` variable is not to be confused with the
+      The :term:`T` variable is not to be confused with the
       :term:`TMPDIR` variable, which points to the root of
       the directory tree where BitBake places the output of an entire
       build.
@@ -7579,7 +7579,7 @@ system and gives an overview of their function and contents.
 
    :term:`TARGET_AS_ARCH`
       Specifies architecture-specific assembler flags for the target
-      system. ``TARGET_AS_ARCH`` is initialized from
+      system. :term:`TARGET_AS_ARCH` is initialized from
       :term:`TUNE_ASARGS` by default in the BitBake
       configuration file (``meta/conf/bitbake.conf``)::
 
@@ -7587,20 +7587,20 @@ system and gives an overview of their function and contents.
 
    :term:`TARGET_CC_ARCH`
       Specifies architecture-specific C compiler flags for the target
-      system. ``TARGET_CC_ARCH`` is initialized from
+      system. :term:`TARGET_CC_ARCH` is initialized from
       :term:`TUNE_CCARGS` by default.
 
       .. note::
 
          It is a common workaround to append :term:`LDFLAGS` to
-         ``TARGET_CC_ARCH`` in recipes that build software for the target that
-         would not otherwise respect the exported ``LDFLAGS`` variable.
+         :term:`TARGET_CC_ARCH` in recipes that build software for the target that
+         would not otherwise respect the exported :term:`LDFLAGS` variable.
 
    :term:`TARGET_CC_KERNEL_ARCH`
       This is a specific kernel compiler flag for a CPU or Application
       Binary Interface (ABI) tune. The flag is used rarely and only for
       cases where a userspace :term:`TUNE_CCARGS` is not
-      compatible with the kernel compilation. The ``TARGET_CC_KERNEL_ARCH``
+      compatible with the kernel compilation. The :term:`TARGET_CC_KERNEL_ARCH`
       variable allows the kernel (and associated modules) to use a
       different configuration. See the
       ``meta/conf/machine/include/arm/feature-arm-thumb.inc`` file in the
@@ -7612,8 +7612,8 @@ system and gives an overview of their function and contents.
       :term:`CFLAGS` is set to the value of this variable by
       default.
 
-      Additionally, the SDK's environment setup script sets the ``CFLAGS``
-      variable in the environment to the ``TARGET_CFLAGS`` value so that
+      Additionally, the SDK's environment setup script sets the :term:`CFLAGS`
+      variable in the environment to the :term:`TARGET_CFLAGS` value so that
       executables built using the SDK also have the flags applied.
 
    :term:`TARGET_CPPFLAGS`
@@ -7623,7 +7623,7 @@ system and gives an overview of their function and contents.
       value of this variable by default.
 
       Additionally, the SDK's environment setup script sets the
-      ``CPPFLAGS`` variable in the environment to the ``TARGET_CPPFLAGS``
+      :term:`CPPFLAGS` variable in the environment to the :term:`TARGET_CPPFLAGS`
       value so that executables built using the SDK also have the flags
       applied.
 
@@ -7634,7 +7634,7 @@ system and gives an overview of their function and contents.
       by default.
 
       Additionally, the SDK's environment setup script sets the
-      ``CXXFLAGS`` variable in the environment to the ``TARGET_CXXFLAGS``
+      :term:`CXXFLAGS` variable in the environment to the :term:`TARGET_CXXFLAGS`
       value so that executables built using the SDK also have the flags
       applied.
 
@@ -7646,7 +7646,7 @@ system and gives an overview of their function and contents.
 
    :term:`TARGET_LD_ARCH`
       Specifies architecture-specific linker flags for the target system.
-      ``TARGET_LD_ARCH`` is initialized from
+      :term:`TARGET_LD_ARCH` is initialized from
       :term:`TUNE_LDARGS` by default in the BitBake
       configuration file (``meta/conf/bitbake.conf``)::
 
@@ -7660,7 +7660,7 @@ system and gives an overview of their function and contents.
 
       Additionally, the SDK's environment setup script sets the
       :term:`LDFLAGS` variable in the environment to the
-      ``TARGET_LDFLAGS`` value so that executables built using the SDK also
+      :term:`TARGET_LDFLAGS` value so that executables built using the SDK also
       have the flags applied.
 
    :term:`TARGET_OS`
@@ -7682,7 +7682,7 @@ system and gives an overview of their function and contents.
          value of ``BUILD_PREFIX``.
 
       -  For native SDK recipes (``nativesdk``), the build system sets the
-         variable to the value of ``SDK_PREFIX``.
+         variable to the value of :term:`SDK_PREFIX`.
 
    :term:`TARGET_SYS`
       Specifies the system, including the architecture and the operating
@@ -7696,7 +7696,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         You do not need to set the ``TARGET_SYS`` variable yourself.
+         You do not need to set the :term:`TARGET_SYS` variable yourself.
 
       Consider these two examples:
 
@@ -7727,11 +7727,11 @@ system and gives an overview of their function and contents.
       In the ``defaultsetup.conf`` file, the default value of
       ``TCLIBCAPPEND`` is "-${TCLIBC}". However, distros such as poky,
       which normally only support one ``libc`` variant, set
-      ``TCLIBCAPPEND`` to "" in their distro configuration file resulting
+      :term:`TCLIBCAPPEND` to "" in their distro configuration file resulting
       in no suffix being applied.
 
    :term:`TCMODE`
-      Specifies the toolchain selector. ``TCMODE`` controls the
+      Specifies the toolchain selector. :term:`TCMODE` controls the
       characteristics of the generated packages and images by telling the
       OpenEmbedded build system which toolchain profile to use. By default,
       the OpenEmbedded build system builds its own internal toolchain. The
@@ -7740,7 +7740,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         If ``TCMODE`` is set to a value other than "default", then it is your
+         If :term:`TCMODE` is set to a value other than "default", then it is your
          responsibility to ensure that the toolchain is compatible with the
          default toolchain. Using older or newer versions of these
          components might cause build problems. See the Release Notes for
@@ -7750,7 +7750,7 @@ system and gives an overview of their function and contents.
          page on the Yocto Project website and click on the "RELEASE
          INFORMATION" link for the appropriate release.
 
-      The ``TCMODE`` variable is similar to :term:`TCLIBC`,
+      The :term:`TCMODE` variable is similar to :term:`TCLIBC`,
       which controls the variant of the GNU standard C library (``libc``)
       used during the build process: ``glibc`` or ``musl``.
 
@@ -7776,7 +7776,7 @@ system and gives an overview of their function and contents.
       the :term:`TEST_EXPORT_ONLY` variable is set
       to "1".
 
-      The ``TEST_EXPORT_DIR`` variable defaults to
+      The :term:`TEST_EXPORT_DIR` variable defaults to
       ``"${TMPDIR}/testimage/${PN}"``.
 
    :term:`TEST_EXPORT_ONLY`
@@ -7786,7 +7786,7 @@ system and gives an overview of their function and contents.
 
    :term:`TEST_LOG_DIR`
       Holds the SSH log and the boot log for QEMU machines. The
-      ``TEST_LOG_DIR`` variable defaults to ``"${WORKDIR}/testimage"``.
+      :term:`TEST_LOG_DIR` variable defaults to ``"${WORKDIR}/testimage"``.
 
       .. note::
 
@@ -7806,7 +7806,7 @@ system and gives an overview of their function and contents.
       For automated hardware testing, specifies additional arguments to
       pass through to the command specified in
       :term:`TEST_POWERCONTROL_CMD`. Setting
-      ``TEST_POWERCONTROL_EXTRA_ARGS`` is optional. You can use it if you
+      :term:`TEST_POWERCONTROL_EXTRA_ARGS` is optional. You can use it if you
       wish, for example, to separate the machine-specific and
       non-machine-specific parts of the arguments.
 
@@ -7837,7 +7837,7 @@ system and gives an overview of their function and contents.
       For automated hardware testing, specifies additional arguments to
       pass through to the command specified in
       :term:`TEST_SERIALCONTROL_CMD`. Setting
-      ``TEST_SERIALCONTROL_EXTRA_ARGS`` is optional. You can use it if you
+      :term:`TEST_SERIALCONTROL_EXTRA_ARGS` is optional. You can use it if you
       wish, for example, to separate the machine-specific and
       non-machine-specific parts of the command.
 
@@ -7849,7 +7849,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         The ``TEST_SERVER_IP`` variable is only used for a small number of
+         The :term:`TEST_SERVER_IP` variable is only used for a small number of
          tests such as the "dnf" test suite, which needs to download packages
          from ``WORKDIR/oe-rootfs-repo``.
 
@@ -7866,7 +7866,7 @@ system and gives an overview of their function and contents.
          QEMU.
 
       Tests include ``ping``, ``ssh``, ``df`` among others. You can add
-      your own tests to the list of tests by appending ``TEST_SUITES`` as
+      your own tests to the list of tests by appending :term:`TEST_SUITES` as
       follows::
 
          TEST_SUITES_append = " mytest"
@@ -7905,7 +7905,7 @@ system and gives an overview of their function and contents.
       the controllers by adding a module in the layer's
       ``/lib/oeqa/controllers`` directory and by inheriting the
       ``BaseTarget`` class, which is an abstract class that cannot be used
-      as a value of ``TEST_TARGET``.
+      as a value of :term:`TEST_TARGET`.
 
       You can provide the following arguments with ``TEST_TARGET``:
 
@@ -7930,7 +7930,7 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Development Tasks Manual.
 
    :term:`TEST_TARGET_IP`
-      The IP address of your hardware under test. The ``TEST_TARGET_IP``
+      The IP address of your hardware under test. The :term:`TEST_TARGET_IP`
       variable has no effect when :term:`TEST_TARGET` is
       set to "qemu".
 
@@ -7947,7 +7947,7 @@ system and gives an overview of their function and contents.
 
    :term:`TESTIMAGE_AUTO`
       Automatically runs the series of automated tests for images when an
-      image is successfully built. Setting ``TESTIMAGE_AUTO`` to "1" causes
+      image is successfully built. Setting :term:`TESTIMAGE_AUTO` to "1" causes
       any image that successfully builds to automatically boot under QEMU.
       Using the variable also adds in dependencies so that any SDK for
       which testing is requested is automatically built first.
@@ -7979,7 +7979,7 @@ system and gives an overview of their function and contents.
    :term:`TMPDIR`
       This variable is the base directory the OpenEmbedded build system
       uses for all build output and intermediate files (other than the
-      shared state cache). By default, the ``TMPDIR`` variable points to
+      shared state cache). By default, the :term:`TMPDIR` variable points to
       ``tmp`` within the :term:`Build Directory`.
 
       If you want to establish this directory in a location other than the
@@ -7988,14 +7988,14 @@ system and gives an overview of their function and contents.
 
          #TMPDIR = "${TOPDIR}/tmp"
 
-      An example use for this scenario is to set ``TMPDIR`` to a local disk,
+      An example use for this scenario is to set :term:`TMPDIR` to a local disk,
       which does not use NFS, while having the Build Directory use NFS.
 
-      The filesystem used by ``TMPDIR`` must have standard filesystem
+      The filesystem used by :term:`TMPDIR` must have standard filesystem
       semantics (i.e. mixed-case files are unique, POSIX file locking, and
       persistent inodes). Due to various issues with NFS and bugs in some
       implementations, NFS does not meet this minimum requirement.
-      Consequently, ``TMPDIR`` cannot be on NFS.
+      Consequently, :term:`TMPDIR` cannot be on NFS.
 
    :term:`TOOLCHAIN_HOST_TASK`
       This variable lists packages the OpenEmbedded build system uses when
@@ -8024,7 +8024,7 @@ system and gives an overview of their function and contents.
    :term:`TOOLCHAIN_OUTPUTNAME`
       This variable defines the name used for the toolchain output. The
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class sets
-      the ``TOOLCHAIN_OUTPUTNAME`` variable as follows::
+      the :term:`TOOLCHAIN_OUTPUTNAME` variable as follows::
 
          TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
@@ -8060,7 +8060,7 @@ system and gives an overview of their function and contents.
       variable is used where the architecture is needed in a value where
       underscores are not allowed, for example within package filenames. In
       this case, dash characters replace any underscore characters used in
-      ``TARGET_ARCH``.
+      :term:`TARGET_ARCH`.
 
       Do not edit this variable.
 
@@ -8069,18 +8069,18 @@ system and gives an overview of their function and contents.
       ``arm``, ``armeb``, ``mips``, ``mips64``, and so forth). BitBake uses
       this value to setup configuration.
 
-      ``TUNE_ARCH`` definitions are specific to a given architecture. The
+      :term:`TUNE_ARCH` definitions are specific to a given architecture. The
       definitions can be a single static definition, or can be dynamically
       adjusted. You can see details for a given CPU family by looking at
       the architecture's ``README`` file. For example, the
       ``meta/conf/machine/include/mips/README`` file in the
       :term:`Source Directory` provides information for
-      ``TUNE_ARCH`` specific to the ``mips`` architecture.
+      :term:`TUNE_ARCH` specific to the ``mips`` architecture.
 
-      ``TUNE_ARCH`` is tied closely to
+      :term:`TUNE_ARCH` is tied closely to
       :term:`TARGET_ARCH`, which defines the target
       machine's architecture. The BitBake configuration file
-      (``meta/conf/bitbake.conf``) sets ``TARGET_ARCH`` as follows::
+      (``meta/conf/bitbake.conf``) sets :term:`TARGET_ARCH` as follows::
 
          TARGET_ARCH = "${TUNE_ARCH}"
 
@@ -8098,7 +8098,7 @@ system and gives an overview of their function and contents.
    :term:`TUNE_ASARGS`
       Specifies architecture-specific assembler flags for the target
       system. The set of flags is based on the selected tune features.
-      ``TUNE_ASARGS`` is set using the tune include files, which are
+      :term:`TUNE_ASARGS` is set using the tune include files, which are
       typically under ``meta/conf/machine/include/`` and are influenced
       through :term:`TUNE_FEATURES`. For example, the
       ``meta/conf/machine/include/x86/arch-x86.inc`` file defines the flags
@@ -8115,7 +8115,7 @@ system and gives an overview of their function and contents.
    :term:`TUNE_CCARGS`
       Specifies architecture-specific C compiler flags for the target
       system. The set of flags is based on the selected tune features.
-      ``TUNE_CCARGS`` is set using the tune include files, which are
+      :term:`TUNE_CCARGS` is set using the tune include files, which are
       typically under ``meta/conf/machine/include/`` and are influenced
       through :term:`TUNE_FEATURES`.
 
@@ -8135,7 +8135,7 @@ system and gives an overview of their function and contents.
       are not conflicting and that they are supported.
 
       The BitBake configuration file (``meta/conf/bitbake.conf``) defines
-      ``TUNE_FEATURES`` as follows::
+      :term:`TUNE_FEATURES` as follows::
 
          TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
 
@@ -8144,7 +8144,7 @@ system and gives an overview of their function and contents.
    :term:`TUNE_LDARGS`
       Specifies architecture-specific linker flags for the target system.
       The set of flags is based on the selected tune features.
-      ``TUNE_LDARGS`` is set using the tune include files, which are
+      :term:`TUNE_LDARGS` is set using the tune include files, which are
       typically under ``meta/conf/machine/include/`` and are influenced
       through :term:`TUNE_FEATURES`. For example, the
       ``meta/conf/machine/include/x86/arch-x86.inc`` file defines the flags
@@ -8174,12 +8174,12 @@ system and gives an overview of their function and contents.
    :term:`TUNEABI`
       An underlying Application Binary Interface (ABI) used by a particular
       tuning in a given toolchain layer. Providers that use prebuilt
-      libraries can use the ``TUNEABI``,
+      libraries can use the :term:`TUNEABI`,
       :term:`TUNEABI_OVERRIDE`, and
       :term:`TUNEABI_WHITELIST` variables to check
       compatibility of tunings against their selection of libraries.
 
-      If ``TUNEABI`` is undefined, then every tuning is allowed. See the
+      If :term:`TUNEABI` is undefined, then every tuning is allowed. See the
       :ref:`sanity <ref-classes-sanity>` class to see how the variable is
       used.
 
@@ -8187,7 +8187,7 @@ system and gives an overview of their function and contents.
       If set, the OpenEmbedded system ignores the
       :term:`TUNEABI_WHITELIST` variable.
       Providers that use prebuilt libraries can use the
-      ``TUNEABI_OVERRIDE``, ``TUNEABI_WHITELIST``, and
+      :term:`TUNEABI_OVERRIDE`, :term:`TUNEABI_WHITELIST`, and
       :term:`TUNEABI` variables to check compatibility of a
       tuning against their selection of libraries.
 
@@ -8196,9 +8196,9 @@ system and gives an overview of their function and contents.
 
    :term:`TUNEABI_WHITELIST`
       A whitelist of permissible :term:`TUNEABI` values. If
-      ``TUNEABI_WHITELIST`` is not set, all tunes are allowed. Providers
-      that use prebuilt libraries can use the ``TUNEABI_WHITELIST``,
-      :term:`TUNEABI_OVERRIDE`, and ``TUNEABI``
+      :term:`TUNEABI_WHITELIST` is not set, all tunes are allowed. Providers
+      that use prebuilt libraries can use the :term:`TUNEABI_WHITELIST`,
+      :term:`TUNEABI_OVERRIDE`, and :term:`TUNEABI`
       variables to check compatibility of a tuning against their selection
       of libraries.
 
@@ -8243,35 +8243,35 @@ system and gives an overview of their function and contents.
          UBOOT_CONFIG[spinor] = "mx6qsabreauto_spinor_config"
 
       In this example, "sd" is selected as the configuration of the possible four for the
-      ``UBOOT_MACHINE``. The "sd" configuration defines
-      "mx6qsabreauto_config" as the value for ``UBOOT_MACHINE``, while the
+      :term:`UBOOT_MACHINE`. The "sd" configuration defines
+      "mx6qsabreauto_config" as the value for :term:`UBOOT_MACHINE`, while the
       "sdcard" specifies the ``IMAGE_FSTYPES`` to use for the U-Boot image.
 
-      For more information on how the ``UBOOT_CONFIG`` is handled, see the
+      For more information on how the :term:`UBOOT_CONFIG` is handled, see the
       :ref:`uboot-config <ref-classes-uboot-config>`
       class.
 
    :term:`UBOOT_DTB_LOADADDRESS`
       Specifies the load address for the dtb image used by U-Boot. During FIT
-      image creation, the ``UBOOT_DTB_LOADADDRESS`` variable is used in
+      image creation, the :term:`UBOOT_DTB_LOADADDRESS` variable is used in
       :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to specify
       the load address to be used in
       creating the dtb sections of Image Tree Source for the FIT image.
 
    :term:`UBOOT_DTBO_LOADADDRESS`
       Specifies the load address for the dtbo image used by U-Boot.  During FIT
-      image creation, the ``UBOOT_DTBO_LOADADDRESS`` variable is used in
+      image creation, the :term:`UBOOT_DTBO_LOADADDRESS` variable is used in
       :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to specify the load address to be used in
       creating the dtbo sections of Image Tree Source for the FIT image.
 
    :term:`UBOOT_ENTRYPOINT`
       Specifies the entry point for the U-Boot image. During U-Boot image
-      creation, the ``UBOOT_ENTRYPOINT`` variable is passed as a
+      creation, the :term:`UBOOT_ENTRYPOINT` variable is passed as a
       command-line parameter to the ``uboot-mkimage`` utility.
 
    :term:`UBOOT_LOADADDRESS`
       Specifies the load address for the U-Boot image. During U-Boot image
-      creation, the ``UBOOT_LOADADDRESS`` variable is passed as a
+      creation, the :term:`UBOOT_LOADADDRESS` variable is passed as a
       command-line parameter to the ``uboot-mkimage`` utility.
 
    :term:`UBOOT_LOCALVERSION`
@@ -8322,7 +8322,7 @@ system and gives an overview of their function and contents.
    :term:`UBOOT_RD_ENTRYPOINT`
       Specifies the entrypoint for the RAM disk image.
       During FIT image creation, the
-      ``UBOOT_RD_ENTRYPOINT`` variable is used
+      :term:`UBOOT_RD_ENTRYPOINT` variable is used
       in :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to specify the
       entrypoint to be used in creating the Image Tree Source for
       the FIT image.
@@ -8330,7 +8330,7 @@ system and gives an overview of their function and contents.
    :term:`UBOOT_RD_LOADADDRESS`
       Specifies the load address for the RAM disk image.
       During FIT image creation, the
-      ``UBOOT_RD_LOADADDRESS`` variable is used
+      :term:`UBOOT_RD_LOADADDRESS` variable is used
       in :ref:`kernel-fitimage <ref-classes-kernel-fitimage>` class to specify the
       load address to be used in creating the Image Tree Source for
       the FIT image.
@@ -8371,16 +8371,16 @@ system and gives an overview of their function and contents.
       However, there are common options that are passed to all
       configure scripts at a class level, but might not be valid for some
       configure scripts. Therefore warnings about these options are useless.
-      For these cases, the options are added to ``UNKNOWN_CONFIGURE_WHITELIST``.
+      For these cases, the options are added to :term:`UNKNOWN_CONFIGURE_WHITELIST`.
 
       The configure arguments check that uses
-      ``UNKNOWN_CONFIGURE_WHITELIST`` is part of the
+      :term:`UNKNOWN_CONFIGURE_WHITELIST` is part of the
       :ref:`insane <ref-classes-insane>` class and is only enabled if the
       recipe inherits the :ref:`autotools <ref-classes-autotools>` class.
 
    :term:`UPDATERCPN`
       For recipes inheriting the
-      :ref:`update-rc.d <ref-classes-update-rc.d>` class, ``UPDATERCPN``
+      :ref:`update-rc.d <ref-classes-update-rc.d>` class, :term:`UPDATERCPN`
       specifies the package that contains the initscript that is enabled.
 
       The default value is "${PN}". Given that almost all recipes that
@@ -8394,7 +8394,7 @@ system and gives an overview of their function and contents.
       OpenEmbedded build system determines the latest upstream version by
       picking the latest tag from the list of all repository tags.
 
-      You can use the ``UPSTREAM_CHECK_GITTAGREGEX`` variable to provide a
+      You can use the :term:`UPSTREAM_CHECK_GITTAGREGEX` variable to provide a
       regular expression to filter only the relevant tags should the
       default filter not work correctly.
       ::
@@ -8402,7 +8402,7 @@ system and gives an overview of their function and contents.
          UPSTREAM_CHECK_GITTAGREGEX = "git_tag_regex"
 
    :term:`UPSTREAM_CHECK_REGEX`
-      Use the ``UPSTREAM_CHECK_REGEX`` variable to specify a different
+      Use the :term:`UPSTREAM_CHECK_REGEX` variable to specify a different
       regular expression instead of the default one when the package
       checking system is parsing the page found using
       :term:`UPSTREAM_CHECK_URI`.
@@ -8416,7 +8416,7 @@ system and gives an overview of their function and contents.
       the source code is provided from tarballs, the latest version is
       determined by fetching the directory listing where the tarball is and
       attempting to find a later tarball. When this approach does not work,
-      you can use ``UPSTREAM_CHECK_URI`` to provide a different URI that
+      you can use :term:`UPSTREAM_CHECK_URI` to provide a different URI that
       contains the link to the latest tarball.
       ::
 
@@ -8424,8 +8424,8 @@ system and gives an overview of their function and contents.
 
    :term:`USE_DEVFS`
       Determines if ``devtmpfs`` is used for ``/dev`` population. The
-      default value used for ``USE_DEVFS`` is "1" when no value is
-      specifically set. Typically, you would set ``USE_DEVFS`` to "0" for a
+      default value used for :term:`USE_DEVFS` is "1" when no value is
+      specifically set. Typically, you would set :term:`USE_DEVFS` to "0" for a
       statically populated ``/dev`` directory.
 
       See the ":ref:`dev-manual/common-tasks:selecting a device manager`" section in
@@ -8440,8 +8440,8 @@ system and gives an overview of their function and contents.
       virtual terminals in order to enable logging in through those
       terminals.
 
-      The default value used for ``USE_VT`` is "1" when no default value is
-      specifically set. Typically, you would set ``USE_VT`` to "0" in the
+      The default value used for :term:`USE_VT` is "1" when no default value is
+      specifically set. Typically, you would set :term:`USE_VT` to "0" in the
       machine configuration file for machines that do not have a graphical
       display attached and therefore do not need virtual terminal
       functionality.
@@ -8468,9 +8468,9 @@ system and gives an overview of their function and contents.
 
       The default behavior for the build system is to dynamically apply
       ``uid`` and ``gid`` values. Consequently, the
-      ``USERADD_ERROR_DYNAMIC`` variable is by default not set. If you plan
+      :term:`USERADD_ERROR_DYNAMIC` variable is by default not set. If you plan
       on using statically assigned ``gid`` and ``uid`` values, you should
-      set the ``USERADD_ERROR_DYNAMIC`` variable in your ``local.conf``
+      set the :term:`USERADD_ERROR_DYNAMIC` variable in your ``local.conf``
       file as follows::
 
          USERADD_ERROR_DYNAMIC = "error"
@@ -8485,7 +8485,7 @@ system and gives an overview of their function and contents.
       .. note::
 
          There is a difference in behavior between setting
-         ``USERADD_ERROR_DYNAMIC`` to ``error`` and setting it to ``warn``.
+         :term:`USERADD_ERROR_DYNAMIC` to ``error`` and setting it to ``warn``.
          When it is set to ``warn``, the build system will report a warning for
          every undefined ``uid`` and ``gid`` in any recipe. But when it is set
          to ``error``, it will only report errors for recipes that are actually
@@ -8524,7 +8524,7 @@ system and gives an overview of their function and contents.
 
       .. note::
 
-         It follows that if you are going to use the ``USERADD_PACKAGES``
+         It follows that if you are going to use the :term:`USERADD_PACKAGES`
          variable, you need to set one or more of the :term:`USERADD_PARAM`,
          :term:`GROUPADD_PARAM`, or :term:`GROUPMEMS_PARAM` variables.
 
@@ -8587,7 +8587,7 @@ system and gives an overview of their function and contents.
       Specifies the persistence of the target's ``/var/log`` directory,
       which is used to house postinstall target log files.
 
-      By default, ``VOLATILE_LOG_DIR`` is set to "yes", which means the
+      By default, :term:`VOLATILE_LOG_DIR` is set to "yes", which means the
       file is not persistent. You can override this setting by setting the
       variable to "no" to make the log directory persistent.
 
@@ -8609,18 +8609,18 @@ system and gives an overview of their function and contents.
 
    :term:`WKS_FILE_DEPENDS`
       When placed in the recipe that builds your image, this variable lists
-      build-time dependencies. The ``WKS_FILE_DEPENDS`` variable is only
+      build-time dependencies. The :term:`WKS_FILE_DEPENDS` variable is only
       applicable when Wic images are active (i.e. when
       :term:`IMAGE_FSTYPES` contains entries related
       to Wic). If your recipe does not create Wic images, the variable has
       no effect.
 
-      The ``WKS_FILE_DEPENDS`` variable is similar to the
+      The :term:`WKS_FILE_DEPENDS` variable is similar to the
       :term:`DEPENDS` variable. When you use the variable in
       your recipe that builds the Wic image, dependencies you list in the
-      ``WKS_FILE_DEPENDS`` variable are added to the ``DEPENDS`` variable.
+      :term:`WKS_FILE_DEPENDS` variable are added to the :term:`DEPENDS` variable.
 
-      With the ``WKS_FILE_DEPENDS`` variable, you have the possibility to
+      With the :term:`WKS_FILE_DEPENDS` variable, you have the possibility to
       specify a list of additional dependencies (e.g. native tools,
       bootloaders, and so forth), that are required to build Wic images.
       Following is an example::
@@ -8637,7 +8637,7 @@ system and gives an overview of their function and contents.
       :term:`TMPDIR` directory structure and is specific to
       the recipe being built and the system for which it is being built.
 
-      The ``WORKDIR`` directory is defined as follows::
+      The :term:`WORKDIR` directory is defined as follows::
 
          ${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}
 
@@ -8667,6 +8667,6 @@ system and gives an overview of their function and contents.
       indirectly, includes "x11-base" in
       :term:`IMAGE_FEATURES`.
 
-      The default value of ``XSERVER``, if not specified in the machine
+      The default value of :term:`XSERVER`, if not specified in the machine
       configuration, is "xserver-xorg xf86-video-fbdev xf86-input-evdev".
    
diff --git a/documentation/sdk-manual/appendix-customizing-standard.rst b/documentation/sdk-manual/appendix-customizing-standard.rst
index 90b634529..9bc70cf55 100644
--- a/documentation/sdk-manual/appendix-customizing-standard.rst
+++ b/documentation/sdk-manual/appendix-customizing-standard.rst
@@ -17,10 +17,10 @@ and
 variables control the set of packages adding to the SDK.
 
 If you want to add individual packages to the toolchain that runs on the
-host, simply add those packages to the ``TOOLCHAIN_HOST_TASK`` variable.
+host, simply add those packages to the :term:`TOOLCHAIN_HOST_TASK` variable.
 Similarly, if you want to add packages to the default set that is part
 of the toolchain that runs on the target, add the packages to the
-``TOOLCHAIN_TARGET_TASK`` variable.
+:term:`TOOLCHAIN_TARGET_TASK` variable.
 
 Adding API Documentation to the Standard SDK
 ============================================
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 67b49d9f4..929e6bbd1 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -35,13 +35,13 @@ build system applies them against ``local.conf`` and ``auto.conf``:
 -  Variables listed in
    :term:`SDK_LOCAL_CONF_WHITELIST`
    are included. Including a variable in the value of
-   ``SDK_LOCAL_CONF_WHITELIST`` overrides either of the previous two
+   :term:`SDK_LOCAL_CONF_WHITELIST` overrides either of the previous two
    filters. The default value is blank.
 
 -  Classes inherited globally with
    :term:`INHERIT` that are listed in
    :term:`SDK_INHERIT_BLACKLIST`
-   are disabled. Using ``SDK_INHERIT_BLACKLIST`` to disable these
+   are disabled. Using :term:`SDK_INHERIT_BLACKLIST` to disable these
    classes is the typical method to disable classes that are problematic
    or unnecessary in the SDK context. The default value blacklists the
    :ref:`buildhistory <ref-classes-buildhistory>`
@@ -95,7 +95,7 @@ adjustments:
 
    -  Disable the tasks if they are added by a class and you do not need
       the functionality the class provides in the extensible SDK. To
-      disable the tasks, add the class to the ``SDK_INHERIT_BLACKLIST``
+      disable the tasks, add the class to the :term:`SDK_INHERIT_BLACKLIST`
       variable as described in the previous section.
 
 -  Generally, you want to have a shared state mirror set up so users of
@@ -142,12 +142,12 @@ section.
 
 By default, this title is derived from
 :term:`DISTRO_NAME` when it is
-set. If the ``DISTRO_NAME`` variable is not set, the title is derived
+set. If the :term:`DISTRO_NAME` variable is not set, the title is derived
 from the :term:`DISTRO` variable.
 
 The
 :ref:`populate_sdk_base <ref-classes-populate-sdk-*>`
-class defines the default value of the ``SDK_TITLE`` variable as
+class defines the default value of the :term:`SDK_TITLE` variable as
 follows::
 
    SDK_TITLE ??= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
@@ -158,7 +158,7 @@ creates an SDK installer title that applies across your distribution. As
 an example, assume you have your own layer for your distribution named
 "meta-mydistro" and you are using the same type of file hierarchy as
 does the default "poky" distribution. If so, you could update the
-``SDK_TITLE`` variable in the
+:term:`SDK_TITLE` variable in the
 ``~/meta-mydistro/conf/distro/mydistro.conf`` file using the following
 form::
 
@@ -220,7 +220,7 @@ class as follows::
 
 You can
 change this default installation directory by specifically setting the
-``SDKEXTPATH`` variable.
+:term:`SDKEXTPATH` variable.
 
 While there are several ways of setting this variable,
 the method that makes the most sense is to set the variable in your
@@ -229,7 +229,7 @@ default directory that applies across your distribution. As an example,
 assume you have your own layer for your distribution named
 "meta-mydistro" and you are using the same type of file hierarchy as
 does the default "poky" distribution. If so, you could update the
-``SDKEXTPATH`` variable in the
+:term:`SDKEXTPATH` variable in the
 ``~/meta-mydistro/conf/distro/mydistro.conf`` file using the following
 form::
 
@@ -284,11 +284,11 @@ source, you need to do a number of things:
 
          SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
 
-   -  Alternatively, if you just want to set the ``SSTATE_MIRRORS``
+   -  Alternatively, if you just want to set the :term:`SSTATE_MIRRORS`
       variable's value for the SDK alone, create a
       ``conf/sdk-extra.conf`` file either in your
       :term:`Build Directory` or within any
-      layer and put your ``SSTATE_MIRRORS`` setting within that file.
+      layer and put your :term:`SSTATE_MIRRORS` setting within that file.
 
       .. note::
 
@@ -333,7 +333,7 @@ following::
 
 See the :term:`SDK_INCLUDE_PKGDATA` variable for additional information.
 
-Setting the ``SDK_INCLUDE_PKGDATA`` variable as shown causes the "world"
+Setting the :term:`SDK_INCLUDE_PKGDATA` variable as shown causes the "world"
 target to be built so that information for all of the recipes included
 within it are available. Having these recipes available increases build
 time significantly and increases the size of the SDK installer by 30-80
@@ -358,7 +358,7 @@ You can explicitly control whether or not to include the toolchain when
 you build an SDK by setting the
 :term:`SDK_INCLUDE_TOOLCHAIN`
 variable to "1". In particular, it is useful to include the toolchain
-when you have set ``SDK_EXT_TYPE`` to "minimal", which by default,
+when you have set :term:`SDK_EXT_TYPE` to "minimal", which by default,
 excludes the toolchain. Also, it is helpful if you are building a small
 SDK for use with an IDE or some other tool where you do not want to take
 extra steps to install a toolchain.
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 55bd7f6eb..91ecdfe76 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -439,7 +439,7 @@ command:
 
       With this scenario, there is no ``srctree`` argument. Consequently, the
       default behavior of the ``devtool modify`` command is to extract
-      the source files pointed to by the ``SRC_URI`` statements into a
+      the source files pointed to by the :term:`SRC_URI` statements into a
       local Git structure. Furthermore, the location for the extracted
       source is the default area within the ``devtool`` workspace. The
       result is that the command sets up both the source code and an
@@ -447,7 +447,7 @@ command:
       original location.
 
       Additionally, if you have any non-patch local files (i.e. files
-      referred to with ``file://`` entries in ``SRC_URI`` statement
+      referred to with ``file://`` entries in :term:`SRC_URI` statement
       excluding ``*.patch/`` or ``*.diff``), these files are copied to
       an ``oe-local-files`` folder under the newly created source tree.
       Copying the files here gives you a convenient area from which you
@@ -477,7 +477,7 @@ command:
          devtool
          command.
 
-      As with all extractions, the command uses the recipe's ``SRC_URI``
+      As with all extractions, the command uses the recipe's :term:`SRC_URI`
       statements to locate the source files and any associated patch
       files. Non-patch files are copied to an ``oe-local-files`` folder
       under the newly created source tree.
@@ -656,18 +656,18 @@ The following diagram shows the common development flow used with the
       don't use "-V", the command upgrades the recipe to the latest
       version.
 
-   If the source files pointed to by the ``SRC_URI`` statement in the
+   If the source files pointed to by the :term:`SRC_URI` statement in the
    recipe are in a Git repository, you must provide the "-S" option and
    specify a revision for the software.
 
-   Once ``devtool`` locates the recipe, it uses the ``SRC_URI`` variable
+   Once ``devtool`` locates the recipe, it uses the :term:`SRC_URI` variable
    to locate the source code and any local patch files from other
    developers. The result is that the command sets up the source code,
    the new version of the recipe, and an append file all within the
    workspace.
 
    Additionally, if you have any non-patch local files (i.e. files
-   referred to with ``file://`` entries in ``SRC_URI`` statement
+   referred to with ``file://`` entries in :term:`SRC_URI` statement
    excluding ``*.patch/`` or ``*.diff``), these files are copied to an
    ``oe-local-files`` folder under the newly created source tree.
    Copying the files here gives you a convenient area from which you can
@@ -677,7 +677,7 @@ The following diagram shows the common development flow used with the
 
 2. *Resolve any Conflicts created by the Upgrade*: Conflicts could happen
    after upgrading the software to a new version. Conflicts occur
-   if your recipe specifies some patch files in ``SRC_URI`` that
+   if your recipe specifies some patch files in :term:`SRC_URI` that
    conflict with changes made in the new version of the software. For
    such cases, you need to resolve the conflicts by editing the source
    and following the normal ``git rebase`` conflict resolution process.
@@ -833,7 +833,7 @@ result from naming not being recognized or because the dependency simply
 is not available. For cases where the dependency is not available, you
 must use the ``devtool add`` command to add an additional recipe that
 satisfies the dependency. Once you add that recipe, you need to update
-the ``DEPENDS`` variable in the original recipe to include the new
+the :term:`DEPENDS` variable in the original recipe to include the new
 recipe.
 
 If you need to add runtime dependencies, you can do so by adding the
@@ -862,7 +862,7 @@ license. If so, the command sets the
 :term:`LICENSE` value accordingly.
 You should double-check the value added by the command against the
 documentation or source files for the software you are building and, if
-necessary, update that ``LICENSE`` value.
+necessary, update that :term:`LICENSE` value.
 
 The ``devtool add`` command also sets the
 :term:`LIC_FILES_CHKSUM`
@@ -870,16 +870,16 @@ value to point to all files that appear to be license-related. Realize
 that license statements often appear in comments at the top of source
 files or within the documentation. In such cases, the command does not
 recognize those license statements. Consequently, you might need to
-amend the ``LIC_FILES_CHKSUM`` variable to point to one or more of those
-comments if present. Setting ``LIC_FILES_CHKSUM`` is particularly
+amend the :term:`LIC_FILES_CHKSUM` variable to point to one or more of those
+comments if present. Setting :term:`LIC_FILES_CHKSUM` is particularly
 important for third-party software. The mechanism attempts to ensure
 correct licensing should you upgrade the recipe to a newer upstream
 version in future. Any change in licensing is detected and you receive
 an error prompting you to check the license text again.
 
 If the ``devtool add`` command cannot determine licensing information,
-``devtool`` sets the ``LICENSE`` value to "CLOSED" and leaves the
-``LIC_FILES_CHKSUM`` value unset. This behavior allows you to continue
+``devtool`` sets the :term:`LICENSE` value to "CLOSED" and leaves the
+:term:`LIC_FILES_CHKSUM` value unset. This behavior allows you to continue
 with development even though the settings are unlikely to be correct in
 all cases. You should check the documentation or source files for the
 software you are building to determine the actual license.
@@ -905,7 +905,7 @@ mind:
    hardcoding tools within the toolchain such as ``gcc`` and ``g++``.
 
 -  The environment in which Make runs is set up with various standard
-   variables for compilation (e.g. ``CC``, ``CXX``, and so forth) in a
+   variables for compilation (e.g. :term:`CC`, :term:`CXX`, and so forth) in a
    similar manner to the environment set up by the SDK's environment
    setup script. One easy way to see these variables is to run the
    ``devtool build`` command on the recipe and then look in
@@ -921,7 +921,7 @@ mind:
    the command line, add the variable setting to
    :term:`EXTRA_OEMAKE` or
    :term:`PACKAGECONFIG_CONFARGS`
-   within the recipe. Here is an example using ``EXTRA_OEMAKE``::
+   within the recipe. Here is an example using :term:`EXTRA_OEMAKE`::
 
       EXTRA_OEMAKE += "'CC=${CC}' 'CXX=${CXX}'"
 
@@ -1087,20 +1087,20 @@ extras specified by
 :term:`EXTRA_OECONF` or
 :term:`PACKAGECONFIG_CONFARGS`
 set within the recipe. If you wish to pass additional options, add them
-to ``EXTRA_OECONF`` or ``PACKAGECONFIG_CONFARGS``. Other supported build
+to :term:`EXTRA_OECONF` or :term:`PACKAGECONFIG_CONFARGS`. Other supported build
 tools have similar variables (e.g.
 :term:`EXTRA_OECMAKE` for
 CMake, :term:`EXTRA_OESCONS`
 for Scons, and so forth). If you need to pass anything on the ``make``
-command line, you can use ``EXTRA_OEMAKE`` or the
+command line, you can use :term:`EXTRA_OEMAKE` or the
 :term:`PACKAGECONFIG_CONFARGS`
 variables to do so.
 
 You can use the ``devtool configure-help`` command to help you set the
 arguments listed in the previous paragraph. The command determines the
 exact options being passed, and shows them to you along with any custom
-arguments specified through ``EXTRA_OECONF`` or
-``PACKAGECONFIG_CONFARGS``. If applicable, the command also shows you
+arguments specified through :term:`EXTRA_OECONF` or
+:term:`PACKAGECONFIG_CONFARGS`. If applicable, the command also shows you
 the output of the configure script's "--help" option as a
 reference.
 
@@ -1152,16 +1152,16 @@ the ``oe-workdir/packages-split`` directory, which contains a
 subdirectory for each package. Apart from some advanced cases, the
 :term:`PACKAGES` and
 :term:`FILES` variables controls
-splitting. The ``PACKAGES`` variable lists all of the packages to be
-produced, while the ``FILES`` variable specifies which files to include
+splitting. The :term:`PACKAGES` variable lists all of the packages to be
+produced, while the :term:`FILES` variable specifies which files to include
 in each package by using an override to specify the package. For
 example, ``FILES_${PN}`` specifies the files to go into the main package
 (i.e. the main package has the same name as the recipe and
 ``${``\ :term:`PN`\ ``}`` evaluates to the
-recipe name). The order of the ``PACKAGES`` value is significant. For
-each installed file, the first package whose ``FILES`` value matches the
-file is the package into which the file goes. Both the ``PACKAGES`` and
-``FILES`` variables have default values. Consequently, you might find
+recipe name). The order of the :term:`PACKAGES` value is significant. For
+each installed file, the first package whose :term:`FILES` value matches the
+file is the package into which the file goes. Both the :term:`PACKAGES` and
+:term:`FILES` variables have default values. Consequently, you might find
 you do not even need to set these variables in your recipe unless the
 software the recipe is building installs files into non-standard
 locations.
diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index ad84ce2b8..ff6614b03 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -279,9 +279,9 @@ example:
       $ source /opt/poky/&DISTRO;/environment-setup-i586-poky-linux
 
 3. *Create the Makefile:* For this example, the Makefile contains
-   two lines that can be used to set the ``CC`` variable. One line is
+   two lines that can be used to set the :term:`CC` variable. One line is
    identical to the value that is set when you run the SDK environment
-   setup script, and the other line sets ``CC`` to "gcc", the default
+   setup script, and the other line sets :term:`CC` to "gcc", the default
    GNU compiler on the build host::
 
       # CC=i586-poky-linux-gcc -m32 -march=i586 --sysroot=/opt/poky/2.5/sysroots/i586-poky-linux
@@ -298,7 +298,7 @@ example:
 
 4. *Make the Project:* Use the ``make`` command to create the binary
    output file. Because variables are commented out in the Makefile, the
-   value used for ``CC`` is the value set when the SDK environment setup
+   value used for :term:`CC` is the value set when the SDK environment setup
    file was run::
 
       $ make
@@ -307,10 +307,10 @@ example:
       i586-poky-linux-gcc -m32 -march=i586 --sysroot=/opt/poky/2.5/sysroots/i586-poky-linux main.o module.o -o target_bin
 
    From the results of the previous command, you can see that
-   the compiler used was the compiler established through the ``CC``
+   the compiler used was the compiler established through the :term:`CC`
    variable defined in the setup script.
 
-   You can override the ``CC`` environment variable with the same
+   You can override the :term:`CC` environment variable with the same
    variable as set from the Makefile by uncommenting the line in the
    Makefile and running ``make`` again.
    ::
@@ -334,7 +334,7 @@ example:
    variable as part of the command line. Go into the Makefile and
    re-insert the comment character so that running ``make`` uses the
    established SDK compiler. However, when you run ``make``, use a
-   command-line argument to set ``CC`` to "gcc"::
+   command-line argument to set :term:`CC` to "gcc"::
 
       $ make clean
       rm -rf *.o
diff --git a/documentation/toaster-manual/setup-and-use.rst b/documentation/toaster-manual/setup-and-use.rst
index 8f0ec9449..4f71b5841 100644
--- a/documentation/toaster-manual/setup-and-use.rst
+++ b/documentation/toaster-manual/setup-and-use.rst
@@ -625,7 +625,7 @@ To specify ``bash`` 3.2.48 as the version to build, enter
    :scale: 75%
 
 After clicking the "Add variable" button, the settings for
-``PREFERRED_VERSION`` are added to the bottom of the BitBake variables
+:term:`PREFERRED_VERSION` are added to the bottom of the BitBake variables
 list. With these settings, the OpenEmbedded build system builds the
 desired version of the recipe rather than the default version:
 
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index abbd74ca1..f0035bd3a 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -47,7 +47,7 @@ Transitioning to a custom environment for systems development
 #. **Based on the layers you've chosen, make needed changes in your
    configuration**.
    For instance, you've chosen a machine type and added in the corresponding BSP
-   layer. You'll then need to change the value of the ``MACHINE`` variable in your
+   layer. You'll then need to change the value of the :term:`MACHINE` variable in your
    configuration file (build/local.conf) to point to that same machine
    type. There could be other layer-specific settings you need to change as
    well. Each layer has a ``README`` document that you can look at for this type of
-- 
2.31.1

