Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A0BC04A6A
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 14:25:37 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.89544.1691591131677996551
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Aug 2023 07:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ga8jS592;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E055B60009;
	Wed,  9 Aug 2023 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691591129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OvG18oMg+53nk1OnQmTCWd3V5/UCXpTO063lCtAVGkM=;
	b=ga8jS592IiSRfiGFOor2TRQ9e7I+nDRVpsmdFF2g/iQWerqyj2nWbEeA4hsUtRI7H8fDE3
	zW96pWNJpvGDa4cvpN9QSmj6Bings1P1JTCdxs/8RQfvY/TWeNYt/6wGSKTaBmEUePyje5
	2KtQpAMDIvH3A4LQwIujHnZFqwkXYtHRkqmLqMrzz6Bjxn2Q3CmmegZG8yQ5qmT0V4CBOY
	64D+3siGlET3FJ0S/m7OFbgN4fSKo9RNiD/sLAMmg2AZAztES59y+NYERfB2qcgoAaW1Ve
	fTTQMlu52wrgNUS+xKShjvMeDLV6kDFg71ZPkAhBQkTQ9pKBfdI8ntztWRs9Wg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] contributor-guide: add section about why we use mailing lists
Date: Wed,  9 Aug 2023 16:25:19 +0200
Message-Id: <20230809142520.226581-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230809142520.226581-1-michael.opdenacker@bootlin.com>
References: <20230809142520.226581-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Aug 2023 14:25:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4121

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../contributor-guide/submit-change.rst       | 41 ++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-change.rst b/documentation/contributor-guide/submit-change.rst
index 2555767102..573491ecbc 100644
--- a/documentation/contributor-guide/submit-change.rst
+++ b/documentation/contributor-guide/submit-change.rst
@@ -8,10 +8,49 @@ Because the system is extremely configurable and flexible, we recognize
 that developers will want to extend, configure or optimize it for their
 specific uses.
 
+.. _ref-why-mailing-lists:
+
+Contributing through mailing lists --- Why not using web-based workflows?
+=========================================================================
+
+Both Yocto Project and OpenEmbedded have many key components that are
+maintained by patches being submitted on mailing lists. We appreciate this
+approach does look a little old fashioned when other workflows are available
+through web technology such as GitHub, GitLab and others. Since we are often
+asked this question, we’ve decided to document the reasons for using mailing
+lists.
+
+One significant factor is that we value peer review. When a change is proposed
+to many of the core pieces of the project, it helps to have many eyes of review
+go over them. Whilst there is ultimately one maintainer who needs to make the
+final call on accepting or rejecting a patch, the review is made by many eyes
+and the exact people reviewing it are likely unknown to the maintainer. It is
+often the surprise reviewer that catches the most interesting issues!
+
+This is in contrast to the "GitHub" style workflow where either just a
+maintainer makes that review, or review is specifically requested from
+nominated people. We believe there is significant value added to the codebase
+by this peer review and that moving away from mailing lists would be to the
+detriment of our code.
+
+We also need to acknowledge that many of our developers are used to this
+mailing list workflow and have worked with it for years, with tools and
+processes built around it. Changing away from this would result in a loss
+of key people from the project, which would again be to its detriment.
+
+The projects are acutely aware that potential new contributors find the
+mailing list approach off-putting and would prefer a point-and-click web GUI.
+Since we don’t believe that can work for us, the project is aiming to ensure
+`patchwork <https://patchwork.yoctoproject.org/>` is available to help track
+patch status and also looking at how tooling can provide more feedback to users
+about patch status. We are looking at tools such as ``patchtest`` to
+test user contributions before they hit the mailing lists and also at better
+documenting how to use such workflows since we recognise that whilst this was
+common knowledge a decade ago, it might not be as familiar now.
+
 Finding a Suitable Mailing List
 ===============================
 
-The Yocto Project uses a mailing list and a patch-based workflow that is
 similar to the Linux kernel but contains important differences. In
 general, there is a mailing list through which you can submit patches. You
 should send patches to the appropriate mailing list so that they can be
-- 
2.34.1


