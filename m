Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50837CF11DA
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:10:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.41787.1728562257753761792
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hgZ8zy4y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29262FF802;
	Thu, 10 Oct 2024 12:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728562256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gGXJtYhy96Y00twXL5r77Z0lhQ1kwl9UsNnjuQb2aE=;
	b=hgZ8zy4y2JUF0UPRt5SLIHkjVEsHWAzLK/To+OOyk7j1kKqXE4UEcIk9Lx+NQfu3SYdSSc
	lMHFpvlJ0+vEdgTCirMwNWkU3ZyB+QEQ9rlLBSeOM/XrTqAXVcMPBUeRYrmqHiN5oISxzZ
	titSYgFwCWib8Jr3xvwxd/JwTp3QpBqtjxka9cq+8CHSUKm1Q6v4b1DuDOwQuRqm44cixF
	QbUX1DVGg/ZfwRhqjgtJ4YfVT/qTkAl7Ux5+XIaHwTnYS7hz2ceFK+vV0o04ZsABfqSAVi
	1+NS0cyFngdmKYSfwsbUAvOiDmbnrYvfY/0v8Z/AYlw/HRk8+Sps8qORLVJV5Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 10 Oct 2024 14:10:26 +0200
Subject: [PATCH v3 01/16] ref-manual: add missing CVE_CHECK manifest
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-release-note-5-1-v3-1-2cef1a58f1ab@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
In-Reply-To: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0N1yz7L43RthJgx39yU3B4LdQY/uNMagi93oBaF3nZA=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnB8RN5aFUdiiLuqsT1BicMf1cMGrmCa9yHs8Rs
 CHuF3JSzVOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwfETQAKCRDRgEFAKaOo
 NkWREACYX/ni92qMV77srA+pvjTdE76aALNmlCELNA13Y+OwY5D3ydX0mnK5gu+nU5hfjLHuBm+
 smXz1JczX5fZEwIiH/yOO1tM5wZ5nn7+VQPqA9M5rXtStrVX/8XasEcYuLGfNMs+GZRZwSDTP4p
 PiO/HhvXyppc1YZJWoZn7yeoT9YUS3eJdC4ZGxhxCQY8DvjSMo4ag1AwrjJjfBhioAlSPsa54Az
 QAqM8D04UidgoY2TRUU4b30xwa79c9X5eZ4cOEnmEIWscNMDznYXwlrZYJdXlCBMgtgJtPsbxSy
 21eiGSDKdln/hgIps02qbvDX7XhtZPkBWcwHtVhwrHXjxzpzOJsBOQddRzItQTXiwUciFye4/K0
 agbpq+eYs+ZzyR1lqMsAAEr9uLm8ajsDIZmN8dvGJoWYIJ3gttUnhaTUOaBj5kcLOO4bT/od4/N
 CtKdmoFLF7bfkxZuo76c+1fzHrtVaRWieN5KA2BYbMlXG9pBpO5CO8tpsKO0bX37M8ZmZg9twAp
 jDTss2X3bI+f2lrN6Q/5SP/qMhw3thPhgaFgF/0n80I0mdKqP1KQwBdYjf6mcW7zHN+0nkSYinl
 yfVC15HwXsgOBKzHw9TeHx4DfNLQuralvyu7lxoUkW3mjDZorw/7XhgL9ztjcgWdN4IDIuPqDLq
 m1xY60GojbtPIwg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:10:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5453

Variables that can be used for toggling creation of manifest and
specifying the path to the output in the deploy directory.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 32c9e7407..dd97a63c0 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1678,9 +1678,21 @@ system and gives an overview of their function and contents.
          variable only in certain contexts (e.g. when building for kernel
          and kernel module recipes).
 
+   :term:`CVE_CHECK_CREATE_MANIFEST`
+      Specifies whether to create a CVE manifest to place in the deploy
+      directory. The default is "1".
+
    :term:`CVE_CHECK_IGNORE`
       This variable is deprecated and should be replaced by :term:`CVE_STATUS`.
 
+   :term:`CVE_CHECK_MANIFEST_JSON`
+      Specifies the path to the CVE manifest in JSON format. See
+      :term:`CVE_CHECK_CREATE_MANIFEST`.
+
+   :term:`CVE_CHECK_MANIFEST_JSON_SUFFIX`
+      Allows to modify the JSON manifest suffix. See
+      :term:`CVE_CHECK_MANIFEST_JSON`.
+
    :term:`CVE_CHECK_REPORT_PATCHED`
       Specifies whether or not the :ref:`ref-classes-cve-check`
       class should report patched or ignored CVEs. The default is "1", but you

-- 
2.46.0


