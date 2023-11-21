Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C81C61D90
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 19:58:58 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.3147.1700596738016846826
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Nov 2023 11:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=g0p3+nnw;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=dUHqfm0/;
 spf=pass (domain: cold-front.org, ip: 66.111.4.27, mailfrom: jsbronder@cold-front.org)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.nyi.internal (Postfix) with ESMTP id 625BE5C0864;
	Tue, 21 Nov 2023 14:58:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 21 Nov 2023 14:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=mesmtp; t=1700596737; x=1700683137;
	 bh=0sLQ8YxZ33XRJwyOB6PwGHkpVHfmyW3Gx37ciUrHxVk=; b=g0p3+nnwGEdU
	41iU3t91s63Ir1oif3aCMmBUB++yRVdqvZReA6jJTEuCJRjOAeX9K3AU7AwR1+Du
	/DDLh6jEnao/eEbBeVbSLouDOQGTvzFmHn9hk7KBm+z1HKm4Na82L9si9LjInUrB
	clUD70+nWU0DPHDD9KorUXmjDCVU0Mk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700596737; x=1700683137; bh=0sLQ8YxZ33XRJ
	wyOB6PwGHkpVHfmyW3Gx37ciUrHxVk=; b=dUHqfm0/GoVUBglRutn+cRPdX9GRS
	g6wI/O648UsL/HzEsohnmtftFMxIVtphEfmxkYwhWRkkSwvtx/lypugkg2Rk7MCl
	SAKWr13UsN76cfbgBpGvjBCZSMuNvVFwxpW85GfWcq0IvEfufPqPCTXxoOIiR0DS
	nR7wexifgXZxPlh1Ttf3fQUz/KJdHAMOGjc/LRzPKBfBwjml43qcVzqOzVoxaPSh
	EXS0JJQpA7UZEVlWxXtA9Zmmnnm5ViCWKdKH4+/NskSSLPSvFmoo1OTItxNYT0I9
	zN9SIM4OFUWLWmkbpP9WmtN6Ol/068kHKSadNpfsywgR3z16Niqj18EFQ==
X-ME-Sender: <xms:AQxdZSm5Rixy0ffLJNo28qusbjzJivZS9NKlOeGmYYd2QB7ls4So-g>
    <xme:AQxdZZ3IOezOMqNM8EGUeIaF8zje9ve4LqSn5C4i3XiFKBfaCBISFdbPOfCdxe6o1
    AMn0hL9kK9XLVRP5g>
X-ME-Received: <xmr:AQxdZQrR84x4aB75ungsY_Vhbr_GT7xRnDD_f1lWrf7J08bN6vDrsKktBnNpxSoucprnpJ6IyMO7epA-9riXHruY501T7dEtHZ6CvmeS8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegledguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggv
    rhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeehueejffelfe
    ekieejfeelvedtveefieeuffejtdevkeehffduvedukeefuefhtdenucffohhmrghinhep
    ohhpvghnvghmsggvugguvggurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdho
    rhhg
X-ME-Proxy: <xmx:AQxdZWlpurfjhbvKQ2za4DnZnrA86kDMY7kPTnmB52shD9WDuzOUbQ>
    <xmx:AQxdZQ38Iix0xRsbZLJMrG6r8C-AL3ErzB50Re7nfw0G8AyBo1ou-w>
    <xmx:AQxdZdubO1yGo0pVVE8aYFztN9QhLVGnniWYCVWB3cEgZ9ZPmxc6iw>
    <xmx:AQxdZV9FAi81ILr-u-DEyLfW4k_-UURv23tx-V-aTdYRXhBFBaeL4A>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Nov 2023 14:58:57 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: docs@lists.yoctoproject.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [PATCH] contributor-guide: add License-Update tag
Date: Tue, 21 Nov 2023 14:58:54 -0500
Message-ID: <20231121195854.27968-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Nov 2023 19:58:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4639

Porting from the old wiki
https://www.openembedded.org/index.php?title=Commit_Patch_Message_Guidelines&oldid=10935#Describing_license_changes

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../contributor-guide/recipe-style-guide.rst          | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index a005aa324..bb8f6980e 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -250,6 +250,17 @@ Recipes need to define both the :term:`LICENSE` and
    correct string that you can substitute into the recipe file for a
    subsequent build.
 
+License Updates
++++++++++++++++
+When you change the :term:`LICENSE` or :term:`LIC_FILES_CHKSUM` in the recipe
+you need to briefly explain the reason for the change via a ``License-Update:``
+tag.  Often it's quite trivial, such as::
+
+    License-Update: copyright years refreshed
+
+Less often, the actual licensing terms themselves will have changed.  If so, do
+try to link to upstream making/justifying that decision.
+
 Tips and Guidelines for Writing Recipes
 ---------------------------------------
 
-- 
2.42.0


