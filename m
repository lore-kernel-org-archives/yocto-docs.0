Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAD4C282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 14:45:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.54620.1741013110362947195
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 06:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02053113E
	for <docs@lists.yoctoproject.org>; Mon,  3 Mar 2025 06:45:24 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 89D953F66E
	for <docs@lists.yoctoproject.org>; Mon,  3 Mar 2025 06:45:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] ref-manual: don't refer to poky-lsb
Date: Mon,  3 Mar 2025 14:45:02 +0000
Message-ID: <20250303144502.308036-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303144502.308036-1-ross.burton@arm.com>
References: <20250303144502.308036-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Mar 2025 14:45:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6486

This was removed in 2019, so swap it for poky-altcfg.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/features.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-ma=
nual/features.rst
index 70e85f7a2..746d6337e 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -12,7 +12,7 @@ Features provide a mechanism for working out which pack=
ages should be
 included in the generated images. Distributions can select which
 features they want to support through the :term:`DISTRO_FEATURES` variab=
le,
 which is set or appended to in a distribution's configuration file such
-as ``poky.conf``, ``poky-tiny.conf``, ``poky-lsb.conf`` and so forth.
+as ``poky.conf``, ``poky-tiny.conf``, ``poky-altcfg.conf`` and so forth.
 Machine features are set in the :term:`MACHINE_FEATURES` variable, which=
 is
 set in the machine configuration file and specifies the hardware
 features for a given machine.
--=20
2.43.0


