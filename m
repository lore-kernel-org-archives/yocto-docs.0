Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9344D2F01B
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:06:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10606.1769519217947468393
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 05:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tmdR2QXf;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E5EF91A2A85
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:06:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B55F8606F5;
	Tue, 27 Jan 2026 13:06:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F27D119A8647;
	Tue, 27 Jan 2026 14:06:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769519215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Tut3eRasdTqXy/wMJ35hGUltbmOi0YiGVHR8sz2v74w=;
	b=tmdR2QXfEXiYPEEqj9vozaT0k4X+29bXLOgJ1vfOARmNWNXriLZUo6fIEFB39P/jn9mhjP
	W0abbxxoreS+UVPL24uaZOzmQGzYus34dBajls4+kdzoajie38YA4K8fGJo12P/hBg9l/a
	SzD3QAV1vwde+5FVHL/QAraVFnHTFLQll0fzF6bxmi1uvPMFyT9cnuxSWM2Exc5FXEf50f
	xVtGZlGoIA5/40DjGSTey7lkWPsDdfqFw77Z54zOsMRibhgPAD8KJahiYHxIyvC7SKpPJs
	xNvY3Birllh5lWQx6P6Q/rul7sXiYh6Y2KCCd/eEH70j967XZXqP0CVHka6aSg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/3] dev-manual/packages.rst: pr server fixes
Date: Tue, 27 Jan 2026 14:06:43 +0100
Message-Id: <20260127-pr-server-increment-details-v2-0-b46f91df002b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGO4eGkC/42NQQ6DIBBFr2JYdxpAa0xXvUfjAmGo0ygYoKSN8
 e5Fe4EuX/L++yuLGAgju1YrC5gpkncF5KlielTugUCmMJNctlxIDkuAMskYgJwOOKNLYDApmiL
 USjWouW153bFSWAJaeh/1e//j+BqeqNOe3I2RYvLhc9xnsXv/PWUBAqy6GNl1Bq1sboP3aSJ31
 n5m/bZtXxsHTcnaAAAA
X-Change-ID: 20260120-pr-server-increment-details-3aa4ec0f6038
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Robert Berger <pokylinux@reliableembeddedsystems.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=735;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=HBOPUZTMpV0EHEH4mh2ePM7bWilbTkpJZqBMwMLDY6o=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeLhtl+i0AMoInJm4iOhTJyd9VxXgz2gAoAzdE
 9WulqfR966JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXi4bQAKCRDRgEFAKaOo
 NuDNEAC94qdQjP9iaZmTmqXs5UrEFR2XcjrV4pEMLjObZPzZnAfAb0L3o5wODp2CFt2e+Wyv8Ta
 JMzWJ82bM5/yjODWMMR3QuTiN2SKGOJZWP8Q65jqCX/2GOmWtI77uoT9NM5XVfWVd8lo5bYjQKC
 YObo2RuBS+McGkuYALIOKXD2ufk0gp7kE87p81u+Cg0t0ikZthoC61LnWmWoDp1fe/QpHQCAokH
 YDTVbGyYJygLepe+IxE6ekw26Ut0bu+z7H0yDJ3ZhMc9r2Re1R2R/q09W18QaVo7JWOm9PdAK0e
 aHP9O9XxN8tmrmfF+Sk6vy14qAZorwh7FS02pnzT/mGEtsqdzd5u3RK2sijbTyN9LHRFRoV875z
 AUcRvr/iXXLgIHK4WnjnNDZOX9g8hGhwjxrBnJiz48a0qTiDA/L0QgjmkJLlRyMGsngvu3moyKW
 3dqeskdM6yeBCtDyRkitcR0St9AqG6kQhNG3UKw3wp64hao8xtZCuukJDMWghx9RDbHbj+zZU1G
 w1vIq3lXuFOfAfhFrNVB5q7yBwNlk9qvLm0gjoFFkVDMLu+6kbPbLsubBmOHN/FZMGgP2u2V9zM
 MfgM0FB3LRpIlAGrUco84+MIPZ8IJ66s/Pf3pH87IR9o8LWduEVK0yQLGPtOpmG1fEN2uAdICl6
 YReKkH2eI4OZMmg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:06:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8732

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Add two patches to fix the examples.
- Link to v1: https://patch.msgid.link/20260120-pr-server-increment-details-v1-1-fa5d288def24@bootlin.com

---
Antonin Godard (3):
      dev-manual/packages.rst: pr server: fix and explain why r0.X increments on SRCREV change
      dev-manual/packages.rst: rename r0.0 to r0 when PR server is not enabled
      dev-manual/packages.rst: fix example recipe version

 documentation/dev-manual/packages.rst | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)
---
base-commit: b8a56b8b2e8c0417b2f7204f80c79b05d95e9ce4
change-id: 20260120-pr-server-increment-details-3aa4ec0f6038


