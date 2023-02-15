Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB888C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 09:58:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.11696.1676455091807982663
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 01:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AhV29Hte;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E7A6DFF807;
	Wed, 15 Feb 2023 09:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676455090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5agsB6lHNbFg/X5upyBAo4xegkifgyZz6FWG8sF7HAE=;
	b=AhV29HteRkLuJCwNOx9BuFZlzCG/JU0cY5TMbFhM8WX/d5c2/Q+iMwqs244h2AALSFrHT9
	elgBL5+u+/WV+lxfUt4cV8CStzix/4UbOujVtQh8fkV6AFqxWS6dM1qt6CE0ZPCd73N/74
	zs0N558AwctAN13ySwAPfS8F8oP7xQ7Q1QN/dCkcIIPZqxFTbn5Fdk018mZZ01BBAXjnfm
	AaW8MLjqiuaQvwnxkbRTTjj1Iht0RqN+tIZZbABlLOLuZa8EeGQp4G9W0bqa0wrj2Jm7Gn
	d9gSEBokCVaUTMEkmmcW+o6xhn1blUxR+TUOQ6l8zzTN0iKGaj+GMpO8bWszVg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: new-recipe.rst: restructure examples
Date: Wed, 15 Feb 2023 10:58:02 +0100
Message-Id: <20230215095802.108698-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Feb 2023 09:58:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3685

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

To make it possible to add more examples (CMake, Meson, Go, Rust...)
- Change section title names
- Adjust paragraph line length
- Have the Autotools example after the one with a custom Makefile,
  corresponding to an increasing level of complexity.
- Clarify that GNU make and the Autotools are used to build
  the applications, not by these applications.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst | 110 +++++++++++-------------
 1 file changed, 52 insertions(+), 58 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 4751f64b7e..143c8b9c3b 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -288,7 +288,7 @@ extension (e.g. ``.tar``, ``.tar.gz``, ``.tar.bz2``, ``.zip``, and so
 forth), are automatically extracted during the
 :ref:`ref-tasks-unpack` task. For
 another example that specifies these types of files, see the
-":ref:`dev-manual/new-recipe:autotooled package`" section.
+":ref:`dev-manual/new-recipe:building an autotooled package`" section.
 
 Another way of specifying source is from an SCM. For Git repositories,
 you must specify :term:`SRCREV` and you should specify :term:`PV` to include
@@ -361,7 +361,7 @@ and searches specific directories in a certain order:
 ``files``. The directories are assumed to be subdirectories of the
 directory in which the recipe or append file resides. For another
 example that specifies these types of files, see the
-":ref:`dev-manual/new-recipe:single .c file package (hello world!)`" section.
+":ref:`dev-manual/new-recipe:building a single .c file package (hello world!)`" section.
 
 The previous example also specifies a patch file. Patch files are files
 whose names usually end in ``.patch`` or ``.diff`` but can end with
@@ -776,7 +776,7 @@ the software being built:
    ``PREFIX=${D}``, ``INSTALLROOT=${D}``, and so forth).
 
    For an example recipe using ``make install``, see the
-   ":ref:`dev-manual/new-recipe:makefile-based package`" section.
+   ":ref:`dev-manual/new-recipe:building a makefile-based package`" section.
 
 -  *Manual:* You need to define a :ref:`ref-tasks-install` function in your
    recipe. The function must first use ``install -d`` to create the
@@ -1165,28 +1165,27 @@ Examples
 ========
 
 To help summarize how to write a recipe, this section provides some
-examples given various scenarios:
+recipe examples given various scenarios:
 
--  Recipes that use local files
+-  Building packages from a single local file
 
--  Using an Autotooled package
+-  Building a Makefile-based package
 
--  Using a Makefile-based package
+-  Building an Autotooled package
 
 -  Splitting an application into multiple packages
 
 -  Adding binaries to an image
 
-Single .c File Package (Hello World!)
--------------------------------------
+Building a Single .c File Package (Hello World!)
+------------------------------------------------
 
-Building an application from a single file that is stored locally (e.g.
-under ``files``) requires a recipe that has the file listed in the
-:term:`SRC_URI` variable. Additionally, you need to manually write the
-:ref:`ref-tasks-compile` and :ref:`ref-tasks-install` tasks. The :term:`S` variable defines the
-directory containing the source code, which is set to
-:term:`WORKDIR` in this case --- the
-directory BitBake uses for the build::
+Building an application from a single file that is stored locally (e.g. under
+``files``) requires a recipe that has the file listed in the :term:`SRC_URI`
+variable. Additionally, you need to manually write the :ref:`ref-tasks-compile`
+and :ref:`ref-tasks-install` tasks. The :term:`S` variable defines the
+directory containing the source code, which is set to :term:`WORKDIR` in this
+case --- the directory BitBake uses for the build::
 
    SUMMARY = "Simple helloworld application"
    SECTION = "examples"
