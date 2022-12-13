Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82767C4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 09:59:06 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.69585.1670925545211694459
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Dec 2022 01:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ifn/JSP0;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C92C910000D;
	Tue, 13 Dec 2022 09:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670925543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M7jvfGQ90Yv78NnyWTpue6azcKdJyG5MHvgicE2BVoY=;
	b=Ifn/JSP09HRpXDSCexz5tBn+Re4SI+NkPolqFmx9EwC8lgvXv4O1HFMWXI5vc/L/K9qnxm
	m9LnhTK03/nIF1HXeY/LbKVMsybNAY8o0IYnJPSRG0ubT/P1GWkta1un2ELmPtWxOPpute
	bt3zgEM7oPSeqqAMj/lmAUakGHbcnpEbAmpD12QFfgpj7oFPYSxxAOpfwTJP4wkirpwUmm
	jl0gKk6dP1TtAMCv4zDRkGWElTs8n0hEExIcu+3w9hhVYoit8+znnC3mb/EHHjghKqrxa1
	eDVltuWo69k0YpyOD7peFHJ4ArSzx8Ozkgv6QU6KECXLrLo2bTTqbLSwqrcCSw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual/resources.rst: improve description of mailist lists
Date: Tue, 13 Dec 2022 10:58:59 +0100
Message-Id: <20221213095859.135895-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Dec 2022 09:59:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3551

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Mention docs@lists.yoctoproject.org
- Refer to the specific web page about all mailing lists,
  instead of just the website home page.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/resources.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index 06644363d5..5a09909c70 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -82,8 +82,10 @@ instructions:
 -  :yocto_lists:`/g/yocto-announce` --- mailing list to
    receive official Yocto Project release and milestone announcements.
 
-For more Yocto Project-related mailing lists, see the
-:yocto_home:`Yocto Project Website <>`.
+-  :yocto_lists:`/g/docs` --- discussion mailing list about the Yocto Project
+   documentation.
+
+See also :yocto_home:`the description of all mailing lists </community/mailing-lists/>`.
 
 .. _resources-irc:
 
-- 
2.37.2


