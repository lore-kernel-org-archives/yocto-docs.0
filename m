Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8184DC41535
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:30:19 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web10.51267.1699266611808423474
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 321CC2856B;
	Mon,  6 Nov 2023 05:30:11 -0500 (EST)
Received: from linc.fritz.box (unknown [161.29.74.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 54E9A288AE;
	Mon,  6 Nov 2023 05:30:10 -0500 (EST)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 11/12] migration-4.3: adjustments to existing text
Date: Mon,  6 Nov 2023 23:29:41 +1300
Message-Id: <fd67233847db9bf9c72e5430573d152da9c582f4.1699266393.git.bluelightning@bluelightning.org>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4597

* Reword the layername side-effects commentary to be a bit more readable
* Extend edgerouter removal description
* Correct capitalisation of systemd
* For QEMU_USE_SLIRP, specify what to use instead, and adjust the
  following list item to use the same style
* Extend statement on -crossssdk / MLPREFIX change to indicate what
  needs to be done

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 .../migration-guides/migration-4.3.rst        | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/documentation/migration-guides/migration-4.3.rst b/documenta=
tion/migration-guides/migration-4.3.rst
index d2c3d2ad985..17ea4e71276 100644
--- a/documentation/migration-guides/migration-4.3.rst
+++ b/documentation/migration-guides/migration-4.3.rst
@@ -34,9 +34,9 @@ Layername override implications
 Code can now know which layer a recipe is coming from through the newly =
added
 :term:`FILE_LAYERNAME` variable and the ``layer-<layername> override``. =
This is being used
 for enabling QA checks on a per layer basis. For existing code this has =
the
-side effect that the QA checks will apply to things being bbappended to =
recipes
-from other layers. Those other layers would need to have patch upstream =
status
-entries for patches being bbappended for example.
+side effect that the QA checks will apply to recipes being bbappended
+from other layers - for example, patches added through such bbappends wi=
ll now
+need to have the "Upstream-Status" specified in the patch header.
=20
 .. _migration-4.3-compiling-changes:
=20
@@ -71,10 +71,13 @@ See :ref:`all supported distributions <system-require=
ments-supported-distros>`.
=20
 .. _migration-4.3-removed-machines:
=20
-Removed machines
-~~~~~~~~~~~~~~~~
+edgerouter machine removed
+~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
-The ``edgerouter`` BSP in ``meta-yocto-bsp`` has been removed.
+The ``edgerouter`` reference BSP for the MIPS architecture in ``meta-yoc=
to-bsp``
+has been removed as the hardware has been unavailable for some time. The=
re is no
+suitable reference MIPS hardware to replace it with, but the MIPS archit=
ecture
+will continue to get coverage via QEMU build/boot testing.
=20
 .. _migration-4.3-go-changes:
=20
@@ -86,7 +89,7 @@ Go language changes
=20
 .. _migration-4.3-systemd-changes:
=20
-Systemd changes
+systemd changes
 ~~~~~~~~~~~~~~~
=20
 Upstream systemd is now more strict on filesystem layout and the ``usrme=
rge``
@@ -120,8 +123,8 @@ The following variables have been removed:
 -  ``AUTHOR``
 -  ``PERLARCH``
 -  ``PERLVERSION``
--  ``QEMU_USE_SLIRP``
--  ``SERIAL_CONSOLES_CHECK``, which is no longer necessary because all
+-  ``QEMU_USE_SLIRP`` - add ``slirp`` to ``TEST_RUNQEMUPARAMS`` instead.
+-  ``SERIAL_CONSOLES_CHECK`` - no longer necessary because all
    consoles listed in :term:`SERIAL_CONSOLES` are checked for their exis=
tence
    before a ``getty`` is started.
=20
@@ -168,5 +171,7 @@ Miscellaneous changes
    ``virtual/XXX`` provider/dependencies where a ``PREFIX`` was used as =
well,
    as we don't need both and it made automated dependency rewriting
    unnecessarily complex. In general this only affects internal toolchai=
n
-   dependencies so isn't end user visible.
+   dependencies so isn't end user visible, but if for some reason you ha=
ve
+   custom classes or recipes that rely upon the old providers then you w=
ill
+   need to update those.
=20
--=20
2.34.1


