Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51645CA0FF0
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 09:08:40 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.9290.1756458515902940583
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Aug 2025 02:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=E/R1Wg7m;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6F8F84E40B9E
	for <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 09:08:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E96D606B9
	for <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 09:08:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B65F1C228024;
	Fri, 29 Aug 2025 11:08:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756458513; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=D5CiDenI66XIddYR2BwhgORs+72uH8hOhtrRQCmY/sE=;
	b=E/R1Wg7m1KGe6SC74jVK/e3YcNCESuYe1hSstrn4j9XjtB8nvGTIgIryD5H8Kqh0US3ovR
	vSInLRF2cUlHBQ0CzqlgmujDvInwbHIE5bqXPlt19Y+0rqhDfQlB73euIBwpL/IfAiTe93
	Lye6HUS8bQxzbfvn/ZYPitYIQiVRurXH0A+vtrW7xGcifhME8ApplTo8lFSgTgOYNlmEOb
	PICqNrIwpZEcz/skvtVHbjnqsAFBq5xZunJjE+iUoTsAh+rdH8NL4c3K8oKaT3hWgd9v66
	sokrieeSJpS7PtCX4tZ+AB3Jmk/sPF0gPi9eVwVD7SrybZh/oatkRtJ9yS/P3A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 29 Aug 2025 11:08:25 +0200
Subject: [PATCH] dev-manual/security-subjects.rst: update mailing lists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-update-security-lists-v1-1-42d02ed2eb24@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAhusWgC/yXMQQqDMBBA0avIrDuQDgbUq0gXmkzriKhkElHEu
 ze2y7f4/wTlIKzQFCcE3kRlmTOejwLc0M0fRvHZQIasqajGtPouMiq7FCQeOIlGRW+ptGR8T66
 G3K6B37L/vu3rb039yC7eM7iuL3yjZll5AAAA
X-Change-ID: 20250829-update-security-lists-d524520db2c9
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=e/WVk1wn/6A/4KqsElkBCk2ERKMosSgxAX88SdqrxWE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBosW4QGxwpu7T3ilVbt9PikpO0SE1jO61KwCpIU
 ZcHoNfUMlKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaLFuEAAKCRDRgEFAKaOo
 NmEuD/wJL2cBtRr3J1zisEtQr1FgdJ/Ud92z9PU2U6LWaDVPjnSdvNxumeTmuivVsBvgtOQ8vXD
 8t+/MFyh8tHuGGqHqjvq9nVNr5qNI6QyXQDa7lR9loZL2I1UKkKROQ8JMPODgnwqOegiQo9gpsl
 YHcesTTBEFGskjULmFKQLMC6v6hxjDJR+RupwzXNQ83ccl2cfTIq6H1L8IWRH5q5Kas3daumgAj
 ArTLNmbVY5pdEzQnqV3/3AWqM2LBOOfjPfE7bFiYDDO4QfwJCwEb+DnFviTwklVIRfqADeLvPR2
 u6QxTb+ubg3sMA3z9QYhj2DL25AsFOcUNcsanxLdHD59IMXh3Y+7KV6s7ewWeJp76HXcWLTtT0g
 QFQ0cySN7p/TubGfCML1J68cNJZz3PjvNddaN0LtPMh1xO+XAVKTRwUkByODVWSgTwFIzWkrGGI
 eym6lH8k4obz+Ey/k3eQ8+N7GsTryhtAhKLDr4Frv+rBsmwDFu3xYo2/JgGjLZmWqlkJp8XWJ73
 58Gn+DrzpuFeGH8kTKl+kxpdEZN/ZGAChCYqv0jQFoQMy2ZZqMPHkAxTsCWakltYjjulc/CPmTT
 foQSv4uKUmh060k8+fqzQk6+M9+ozMOKvWKQeTV7+bR9G3LQ7m+IUugCSTx/kL+KSyoIb4DWFAx
 RrXsoRL3Wnjb6Eg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Aug 2025 09:08:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7472

Update mailing lists following changes by Michael Halstead
(https://lists.yoctoproject.org/g/yocto-security/message/1478).

Also fix formatting/spacing.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/security-subjects.rst | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/documentation/dev-manual/security-subjects.rst b/documentation/dev-manual/security-subjects.rst
index 1b02b6a9e9..6785b5a16a 100644
--- a/documentation/dev-manual/security-subjects.rst
+++ b/documentation/dev-manual/security-subjects.rst
@@ -52,19 +52,24 @@ for them for significant issues.
 Security-related discussions at the Yocto Project
 -------------------------------------------------
 
-We have set up two security-related mailing lists:
+We have set up two security-related emails/mailing lists:
 
-  -  Public List: yocto [dash] security [at] yoctoproject[dot] org
+  -  Public Mailing List: yocto [dash] security [at] yoctoproject[dot] org
 
-    This is a public mailing list for anyone to subscribe to. This list is an
-    open list to discuss public security issues/patches and security-related
-    initiatives. For more information, including subscription information,
-    please see the  :yocto_lists:`yocto-security mailing list info page </g/yocto-security>`.
+     This is a public mailing list for anyone to subscribe to. This list is an
+     open list to discuss public security issues/patches and security-related
+     initiatives. For more information, including subscription information,
+     please see the  :yocto_lists:`yocto-security mailing list info page
+     </g/yocto-security>`.
 
-  - Private List: security [at] yoctoproject [dot] org
+     This list requires moderator approval for new topics to be posted, to avoid
+     private security reports to be posted by mistake.
 
-    This is a private mailing list for reporting non-published potential
-    vulnerabilities. The list is monitored by the Yocto Project Security team.
+  -  Yocto Project Security Team: security [at] yoctoproject [dot] org
+
+     This is an email for reporting non-published potential vulnerabilities.
+     Emails sent to this address are forwarded to the Yocto Project Security
+     Team members.
 
 
 What you should do if you find a security vulnerability

---
base-commit: dbc6137cd13f982a7fd4d1b2df79dccb177db0fc
change-id: 20250829-update-security-lists-d524520db2c9

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


