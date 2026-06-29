Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF4AC43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:04:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32879.1782720287510368998
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=wt6KWzUK;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DEC771A0CA9
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD1FE5FF96;
	Mon, 29 Jun 2026 08:04:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2313F106F156E;
	Mon, 29 Jun 2026 10:04:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720284; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rD1eA5HtOsmj1DJVtdKyrX11u1A0kek1qj6yPULvbC0=;
	b=wt6KWzUKVSXxzbEDJWTyCuzHD0IDl1Ri+pTT6r11TaP+Id20AE3hF3owH8Z8Koed9P/WY/
	wXqBudbbnLIT6treY/BseJQNMygsx+h0eU8QyKsAcejetpLXx8YCuyic+IVqGT/1rcB4Cj
	d9L4xANQcHJe6vMX3r4wuEL3/KkKSn3Gu/CXQQfL/uxJCabflJKItDZ4a19DdSfCq2Keg9
	oaESV6j5GCEparPEJtoVYw+fpfVfLhHKXw32wROBpiqeXvU9Eu24fYoYmoH7I8clT6vNxW
	3shhtPD0cOxPIsnLbsTXjDkekB9Y02bEY58T3E2+J1S8qWL7kTGIo4VKdOl59w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Peter Marko <peter.marko@siemens.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] build-manual: update ROOTFS_POSTPROCESS_COMMAND example
Date: Mon, 29 Jun 2026 10:02:59 +0200
Message-ID: <178272012376.45179.9774594519483653942.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609065332.5274-1-peter.marko@siemens.com>
References: <20260609065332.5274-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9929

Applied, thanks!

[1/1] build-manual: update ROOTFS_POSTPROCESS_COMMAND example
      commit: cee160c2387b9bb8befad6e2e7f59575a014418c

