Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB34CED630
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 07:41:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10673.1728459694943836300
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 00:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VsScAyCb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77E061BF20C;
	Wed,  9 Oct 2024 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728459693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V9NaGPiD25+F9XdoK1Y2GyHA7hvUyWJRwcyn0FmJero=;
	b=VsScAyCbB95S5Zb12zxcGUt0rMQ2kT3mFp6Se2nauhAFvUrRTjRpBbJxCqPm2G9DlT+sC7
	TeVrulNPOwN9rdTWh12l9heP6uLrocxkseX4ABVMAnpHzuuLUX/Noqro7HHaJnkJUkje6N
	Ys/8hy2zNQi+zTFG2s/Bkz1axogXTfUbsnTr+bsxeZQuTkzGcXEVz1povkvE/OGe09P9LC
	nRAal3QaZoJPLs9R8Y4oOau0+pNCMCw/NTeowOUxk0jylfhh6O9JdKaw7VWRM9NWMREu/g
	uzxfaaY7uoDc5W/NbC0524JYqrDUTxhtplK7uT4Czd2e/I83JoibQpiHuaisqA==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org
Cc: ross.burton@arm.com,
	paul.eggleton@microsoft.com,
	thomas.petazonni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 07/16] ref-manual: add missing TESTIMAGE_FAILED_QA_ARTIFACTS
Date: Wed,  9 Oct 2024 09:41:05 +0200
Message-ID: <20241009074120.866786-8-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009074120.866786-1-antonin.godard@bootlin.com>
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 07:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5414

From: Antonin Godard <antonin.godard@bootlin.com>

This variable lists space-separated paths on the target to retrieve onto
the host, when inheriting testimage.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6af05c810..9eabc4a0d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9267,6 +9267,11 @@ system and gives an overview of their function and contents.
       section in the Yocto Project Development Tasks Manual and the
       ":ref:`ref-classes-testimage`" section.
 
+   :term:`TESTIMAGE_FAILED_QA_ARTIFACTS`
+      When using the :ref:`ref-classes-testimage` class, the variable
+      :term:`TESTIMAGE_FAILED_QA_ARTIFACTS`  lists space-separated paths on the
+      target to retrieve onto the host.
+
    :term:`THISDIR`
       The directory in which the file BitBake is currently parsing is
       located. Do not manually set this variable.
-- 
2.46.0


