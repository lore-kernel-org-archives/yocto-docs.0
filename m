Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA17E78484
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123209.1766593936071331147
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=txlfE2dZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7DC401A23E0
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 541C96073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AE4F10AB1370;
	Wed, 24 Dec 2025 17:32:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593933; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kWakI1MCIj77bMq0pvxzMc4jl03f3LkRTh6wIC/mKLw=;
	b=txlfE2dZ1rdIys89xgx88UhMo2RgFyt9yTfHwo4yUKRQDxaKQlO4kGkUmQWgut3TXNg+iW
	Pmz2DcMfx569ZBKqBQ2K/2VtK46J2egZyyoxjQuaNNX+5aTFVV9yNZKQ4Ts7nEc7+BEXPe
	SgLzI+v2NaqU03jORZAH6txHHjoIaO4H8LPqn2IQAh5mLb91Z/ZOUAyQbGAEgqAt/sld8C
	OY/HNci5SZ3ReCm+ucPyNNWcYCPwlJ3D9PkQapwWVjP9w8Q2rD5LQt2uvE469en2SbicgW
	SDP9ZQ1PfuKplNpg9TKQlDzf3MhKmY02qlD7+cD75b/NSJACY2IGGM9S8RGOQg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:03 +0100
Subject: [PATCH 37/53]
 dev-manual/custom-template-configuration-directory.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-37-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2540;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=d/0q2LDjws/ihTqbTSv8U0pT6EFBt5UX0ulcD3sxvjI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVt95DpCGyjzArJio1Pdx/d38H1MEI5bCul3
 PX3IAS4+F2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbQAKCRDRgEFAKaOo
 NqtBD/0amEkD4BucU5JIPP/yNRL+pypjgxdxADQnaYgjLDXQPFK6LPKXZLdBzJMTMOb6/HWIKxa
 q5KnQ4LOAlnocYsa10NMx3awl/m+I27grFjWJRJ+Nykvy/o6Olkz+hSompEiv8Ogwb3zBF8i97E
 WdGU+aLXrV5doBl09HgtaKHnM7hTJ/A4JsKDo9A2X/kUZtMqQs+7wJ4el7MrQ6IVCD7ZLwCJfhd
 0reg9y3q1EgewZUYKupq3Yb3BtMckFF7TDB/QtdfIn4u65FsvUKR3GPdj4XifVo3BWHDmUIcnHc
 Fvu4dGrJe3pXwMGe1zepSb71LJMwtb3du9dfIxJJ1nDhQH/hrTWhyp0T+XdyshRoo7C2/KpgjPo
 ewEpSTFAisTRoQKTu6TL2qCnMxL/5FGgM9p0/UbY5Mp2JNrg3S3N0LgUoCRuOM42hwnSTSRryGs
 KPrSyMhLFhZD7Hl3sTkwH/Du+gNZo0yegiv1nl95To/hpYGymJqTZ/TQmZC46TBzbL1EwyCOjEe
 5uu+g6xz+BYD90fRRYY3rgzPEJH5gC7ejW2DMNIl5zdmdfmBHs3RomRQZZ9r7tdpDmpRZS88ve7
 u+gJozBzmheWnEy1TbEt1na+PDXbbiO8Rqy9ox/10tk+Exu9MmnxFEzJ8hiaAmTUeNrJ8D08jfd
 Y+GS3S9Ry+YmcMw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8366

Refresh the document now that the Poky repository is obsolete. Adapt
paths to match to encouraged Source Directory layout.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../dev-manual/custom-template-configuration-directory.rst        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/custom-template-configuration-directory.rst b/documentation/dev-manual/custom-template-configuration-directory.rst
index 06fcada822..0750420abf 100644
--- a/documentation/dev-manual/custom-template-configuration-directory.rst
+++ b/documentation/dev-manual/custom-template-configuration-directory.rst
@@ -15,10 +15,10 @@ This can be done by using ``bitbake-layers save-build-conf``::
 
    $ bitbake-layers save-build-conf ../../meta-alex/ test-1
    NOTE: Starting bitbake server...
-   NOTE: Configuration template placed into /srv/work/alex/meta-alex/conf/templates/test-1
-   Please review the files in there, and particularly provide a configuration description in /srv/work/alex/meta-alex/conf/templates/test-1/conf-notes.txt
+   NOTE: Configuration template placed into /srv/project/layers/meta-alex/conf/templates/test-1
+   Please review the files in there, and particularly provide a configuration description in /srv/project/meta-alex/conf/templates/test-1/conf-notes.txt
    You can try out the configuration with
-   TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
+   TEMPLATECONF=/srv/project/layers/meta-alex/conf/templates/test-1 . /srv/project/layers/openembedded-core/oe-init-build-env build-try-test-1
 
 The above command takes the config files from the currently active :term:`Build Directory` under ``conf``,
 replaces site-specific paths in ``bblayers.conf`` with ``##OECORE##``-relative paths, and copies
@@ -27,7 +27,7 @@ the config files into a specified layer under a specified template name.
 To use those saved templates as a starting point for a build, users should point
 to one of them with :term:`TEMPLATECONF` environment variable::
 
-   TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
+   TEMPLATECONF=/srv/project/layers/meta-alex/conf/templates/test-1 . /srv/project/layers/openembedded-core/oe-init-build-env build-try-test-1
 
 The OpenEmbedded build system uses the environment variable
 :term:`TEMPLATECONF` to locate the directory from which it gathers

-- 
2.51.0


