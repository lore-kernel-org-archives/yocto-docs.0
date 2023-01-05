Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3004C53210
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 10:22:30 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.9750.1672914149463407490
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 02:22:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ESqeeMTj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 216ACFF807;
	Thu,  5 Jan 2023 10:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672914147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ovZibRurTqcPPuiLyjt4yYHn6JtxaZifmgcNM7R60c=;
	b=ESqeeMTjn3MxwjfGDyyIrzOrYLQB6QeHQBsWmhQy6F7LObA1cDE6MiAeee+3ofIuPkHK23
	IJ0ojfFcCz2qiC3zVe2jCaAFJh1YyOoDPsA/Kvl74aQJLpkttVnVntIli1DGWTgINQfDGr
	gIcFYfQsLDCloxlb/5tqVX/NJCd3FlWsdYdsiqN/fTysPZaxlnEI0+Eeg9A+v23G0deLUo
	xR+FcOB2jZEOy/8ywJa62+l68Ap6BKvVXis+Bw0V6+lwrEEflaZCK8q2XD7RV0Fo05opr6
	cMqO/MpvETbPlnF6uNmqmevuAIG8f+h4FvYUUeK3z2ifr8AIIEz9JrYSNDX4uA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Konstantin Kletschke <konstantin.kletschke@inside-m2m.de>,
	Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH 2/2] [kirkstone] docs: kernel-dev: faq: update tip on how to not include kernel in image
Date: Thu,  5 Jan 2023 11:21:55 +0100
Message-Id: <20230105102155.55177-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230105102155.55177-1-michael.opdenacker@bootlin.com>
References: <20230105102155.55177-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jan 2023 10:22:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3585

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Since commit f6d963fa6d0e ("kernel: make kernel-base recommend
kernel-image, not depend"), present in Kirkstone 4.0, one should
set RRECOMMENDS and not RDEPENDS to avoid including the kernel in the
image, so let's update the documentation to reflect that.

Reported-by: Konstantin Kletschke <konstantin.kletschke@inside-m2m.de>
Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/kernel-dev/faq.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/kernel-dev/faq.rst b/documentation/kernel-dev/faq.rst
index e40e3ff372..76923f6104 100644
--- a/documentation/kernel-dev/faq.rst
+++ b/documentation/kernel-dev/faq.rst
@@ -36,7 +36,7 @@ How do I install/not-install the kernel image on the root filesystem?
 The kernel image (e.g. ``vmlinuz``) is provided by the
 ``kernel-image`` package. Image recipes depend on ``kernel-base``. To
 specify whether or not the kernel image is installed in the generated
-root filesystem, override ``RDEPENDS:${KERNEL_PACKAGE_NAME}-base`` to include or not
+root filesystem, override ``RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base`` to include or not
 include "kernel-image". See the
 ":ref:`dev-manual/common-tasks:appending other layers metadata with your layer`"
 section in the
-- 
2.37.2


