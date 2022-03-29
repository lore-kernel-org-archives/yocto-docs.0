Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8886BC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 12:21:46 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.5951.1648556505356019363
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 05:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nNXCsvfP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D61AB240005;
	Tue, 29 Mar 2022 12:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648556503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T0GPo05qSTNqqPLDh51eEOv3BkASONwRTThIigXdvQQ=;
	b=nNXCsvfPJyYPyoFiJ2UMiZScn47+yt/pOzuWFzMuXILvg20hrdEOzSAGoaeRehYSmb+HUu
	zMaxWcoqSXQsQYAz+0rkPXph3/4KPEd8gFtg7KasBl1RCY2UoezF6nlsR9UtvB/9YXAMCX
	7dRKrvkmMT6Os0FSxpAOx9YFmYRMnA8iH6e9xL7aKfLg4fXScC5t/YBnh59Aq9ZnyOma/h
	l9FWuzQruxK6mUP9ejJ3P47eRQts8iJpaVi0xERIv10itTYchRSf166gWkHOZazTvZc4zh
	Tj0sh2TNkJ5g/8jim+BhOVZwz5tqQvk8RZw7aiOhZ/HOqcsG+gls82ewkYHpQQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] overview-manual: add missing upper case
Date: Tue, 29 Mar 2022 14:21:40 +0200
Message-Id: <20220329122141.362150-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Mar 2022 12:21:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2727

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/development-environment.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index 9c9c8e87a0..8ffa8c7e3e 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -427,7 +427,7 @@ other branches represent offshoots of the "master" branch.
 When you create a local copy of a Git repository, the copy has the same
 set of branches as the original. This means you can use Git to create a
 local working area (also called a branch) that tracks a specific
-development branch from the upstream source Git repository. in other
+development branch from the upstream source Git repository. In other
 words, you can define your local Git environment to work on any
 development branch in the repository. To help illustrate, consider the
 following example Git commands::
-- 
2.25.1


