Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1F3C982E3
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11766.1789739655744020918
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HBeONeFx;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 148F01A091E
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE14060649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FD0110328D58;
	Fri, 18 Sep 2026 15:54:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739653; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EipsNILjqCdX9/QOcapKHsUx92cXyrQt8agkI/Mzcho=;
	b=HBeONeFxBQzDsZ6KEz8q8tCPwG2/gZP1VBHboVnkTpxdKTeoPHU6ewC2MowrcJEmbTavbl
	8SQNUJgPzsFmKbHJrHFW+bcDFl+onDVenO1hKmxctc/Vk1ezHfIteMTPEU8fAZYtQzhzCB
	1p5kbnB+dfAlP4o4DofV9QkQdrMH3NcbTqtFRoUf9Fpf7PshmQ/mZQccVNXjYACmPsIxLp
	0sF3DIKjPTf6nDzNDOOsogzCOj10+Iu9MzBIWXbjxSjo3ISo9RJI0ZvS5kzS9gUfS+aDFQ
	XQTBjuUWeMY0LWihdVwak0TNXhzs3gqNhx1Xkk5NFr96/Vej8Hao6wPIDYYqRg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:38 +0200
Subject: [PATCH 08/20] ref-manual/variables.rst: document the FIT_OS
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-8-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VnO7VgrQ8O+hTIK0HR20z5LfBAEUCrPsZOkCBKGoJcE=;
 b=kA0DAAoB0YBBQCmjqDYByyZiAGqtQmSgv0N9XH5EL5vQXVFKY8Nw/pb8/MVVEjmSfEg9a2Wb1
 okCMwQAAQoAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJqrUJkAAoJENGAQUApo6g27T4P/R5v
 GggwLkL6SG0Cd5bICTgJYD9uQ0wPFgf+FHpFxiM7INBzBT2ME2qcReBvD2NH1l27e4fvsus+8yZ
 jiQ/pGXpYM3U3l6LSxYaWF2RlCT7jeET0j/VMPeelTjgWHP6X7+GgVE8rXa64qPYVsGaDktN3zG
 bfRnA+x8WJOsezMr2Csu3oU6dKFN6ykwGDeD0XDsBtIP1QknyO7T8wgUXBLxRmLeXIyoan3k2Sk
 XIypTbjs3RoIeexpGX//wEhlXBg3vdjbGvGkd/87ZhjIx33J6SJ7dSlToG+eJLbkxbyXoKPsC8C
 ehY2AtfjUx+1LJnxoQI5Rq7PJKtgO7ww3iJHOrjVr9M6Tg9pA0cyVZ5q+A2zePDxSXVw93Xzn0/
 Z/HUpBDTPUX7/6lJ9j2gUUBXG15H2LOqZ40Z8nT4Pr9p2yqA+A4uLZJscE69yx3afwgEq04exE5
 bETXCIvo2wzosdWBtpGzqnte+BbmB2ah26WJfpWqIhfUMFCUsCJsnr6P3eh2LSvwCE96v73sNns
 YJqUj/A/MLr1sVgwKGEFYhYKc5G0Df31QLL19IiACrGvNouGjBqjxT3E8QJieealfw1RneID/lX
 oz2iTdmx/3Lj+s3X8QTD21f3wLhNFqyGxm5uJoDYvRzwnLMm6SkP+vrCwRvReJxEm7Iu8GbmWhM
 p57nh
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10540

Added by commit dc00e830c3f8 ("kernel-fit-image: introduce FIT_OS
variable to override 'os' field") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8ec5cd955..5f94a0505 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3721,6 +3721,11 @@ system and gives an overview of their function and contents.
 
          mkimage *-B 8 -E* -f fit-image.its fitImage
 
+   :term:`FIT_OS`
+      The :term:`FIT_OS` variable controls the ``os`` field of the kernel and
+      various other images in the FIT image. Set to "efi" to load a kernel with
+      EFI stub as an EFI application. The default is "linux".
+
    :term:`FIT_PAD_ALG`
       Specifies the padding algorithm used in creating the FIT Image.
       The default value is set to "pkcs-1.5" by the

-- 
2.55.0


