Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9894DC04FFE
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 20:43:42 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.6167.1713127420338095947
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 13:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id B710116E85;
	Sun, 14 Apr 2024 16:43:39 -0400 (EDT)
Received: from localhost.localdomain (unknown [209.210.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 6268F16B5B;
	Sun, 14 Apr 2024 16:43:39 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 8/9] migration: Extend migration guide for 5.0
Date: Sun, 14 Apr 2024 13:43:17 -0700
Message-Id: <72a076d449b48273a557dc3ebe3dde9ea11e70d2.1713127068.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713127068.git.bluelightning@bluelightning.org>
References: <cover.1713127068.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 20:43:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5143

Add a few missing entries based upon combing through the release
commits, as well as minor tweaks to existing items.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 .../migration-guides/migration-5.0.rst        | 62 ++++++++++++++++---
 1 file changed, 54 insertions(+), 8 deletions(-)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documenta=
tion/migration-guides/migration-5.0.rst
index 888a1c60d4..951d86547b 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -80,7 +80,8 @@ Recipe changes
 Deprecated variables
 ~~~~~~~~~~~~~~~~~~~~
=20
-No variables have been deprecated in this release.
+-  ``CVE_CHECK_IGNORE`` should be replaced with :term:`CVE_STATUS`
+
=20
 .. _migration-5.0-removed-variables:
=20
@@ -89,13 +90,14 @@ Removed variables
=20
 The following variables have been removed:
=20
--  ``DEPLOY_DIR_TAR``.
--  ``PYTHON_PN``: Python 2 has been removed, leaving Python 3 as the sol=
e
-   major version. Therefore, an abstraction to differentiate both versio=
ns is
+-  ``DEPLOY_DIR_TAR``: no longer needed since the package_tar class was =
removed in 4.2.
+-  ``PYTHON_PN``: Python 2 has previously been removed, leaving Python 3=
 as the sole
+   major version. Therefore, this abstraction to differentiate both vers=
ions is
    no longer needed.
--  ``oldincludedir``.
+-  ``oldincludedir``
 -  ``USE_L10N``: previously deprecated, and now removed.
--  ``CVE_SOCKET_TIMEOUT``.
+-  ``CVE_SOCKET_TIMEOUT``
+-  ``SERIAL_CONSOLES_CHECK`` - use :term:`SERIAL_CONSOLES` instead as al=
l consoles specified in the latter are checked for their existence before=
 a ``getty`` is started.
=20
 .. _migration-5.0-removed-recipes:
=20
@@ -105,9 +107,10 @@ Removed recipes
 The following recipes have been removed in this release:
=20
 -  ``libcroco``: deprecated and archived by the Gnome Project.
+-  ``liberror-perl``: unmaintained and no longer needed - moved to meta-=
perl.
 -  ``linux-yocto``: version 6.1 (version 6.6 provided instead).
--  ``zvariant``: fails to build with newer Rust.
 -  ``systemtap-uprobes``: obsolete.
+-  ``zvariant``: fails to build with newer Rust.
=20
 .. _migration-5.0-removed-classes:
=20
@@ -125,10 +128,53 @@ In ``tune-core2``, the cpu models ``n270`` and ``co=
re2duo`` are no longer
 passed to QEMU, since its documentation recommends not using them with `=
`-cpu``
 option. Therefore, from now on, ``Nehalem`` model is used instead.
=20
+
+ipk packaging changes
+~~~~~~~~~~~~~~~~~~~~~
+
+ipk packaging (using ``opkg``) now uses ``zstd`` compression instead of =
``xz``
+for better compression and performance. This does mean that .ipk package=
s
+built using the 5.0 release requires opkg built with zstd enabled - natu=
rally
+this is the case in 5.0, but at least by default these packages will not=
 be
+usable on older systems where opkg does not have zstd enabled at build t=
ime.
+
+Additionally, the internal dependency solver in opkg is now deprecated -=
 it
+is still available in this release but will trigger a warning if selecte=
d.
+The default has been the external ``libsolv`` solver for some time, but =
if you
+have explicitly removed that from :term:`PACKAGECONFIG` for ``opkg`` to
+select the internal solver, you should plan to switch to ``libsolv`` in =
the
+near future (by including ``libsolv`` your custom :term:`PACKAGECONFIG` =
value
+for ``opkg``, or reverting to the default value).
+
+
+motd message when using ``DISTRO =3D "poky"``
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The default ``poky`` :term:`DISTRO` is explicitly a *reference* distribu=
tion
+for testing and development purposes.  It enables most hardware and soft=
ware
+features so that they can be tested, but this also means that
+from a security point of view the attack surface is very large.
+
+We encourage anyone using the Yocto Project for production use to create
+their own distribution and not use Poky. To encourage this behaviour
+further, in 5.0 a warning has been added to ``/etc/motd`` when Poky is u=
sed
+so that the developer will see it when they log in. If you are creating =
your
+own distribution this message will not show up.
+
+For information on how to create your own distribution, see
+":ref:`dev-manual/custom-distribution:creating your own distribution`".
+
 .. _migration-5.0-misc-changes:
=20
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
=20
--  ``bitbake-whatchanged`` script was removed.
+-  ``bitbake-whatchanged`` script was removed as it was broken and unmai=
ntained.
+-  ``scripts/sstate-cache-management.sh`` has been replaced by ``scripts=
/sstate-cache-management.py``, a more performant Python-based version.
+-  The ``bmap-tools`` recipe has been renamed to ``bmaptool``.
+-  ``gpgme`` has had Python binding support disabled since upstream does=
 not yet support Python 3.12. (This will be fixed in future once it is fi=
xed upstream.)
+-  A warning will now be shown if the ``virtual/`` prefix is used in run=
time contexts (:term:`RDEPENDS` / :term:`RPROVIDES`) - see :ref:`virtual-=
slash <qa-check-virtual-slash>` for details.
+-  ``recipetool`` now prefixes the names of recipes created for Python m=
odules with "python3-".
+-  The :ref:`ref-classes-cve-check` class no longer produces a warning f=
or remote patches - it only logs a note and does not try to fetch the pat=
ch in order to scan it for issues or CVE numbers. However, CVE number ref=
erences in remote patch file names will now be picked up.
+-  The values of :term:`PE` and :term:`PR` have been dropped from -f{fil=
e,macro,debug}-prefix-map, in order to avoid unnecessary churn in debug s=
ymbol paths when the version is bumped. This is unlikely to cause issues,=
 but if you are paying attention to the debug source path (e.g. in recipe=
s that need to manipulate these files during packaging) then you will not=
ice the difference. A new :term:`TARGET_DBGSRC_DIR` variable is provided =
to make this easier.
 -  ``ccache`` no longer supports FORTRAN.
--=20
2.25.1


