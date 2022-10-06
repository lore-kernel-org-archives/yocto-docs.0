Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF73C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 12:26:28 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.5083.1665059181321002053
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 05:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MPVBf98W;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id ED6F860013;
	Thu,  6 Oct 2022 12:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665059179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zYaJDxOxjhS4hOC/kp+Z9sWunehvtJpWcej3UiVAn3A=;
	b=MPVBf98Wk2lUbljskaPj4zFckBIK9tyKaU0f6pQLS3HPCrmwCceXQI7K8DNUbM1OhT76Vj
	kCFKPzzWL237nJgQa5xd1nX9pjBLu0QYLluozwSW0pWtka4xcBd2jeK+vy5AEkqsBngdtv
	U43Xn9cyY86JIutk/KueArv3BrGvPPtJEKyrV1J70k+sG61RAhCsc8vrgn0aJgvcrwkX0J
	HzuLyDKNrbqamTca/daZ58OGpparVLdKd0BWVD9YDDUEYWyrMy/vbzGKRTZe9qr/YUGDeT
	2lCUCuTzB8XqJ9DJ942LDrg0q8xvUyCreJjSaAYNgkP5pid8AXqZO76cUmMwwQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [kirkstone] dev-manual: fix reference to BitBake user manual
Date: Thu,  6 Oct 2022 14:26:15 +0200
Message-Id: <20221006122615.439381-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Oct 2022 12:26:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3297

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Fix a wrong reference no longer tolerated by Sphinx 5.x
(missing "bitbake:" prefix)

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index b228c75aab..fbe8a29896 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2562,7 +2562,7 @@ Recipe Syntax
 Understanding recipe file syntax is important for writing recipes. The
 following list overviews the basic items that make up a BitBake recipe
 file. For more complete BitBake syntax descriptions, see the
-":doc:`bitbake-user-manual/bitbake-user-manual-metadata`"
+":doc:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata`"
 chapter of the BitBake User Manual.
 
 -  *Variable Assignments and Manipulations:* Variable assignments allow
-- 
2.34.1


