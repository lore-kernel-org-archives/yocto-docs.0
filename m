Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74181C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 17:17:41 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.19287.1676913454243728648
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 09:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GxQRXtm1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 10A5DC0004;
	Mon, 20 Feb 2023 17:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676913452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vgalJKNPoCsPGiYj9SbmpMrpDlVtKTkdgdGGJ+45Hsk=;
	b=GxQRXtm1FlQL2/mK+gBGy2n1l+3UaFRTFXe+V1zPiMqY3V9VVuUjGZ+uYWf/F8nciO5sg9
	GCfnmWGWt2as6lsqTtB/slK5T/5z1DuncAzcU5/r4c0nTpypDIkGtXdprM5o13BrE53/FY
	RxPDfk2vNlGSpEFGOI4Ihk7VBjL74ImzL7/IAHSZAvtDEkhowlKC2o1Hp/f5391KyT6vOR
	q8cJJ94efuyEaq7hed/VZZSX0F3eBeu1sRp23vVOO8KwwtvbeEH4HzxL9JzzCn2RyMf5oA
	4sRo0OIO2uIx2PcfCWHNi85s5aPsV8OoSOnthswDZM6+TqJqjdm0vHX563/TZQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Niko Mauno <niko.mauno@vaisala.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH] [langdale] ref-manual: Fix invalid feature name
Date: Mon, 20 Feb 2023 18:17:24 +0100
Message-Id: <20230220171724.22223-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Feb 2023 17:17:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3700

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Niko Mauno <niko.mauno@vaisala.com>

Replace the invalid feature name with correct one which helps to avoid
following bitbake error

  ERROR: Nothing PROVIDES 'core-image-minimal'
  core-image-minimal was skipped: 'empty-root-passwd' in IMAGE_FEATURES (added via EXTRA_IMAGE_FEATURES) is not a valid image feature.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/features.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index a5b01e8df7..9345543ebb 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -296,11 +296,11 @@ Here are the image features available for all images:
    forced in ``/etc/passwd`` and ``/etc/shadow`` if such files exist.
 
    .. note::
-       ``empty-root-passwd`` doesn't set an empty root password by itself.
+       ``empty-root-password`` doesn't set an empty root password by itself.
        You get an initial empty root password thanks to the
        :oe_git:`base-passwd </openembedded-core/tree/meta/recipes-core/base-passwd/>`
        and :oe_git:`shadow </openembedded-core/tree/meta/recipes-extended/shadow/>`
-       recipes, and the presence of ``empty-root-passwd`` or ``debug-tweaks``
+       recipes, and the presence of ``empty-root-password`` or ``debug-tweaks``
        just disables the mechanism which forces an non-empty password for the
        root user.
 
-- 
2.37.2


