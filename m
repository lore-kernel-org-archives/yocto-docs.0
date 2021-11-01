Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE50C433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 12:22:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.43252.1635769343216298927
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 05:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74917D6E
	for <docs@lists.yoctoproject.org>; Mon,  1 Nov 2021 05:22:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EFE73F5A1
	for <docs@lists.yoctoproject.org>; Mon,  1 Nov 2021 05:22:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/2] ref-manual: improve documentation for SDKMACHINE
Date: Mon,  1 Nov 2021 12:22:18 +0000
Message-Id: <20211101122219.5965-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Nov 2021 12:22:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2058

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/variables.rst | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index b9e97719b..1389bcc5d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6756,17 +6756,14 @@ system and gives an overview of their function an=
d contents.
          $ bitbake -c populate_sdk imagename
=20
    :term:`SDKMACHINE`
-      The machine for which the SDK is built. In other words, the SDK is
-      built such that it runs on the target you specify with the
-      :term:`SDKMACHINE` value. The value points to a corresponding ``.c=
onf``
-      file under ``conf/machine-sdk/``.
-
-      You can use "i686" and "x86_64" as possible values for this variab=
le.
-      The variable defaults to "i686" and is set in the local.conf file =
in
-      the Build Directory.
-      ::
-
-         SDKMACHINE ?=3D "i686"
+      The machine for which the SDK is built. In other words, the SDK is=
 built
+      such that it runs on the target you specify with the :term:`SDKMAC=
HINE`
+      value. The value points to a corresponding ``.conf`` file under
+      ``conf/machine-sdk/`` in the enabled layers, for example ``aarch64=
``,
+      ``i586``, ``i686``, ``ppc64``, ``ppc64le``, or ``x86_64``.
+
+      The variable defaults to :term:`BUILD_ARCH` so that SDKs are built=
 for the
+      build machine.
=20
       .. note::
=20
--=20
2.25.1


