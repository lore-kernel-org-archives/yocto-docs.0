Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E811CED635
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 07:41:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.10669.1728459693304184837
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 00:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BRxsRt1/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D56571BF208;
	Wed,  9 Oct 2024 07:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728459692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w3BM4chAtTZv10TkLjcnONRikiYgALfkAk+S1T3hYlY=;
	b=BRxsRt1/eNz0e9+U21RaDbeGPeDbB+F2+iDVr5QPmX/akioS4AoeWKdY5L5Hzgkw8DMJvh
	qMGtrCxC3N+1V3gvVG3KnqWZg11wD/t5YdmbGWYFq5lBMABGq5Y9r4lObfv8SnGs4kc/vU
	MpvLGQO4nj7DG1Brx31Coyk4NsNxOXEqxbQIOAVNKg+WLaIx3tGKLr3vC4Kz5YWNTz0gME
	h+RojFEpFieAKTkwPi6A3PIg1n4LhGEV5KiLwlSnvpBhBVcNvfxM3bFc7MgwvjZzXhwFqZ
	szf8lN4O1mPDnFQ2ZBpISIZIPvmyXQHBWoFov3AvxHIcf+m4bgPNz8SOBcFKRQ==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org
Cc: ross.burton@arm.com,
	paul.eggleton@microsoft.com,
	thomas.petazonni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 01/16] ref-manual: add missing CVE_CHECK manifest variables
Date: Wed,  9 Oct 2024 09:40:59 +0200
Message-ID: <20241009074120.866786-2-antonin.godard@bootlin.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5408

From: Antonin Godard <antonin.godard@bootlin.com>

Variables that can be used for toggling creation of manifest and
specifying the path to the output in the deploy directory.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 32c9e7407..0236c8c9c 100644
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
+      Specifies the path to the CVE manifest in json format. See
+      :term:`CVE_CHECK_CREATE_MANIFEST`.
+
+   :term:`CVE_CHECK_MANIFEST_JSON_SUFFIX`
+      Allows to modify the json manifest suffix. See
+      :term:`CVE_CHECK_MANIFEST_JSON`.
+
    :term:`CVE_CHECK_REPORT_PATCHED`
       Specifies whether or not the :ref:`ref-classes-cve-check`
       class should report patched or ignored CVEs. The default is "1", but you
-- 
2.46.0


