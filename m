Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F97C43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:04:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87403.1782720279105028640
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=a7s7or1p;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6390E4E40B50
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38FA85FF96
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E109106F1567;
	Mon, 29 Jun 2026 10:04:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720276; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4x9CXQYuuNeWY66MxGwHa9Zn56KCxXr7G8by4F6lqIs=;
	b=a7s7or1p72kcJp6lQnGtz69gBT8NjlM2YUfs1ZZOMN3QlQUI+f/AoMqD/+8JbawAeBpsf7
	nk5WMi6ZtbX0xOwyPlFmT7vNmqzJPyRyVwCGolU/4pUljHonOqM3Mx/Sb8atYZSQcPVDfK
	Mq6WsX2kJe0frx9A9jcIQdw2S5oBoG1xJrNmEScgqfp//52G1QoN/5gMhr6T9EgtNLBUce
	kVbInJMbwKg0JIoce/O8iytvFnq4YUU8FDiFbeccmIy9nS91x5kOxZJJTuNcVfYCa7HNM7
	1pxkqopAgjRIKnHII38zM9o3jNiKSZal6mn4q5YMexb7egjMiAGjUpP7kQJ+Rw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] migration-guides/migration-6.0.rst: fix wks file move note
Date: Mon, 29 Jun 2026 10:02:53 +0200
Message-ID: <178272012685.45179.17431691369240499744.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626-fix-6-0-migration-wic-note-v1-1-718c24a05619@bootlin.com>
References: <20260626-fix-6-0-migration-wic-note-v1-1-718c24a05619@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9923

Applied, thanks!

[1/1] migration-guides/migration-6.0.rst: fix wks file move note
      commit: 4562ba19f36e54099bcae82cec8a70deb1c23aa7

