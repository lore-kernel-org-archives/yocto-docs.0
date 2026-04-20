Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A16CF557EC
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 08:51:03 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15167.1776675061177016248
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 01:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qeR+nsiQ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0A050C5C987
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 08:51:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3EF095FFA5
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 08:50:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8968D10460C09;
	Mon, 20 Apr 2026 10:50:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776675058; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=I4a3cwgEd84sehyNoJ1Ijs1waAkQXyqigu9qWEi2X54=;
	b=qeR+nsiQH9xHeZFfCCg+oIMhxAlkgJeISJcSAYUnKv4y4AG54qQwYY54LWCFdZYzqmXEsP
	otRUQUazhTkDVI/+j1Lbot3CihydddIld+47gpduqj2n8fLh0QnBEqs78miVwRXBOFY9dp
	pORDnxTUiKxvsdjnA8M2a7wqTKx6AkzTqHYGFr52eGiHpGuP+f/eCExy0KrBhBYXmyOw6e
	1817nuSD/nGMz58+1g7jfkTrvi11WRsr9rT1+ZGsQWb/JBEPMJsvlUCIFuzuF5JhdhAWx9
	IURYgIvqDfil/8TzEFu1/AWi6SSKY1C6DZz2AM9/6KL1A4QSbFe2ukjomvqLZw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Mon, 20 Apr 2026 10:50:58 +0200
Subject: [PATCH v2] variables: add precision about special characters in
 CVE_PRODUCT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cve-product-v2-1-3396c3e22042@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf4XM2pq2PCSu+A/Doi2DjNGWtKXRE
 P5diluXJzn33BUCesIA12IFj4kCObuDPBVgJmXvyGjYGSSXDa8kZyYhm70bFhNZI8ZWGqx5iRr
 2xexxpPdRu/U/Dot+oIk5kY2JQnT+c9wlkb3/5SSYYK2Q6lKjVlWpO+1cfJI9G/eCftu2LxR0P
 Ay6AAAA
X-Change-ID: 20260420-cve-product-61f82ce503eb
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 08:51:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9282

Indicate that special characters must not be escaped in CVE_PRODUCT
starting from Wrynose.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
Changes in v2:
- Update formulation as recommended by Quentin.
- Link to v1: https://patch.msgid.link/20260420-cve-product-v1-1-812a75eba43b@bootlin.com
---
 documentation/ref-manual/variables.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 317b75913396..6f76f1c3491e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2056,6 +2056,10 @@ system and gives an overview of their function and contents.
 
          CVE_PRODUCT = "vendor:package"
 
+      Since Wrynose (6.0), special characters must not be escaped. For example,
+      the :term:`CVE_PRODUCT` variable for the ``webkitgtk`` recipe must no
+      longer be written as ``webkitgtk\+`` but rather ``webkitgtk+``.
+
    :term:`CVE_STATUS`
       The CVE ID which is patched or should be ignored. Here is
       an example from the :oe_layerindex:`Python3 recipe</layerindex/recipe/23823>`::

---
base-commit: 2c12ec7bf29aedeacf82970a9d2eb262fde4670e
change-id: 20260420-cve-product-61f82ce503eb

Best regards,
--  
Benjamin Robin <benjamin.robin@bootlin.com>


