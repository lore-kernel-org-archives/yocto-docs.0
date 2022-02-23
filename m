Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA13FC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 17:23:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.10684.1645637018772384419
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Feb 2022 09:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YmentUcF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F1651E0010;
	Wed, 23 Feb 2022 17:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1645637017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3Injyp+/8OdjOcbutUblb7mQCJ+Corh03lIr9BYP/nw=;
	b=YmentUcFzbGM9NopATnMJLkTRH4DtI2TvIJ7lXSZck4OzJvg02DR7YBhtkHdTsG90NWa1Z
	eNOGUx+Q00hw1wiSd4TRK1AkLvNaKzrd6yTqSUARVnIC5FoMaiuLOJN9ySeaglZM9Md5+J
	bfqzzdfpcZnshW0/utXdCVGG3Q1+8EKk9sBZhsgSLa2jMbGse4ZxsOH2b5+lwZNR/a/38t
	pC4zYNFx2VKvaOaxZSh7UfPJOgeQ2gPUKM+VTZXwQGHc19F26SzW9Hr3HqKWsrKo4qHeKM
	swMd/CiVNyXPNNcpRYeZeJrl6bhROoOG+BNnEbH5DU6NWikaOcsP48Nedoqp8w==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] documentation/README: how to upgrade Sphinx packages
Date: Wed, 23 Feb 2022 18:23:21 +0100
Message-Id: <20220223172321.130221-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Feb 2022 17:23:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2500

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/README | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/documentation/README b/documentation/README
index 10b46de3e6..123812dcac 100644
--- a/documentation/README
+++ b/documentation/README
@@ -113,13 +113,18 @@ documentation with Python3.
 Sphinx might be available in your Linux distro packages repositories,
 however it is not recommended to use distro packages, as they might be
 old versions, especially if you are using an LTS version of your
-distro. The recommended method to install Sphinx and all required
-dependencies is to use the Python Package Index (pip).
+distro. The recommended method to install the latest versions of Sphinx
+and of its required dependencies is to use the Python Package Index (pip).
 
 To install all required packages run:
 
  $ pip3 install sphinx sphinx_rtd_theme pyyaml
 
+To make sure you always have the latest versions of such packages, you
+should regularly run the same command with an added "--upgrade" option:
+
+ $ pip3 install --upgrade sphinx sphinx_rtd_theme pyyaml
+
 Also install the "inkscape" package from your distribution.
 Inkscape is need to convert SVG graphics to PNG (for EPUB
 export) and to PDF (for PDF export).
-- 
2.25.1


