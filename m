Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0A5C4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:30:19 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.51268.1699266613029438427
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:30:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 6CA7828A8C;
	Mon,  6 Nov 2023 05:30:12 -0500 (EST)
Received: from linc.fritz.box (unknown [161.29.74.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 91BAF28574;
	Mon,  6 Nov 2023 05:30:11 -0500 (EST)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 12/12] migration-4.3: additional migration items
Date: Mon,  6 Nov 2023 23:29:42 +1300
Message-Id: <76de363e7d3d18d38be8d63cbd683e22337f7af6.1699266393.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699266393.git.bluelightning@bluelightning.org>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 10:30:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4598

Add the following:

* Removed recipes
* One removed class
* Output file name changes
* Versioning changes
* tunctl removal

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 .../migration-guides/migration-4.3.rst        | 77 ++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/migration-4.3.rst b/documenta=
tion/migration-guides/migration-4.3.rst
index 17ea4e71276..fcad9ef5eef 100644
--- a/documentation/migration-guides/migration-4.3.rst
+++ b/documentation/migration-guides/migration-4.3.rst
@@ -135,7 +135,15 @@ Removed recipes
=20
 The following recipes have been removed in this release:
=20
--  ``glide``, as explained in :ref:`migration-4.3-go-changes`.
+-  ``apmd``: obsolete (``apm`` in :term:`MACHINE_FEATURES` also removed)=
.
+-  ``cve-update-db-native``: functionally replaced by ``cve-update-nvd2-=
native``
+-  ``gcr3``: no longer needed by core recipes, moved to meta-gnome (gcr,=
 i.e. version 4.x, is still provided).
+-  ``glide``: as explained in :ref:`migration-4.3-go-changes`.
+-  ``libdmx``: obsolete
+-  ``linux-yocto`` version 5.15 (versions 6.1 and 6.5 provided instead).
+-  ``python3-async``: obsolete - no longer needed by ``python3-gitdb`` o=
r any other core recipe
+-  ``rust-hello-world``: there are sufficient other Rust recipes and tes=
t cases such that this is no longer needed.
+
=20
 .. _migration-4.3-removed-classes:
=20
@@ -144,6 +152,68 @@ Removed classes
=20
 The following classes have been removed in this release:
=20
+-  ``glide``: as explained in :ref:`migration-4.3-go-changes`.
+
+
+Output file naming changes
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+In 4.3 there are some minor differences in image and SDK output file nam=
es.
+If you rely on the existing naming (e.g. in external scripts) you may ne=
ed to
+either modify configuration or adapt to the new naming. Further details:
+
+-  :term:`IMAGE_NAME` and :term:`IMAGE_LINK_NAME` now include the
+   :term:`IMAGE_NAME_SUFFIX` value directly. In practical terms, this me=
ans
+   that ``.rootfs`` will now appear in image output file names. If you d=
o not
+   wish to have the ``.rootfs`` suffix used, you can just set
+   :term:`IMAGE_NAME_SUFFIX` to "" and this will now be consistently res=
pected
+   in both the image file and image file symlink names. As part of this =
change,
+   support for the ``imgsuffix`` task varflag has been dropped (mostly
+   an internal implementation detail, but if you were implementing a cus=
tom
+   image construction with a task in a similar manner to ``do_bootimg``
+   you may have been using this).
+
+-  :term:`SDK_NAME` now includes the values of :term:`IMAGE_BASENAME` an=
d
+   :term:`MACHINE` so that they are unique when building SDKs for differ=
ent
+   images and machines.
+
+
+
+.. _migration-4.3-pr-pe:
+
+Versioning changes
+~~~~~~~~~~~~~~~~~~
+
+-  :term:`PR` values have been removed from all core recipes - distro ma=
intainers
+   who make use of :term:`PR` values would need to curate these already =
so the
+   sparsely set base values would not be that useful anymore. If you hav=
e been
+   relying on these (i.e. you are maintaining a binary package feed wher=
e package
+   versions should only ever increase), double-check the output (perhaps=
 with the
+   help of the :ref:`ref-classes-buildhistory` class) to ensure that pac=
kage
+   versions are consistent.
+
+-  The :term:`PR` value can no longer be set from the recipe file name -=
 this
+   was rarely used, but in any case is no longer supported.
+
+-  :term:`PE` and :term:`PR` are no longer included in the work director=
y path
+   (:term:`WORKDIR`). This may break some tool assumptions about directo=
ry paths,
+   but those should really be querying paths from the build system (or n=
ot poking
+   into :term:`WORKDIR` externally).
+
+-  Source revision information has been moved from :term:`PV` to :term:`=
PKGV`.
+   The user visible effect of this change is that :term:`PV` will no lon=
ger have
+   revision information in it and this will now be appended to the :term=
:`PV`
+   value through :term:`PKGV` when the packages are written out (as long=
 as "+"
+   is present in the :term:`PKGV` value). Since :term:`PV` is used in
+   :term:`STAMP` and :term:`WORKDIR`, you may notice small directory nam=
ing and
+   stamp naming changes.
+
+-  The :term:`SRCPV` variable is no longer be needed in :term:`PV`, but =
since
+   the default :term:`SRCPV` value is now "", using it is effectively no=
w just a
+   null operation - you can remove it (leaving behind the "+") , but it =
is not
+   yet required to do so.
+
+
 .. _migration-4.3-qemu-changes:
=20
 QEMU changes
@@ -162,6 +232,11 @@ QEMU changes
    This change was made to avoid exceeding two serial ports, which inter=
feres
    with automated testing.
=20
+-  ``runqemu`` now uses the ``ip tuntap`` command instead of ``tunctl``,=
 and
+   thus ``tunctl`` is no longer built by the ``qemu-helper-native`` reci=
pe; if
+   for some reason you were calling ``tunctl`` directly from your own sc=
ripts
+   you should switch to calling ``ip tuntap`` instead.
+
 .. _migration-4.3-misc-changes:
=20
 Miscellaneous changes
--=20
2.34.1


