Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82573C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 15:31:54 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.9993.1705073513761984319
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 07:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kj6sypdb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9828660009;
	Fri, 12 Jan 2024 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705073511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EgneeNj0jB9d7oGliPiBa1YPrBTf9E63yTK16eVxZec=;
	b=kj6sypdbCvecsWX1Dg8x/ygF3WsomEwBSPRIY9N4vnedhuuhwY5qOnkhvfnphPDSXlWI1n
	b9yASdl8gOlur2ev/OckF70+ZB2o/ggJQWHisdj+liz2hvaOT028YVTVKoRMFTrGHSMW/x
	3HlurHqa35ddTr91of5Xo1+a5TfbSLJnBnDcJRPCcHk1tAep1g/W3uNlwjIyBlKCAmv84L
	20sFwoXRez3/oFnw+maf7OTVRhwKJw3MMwG/CVmJX682ZmqQJkdHoj8DMiy70UQoC8dIqz
	HrUClUzNwaMylPVPk3TbSwTUNc93R78gK482sVxZHPPXCUUCNvo3eRUJZxsS8Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] dev-manual: start: remove idle line
Date: Fri, 12 Jan 2024 16:31:49 +0100
Message-Id: <20240112153149.3540525-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Jan 2024 15:31:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4764

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This fixes an issue introduced by d8fdec653f96c4ddcb705ff0ef17ed641afcfe2d

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/start.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 762605a0aa..b108337795 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -646,7 +646,6 @@ described in the ":ref:`dev-manual/start:accessing source archives`" section.
    supported releases are displayed, further down past supported Yocto Project
    releases are visible. The "Download" links in the rows of the table there
    will lead to the download tarballs for the release.
-   (e.g. &DISTRO_NAME_NO_CAP;, &DISTRO_NAME_NO_CAP_MINUS_ONE;, and so forth).
 
    .. note::
 
-- 
2.34.1


