Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F86CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.31567.1761569075186000752
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jWIV/6so;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DF7B61A16B4;
	Mon, 27 Oct 2025 12:44:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4ECE6062C;
	Mon, 27 Oct 2025 12:44:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66323102F2505;
	Mon, 27 Oct 2025 13:44:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569072; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8RihZQfeAypIroZ7bcMtp0IkYEWJcBUWezoYyapYg2s=;
	b=jWIV/6soyVMwnhxaFGJ8IVOW5WecIPEL44ZvqESWZ50PLhZqOZeA6MrzqsssZgC+72g0ju
	jr2Ykm7wBCpeyFHOUQwfoXGmiHTaf2lEWOFhOeQ9AqcWnsrXap/PnKdBWDRc8BiE2kFdIY
	ZnDDqn2yrvwlxRKvO0toL3mqBKuDeqgeYMnocTVlOkzZgYnzeK3140w45QGKGaQHeGwcl0
	VZfVxY5TrwrjRkmogi/rbn/mt+Ys00mVJsQiQkL6gDTyOsDlBzDDWS8I5kG5FNQMUYCAJg
	B3teVJzzAnuvrGYjqaLwVtETNP+S07dZQ+1k/gkH/WyaEJYOUBacVJ1WJd5H9w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Oct 2025 13:43:42 +0100
Subject: [PATCH v3 10/16] ref-manual/variables.rst: document the USE_NLS
 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-release-note-5-3-second-hunk-v3-10-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=S/M/+i9wMdFptPnFz30JjzZb091rHevNxAkbOnDEktk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo/2kFN2/cXMpnRIddarmeP+SfYJng4oC3YrzQT
 g5iLRtal9GJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaP9pBQAKCRDRgEFAKaOo
 NtghEACQ9r1+yNpDscF8nl8qLbV7lz/ORkMUXNCi2YqhGOHY925lREq9tIRHCYtDORICwTojaJq
 CVKvsTVcHrnDzzSntYwK92ONQKa9RM81Sn32CNQhzq9LFpygBwv7wfiJdFd+8xaiUNHTyWT/dCo
 LzrD219UsJCM6c2WQtEKq+dIC2F3vWWKk7cIoTxYuBTPCvXgeeb+QWiWpyiFIIebN56tDu+q0J/
 6iHX03Mj4QDMHSXDZD4TXF4VYaykQuivvxIBk0NSu089D5lO+S/WBChyZig+2Nid14NlxD3nvB0
 /TZvY1P2QR+n2mpDSpM/Ee5LBBfC2LoYYE9NWu/8kYQVQsJ19sci/z4xW0JWTsXfNZJ0rmXpmUc
 an3LRJYn3tWFKf6MqSBTQ7X9ugwaQGdPhJO/NBdgSHrMpnDuCb8ZgPvJ19eF3WRvDCAIu+3mNYZ
 sS+/W5PWOLTO2uzOvDe1W57axY/YOIiO7trt4frCNNJp2siMBZNnLUzSrEF/9caccdnD6ER9EnV
 3XfJap40lZQVA2n8lYL+caeC0aNDW11aC7V2V+/9qFDA16YFxdoTEf3gEhqBW31VUnTfHV0JAaA
 n7Rc6DvjBTKNKaHpYBKZVBIvyS36t3cEQ7QWy8S8nO/+bSlcNsO5BL1bIDwxCqykiHoFtz+Ih+a
 nyZO2da1qWJ7BGQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7859

Part of bitbake.conf, this variable allowing to enable or disable
translation was undocumented. Add a entry to the glossary.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index cd55bf13b..e80c5a6e9 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -11139,6 +11139,18 @@ system and gives an overview of their function and contents.
       the Yocto Project Development Tasks Manual for information on how to
       use this variable.
 
+   :term:`USE_NLS`
+      Determine if language translations should be built for recipes that can
+      build them. This variable can be equal to:
+
+      -  ``yes``: translations are enabled.
+      -  ``no``: translation are disabled.
+
+      Recipes can use the value of this variable to enable language
+      translations in their build. Classes such as :ref:`ref-classes-gettext`
+      use the value of this variable to enable :wikipedia:`Gettext <Gettext>`
+      support.
+
    :term:`USE_VT`
       When using
       :ref:`SysVinit <dev-manual/new-recipe:enabling system services>`,

-- 
2.51.0


