Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B13CE79B4
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:16:13 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.32194.1695197767890643127
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 01:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pAQyPcQ3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69F83FF803;
	Wed, 20 Sep 2023 08:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695197766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZerD4VCbE9ROEK1R6CsUwvJMzZwzxYskpQOwkY2wUHA=;
	b=pAQyPcQ3GHNt//cS+Ni2Di5+vAAZfMGbVpMHG2B4MJk5d7VAT9RVRQdz0adgxJC4m7wz0+
	/g2Ua/alMkHjKyccCEIExtQ5YH1E8CS4isbU1hi5IS2RQ5JCc+BO7iO8beXRQX0aUjmM3u
	hNHowtk9tA/gobUxcgZV3DGeXI05cpbdf7OBJrikxxWecG8kF9IF5Q+qVTGvsjkzU/St3O
	T8e9siNBhu8KD/lUwv8007tmqXWWr/vxZ+ADb+ois7BEFiSeCbyNfRN5RdXYevmOuc4/gA
	gK9WKvsADjWI1pUer91TiZxt3jS95YsoyL2ofutTOsnWKhAzjasSW3JoSAAMTg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 08/10] ref-manual: qa-checks: align with master
Date: Wed, 20 Sep 2023 10:15:42 +0200
Message-Id: <20230920081544.1226760-9-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920081544.1226760-1-michael.opdenacker@bootlin.com>
References: <20230920081544.1226760-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Sep 2023 08:16:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4255

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/qa-checks.rst | 87 +++++++++++++++++++-------
 1 file changed, 64 insertions(+), 23 deletions(-)

diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 8c475d0f72..4a02e7206a 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -162,7 +162,7 @@ Errors and Warnings
    normally expected to be empty (such as ``/tmp``). These files may
    be more appropriately installed to a different location, or
    perhaps alternatively not installed at all, usually by updating the
-   ``do_install`` task/function.
+   :ref:`ref-tasks-install` task/function.
 
 .. _qa-check-arch:
 
@@ -536,7 +536,7 @@ Errors and Warnings
       in (e.g. ``FILES:${``\ :term:`PN`\ ``}`` for the main
       package).
 
-   -  Delete the files at the end of the ``do_install`` task if the
+   -  Delete the files at the end of the :ref:`ref-tasks-install` task if the
       files are not needed in any package.
 
     
@@ -579,10 +579,10 @@ Errors and Warnings
 - ``package contains mime types but does not inherit mime: <packagename> path '<file>' [mime]``
 
    The specified package contains mime type files (``.xml`` files in
-   ``${datadir}/mime/packages``) and yet does not inherit the mime
-   class which will ensure that these get properly installed. Either
-   add ``inherit mime`` to the recipe or remove the files at the
-   ``do_install`` step if they are not needed.
+   ``${datadir}/mime/packages``) and yet does not inherit the
+   :ref:`ref-classes-mime` class which will ensure that these get
+   properly installed. Either add ``inherit mime`` to the recipe or remove the
+   files at the :ref:`ref-tasks-install` step if they are not needed.
 
 
 .. _qa-check-mime-xdg:
@@ -590,10 +590,10 @@ Errors and Warnings
 - ``package contains desktop file with key 'MimeType' but does not inhert mime-xdg: <packagename> path '<file>' [mime-xdg]``
 
     The specified package contains a .desktop file with a 'MimeType' key
-    present, but does not inherit the mime-xdg class that is required in
-    order for that to be activated. Either add ``inherit mime`` to the
-    recipe or remove the files at the ``do_install`` step if they are not
-    needed.
+    present, but does not inherit the :ref:`ref-classes-mime-xdg`
+    class that is required in order for that to be activated. Either add
+    ``inherit mime`` to the recipe or remove the files at the
+    :ref:`ref-tasks-install` step if they are not needed.
 
 
 .. _qa-check-src-uri-bad:
@@ -602,7 +602,7 @@ Errors and Warnings
 
     GitHub provides "archive" tarballs, however these can be re-generated
     on the fly and thus the file's signature will not necessarily match that
-    in the SRC_URI checksums in future leading to build failures. It is
+    in the :term:`SRC_URI` checksums in future leading to build failures. It is
     recommended that you use an official release tarball or switch to
     pulling the corresponding revision in the actual git repository instead.
 
@@ -613,18 +613,20 @@ Errors and Warnings
     so using ${:term:`BPN`} rather than ${:term:`PN`} as the latter will change
     for different variants of the same recipe e.g. when :term:`BBCLASSEXTEND`
     or multilib are being used. This check will fail if a reference to ``${PN}``
-    is found within the :term:`SRC_URI` value - change it to ``${BPN}`` instead.
+    is found within the :term:`SRC_URI` value --- change it to ``${BPN}`` instead.
 
 
 .. _qa-check-unhandled-features-check:
 
 - ``<recipename>: recipe doesn't inherit features_check [unhandled-features-check]``
 
