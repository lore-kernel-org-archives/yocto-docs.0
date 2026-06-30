Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4431CC43638
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 08:13:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16461.1782807205077994031
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 01:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fAEG80ML;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6C99B4E40BA0
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4297660233
	for <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EFF8106F1CC4;
	Tue, 30 Jun 2026 10:13:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782807202; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AcmhyNSAzcnaayQT1wrkxsUbAJzSU6etHtFVlWJxmg4=;
	b=fAEG80MLw7vD15yB/AgHZKASINIMSO31VGBH3ZpMW+wJhJH5Z3WHx+rKCYOI0iiHVzv5Fi
	guGdIcD6AybOXQMNVyzQdL9dCu9yiI5t515TduFrhmhY/0J9KlDBvyISLbc3pasYWQ4f0V
	SsWAZJWUb/8kOS3dGZevPxNcycKbiykqZEo7+IHTilTENRZkoyGFjU70UyLaB/5B90f/eH
	253i1vKJw0yNd0Eb+TGGf/NuLswR1is+SKKapvV4eNphZeqTWviWCFKE9G5eUxCC7E2zhz
	dFEoFL3qt3Mq8mox7VRi5T5/4HQC8MgZovIhebMLGhZ1NPxPal4FtAJ32O9UiA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 30 Jun 2026 10:13:16 +0200
Subject: [PATCH 6/7] ref-manual/variables.rst: document the
 TEST_SERIALCONTROL_PS1 variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-sync-documentation-conf-v1-6-da14b40cb515@bootlin.com>
References: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
In-Reply-To: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=BhY+lurzDNu2MGhm0a8RfzvHY0YySWZP1w+aO6TOWuk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQ3qc4ORAlcKbP2v+NwEZEj1y2jEsdYhB+9B6u
 QcqpyhRxGyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakN6nAAKCRDRgEFAKaOo
 NtkWD/97WH7D25y4sZJI5eeIny+ubVC1tPigCpYqw0YAlxSjpjS1oj2xj5A64iquQBhAsxoR39/
 RBPowYPZ4GtiISL/l1JmAvF2fF+W9BZ5AUbeGTadpOwOA3W491klCYjve+c4hxwz8nYu+gIUh1f
 sHpwkobltOome6EYMbUIXT1kxpGhNaGn3/jiuaRUjSio8IOIgJPoTsNZ/W0L1HaSlxRqEPoZ8Nl
 FEEWW8y6YXDdKJJ/5JsjwVY5JigCJKLv1KsaFvX4OJ8AIToC+vUVhXeN1gN2gU+jjT+RV/GLgv5
 +e252/tGXbMOn3ZWJiwXESEJa2FIfieJ+padk663gzrIRwpOjUDAq0cO5A58BeJNNeyq8xsvWTc
 r5/YNXfydIinNzo+Hc3MLMbLaTi56hrWIAXqN0CLB8yp66M6hfec5bvzO2qfl21ibJCzmltJv7u
 XxcKNlr3CzeQv3OXwLb3MUVLGNJlJHfBULmlI1iOb3+d6VY+LRQ0IZwBkyoHJ2tAvqqggsYAeQ0
 ujYGpZSglaQhWc0FplGfZTwRGI1Lv72sTEryrD6+/RSRHDaDPte3sypGt12VssPjLhjxVxA93a2
 Q0ZahAKH27tTQpXHEei3berOXoY7slw8PEp8iSz6LDykL8ohjsQ0xWG1FtA5DCzQhuaKyi+8Dtf
 Xqq4ol1YZH1nEMw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 08:13:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9988

Added by commit d817b27d73d2 ("testexport: support for executing
tests over serial") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 20bcf8d60..d23eabad8 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10998,6 +10998,12 @@ system and gives an overview of their function and contents.
       wish, for example, to separate the machine-specific and
       non-machine-specific parts of the command.
 
+   :term:`TEST_SERIALCONTROL_PS1`
+      For automated hardware testing with the :ref:`ref-classes-testexport`
+      class, the :term:`TEST_SERIALCONTROL_PS1` variable specifies a regex
+      string representing an empty prompt on the target terminal. For example:
+      ``root@target:.*#``.
+
    :term:`TEST_SERVER_IP`
       The IP address of the build machine (host machine). This IP address
       is usually automatically detected. However, if detection fails, this

-- 
2.54.0


