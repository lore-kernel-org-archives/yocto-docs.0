Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B44E77186
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:26 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.77905.1734427637612627293
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LVsJohZT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3935E1C000C;
	Tue, 17 Dec 2024 09:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734427636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YzTnkLRNFEz7AEmxTmmo3s8NqsiRKQGr9wHocFzLs+U=;
	b=LVsJohZTPp21OArh7zTbi3h7PC0YtgY2n5p3Gref6zvvMQLddw04AJbMwr2VnNg0Fjyrbi
	szlygMh74+KtOfD1/z5VSXKdSyhCMsFfvl/vwO/DytHgawmAYm61FjOja2MxH3ug81zRLg
	y1+Eo0tscX5GI1QJwWYWjyl/tkBDt32O+5Zv25icxLYGZZK8mwcWMtrtKE28/O5lT/+MlD
	CqyQOabCqXcWipmsfujVrV0CGsMbrCvIOcjrGBSDk8iRxlvJaNFcNnOnGC3OxiTyUsXLfN
	OGZvauRXBUoulzQQ3ADMvxlFoCO/jxBTbV29HqXzG3dEQjyrOQ4+o9SqG6x9Fw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Dec 2024 10:27:12 +0100
Subject: [yocto-docs PATCH 13/14] ref-manual/variables: document the
 PREFERRED_RPROVIDER variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-release-note-5-2-updates-v1-13-b189493b1b09@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
In-Reply-To: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=U2mE7qEXG7/uyXM/8PPsbT0ZqvSo2PMOrShP8gHV9bk=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYUPxY+ZXjiQvwi3si8cG89K3kmqrR5D9zw9cl
 kgxpGOiZiCJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2FD8QAKCRDRgEFAKaOo
 NlRxEACsEFMQPTV7wLtKK2ExkmzhFnSUEkCrTJdP/icJLiM8WmgmKfDEDsVvcM/EVe77dt+5iTN
 lTmh6/UOspHMUsgWGNzNwv/EJ9BAXQywYGmcMFQvIEhUSgaOJnLF5ZhR3191iJmTCnJp5a0+fra
 N5dPOuScFoGK3iNIadYs/qkcmwLw+T/uTPnG43RfBXSx5chFiAACOUUCVs4rncMVfXNcq9HREyn
 GDjMgWrmIv8VpATJ22cyVytaX0lemKuDKHB88s7tw/U1y//gm56cH3x8gMZC+ymwsh/h5D16mtP
 8vnfuwmyB9oVKsjAMbmFIbkAL8kpInvvmyVRiDxw8kRRb9Ag+fkEtBcpEcwmmTeY6IJnbB4+bOq
 /o2PDbzQA/N6apwfhFCBs4dUMis4QSi0Yt8ksqYNu2gfuLjjqmZ1CImxbVQI1TEuNyPt3g17boi
 GBCbSeH2xzzYtucqcbJnsnWHvYjyPIVF9RLj43yGonh7T6sYoGTE/U3HxIxrfcGVkWAn7Z8j83j
 yL23cRfbi9WY2TkYqRt4hz2DSpBFWA0hE2Y8eZp3qu+WanedZ/pkWgrS8vyfU2cuWTNr6kjrylt
 Py7sX+D9WRFUR8P4517bTgsSzVjkTR3A77RFVSCinxZ8P6dLTD0fIZHxVFnfKGKeqt5bcxVT5qP
 RlqEKXLBJjFlNkQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:27:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5946

This variable is similar to the PREFERRED_PROVIDER variable but it
denotes a runtime provider specifically.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 50cd8948b35f381414837acc9b9e925dc5110779..e0b87c0e5ff8cf7bd2598cbbb184f9aada19d326 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6711,6 +6711,25 @@ system and gives an overview of their function and contents.
    :term:`PREFERRED_PROVIDERS`
       See :term:`bitbake:PREFERRED_PROVIDERS` in the BitBake manual.
 
+   :term:`PREFERRED_RPROVIDER`
+      The :term:`PREFERRED_RPROVIDER` variable works like the
+      :term:`PREFERRED_PROVIDER` variable, but it denotes recipes that provide a
+      *runtime* component. Runtime providers are declared by recipes that set
+      the :term:`RPROVIDES` variable. For example::
+
+        PREFERRED_RPROVIDER_virtual-x-terminal-emulator = "rxvt-unicode"
+
+      This statement sets the runtime provider for the X terminal emulator to
+      ``rxvt-unicode``. The ``rxvt-unicode`` recipe is a runtime provider of
+      this component because it contains the following :term:`RPROVIDES`
+      definition::
+
+        RPROVIDES:${PN} = "virtual-x-terminal-emulator"
+
+      For more information on virtual providers, see the
+      ":ref:`dev-manual/new-recipe:using virtual providers`" section in the
+      Yocto Project Development Tasks Manual.
+
    :term:`PREFERRED_VERSION`
       If there are multiple versions of a recipe available, this variable
       determines which version should be given preference. You must always

-- 
2.47.1


