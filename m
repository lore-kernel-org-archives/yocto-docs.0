Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE29C25B6D
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:23:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.147620.1698153821480521930
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kgr36jaZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72E052000F;
	Tue, 24 Oct 2023 13:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698153818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6KYc1LoSUchk0vYuz362G5zrEGyfkZtKzTlNFslQL6A=;
	b=kgr36jaZaLBqsbTF5O7BtRSCd+Zv+GTj2gao8c1pYa6npRrq07xxwYYZFPosPraeJ9q8ac
	uchfnLaf1pgsaFxnHdrM0lTh1xE3DreEzNGl6bqbIcO2CSqEgBL/MwMDn5YC8vnVfvmGr4
	je6eMXSTip0E2+kPSDBRRF05CRXd+WURRyf4/5jGWPPZIhcQoP42sBNWQNkKKhF2HYJkEF
	EWUQW9yMpBNGFTOylyyx0V0QikeOmz9eyf7CUdjdgcd4XfpJQRARBqWIPZhJdEYUOyLbze
	l7y3pNushoMbVlYiU1L1fpzyOHggUdaFjf9VNYyoHW69Nc9e95JzPaQBp8/ldg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"Robert P . J . Day" <rpjday@crashcourse.ca>
Subject: [mickledore][PATCH 04/13] dev-manual: new-recipe.rst: add missing parenthesis to "Patching Code" section
Date: Tue, 24 Oct 2023 15:23:09 +0200
Message-Id: <20231024132318.90209-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
References: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:23:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4465

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Robert P. J. Day <rpjday@crashcourse.ca>

Add missing parenthesis, and another example of a compressed patch filename.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/dev-manual/new-recipe.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index a330a8f8c6..8d5d546923 100644
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


