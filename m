Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F0FC982E3
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11771.1789739659307446532
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ddaxwqvi;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A7CF01A0969
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D31060649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7347B1032901D;
	Fri, 18 Sep 2026 15:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739656; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5c/AkgSeY1NVZ075BNgbZp00xcmJCe7uT1Qbmt1U3Mc=;
	b=DdaxwqviEznyVl851w4rnKMZemhevcuS9NZUrwWSQvL666duLAdwRWV6aX+NJHj5M9MBnP
	lp2jqcZ797eh/JHWagvGJDfRwgFky4uhRjWAX40cd7uXWysmYtCMUl5f8dDYCastiN49zQ
	Bvqn3j0g+zsqwIBMFQmJ5XNRvIqardeA1xzipFh8hVBwabGkRsO9a6k/d30mOgu82546HL
	pH3MOIL7t+c3MXM7RCtOsNXs9kBWj1uaw6vzcGvJzNrIOiyKVGTl85AVxoLlkUZ3wG7aKT
	EkEJsTNl41AexvWS7PzRGCaYzgjzvcz9r8OJsoK1wXMGlU9sqbcmuYixWt0BBQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:43 +0200
Subject: [PATCH 13/20] ref-manual/variables.rst: document
 RETAIN_IGNORE_TASKS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-13-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=WAwVr0k39mBvxtF3NW+8TNbOqL9xzHyUFe1lpJsiPe4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJlKhuMbBRrK8eeQ78qzMiaaSFsXbJvcVVq6
 VbD1+zN3A2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CZQAKCRDRgEFAKaOo
 Ng9nEADLggvRLqqfhplR5Ps1w1ZNCxrpVz0R+a8T6VzuAhKMfu9dPuzcqzdxHwSYpgcDCSgbC18
 KwdN1lggkCI1rlEVC/U73UBNE2R+3roCafVjzjDcVw0+K7jutCEurnu4Q6w7F41R+IpJbulwl7F
 RwMeA1nDKjJwQqB2ugrAKfJUZacF4tvz60OKpS5vBc/AEjrpw2VrkG1yASLsiy66PEX6bsN435x
 gNcguwVFO7ycC3hp6/vE5j1Nub+f27/2GQa5h1IxI7MftCejSn7cZHFNemrF8FfvsS67XPAjYkN
 UfGoNv6JH6Gicgp2uPs+xIpuDNfK43sqZ46eN1qMWwLRFj60N5j1vh505nXSCZOaTQGVC++7IOc
 GLY2af04rzro13WHbW///Zz77/jqvtPk6/76UlHLBHnvBluYPfxRvpDMsUNupD/UJgpVcspHCi6
 hBPlilWGVL1mF9POymi+C7WoZn3+lH/l+GqhRe+4w2Ig3IDcgGoc9x1ktjozi2bPKGUZpILBtY8
 U/J6vwKN7/KvyzGiLowACvDY2KnZTroEF+1jb8aSIC3iJGKmKmckemqjZNTrieE60WG6FW7Y2Ea
 SOFAH0GzE/FsbCVyetPqln+doZwgvwineBV5emuaInZ6g/ygEXZKSwt3Y94E18JzN4g9XYhbwbC
 oVgswRkzZvhvxXA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10545

Added by commit d00d3b3d20c3 ("classes/retain: add ability to ignore
certain tasks") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 3fb8d8a65..8bbb2073d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8606,6 +8606,11 @@ system and gives an overview of their function and contents.
       :ref:`ref-classes-retain` class. Can be set to specific recipes to disable
       the class when the class was inherited globally with :term:`INHERIT`.
 
+   :term:`RETAIN_IGNORE_TASKS`
+      When inheriting the :ref:`ref-classes-retain` class, the
+      :term:`RETAIN_IGNORE_TASKS` variable can contain a list of tasks that
+      should *not* trigger retention.
+
    :term:`RETAIN_OUTDIR`
       When inheriting the :ref:`ref-classes-retain` class, this variable
       specifies the directory where to save the tarball of the work directory.

-- 
2.55.0


