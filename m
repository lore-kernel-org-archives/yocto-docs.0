Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CC5D6B06C
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17117.1769700274942736892
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=htUp70eM;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5F6224E42322;
	Thu, 29 Jan 2026 15:24:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35AE7606FD;
	Thu, 29 Jan 2026 15:24:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7ECF6119A8853;
	Thu, 29 Jan 2026 16:24:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700272; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iyO4sDwjgpuDnZqHqirXF/WZJNoNQIhf6pTVC0Qg/Ds=;
	b=htUp70eMzMEGT9z+ufYm+NuzE8DvI5KPKyVS+caLHcUJQKTp/dDgAcmvkqDJZOs5jFPhkS
	qSfqpcOGqMBFHvPuLwksmSz8smrjEaH/SEI6ezUEtErC9PpO/Y+qyJkemR7P+OaGk8mfS6
	TUGGYNVjHG+i6pOCKKQYxYQlA8SaefnHri5AL7UCF4gznqR7kJb161OLUas53V8fXXZZUG
	39XbJfv60sA3RWqIIhosNhNR4E8WYVmxjN3nRgzSN4NiiDGlXhB6l+pg9791W30KETy6Tr
	TNHcrBOIfhqBAjzfB7GtpTeuj3vuyyMdRsymdbBVnfH7OZ7yqXX0Jf8zE9CXbg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:34 +0100
Subject: [PATCH v3 43/57] dev-manual/qemu.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-43-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1380;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=2XlSNHXthzVEvghh4GejLPwX5nHi3jOAAARDOe3o7lA=;
 b=kA0DAAoB0YBBQCmjqDYByyZiAGl7e4+gwmZti6EI5Zrb78Tr7vFfRgH+rStRfQZBHe0L8pgsG
 YkCMwQAAQoAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJpe3uPAAoJENGAQUApo6g2kpMP/jad
 YBRr5qzjrjDKPpXl0d6YZcfa1anHTZX7t2TKYUc/qCyWOz4K3/THoBRgutiU16lBTR36xMhA8Ae
 I7yk+Q0OxFSAS/4LGtCdgjXsOAM7SO+D/9eCyPpuOKT0LfvGCokEoCWW2930L0w1ZUrBGuT9TY3
 ikzKYakybtKgg9005yMujqLaFVOJuGlCzbJQqrU2twzRlGw9UHmbN73FsrRIUumdaEjvs4+zmhv
 0RJOL+aNelqpomDlWfb0CIsjJsLexs++KRvDfid1u26HukdJRCOmjPsVzrY22S6wxCuQcWtwdBT
 SwJTmpUbMjKyZjl0ifOd2kvixXp1Uxc42SswghPh8e0eIIYUZfdjXjZrfYvt6bv7WxNnJ/B+18k
 j2hg8TPkdBuiyIZkOKNreFjhrk3z2cG7m38/1O00IdM3gPQ3lzWplsqAQXgq84O9mUaMl+kZLtl
 3J1wTukbpDkz8/LAqpC7IMOud2TJ0ECqSPvWEEBQyceU1HLBaNsK9UKC5vFzlXupO1R7rxcX52F
 VztgEUiwttSXfR8l0bAJ/xw/hMlZBsXCfL/4CjhiBytKFgvxWf0Ki+BM7dzJBB3u8sGkzuPM1ie
 X3DtkLbZUd0PZfPJxo5EixtSQ0VFDTfAfgSs9WyR/AsPdghpW6TGnpH9kXpL62y6isVkbK4F7Oi
 3+dbZ
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8829

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/qemu.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 442fdced3..e40660a96 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -53,12 +53,13 @@ available. Follow these general steps to run QEMU:
 #. *Setting Up the Environment:* How you set up the QEMU environment
    depends on how you installed QEMU:
 
-   -  If you cloned the ``poky`` repository or you downloaded and
-      unpacked a Yocto Project release tarball, you can source the build
-      environment script (i.e. :ref:`structure-core-script`)::
+   -  If you followed :doc:`/dev-manual/start`, either use ``bitbake-setup`` or source
+      the environment setup script manually::
 
-         $ cd poky
-         $ source oe-init-build-env
+      .. code-block:: console
+
+         $ cd bitbake-builds
+         $ source layers/openembedded-core/oe-init-build-env
 
    -  If you installed a cross-toolchain, you can run the script that
       initializes the toolchain. For example, the following commands run

-- 
2.52.0