@@ -1206,52 +1205,22 @@ directory BitBake uses for the build::
        install -m 0755 helloworld ${D}${bindir}
    }
 
-By default, the ``helloworld``, ``helloworld-dbg``, and
-``helloworld-dev`` packages are built. For information on how to
-customize the packaging process, see the
+By default, the ``helloworld``, ``helloworld-dbg``, and ``helloworld-dev`` packages
+are built. For information on how to customize the packaging process, see the
 ":ref:`dev-manual/new-recipe:splitting an application into multiple packages`"
 section.
 
-Autotooled Package
-------------------
+Building a Makefile-Based Package
+---------------------------------
 
-Applications that use Autotools such as ``autoconf`` and ``automake``
-require a recipe that has a source archive listed in :term:`SRC_URI` and
-also inherit the :ref:`ref-classes-autotools` class,
-which contains the definitions of all the steps needed to build an
-Autotool-based application. The result of the build is automatically
-packaged. And, if the application uses NLS for localization, packages
-with local information are generated (one package per language).
-Following is one example: (``hello_2.3.bb``)::
-
-   SUMMARY = "GNU Helloworld application"
-   SECTION = "examples"
-   LICENSE = "GPL-2.0-or-later"
-   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-   SRC_URI = "${GNU_MIRROR}/hello/hello-${PV}.tar.gz"
-
-   inherit autotools gettext
-
-The variable :term:`LIC_FILES_CHKSUM` is used to track source license
-changes as described in the
-":ref:`dev-manual/licenses:tracking license changes`" section in
-the Yocto Project Overview and Concepts Manual. You can quickly create
-Autotool-based recipes in a manner similar to the previous example.
-
-Makefile-Based Package
-----------------------
-
-Applications that use GNU ``make`` also require a recipe that has the
-source archive listed in :term:`SRC_URI`. You do not need to add a
-:ref:`ref-tasks-compile` step since by default BitBake starts the ``make`` command
-to compile the application. If you need additional ``make`` options, you
-should store them in the
-:term:`EXTRA_OEMAKE` or
-:term:`PACKAGECONFIG_CONFARGS`
-variables. BitBake passes these options into the GNU ``make``
-invocation. Note that a :ref:`ref-tasks-install` task is still required.
-Otherwise, BitBake runs an empty :ref:`ref-tasks-install` task by default.
+Applications built with GNU ``make`` require a recipe that has the source archive
+listed in :term:`SRC_URI`. You do not need to add a :ref:`ref-tasks-compile`
+step since by default BitBake starts the ``make`` command to compile the
+application. If you need additional ``make`` options, you should store them in
+the :term:`EXTRA_OEMAKE` or :term:`PACKAGECONFIG_CONFARGS` variables. BitBake
+passes these options into the GNU ``make`` invocation. Note that a
+:ref:`ref-tasks-install` task is still required. Otherwise, BitBake runs an
+empty :ref:`ref-tasks-install` task by default.
 
 Some applications might require extra parameters to be passed to the
 compiler. For example, the application might need an additional header
@@ -1294,6 +1263,31 @@ In the following example, ``lz4`` is a makefile-based package::
 
    BBCLASSEXTEND = "native nativesdk"
 
+Building an Autotooled Package
+------------------------------
+
+Applications built with the Autotools such as ``autoconf`` and ``automake``
+require a recipe that has a source archive listed in :term:`SRC_URI` and also
+inherit the :ref:`ref-classes-autotools` class, which contains the definitions
+of all the steps needed to build an Autotool-based application. The result of
+the build is automatically packaged. And, if the application uses NLS for
+localization, packages with local information are generated (one package per
+language). Following is one example: (``hello_2.3.bb``)::
+
+   SUMMARY = "GNU Helloworld application"
+   SECTION = "examples"
+   LICENSE = "GPL-2.0-or-later"
+   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+   SRC_URI = "${GNU_MIRROR}/hello/hello-${PV}.tar.gz"
+
+   inherit autotools gettext
+
+The variable :term:`LIC_FILES_CHKSUM` is used to track source license changes
+as described in the ":ref:`dev-manual/licenses:tracking license changes`"
+section in the Yocto Project Overview and Concepts Manual. You can quickly
+create Autotool-based recipes in a manner similar to the previous example.
+
 Splitting an Application into Multiple Packages
 -----------------------------------------------
 
-- 
2.37.2


