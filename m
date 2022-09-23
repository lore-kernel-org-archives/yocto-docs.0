Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F1FC6FA83
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.587.1663955614226833949
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ozg+5fyj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AB8FC20005;
	Fri, 23 Sep 2022 17:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvxnVt+HuNOgtqaJDq8mP6RuG7mVWVsgOIq2Xt2CEsI=;
	b=Ozg+5fyj6Xnpz2ydak8/lcZMNOpX8imJLdBrsBKkEqj2oj3JavIilR+2D9M/btzskzFUwy
	7sLh0wLrDQndhqOI3OOytquWMs7+2TCfNV0uKqSRm3W0+SZETqZaZBJPC7/78R2QpsU3zz
	EXm1ea66KeU8tcjNpp72ThvMNmuYieQVr2YaVrHqMGs0q2V5ArxqTF9wylAcZYSgJoKFFu
	hnQV9cY1dBHs1UfhCyclwWflQr/nrCI6v3RXJCB555/vh7QrGpDRRe/EOSrRU23JIWQps+
	aoqldx3I8fGBFSbFKUB8qvuZq7QMU0JyMNCOUiSfR4J42KPRSMltePPyo7bVBA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 15/30] overview-manual: concepts.rst: add reference to
 "do_populate_sdk_ext" task
Date: Fri, 23 Sep 2022 19:52:04 +0200
Message-Id: <20220923175219.6652-16-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3230

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/overview-manual/concepts.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 1215e0ee94..423f645740 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1106,7 +1106,7 @@ built for the target hardware and includes libraries and headers. The
 host part is the part of the SDK that runs on the
 :term:`SDKMACHINE`.
 
-The ``do_populate_sdk_ext`` task helps create the extensible SDK and
+The :ref:`ref-tasks-populate_sdk_ext` task helps create the extensible SDK and
 handles host and target parts differently than its counter part does for
 the standard SDK. For the extensible SDK, the task encapsulates the
 build system, which includes everything needed (host and target) for the
-- 
2.34.1


