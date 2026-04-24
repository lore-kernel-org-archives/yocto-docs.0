Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8369FB44DE
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:28:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16363.1777019332922685344
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=m6rmi0Eq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3B0C74E42AEB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13B01604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6CA6610720737;
	Fri, 24 Apr 2026 10:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019330; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kvnDyrIrXzYTdsaJgy0EhORq6GAR2bWx6yG5g617lMc=;
	b=m6rmi0EqAFbZ0mrXRxXR39BcREVDFDTCaucYc6ZnW2bCFvkm6vODNsRb6RDP/VtC2zKm1B
	10IgKSx+Igd5vM56uusPnD6SPXNlRcCTzhdz2SJDfXitHIMj7ZyvzUodiNjIUQXrflJf8X
	lN75LQxL4ZolxcERotvQtZK1FbYvIKVGitOzsHK+Wg6gjjrURSFJFr9fyqwkDb6jHuV6MK
	X2ITgOKsF3rY79WcHqq37SfzzBbAW3mWs7qgh9jagarWLgffoOmCzqjL+XdqZ10eiXjGAb
	DesVoLqKQf2IzKM5IFGz7L22n/mIJJncRH5OwK+LtKcPR3PWeFIoz/rWbIN94g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:30 +0200
Subject: [PATCH v2 02/18] migration-guides/release-notes-6.0.rst: add known
 KVM issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-third-release-notes-6-0-v2-2-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=shYmkMqZYzh8kLKEJCRJxNFJODFY7BWNFo/XpDnqV+8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ym9PZ40eRcpg/Oj6AdxcJ1BZUh9WktP5G+xz
 4QwUfoFftiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespvQAKCRDRgEFAKaOo
 NgjQEADMgkqKom4xWYJZrwYUaq7z/+wPUEdDzm7Tnk/N73Afr3s9IuSYLZGQXMvyKr/9S7hNntQ
 FPAGbRHTMhqRz6Bz804bivWvPBHStuTCTcA8hNc/5WN8XxTl/NbmkAh3k7q02ORVMyk+CF3ueaI
 eFkfmNce8s5sTpHSZuVHhIIBQn5AQOFjAT+LRFoJ/+gn2uGu4bmZrKhQDuBq64MIbW8JstvWpQC
 1khhlM7H+8SX4KtuuJnThTF5ePyE6nctlYUxW3VfdUQCknpMeZs4XA0rChTAZ0NFwOUTVcmEm57
 j8Au+qoEkGmGm70urPHqn9G51X8eHqTUzKdRLmXXnX1a6iikykAyn57IB2ak22D4A4tghQjZ4LB
 yoqXaVEv0oFulbZ7vwBAoHps1hFkK3vqNZ8KaS/ab1/4lneaMMbqK9bDTzqpWysSW+QjkXvdw0w
 qnAO5YweFAAGgPQB9lhvsfR46Jsn5tuOXDD2ZnGDjzDv+rF+1e5ELAPXUXX3lUvGakbGdMJTsyU
 4n9dGrsuv9nXbNH8MUi5n7a29Lj18aw7yP27Sc/1AJCKN3J1jd+914PuuQrnrm4JlmDWr+WPW2E
 k7+pWy1Pd55xxSqAB28wZ9TESQYlv/9qbZVLvTSXprjEnhkmvZyu2M3dycvTMBZIgoyoVaDkNnO
 0UtpV30CWLUA8vA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9341

And link to the bug in question on Bugzilla.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/release-notes-6.0.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index a4fd7a169..2ae182c8c 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -739,6 +739,10 @@ New Features / Enhancements in |yocto-ver|
 Known Issues in |yocto-ver|
 ---------------------------
 
+-  A known bug is affecting :term:`build hosts <Build Host>` that have Intel
+   Ultra 7 CPUs and breaks :term:`OpenEmbedded-Core (OE-Core)` tests that
+   involve KVM. See bug :yocto_bug:`16074` for more information.
+
 Recipe License changes in |yocto-ver|
 -------------------------------------
 

-- 
2.53.0


