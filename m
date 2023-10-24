Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D76C25B48
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:39 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.18019.1698154049558144898
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NLtwuT3q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1080C0005;
	Tue, 24 Oct 2023 13:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LvMEdtBSm/Jp22691eMhdIiqoq9NPKQ03XcUG9jJL/g=;
	b=NLtwuT3q8aK0b5NC+wFTdocJG1DchbCrrTLUGHkB37IkXvyeWvlF3Vpz0YGFHhyFW3128s
	wfo24BDELPJE3BW2WMHTsqzWWbwcAYN1JC8pD3+1HvW/fW1bKUdVjRc2IhZac9w5dvpA5l
	6ewHy+d6jj26za/cjM3L51goMDnKm0OOFvmGl65yVqnmCwxB477oCvHT7XS3DytY4/gfd9
	JJkg3xeHZPcOyQ5OyFVp5RSKw5BEoDbfiifKL31iiPqpUGzNAP8uQ/dwLR3kZV+cF4goLC
	kuIWhlMYPe5hTduyLuroLeywa6/2/BJsG6W3NN+XAEDOTD9BpnBTJzw1/ekY3w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: [kirkstone][PATCH 06/16] dev-manual: new-recipe.rst: add missing parenthesis to "Patching Code" section
Date: Tue, 24 Oct 2023 15:27:02 +0200
Message-Id: <20231024132712.90600-7-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
References: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:27:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4481

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Robert P. J. Day <rpjday@crashcourse.ca>

Add missing parenthesis, and another example of a compressed patch filename.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index 855ef8eb06..a031c59875 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -409,8 +409,8 @@ Patching Code
 
 Sometimes it is necessary to patch code after it has been fetched. Any
 files mentioned in :term:`SRC_URI` whose names end in ``.patch`` or
-``.diff`` or compressed versions of these suffixes (e.g. ``diff.gz`` are
-treated as patches. The
+``.diff`` or compressed versions of these suffixes (e.g. ``diff.gz``,
+``patch.bz2``, etc.) are treated as patches. The
 :ref:`ref-tasks-patch` task
 automatically applies these patches.
 
-- 
2.34.1


