Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656C2C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:31:47 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.24307.1707233497804716287
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 07:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gs3u1vuK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D8C51C000B;
	Tue,  6 Feb 2024 15:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707233496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ldDgAP7hmbrbhcxTejxb+Bl7UPAYlNMgKZKX/aiHwBw=;
	b=gs3u1vuK8T+p8UoVhJrPM5X0FRlwCG3tISs+B7RD/IwfQJk/3v0RlYJ+T1zPKV/seWja9H
	4uuDbbMPpQ24jufCUvi9tvladDywRdQs+HoZWQiwQqZI84JsAkZ2jUy17QGFc8Lt4jv2HV
	A0S0Qkmqu3yLNtEcA8uY/JRwH61Xmh7l//TOF0EhailxRwpqx8rlz+H99qVFU79QVgdoVJ
	6R4vEuW1Xq6O4ft7kKpDyPayLB7ASLI8Yyq/kyv7ekX3VTxVM7RuwckmdFM7cdmAwsrvAL
	/Sp2f24uniADuJ9JMDnLKDCmbaKJHGp29lj5I7vsPNj7m+4avE8k2FwvP9WOXA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 3/3] dev-manual: start: remove idle line
Date: Tue,  6 Feb 2024 16:31:11 +0100
Message-Id: <20240206153111.77153-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206153111.77153-1-michael.opdenacker@bootlin.com>
References: <20240206153111.77153-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Feb 2024 15:31:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4822

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Align with text in the other branches.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/start.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 44503a5183..794da1e672 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -666,8 +666,7 @@ described in the ":ref:`dev-manual/start:accessing index of releases`" section.
 #. *Select a Yocto Project Release:* On the top of the "RELEASE" page currently
    supported releases are displayed, further down past supported Yocto Project
    releases are visible. The "Download" links in the rows of the table there
-   will lead to the download tarballs for the release
-   (e.g. &DISTRO_NAME_NO_CAP;, &DISTRO_NAME_NO_CAP_MINUS_ONE;, and so forth).
+   will lead to the download tarballs for the release.
 
    .. note::
 
-- 
2.34.1


