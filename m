Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0F0C001DE
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 08:59:55 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.13142.1691657987038007617
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Aug 2023 01:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JK6N7DVG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F2501BF20B;
	Thu, 10 Aug 2023 08:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691657985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tImKVL3SkcDF8MyLlpIpjufUDAs6zT0tZ6fBUjY4tM0=;
	b=JK6N7DVGos6thGQFguPFRl+aRKqNvCUPIcJFxfsnwO/I7NmbHmo5Nmvi+Swi+LskLEowYb
	iJQ6h3LNhmf4fE0XHVQPHLE9UrZ+wqP4TXuWCUoOF8AjNyFG++wh7JIWJ4I0a49r+TapgS
	QwwmiEsIANb2ZKpUZZNRsrKWPHHO60j5ciQvoQHF8BoRA6fL3ahpHTlZxP9qGPaq4oL8D0
	5zc7sUyEuTbVwytuVgfwtFUOCRTDCHImqH2lx42jCsnZaYUWh2m7QHerR55zlngHUWSR7X
	d5t82k28pv/OuRpQPKohOyWR4VvnbDGrwc+TDV0HwV8YSgTpTeYVxF6syvK0cA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] ref-manual: remove AUTHOR variable
Date: Thu, 10 Aug 2023 10:59:43 +0200
Message-Id: <20230810085943.968932-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Aug 2023 08:59:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4134

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Following https://git.openembedded.org/openembedded-core/commit/?id=9d5edd124b7dddb995ceddd79f8a7fc8cf44badf

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/recipe-style-guide.rst | 1 -
 documentation/ref-manual/variables.rst                 | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 5210062802..35ffbc61ef 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -144,7 +144,6 @@ general order when possible:
 
 -  :term:`SUMMARY`
 -  :term:`DESCRIPTION`
--  :term:`AUTHOR`
 -  :term:`HOMEPAGE`
 -  :term:`BUGTRACKER`
 -  :term:`SECTION`
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 44e2dd08a8..7a71abc0ae 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -192,10 +192,6 @@ system and gives an overview of their function and contents.
 
          ASSUME_SHLIBS = "libEGL.so.1:libegl-implementation"
 
-   :term:`AUTHOR`
-      The email address used to contact the original author or authors in
-      order to send patches and forward bugs.
-
    :term:`AUTO_LIBNAME_PKGS`
       When the :ref:`ref-classes-debian` class is inherited,
       which is the default behavior, :term:`AUTO_LIBNAME_PKGS` specifies which
-- 
2.34.1


