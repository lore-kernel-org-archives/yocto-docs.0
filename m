Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6287C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 15:56:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.105900.1680623784688629873
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Apr 2023 08:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DF1BFEC;
	Tue,  4 Apr 2023 08:57:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 904B73F6C4;
	Tue,  4 Apr 2023 08:56:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: docs@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] Increase minimum GCC version to 8.0
Date: Tue,  4 Apr 2023 16:56:20 +0100
Message-Id: <20230404155620.3278946-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Apr 2023 15:56:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3821

We've increased the minimum GCC version to 8.0[1] so update the
documentation to match.

[1] sanity.bbclass: Update minimum gcc version to 8.0

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/poky.yaml.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index dc0c257e5..1c072c1d0 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -39,7 +39,7 @@ PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sp=
hinx_rtd_theme pyyaml"
 MIN_PYTHON_VERSION : "3.8.0"
 MIN_TAR_VERSION : "1.28"
 MIN_GIT_VERSION : "1.8.3.1"
-MIN_GCC_VERSION : "7.5"
+MIN_GCC_VERSION : "8.0"
 MIN_MAKE_VERSION : "4.0"
 # Disk space (Gbytes) needed to generate qemux86-64 core-image-sato on U=
buntu 22.04 (x86-64), rounded up from 87
 MIN_DISK_SPACE : "90"
--=20
2.34.1


