Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB68FB44D3
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:28:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16366.1777019335703235534
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WGQbU4ak;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2A3F54E42AE6
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 03340604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA9DA10720735;
	Fri, 24 Apr 2026 10:28:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777019333; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nC6C3wegqbJ6zb1eTT6QjibjNWplsACmhCot8Skbvds=;
	b=WGQbU4ak4WJZEk6yU6WE25j0JKzgsZcyNf74xD9cJ8Kc/9T0JggTN4aDarVNaX/DSx6Sil
	I7SLvIyEk0waWlFfQrcl06M1y8bLF+v2Yuu8HVmTDnvQftBdK8EPkJ9x2LPSpaPZW+q+i3
	qxcNndCIM0OvG17qi+QqMhNlx3uiQB0rjx1rAbcBEXJBAHs+7GYHixmTE3BCrFbgFFP6O0
	QoK/jpaFeNr86Js54Skc1S/C58/hksWcXudrplhSBYfGOqhXt2v6Qzb1O+9s29E1g39gXt
	xYRnwVc8ND9QQOso3+lkJL3w7rawix4nHjetn7GEn/McErcYpHw5BeKvOTwdwQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Apr 2026 10:28:34 +0200
Subject: [PATCH v2 06/18] ref-manual/system-requirements.rst: add CentOS 10
 as a supported distro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-third-release-notes-6-0-v2-6-4feacf138e13@bootlin.com>
References: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
In-Reply-To: <20260424-third-release-notes-6-0-v2-0-4feacf138e13@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=684;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Kat+2VyDK29np8t9Rb48cNVVFDRWfQ1blj20m8pZ1Qw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6ym+W1uFKrLiB2ZyPvXVQHH4jA6mOs59MMw3h
 4M8+bQNaHeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaespvgAKCRDRgEFAKaOo
 NhwCD/sF7Go0FAoCgItxfWyscz9IKisGbadHQAsJ+ZFxLqIxKgNSTNnihmlyJvpMqJ9/yU9/S0h
 cN4+kcYx8UsUEw+XwIpcG0fO7dAxAbqXN/0MpZqnYCNbi6ExH2j9MVEU6xohaBMD3J8qjZmEjmb
 5ho9OXhtH+215gQ4hMRO8hNCF5rIlWbLjS41ar34Gkv/cHsC6licPdcVEKKDZW5PU3nl4yamDgG
 1rsMFeR8a5yPmyrEGVcPbe7XWJ1kj/3Wi5TK9f7w8mhguoSsXOf/wSyY8qCUfvCDpC0qEpQdmuT
 bPPmHDmThodotu/dglwQQzLKzyBrqajiga6wYJiAgaEZCigG94mF1Pjo/mI6hDouJJRmeDAP8fz
 qJgE/yO0TPohDIS1WKXXQ/GAE5lSh+Ggs5ebxOA9JhIHB1aD8xlBSstLW/SrRYp6nGTGiYpIgAh
 S2cKHfF/8lPgeb41zeHvn65oCQw69NO3PAxXzpPYwIoMTtOj6ULDUM8jsNVEofI8Z7F6ptYOQiR
 t8l7ciSxJOYbeQQVKD3KRwAs1RmVtp2R23jisucnVQIY0FkfCF4MAmfXSmGBZ0mrIq9Dp918QhG
 WZM/h8+PbT1enxpq+GSxgAkMyY8QhYdfzY5fUFWSs9PBYecgA1mmkDcXSXLHvAe3Mg9SxIL8QhR
 sgmL9qTzdq7tVuQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:28:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9344

The current list of packages for CentOS 9 applies for CentOS 10.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 05c852043..5171ca6ba 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -65,6 +65,7 @@ supported on the following distributions:
 -  AlmaLinux 8
 -  AlmaLinux 9
 -  CentOS Stream 9
+-  CentOS Stream 10
 -  Debian 11
 -  Debian 12
 -  Debian 13

-- 
2.53.0


