Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDCBCA6C80
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:35 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5805.1769501973860785626
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yqTrE8if;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4CC5FC211CD
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5513C606F5;
	Tue, 27 Jan 2026 08:19:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 375C7119A868A;
	Tue, 27 Jan 2026 09:19:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501971; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+KIRsq1o9ehnryYo0s19dvtHfW+cKglzZKCzGbR6OmI=;
	b=yqTrE8ifncsx9oxze4eZokMn4/m4GYq3wo/KSA/7L7CG1pNlE52FxvueqVW9o4dZDlIqvV
	ovvhNL3+aRdf99twvgB9nFYPpXDK7yytBtUMI6pbxaDN74FbPqutUvXSkb1wLQ1rpzToMj
	qUmxAMCTjVGby9sJlzugRxzqy9pDc9Y9MqhAN9dVu0wykhVVbpz/+uKBRx8P0daedaiuZB
	9MurCWqkjMCFTEj5KAVvesfZlTdzuOy2gPj+bIzg8+WdbkQhGe8nG0i5NanBxeTCTtVNbs
	u2V0WYqZgyeh8lLuEa9svaF66q+XUoD9gQU6cKz2Ph+IcW/5QORP88eETCleeg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:11 +0100
Subject: [PATCH v2 16/56] dev-manual/temporary-source-code.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-16-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KU6p3i5kc7OoFw7iccMBphxTP/RQQ9j8k8kmC5PySoY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUAe9gs1P5hpUMGutpl+NnnilVMrFs9B+ETk
 rTuGokGgEuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AAAKCRDRgEFAKaOo
 NqGED/938yqr2DzJbuTZIpS21L7zYvq/rmZ+lopzmuU7WxfQVik8OfalsksEt3O6mT3UNgw7MD/
 zP2EsL/QX6fg5HClyj4FDWGnsQoBXgW3qys3Tu2mE/GJ9bYyqEvw0L3otxzP6R0pwjJpvy00WF1
 FkhImJZ4cWgl21mBd3cpOvjpu/7tSGXSmF9KPYWPkF9pu+KdUX2ATG5vcsQDx9HCsNmu3o1PeQ1
 2UpnD7fMPJ6OCx4j3sTelvqPkWnLCu6hLEBbtpzNmd34cWcdvg+H+0t9SQXZ1w0SgY8IyFPI8Ne
 CKN/aJYOag63kUy7qNnAWiDWPLqszOTTmabnQXO5kSLncCQ/dsFjKzLlt60tLcktIfrj51P520j
 6ZXgxl0u3Q8aBLHd5VWWUz67lt7P/Muta78JQHRt5o4SDacnT1v8VEzeEVWCS3vwLGjuIWXkrrY
 EhksJlbRWAxLQ4s6omobI3vHLGaaTAk7s2E3lXvew+3DalqIAO+emhVwAFpHBwzIdacSiy0a9FF
 kI9BMRj7qpK7b6x849C7whPN00V+mtk5sf4SibCA1aaLESGrzbM4NdtAx+blgv3cFBrd19bW/Rs
 xVMw97PMYDB1bXwzVsvdGri9V5uBWF3L6K/VYFLwhkC1lrH/55XQxeRfYOZF5nR5V2LYO+l9lY1
 eBhU1EmhoIQ9e+w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8677

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/temporary-source-code.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/temporary-source-code.rst b/documentation/dev-manual/temporary-source-code.rst
index 977edbc3f..aecd34099 100644
--- a/documentation/dev-manual/temporary-source-code.rst
+++ b/documentation/dev-manual/temporary-source-code.rst
@@ -15,8 +15,8 @@ your changes in the form of patches.
 During a build, the unpacked temporary source code used by recipes to
 build packages is available in the :term:`Build Directory` as defined by the
 :term:`S` variable. Below is the default value for the :term:`S` variable as
-defined in the ``meta/conf/bitbake.conf`` configuration file in the
-:term:`Source Directory`::
+defined in the ``meta/conf/bitbake.conf`` configuration file in
+:term:`OpenEmbedded-Core (OE-Core)`::
 
    S = "${UNPACKDIR}/${BP}"
 

-- 
2.52.0


