Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3306C05024
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 18:20:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.3487.1713118829026232112
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 11:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Acz7pxst;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1F701BF207;
	Sun, 14 Apr 2024 18:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713118827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aUJtjNC8ltDfziBuvTYffSSU4v5DnU0yylwrMi7v9kA=;
	b=Acz7pxstoCeDb800P+oXf93xqSUFYJ1/AO6jQdwK9SB3cAlnWq22XAkdp9fwRWI+UyY+oj
	CxIZZA2VLMfUr/mQvN3Q2fcFpb9ZYFByqet7Hv4iDk20GVAeUhDB61mhzvLkwfrtdqjVRY
	Kv17KGdv6ta2dhSYq3NFBuGu7GKKb2ticgZ3hXh7cPADGTsgiSL8l/kbjMpadNBr02wvS0
	6rYcwxv2L+tvoRIaeFgJL7xEWGrsmlMEEIkrvAw2DbZjsFSj5qv/X59djxSNjX4J4ARhne
	GTNx9JtZtj8uMceL9pkV+lmUUnxe9o0b4KMrjXsYHOZm19R/wjyYqe6KHSCOXA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [kirkstone][PATCH 3/9] manuals: refer to new yocto-patches mailing list wherever appropriate
Date: Sun, 14 Apr 2024 20:20:05 +0200
Message-Id: <20240414182011.994356-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
References: <20240414182011.994356-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 18:20:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5127

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

There's a new yocto-patches mailing list available for all layers that
do not have their own mailing list.

c.f. https://lists.yoctoproject.org/g/yocto/topic/105197684

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 documentation/ref-manual/resources.rst             | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 15566701f6..25f839ba03 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -399,7 +399,7 @@ varies by component:
 
 For changes to other layers and tools hosted in the Yocto Project source
 repositories (i.e. :yocto_git:`git.yoctoproject.org <>`), use the
-:yocto_lists:`yocto </g/yocto/>` general mailing list.
+:yocto_lists:`yocto-patches </g/yocto-patches/>` general mailing list.
 
 For changes to other layers hosted in the OpenEmbedded source
 repositories (i.e. :oe_git:`git.openembedded.org <>`), use
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index 8e54ac87c9..4eaaca942e 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -66,6 +66,9 @@ instructions:
 -  :yocto_lists:`/g/yocto` --- general Yocto Project
    discussion mailing list.
 
+-  :yocto_lists:`/g/yocto-patches` --- patch contribution mailing list for Yocto
+   Project-related layers which do not have their own mailing list.
+
 -  :oe_lists:`/g/openembedded-core` --- discussion mailing
    list about OpenEmbedded-Core (the core metadata).
 
-- 
2.34.1


