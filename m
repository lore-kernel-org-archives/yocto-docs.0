Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7437DC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 12:50:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.287.1635857437739519344
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Nov 2021 05:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0539D6E
	for <docs@lists.yoctoproject.org>; Tue,  2 Nov 2021 05:50:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5ACB83F70D
	for <docs@lists.yoctoproject.org>; Tue,  2 Nov 2021 05:50:30 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2] ref-manual: improve documentation for SDKMACHINE
Date: Tue,  2 Nov 2021 12:50:26 +0000
Message-Id: <20211102125026.2425438-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Nov 2021 12:50:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2063

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/variables.rst | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index b9e97719b..9eea8081c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6756,17 +6756,15 @@ system and gives an overview of their function an=
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
+      ``i586``, ``i686``, ``ppc64``, ``ppc64le``, and ``x86_64`` are
+      :oe_git:`available in OpenEmbedded-Core </openembedded-core/tree/m=
eta/conf/machine-sdk>`.
+
+      The variable defaults to :term:`BUILD_ARCH` so that SDKs are built=
 for the
+      architecture of the build machine.
=20
       .. note::
=20
--=20
2.25.1


