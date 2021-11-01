Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4925DC433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 12:22:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.43245.1635769344083626221
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 05:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0708813A1
	for <docs@lists.yoctoproject.org>; Mon,  1 Nov 2021 05:22:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5E103F5A1
	for <docs@lists.yoctoproject.org>; Mon,  1 Nov 2021 05:22:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] kickstart: update busybox note regarding PARTUUID
Date: Mon,  1 Nov 2021 12:22:19 +0000
Message-Id: <20211101122219.5965-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101122219.5965-1-ross.burton@arm.com>
References: <20211101122219.5965-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Nov 2021 12:22:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2059

As of oe-core c996cabf the default BusyBox configuration supports
PARTUUID, so update the note to reflect this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/kickstart.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-m=
anual/kickstart.rst
index cac9f2f49..807f5e052 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -54,8 +54,9 @@ must also provide one of the ``--ondrive``, ``--ondisk`=
`, or
 .. note::
=20
    The mount program must understand the PARTUUID syntax you use with
-   ``--use-uuid`` and non-root *mountpoint*, including swap. The BusyBox
-   versions of these application are currently excluded.
+   ``--use-uuid`` and non-root *mountpoint*, including swap. The default
+   configuration of BusyBox in OpenEmbedded supports this, but this may
+   be disabled in custom configurations.
=20
 Here is an example that uses "/" as the mountpoint. The command uses
 ``--ondisk`` to force the partition onto the ``sdb`` disk::
--=20
2.25.1


