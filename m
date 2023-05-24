Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FD9C7EE2D
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 19:39:24 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.3598.1684957154161035080
 for <docs@lists.yoctoproject.org>;
 Wed, 24 May 2023 12:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UwiZokdl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A848FC0002;
	Wed, 24 May 2023 19:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684957152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jIyBIo+vLGNLxtNCBcgv9JQ+mLtpyMdzs8VVWlhyVQ=;
	b=UwiZokdldv7TMvJSqC6L30aw5LJMIMmIosYCRaWl65yJONEs99qkVki9XMJ9Bf/zzY30D2
	Q9/auV8KipMlifDTf36gQHUZ5hn2t2cVheP47iewrFiGHZkChJ1E037W4JSdLsjALF3OoJ
	B8nWjUTqBFvVWRpbqlNI2Y1vRgBUwEM1tlUCjxqPdxVQnXF28JsVhPbmwSVvH+pYqJtbMH
	qjmDlGOb9AeVmq4wjAY3tvge0mBpsVy0mMTbsory9nWlYymKcL+JIZw1fO0ZU6esFJpr67
	iL8TKhTZ55xs3nIi6lfSBT9p7JRxa283Km1fvAi+rZGuBSAk78bcIzarEaQixg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/4] [kirkstone] migration-guides: use new cve_mitre macro
Date: Wed, 24 May 2023 21:39:02 +0200
Message-Id: <20230524193903.3113544-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230524193903.3113544-1-michael.opdenacker@bootlin.com>
References: <20230524193903.3113544-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 May 2023 19:39:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3964

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/release-notes-4.0.7.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/release-notes-4.0.7.rst b/documentation/migration-guides/release-notes-4.0.7.rst
index 9e8ad51a0c..95f5b6a3af 100644
--- a/documentation/migration-guides/release-notes-4.0.7.rst
+++ b/documentation/migration-guides/release-notes-4.0.7.rst
@@ -7,7 +7,7 @@ Security Fixes in Yocto-4.0.7
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 -  binutils: Fix :cve:`2022-4285`
--  curl: Fix :cve:`2022-43551` and `CVE-2022-43552 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-43552>`__
+-  curl: Fix :cve:`2022-43551` and :cve_mitre:`2022-43552`
 -  ffmpeg: Fix :cve:`2022-3109` and :cve:`2022-3341`
 -  go: Fix :cve:`2022-41715` and :cve:`2022-41717`
 -  libX11: Fix :cve:`2022-3554` and :cve:`2022-3555`
@@ -24,7 +24,7 @@ Security Fixes in Yocto-4.0.7
 -  sqlite: Fix :cve:`2022-46908`
 -  systemd: Fix :cve:`2022-45873`
 -  vim: Fix :cve:`2023-0049`, :cve:`2023-0051`, :cve:`2023-0054` and :cve:`2023-0088`
--  webkitgtk: Fix :cve:`2022-32886`, `CVE-2022-32891 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-32891>`__ and :cve:`2022-32912`
+-  webkitgtk: Fix :cve:`2022-32886`, :cve_mitre:`2022-32891`
 
 
 Fixes in Yocto-4.0.7
-- 
2.34.1


