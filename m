Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792D5C54E56
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:41 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.12829.1709042499320399333
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FN8LqQHQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAA45E000F;
	Tue, 27 Feb 2024 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wb25ItySJ1SkRqVqTb64ZujnJcv4sud70bfUc7VLkhg=;
	b=FN8LqQHQo1H0/+oqI4Qd3HIonhHD/pkBIBt0+NGXpO6WcNPq/sUMR5PbyopuFboeN80huM
	DtiFDDtrqPZIklX0HN4q8DgFchAGmPum4h+U16DAcN0p5ybzcBx0rmDr2w5wMVeyKtfBmG
	unogvJuDl5ww+ImxCBCuowB4iggH6XYZEYMz7e2FFmmzoPSkv3YPlZf4UB0GROj3yXwOvu
	MK5WIycZYUDAeCH/zVyTq1/BGpSNke/5ZzQ2cKgXPIypo0mVuX1DDjQqO0VZ/FAUcqQak7
	WNk+JB7ni/1WwGnrnvEidPRvv7oitXuCaYrn6R4nWKSGxHwJpDq9JBW4dFbgbg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 05/16] dev-manual: packages: need enough free space
Date: Tue, 27 Feb 2024 15:01:17 +0100
Message-Id: <20240227140128.481522-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
References: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 14:01:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4896

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Enough free storage space is needed to apply package upgrades.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/packages.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index d90ff7110e..a6e6af0de7 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -612,6 +612,13 @@ subsequent sections are necessary to configure the target. You should
 set these variables before building the image in order to produce a
 correctly configured image.
 
+.. note::
+
+   Your image will need enough free storage space to run package upgrades,
+   especially if many of them need to be downloaded at the same time.
+   You should make sure images are created with enough free space
+   by setting the :term:`IMAGE_ROOTFS_EXTRA_SPACE` variable.
+
 When your build is complete, your packages reside in the
 ``${TMPDIR}/deploy/packageformat`` directory. For example, if
 ``${``\ :term:`TMPDIR`\ ``}`` is
-- 
2.34.1