-    This check ensures that if one of the variables that the :ref:`features_check <ref-classes-features_check>`
-    class supports (e.g. :term:`REQUIRED_DISTRO_FEATURES`) is used, then the recipe
-    inherits ``features_check`` in order for the requirement to actually work. If
-    you are seeing this message, either add ``inherit features_check`` to your recipe
-    or remove the reference to the variable if it is not needed.
+    This check ensures that if one of the variables that the
+    :ref:`ref-classes-features_check` class supports (e.g.
+    :term:`REQUIRED_DISTRO_FEATURES`) is used, then the recipe
+    inherits :ref:`ref-classes-features_check` in order for
+    the requirement to actually work. If you are seeing this message, either
+    add ``inherit features_check`` to your recipe or remove the reference to
+    the variable if it is not needed.
 
 
 .. _qa-check-missing-update-alternatives:
@@ -632,7 +634,7 @@ Errors and Warnings
 - ``<recipename>: recipe defines ALTERNATIVE:<packagename> but doesn't inherit update-alternatives. This might fail during do_rootfs later! [missing-update-alternatives]``
 
     This check ensures that if a recipe sets the :term:`ALTERNATIVE` variable that the
-    recipe also inherits :ref:`update-alternatives <ref-classes-update-alternatives>` such
+    recipe also inherits :ref:`ref-classes-update-alternatives` such
     that the alternative will be correctly set up. If you are seeing this message, either
     add ``inherit update-alternatives`` to your recipe or remove the reference to the variable
     if it is not needed.
@@ -653,7 +655,7 @@ Errors and Warnings
 - ``<packagename> contains perllocal.pod (<files>), should not be installed [perllocalpod]``
 
     ``perllocal.pod`` is an index file of locally installed modules and so shouldn't be
-    installed by any distribution packages. The :ref:`cpan <ref-classes-cpan>` class
+    installed by any distribution packages. The :ref:`ref-classes-cpan` class
     already sets ``NO_PERLLOCAL`` to stop this file being generated by most Perl recipes,
     but if a recipe is using ``MakeMaker`` directly then they might not be doing this
     correctly. This check ensures that perllocal.pod is not in any package in order to
@@ -667,8 +669,8 @@ Errors and Warnings
 
     If ``usrmerge`` is in :term:`DISTRO_FEATURES`, this check will ensure that no package
     installs files to root (``/bin``, ``/sbin``, ``/lib``, ``/lib64``) directories. If you are seeing this
-    message, it indicates that the ``do_install`` step (or perhaps the build process that
-    ``do_install`` is calling into, e.g. ``make install`` is using hardcoded paths instead
+    message, it indicates that the :ref:`ref-tasks-install` step (or perhaps the build process that
+    :ref:`ref-tasks-install` is calling into, e.g. ``make install`` is using hardcoded paths instead
     of the variables set up for this (``bindir``, ``sbindir``, etc.), and should be
     changed so that it does.
 
@@ -677,7 +679,7 @@ Errors and Warnings
 
 - ``Fuzz detected: <patch output> [patch-fuzz]``
 
-    This check looks for evidence of "fuzz" when applying patches within the ``do_patch``
+    This check looks for evidence of "fuzz" when applying patches within the :ref:`ref-tasks-patch`
     task. Patch fuzz is a situation when the ``patch`` tool ignores some of the context
     lines in order to apply the patch. Consider this example:
 
@@ -727,7 +729,7 @@ Errors and Warnings
             devtool modify <recipe>
 
     This will apply all of the patches, and create new commits out of them in
-    the workspace - with the patch context updated.
+    the workspace --- with the patch context updated.
 
     Then, replace the patches in the recipe layer::
 
@@ -748,6 +750,45 @@ Errors and Warnings
     other things in the patches, those can be discarded.
 
 
+.. _qa-check-patch-status:
+
+- ``Missing Upstream-Status in patch <patchfile> Please add according to <url> [patch-status-core/patch-status-noncore]``
+
+    The ``Upstream-Status`` value is missing in the specified patch file's header.
+    This value is intended to track whether or not the patch has been sent
+    upstream, whether or not it has been merged, etc.
+
+    There are two options for this same check - ``patch-status-core`` (for
+    recipes in OE-Core) and ``patch-status-noncore`` (for recipes in any other
+    layer).
+
+    For more information, see the
+    ":ref:`contributor-guide/recipe-style-guide:patch upstream status`"
+    section in the Yocto Project and OpenEmbedded Contributor Guide.
+
+- ``Malformed Upstream-Status in patch <patchfile> Please correct according to <url> [patch-status-core/patch-status-noncore]``
+
+    The ``Upstream-Status`` value in the specified patch file's header is invalid -
+    it must be a specific format. See the "Missing Upstream-Status" entry above
+    for more information.
+
+
+.. _qa-check-buildpaths:
+
+- ``File <filename> in package <packagename> contains reference to TMPDIR [buildpaths]``
+
+    This check ensures that build system paths (including :term:`TMPDIR`) do not
+    appear in output files, which not only leaks build system configuration into
+    the target, but also hinders binary reproducibility as the output will change
+    if the build system configuration changes.
+
+    Typically these paths will enter the output through some mechanism in the
+    configuration or compilation of the software being built by the recipe. To
+    resolve this issue you will need to determine how the detected path is
+    entering the output. Sometimes it may require adjusting scripts or code to
+    use a relative path rather than an absolute one, or to pick up the path from
+    runtime configuration or environment variables.
+
 
 Configuring and Disabling QA Checks
 ===================================
-- 
2.34.1


