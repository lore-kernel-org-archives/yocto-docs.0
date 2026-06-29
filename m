Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC03DC43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 13:31:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92172.1782739900185049229
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 06:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QPSAc+O7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 183534E40B66
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 13:31:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E16425FF96
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 13:31:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0096D106F17E2;
	Mon, 29 Jun 2026 15:31:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782739897; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=rEoef+Gbi6efLh9wmEAvP77vz/q3UCFkPz/0yx84wrU=;
	b=QPSAc+O7BbjBkGf/UyTqnns+bytMZfryx1fSrXNYfe0r/7m0P7wFa/9xnxsAfDvdBFvVSB
	Ul3m/VTkgy5aKp66/78ti9n+EgL/HmyjnueHvP1ZL6NXQiEFyO3SGCnUWr44sMvSZ/O/s5
	0xAW0KMY3i+gdkQTduZ2Yvy/AXQKVPUNnpYyMohdt9g0Idbhh7xKhV5NNG7mcLZqjfDXTp
	ZwQKPOiGXk7XJrg6Bbt3sCF82x4O+Whs0kaKDwgTFLX1p180GVXOA0Uu/QfusRjObdQ15f
	y9yWxBUtg7DypU/El2oMipch6LVCaaAjDrSf3qo5oKNJxl/Eh1171/ztI3xNqQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Drop support for Fedora 42
Date: Mon, 29 Jun 2026 15:31:31 +0200
Message-Id: <20260629-remove-fedora-42-v1-0-b55005c6e434@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrDuQBonaq5Qu0uTXTqGmTFQE8
 e5Ndfkt3tsoQwWZbtVGikWypLHgeqkovPw4gCUWkzXWGWc7VnzSAu4Rk3quLUff1l0bmmhcoJJ
 9Fb2sx/L+OJ3n5xth+n9o339/SOG1dAAAAA==
X-Change-ID: 20260629-remove-fedora-42-da8498c7d06c
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=472;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=e+jbkSfwKs+fb9rX+Bh9IGOiE7UX5cJROv0+Oui6K1Q=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQnO2z7IZExr1xlU9NasRPD2PtkuTF5OgJt9jF
 B9wH4NaomiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakJztgAKCRDRgEFAKaOo
 NizCD/0aZ80svsrDhQLurqur4CIswuME/TtiGDvYb2Q6TsxyZMvISKHqTYLmJ28dZWOW2T+bQd/
 Nl8AryAF6n77bgurSM4JFcOs1H8sRiL6xEeVnKHTl3Gi//blC1KrHJUWpzXMAkARGyGBnsWVFlS
 MtMWHvtfeUm+2bLkNQ0SJe+PjJs/9K4qkOyUTYtRe0YQn/m8l1JEBJey+UrProI63EivyIj/9P2
 QJCMN4eqUAdPg9B83jmgto45XwWkToIe8J/ATIsvcTNEvMasao0MLgczZKAaVMjgWBUR/2vWOJb
 yy1XJ3ygaM58lHy8nbf1zq49zSRIqnorgH6fNBUji7hDwxfdxR9afeUp3QPQ4WM80Hzf7kKkEnU
 aU6fC4VQPk00zEDdOBYPK6WjpTFCGM203Aabd6XvdCek7Kjx2ZCIGja/TP7zAcIEwz3qTw3JpDz
 Gqz3VzNmTQyC7SIuOqGazFw3jcuRMFLgfL9U9IzzicGyWJsQbPd56OEHZBSfvB9ug7AG2TeVef6
 63MGS0lUFi/T1xJaRp9OTluxlXs7hR6a4QVnx2cvGpoDENHApIS4BC0v8Fl0kMfkOsT1My/bS9i
 SCaNocMdqp25C9dP5+/5mtLQjxlWmzSJcPz0KxBj9NHzIOJc2vMQXc7QaJuxxTvNOeN2BpYoLxR
 HDd0bppNE23BdSA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 13:31:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9970

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      ref-manual/system-requirements.rst: drop Fedora 42 support
      tools/build-docs-container: drop Fedora 42 support

 documentation/ref-manual/system-requirements.rst | 1 -
 documentation/tools/build-docs-container         | 2 --
 2 files changed, 3 deletions(-)
---
base-commit: 4562ba19f36e54099bcae82cec8a70deb1c23aa7
change-id: 20260629-remove-fedora-42-da8498c7d06c


