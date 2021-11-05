Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55F2C433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 15:12:07 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.6903.1636125126209936367
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Nov 2021 08:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6EBEA60013;
	Fri,  5 Nov 2021 15:12:04 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [RFC 1/3] ref-manual: simplify SRC_URI reference
Date: Fri,  5 Nov 2021 16:11:57 +0100
Message-Id: <20211105151159.28541-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105151159.28541-1-michael.opdenacker@bootlin.com>
References: <20211105151159.28541-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Nov 2021 15:12:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2090

Moving all the features that also apply to BitBake
to the BitBake manual.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 122 ++-----------------------
 1 file changed, 8 insertions(+), 114 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9eea8081c7..441a10929e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7016,88 +7016,11 @@ system and gives an overview of their function and contents.
       for additional information.
 
    :term:`SRC_URI`
-      The list of source files - local or remote. This variable tells the
-      OpenEmbedded build system which bits to pull in for the build and how
-      to pull them in. For example, if the recipe or append file only needs
-      to fetch a tarball from the Internet, the recipe or append file uses
-      a single :term:`SRC_URI` entry. On the other hand, if the recipe or
-      append file needs to fetch a tarball, apply two patches, and include
-      a custom file, the recipe or append file would include four instances
-      of the variable.
-
-      The following list explains the available URI protocols. URI
-      protocols are highly dependent on particular BitBake Fetcher
-      submodules. Depending on the fetcher BitBake uses, various URL
-      parameters are employed. For specifics on the supported Fetchers, see
-      the ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers`" section in the
-      BitBake User Manual.
-
-      -  ``file://`` - Fetches files, which are usually files shipped
-         with the :term:`Metadata`, from the local machine (e.g.
-         :ref:`patch <overview-manual/concepts:patching>` files).
-         The path is relative to the :term:`FILESPATH`
-         variable. Thus, the build system searches, in order, from the
-         following directories, which are assumed to be a subdirectories of
-         the directory in which the recipe file (``.bb``) or append file
-         (``.bbappend``) resides:
-
-         -  ``${BPN}`` - The base recipe name without any special suffix
-            or version numbers.
-
-         -  ``${BP}`` - ``${BPN}-${PV}``. The base recipe name and
-            version but without any special package name suffix.
-
-         -  *files -* Files within a directory, which is named ``files``
-            and is also alongside the recipe or append file.
 
-         .. note::
-
-            If you want the build system to pick up files specified through
-            a
-            SRC_URI
-            statement from your append file, you need to be sure to extend
-            the
-            FILESPATH
-            variable by also using the
-            FILESEXTRAPATHS
-            variable from within your append file.
-
-      -  ``bzr://`` - Fetches files from a Bazaar revision control
-         repository.
-
-      -  ``git://`` - Fetches files from a Git revision control
-         repository.
-
-      -  ``osc://`` - Fetches files from an OSC (openSUSE Build service)
-         revision control repository.
-
-      -  ``repo://`` - Fetches files from a repo (Git) repository.
-
-      -  ``ccrc://`` - Fetches files from a ClearCase repository.
-
-      -  ``http://`` - Fetches files from the Internet using ``http``.
-
-      -  ``https://`` - Fetches files from the Internet using ``https``.
-
-      -  ``ftp://`` - Fetches files from the Internet using ``ftp``.
-
-      -  ``cvs://`` - Fetches files from a CVS revision control
-         repository.
-
-      -  ``hg://`` - Fetches files from a Mercurial (``hg``) revision
-         control repository.
-
-      -  ``p4://`` - Fetches files from a Perforce (``p4``) revision
-         control repository.
+      See the BitBake manual for the initial description for this variable:
+      :term:`bitbake:SRC_URI`
 
-      -  ``ssh://`` - Fetches files from a secure shell.
-
-      -  ``svn://`` - Fetches files from a Subversion (``svn``) revision
-         control repository.
-
-      -  ``npm://`` - Fetches JavaScript modules from a registry.
-
-      -  ``az://`` - Fetches files from an Azure Storage account.
+      The following features are added by OpenEmbedded and the Yocto Project.
 
       There are standard and recipe-specific options for :term:`SRC_URI`. Here are
       standard ones:
@@ -7133,41 +7056,12 @@ system and gives an overview of their function and contents.
       -  ``notrev`` - Apply the patch only if :term:`SRCREV` is not equal to
          ``rev``.
 
-      Here are some additional options worth mentioning:
-
-      -  ``unpack`` - Controls whether or not to unpack the file if it is
-         an archive. The default action is to unpack the file.
-
-      -  ``destsuffix`` - Places the file (or extracts its contents) into
-         the specified subdirectory of :term:`WORKDIR` when
-         the Git fetcher is used.
-
-      -  ``subdir`` - Places the file (or extracts its contents) into the
-         specified subdirectory of :term:`WORKDIR` when the local (``file://``)
-         fetcher is used.
-
-      -  ``localdir`` - Places the file (or extracts its contents) into
-         the specified subdirectory of :term:`WORKDIR` when the CVS fetcher is
-         used.
-
-      -  ``subpath`` - Limits the checkout to a specific subpath of the
-         tree when using the Git fetcher is used.
-
-      -  ``name`` - Specifies a name to be used for association with
-         :term:`SRC_URI` checksums or :term:`SRCREV` when you have more than one
-         file or git repository specified in :term:`SRC_URI`. For example::
-
-            SRC_URI = "git://example.com/foo.git;name=first \
-                       git://example.com/bar.git;name=second \
-                       http://example.com/file.tar.gz;name=third"
-
-            SRCREV_first = "f1d2d2f924e986ac86fdf7b36c94bcdf32beec15"
-            SRCREV_second = "e242ed3bffccdf271b7fbaf34ed72d089537b42f"
-            SRC_URI[third.sha256sum] = "13550350a8681c84c861aac2e5b440161c2b33a3e4f302ac680ca5b686de48de"
-
+      .. note::
 
-      -  ``downloadfilename`` - Specifies the filename used when storing
-         the downloaded file.
+         If you want the build system to pick up files specified through
+         a :term:`SRC_URI` statement from your append file, you need to be
+         sure to extend the :term:`FILESPATH` variable by also using the
+         :term:`FILESEXTRAPATHS` variable from within your append file.
 
    :term:`SRC_URI_OVERRIDES_PACKAGE_ARCH`
       By default, the OpenEmbedded build system automatically detects
-- 
2.25.1


