Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.6088.1620981349175204402
 for <docs@lists.yoctoproject.org>;
 Fri, 14 May 2021 01:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: from localhost (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 57125240005;
	Fri, 14 May 2021 08:35:46 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 4/6] sdk-manual: simplify style and fix formating
Date: Fri, 14 May 2021 10:35:25 +0200
Message-Id: <20210514083527.281767-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514083527.281767-1-michael.opdenacker@bootlin.com>
References: <20210514083527.281767-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../sdk-manual/appendix-customizing.rst       |  7 ++-
 documentation/sdk-manual/extensible.rst       | 45 ++++++++++---------
 documentation/sdk-manual/intro.rst            |  2 +-
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index fb2d78452b..67b49d9f49 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -57,8 +57,7 @@ Adjusting the Extensible SDK to Suit Your Build Host's Setup
 ============================================================
 
 In most cases, the extensible SDK defaults should work with your :term:`Build
-Host`'s setup.
-However, some cases exist for which you might consider making
+Host`'s setup. However, there are cases when you might consider making
 adjustments:
 
 -  If your SDK configuration inherits additional classes using the
@@ -153,7 +152,7 @@ follows::
 
    SDK_TITLE ??= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
 
-While several ways exist to change this variable, an efficient method is
+While there are several ways of changing this variable, an efficient method is
 to set the variable in your distribution's configuration file. Doing so
 creates an SDK installer title that applies across your distribution. As
 an example, assume you have your own layer for your distribution named
@@ -223,7 +222,7 @@ You can
 change this default installation directory by specifically setting the
 ``SDKEXTPATH`` variable.
 
-While a number of ways exist through which you can set this variable,
+While there are several ways of setting this variable,
 the method that makes the most sense is to set the variable in your
 distribution's configuration file. Doing so creates an SDK installer
 default directory that applies across your distribution. As an example,
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 81727e6f28..55bd7f6ebf 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -194,7 +194,7 @@ all the commands.
    devtool
    quick reference.
 
-Three ``devtool`` subcommands exist that provide entry-points into
+Three ``devtool`` subcommands provide entry-points into
 development:
 
 -  *devtool add*: Assists in adding new software to be built.
@@ -276,7 +276,7 @@ command:
          devtool
          always creates a Git repository locally during the extraction.
 
-      Furthermore, the first positional argument srctree in this case
+      Furthermore, the first positional argument ``srctree`` in this case
       identifies where the ``devtool add`` command will locate the
       extracted code outside of the workspace. You need to specify an
       empty directory::
@@ -285,13 +285,13 @@ command:
 
       In summary,
       the source code is pulled from fetchuri and extracted into the
-      location defined by srctree as a local Git repository.
+      location defined by ``srctree`` as a local Git repository.
 
       Within workspace, ``devtool`` creates a recipe named recipe along
       with an associated append file.
 
    -  *Right*: The right scenario in the figure represents a situation
-      where the srctree has been previously prepared outside of the
+      where the ``srctree`` has been previously prepared outside of the
       ``devtool`` workspace.
 
       The following command provides a new recipe name and identifies
@@ -437,7 +437,7 @@ command:
       locate the source code and any local patch files from other
       developers.
 
-      With this scenario, no srctree argument exists. Consequently, the
+      With this scenario, there is no ``srctree`` argument. Consequently, the
       default behavior of the ``devtool modify`` command is to extract
       the source files pointed to by the ``SRC_URI`` statements into a
       local Git structure. Furthermore, the location for the extracted
@@ -483,21 +483,21 @@ command:
       under the newly created source tree.
 
       Once the files are located, the command by default extracts them
-      into srctree.
+      into ``srctree``.
 
       Within workspace, ``devtool`` creates an append file for the
       recipe. The recipe remains in its original location but the source
-      files are extracted to the location you provide with srctree.
+      files are extracted to the location you provide with ``srctree``.
 
    -  *Right*: The right scenario in the figure represents a situation
-      where the source tree (srctree) already exists locally as a
+      where the source tree (``srctree``) already exists locally as a
       previously extracted Git structure outside of the ``devtool``
       workspace. In this example, the recipe also exists elsewhere
       locally in its own layer.
 
       The following command tells ``devtool`` the recipe with which to
       work, uses the "-n" option to indicate source does not need to be
-      extracted, and uses srctree to point to the previously extracted
+      extracted, and uses ``srctree`` to point to the previously extracted
       source files::
 
          $ devtool modify -n recipe srctree
@@ -646,8 +646,9 @@ The following diagram shows the common development flow used with the
    code into the ``sources`` directory in the
    :ref:`devtool-the-workspace-layer-structure`.
    If you want the code extracted to any other location, you need to
-   provide the srctree positional argument with the command as follows:
-   $ devtool upgrade -V version recipe srctree
+   provide the ``srctree`` positional argument with the command as follows::
+
+      $ devtool upgrade -V version recipe srctree
 
    .. note::
 
@@ -674,8 +675,8 @@ The following diagram shows the common development flow used with the
    are incorporated into the build the next time you build the software
    just as are other changes you might have made to the source.
 
-2. *Resolve any Conflicts created by the Upgrade*: Conflicts could exist
-   due to the software being upgraded to a new version. Conflicts occur
+2. *Resolve any Conflicts created by the Upgrade*: Conflicts could happen
+   after upgrading the software to a new version. Conflicts occur
    if your recipe specifies some patch files in ``SRC_URI`` that
    conflict with changes made in the new version of the software. For
    such cases, you need to resolve the conflicts by editing the source
@@ -908,8 +909,8 @@ mind:
    similar manner to the environment set up by the SDK's environment
    setup script. One easy way to see these variables is to run the
    ``devtool build`` command on the recipe and then look in
-   ``oe-logs/run.do_compile``. Towards the top of this file, a list of
-   environment variables exists that are being set. You can take
+   ``oe-logs/run.do_compile``. Towards the top of this file, there is
+   a list of environment variables that are set. You can take
    advantage of these variables within the Makefile.
 
 -  If the Makefile sets a default for a variable using "=", that default
@@ -1037,8 +1038,8 @@ If you look at the contents of a recipe, you will see that the recipe
 does not include complete instructions for building the software.
 Instead, common functionality is encapsulated in classes inherited with
 the ``inherit`` directive. This technique leaves the recipe to describe
-just the things that are specific to the software being built. A
-:ref:`base <ref-classes-base>` class exists that
+just the things that are specific to the software being built. There is
+a :ref:`base <ref-classes-base>` class that
 is implicitly inherited by all recipes and provides the functionality
 that most recipes typically need.
 
@@ -1110,9 +1111,9 @@ Recipes often need to use files provided by other recipes on the
 :term:`Build Host`. For example,
 an application linking to a common library needs access to the library
 itself and its associated headers. The way this access is accomplished
-within the extensible SDK is through the sysroot. One sysroot exists per
+within the extensible SDK is through the sysroot. There is one sysroot per
 "machine" for which the SDK is being built. In practical terms, this
-means a sysroot exists for the target machine, and a sysroot exists for
+means there is a sysroot for the target machine, and a sysroot for
 the build host.
 
 Recipes should never write files directly into the sysroot. Instead,
@@ -1159,8 +1160,8 @@ example, ``FILES_${PN}`` specifies the files to go into the main package
 ``${``\ :term:`PN`\ ``}`` evaluates to the
 recipe name). The order of the ``PACKAGES`` value is significant. For
 each installed file, the first package whose ``FILES`` value matches the
-file is the package into which the file goes. Defaults exist for both
-the ``PACKAGES`` and ``FILES`` variables. Consequently, you might find
+file is the package into which the file goes. Both the ``PACKAGES`` and
+``FILES`` variables have default values. Consequently, you might find
 you do not even need to set these variables in your recipe unless the
 software the recipe is building installs files into non-standard
 locations.
@@ -1230,7 +1231,7 @@ source, you can add the "-s" option as follows::
 
 It is important to remember that building the item from source
 takes significantly longer than installing the pre-built artifact. Also,
-if no recipe exists for the item you want to add to the SDK, you must
+if there is no recipe for the item you want to add to the SDK, you must
 instead add the item using the ``devtool add`` command.
 
 Applying Updates to an Installed Extensible SDK
diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index 124d8a8b1f..2f94aaf874 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -214,5 +214,5 @@ You just need to follow these general steps:
    within the Yocto Project.
 
 The remainder of this manual describes how to use the extensible and
-standard SDKs. Information also exists in appendix form that describes
+standard SDKs. There is also information in appendix form describing
 how you can build, install, and modify an SDK.
-- 
2.25.1

