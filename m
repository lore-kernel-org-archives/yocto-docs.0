Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C01DC77B7F
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:20:16 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.1288.1682133610996059582
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 5F10FE76A9;
	Fri, 21 Apr 2023 23:20:10 -0400 (EDT)
Received: from linc.fritz.box (unknown [161.29.131.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 8FE3BE7475;
	Fri, 21 Apr 2023 23:20:09 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 08/17] ref-manual: add missing QA checks from previous releases
Date: Sat, 22 Apr 2023 15:19:44 +1200
Message-Id: <9b0cc83f5a80e55e9e375775f43619c8cd52a554.1682133339.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682133339.git.bluelightning@bluelightning.org>
References: <cover.1682133339.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.11 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 22 Apr 2023 03:20:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3859

This section needs to be kept in sync with the "QA Error and Warning
Messages" section (qa-checks.rst) - this is the other direction that
tells folks what all of the values in WARN_QA / ERROR_QA are intended
to do. Add the ones that we missed adding here for previous releases,
and also use a proper reference for the buildhistory class in the entry
for version-going-backwards.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 documentation/ref-manual/classes.rst | 58 ++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index 32494ee09f6..aacbb8a495c 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1192,6 +1192,11 @@ Here are the tests you can list with the :term:`WA=
RN_QA` and
    ``initscripts`` recipe is actually built and thus the
    ``initscripts-functions`` package is made available.
=20
+-  ``configure-gettext:`` Checks that if a recipe is building something
+   that uses automake and the automake files contain an ``AM_GNU_GETTEXT=
``
+   directive, that the recipe also inherits the :ref:`ref-classes-gettex=
t`
+   class to ensure that gettext is available during the build.
+
 -  ``compile-host-path:`` Checks the
    :ref:`ref-tasks-compile` log for indications that
    paths to locations on the build host were used. Using such paths
@@ -1308,11 +1313,32 @@ Here are the tests you can list with the :term:`W=
ARN_QA` and
    ``/usr/libexec``. This check is not performed if the ``libexecdir``
    variable has been set explicitly to ``/usr/libexec``.
=20
+-  ``mime:`` Check that if a package contains mime type files (``.xml``
+   files in ``${datadir}/mime/packages``) that the recipe also inherits
+   the :ref:`ref-classes-mime` class in order to ensure that these get
+   properly installed.
+
+-  ``mime-xdg:`` Checks that if a package contains a .desktop file with =
a
+   'MimeType' key present, that the recipe inherits the
+   :ref:`ref-classes-mime-xdg` class that is required in order for that
+   to be activated.
+
+-  ``missing-update-alternatives:`` Check that if a recipe sets the
+   :term:`ALTERNATIVE` variable that the recipe also inherits
+   :ref:`ref-classes-update-alternatives` such that the alternative will
+   be correctly set up.
+
 -  ``packages-list:`` Checks for the same package being listed
    multiple times through the :term:`PACKAGES` variable
    value. Installing the package in this manner can cause errors during
    packaging.
=20
+-  ``patch-fuzz:`` Checks for fuzz in patch files that may allow
+   them to apply incorrectly if the underlying code changes.
+
+-  ``perllocalpod:`` Checks for ``perllocal.pod`` being erroneously
+   installed and packaged by a recipe.
+
 -  ``perm-config:`` Reports lines in ``fs-perms.txt`` that have an
    invalid format.
=20
@@ -1366,12 +1392,20 @@ Here are the tests you can list with the :term:`W=
ARN_QA` and
    options are being passed to the linker commands and your binaries
    have potential security issues.
=20
+-  ``shebang-size:`` Check that the shebang line (``#!`` in the first li=
ne)
+   in a packaged script is not longer than 128 characters, which can cau=
se
+   an error at runtime depending on the operating system.
+
 -  ``split-strip:`` Reports that splitting or stripping debug symbols
    from binaries has failed.
=20
 -  ``staticdev:`` Checks for static library files (``*.a``) in
    non-``staticdev`` packages.
=20
+-  ``src-uri-bad:`` Checks that the :term:`SRC_URI` value set by a recip=
e
+   does not contain a reference to ``${PN}`` (instead of the correct
+   ``${BPN}``) nor refers to unstable Github archive tarballs.
+
 -  ``symlink-to-sysroot:`` Checks for symlinks in packages that point
    into :term:`TMPDIR` on the host. Such symlinks will
    work on the host, but are clearly invalid when running on the target.
@@ -1382,6 +1416,12 @@ Here are the tests you can list with the :term:`WA=
RN_QA` and
    ":doc:`/ref-manual/qa-checks`" for more information regarding runtime=
 performance
    issues.
=20
+-  ``unhandled-features-check:`` check that if one of the variables that
+   the :ref:`ref-classes-features_check` class supports (e.g.
+   :term:`REQUIRED_DISTRO_FEATURES`) is set by a recupe, then the recipe
+   also inherits :ref:`ref-classes-features_check` in order for the
+   requirement to actually work.
+
 -  ``unlisted-pkg-lics:`` Checks that all declared licenses applying
    for a package are also declared on the recipe level (i.e. any license
    in ``LICENSE:*`` should appear in :term:`LICENSE`).
@@ -1391,19 +1431,23 @@ Here are the tests you can list with the :term:`W=
ARN_QA` and
    the linker (e.g. ``/lib`` and ``/usr/lib``). While these paths will
    not cause any breakage, they do waste space and are unnecessary.
=20
+-  ``usrmerge:`` If ``usrmerge`` is in :term:`DISTRO_FEATURES`, this
+   check will ensure that no package installs files to root (``/bin``,
+   ``/sbin``, ``/lib``, ``/lib64``) directories.
+
 -  ``var-undefined:`` Reports when variables fundamental to packaging
    (i.e. :term:`WORKDIR`,
    :term:`DEPLOY_DIR`, :term:`D`,
    :term:`PN`, and :term:`PKGD`) are undefined
    during :ref:`ref-tasks-package`.
=20
--  ``version-going-backwards:`` If Build History is enabled, reports
-   when a package being written out has a lower version than the
-   previously written package under the same name. If you are placing
-   output packages into a feed and upgrading packages on a target system
-   using that feed, the version of a package going backwards can result
-   in the target system not correctly upgrading to the "new" version of
-   the package.
+-  ``version-going-backwards:`` If the :ref:`ref-classes-buildhistory`
+   class is enabled, reports when a package being written out has a lowe=
r
+   version than the previously written package under the same name. If
+   you are placing output packages into a feed and upgrading packages on
+   a target system using that feed, the version of a package going
+   backwards can result in the target system not correctly upgrading to
+   the "new" version of the package.
=20
    .. note::
=20
--=20
2.34.1


