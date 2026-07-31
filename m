Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB42C55174
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:37:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3040.1785490625462076091
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=wIFvbfkw;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A6B4A4E4104F
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C3EF6039A
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E596B11C16615;
	Fri, 31 Jul 2026 11:37:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785490623; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aMaLN9jTw+X7W7A5vGdHL6TNj/EWj8C0ACn2yHQQDkk=;
	b=wIFvbfkwqbuTk9T2+6dF5sr1WrVtjM4MwpjtAzTCBSBov5EyK4RGZnTc5SaQKiJQ/mLp7A
	Sby0u7z2iamXECx133NrZ+9k8Q6cjf09ERHLi7YE/p84trxwcYpjYLfUFIfrRgxRiWUZiR
	h8rMgc3+PAns9aYrR8hLwxqP1pwm/QDH6IKAtCdZtSzjmFzOSI6v52xk4qoxsYedxmhUW+
	G3gSglmBvvRmtMuz168vywgk3MwUta0zV5Q8qHl/gXDpIqh8wrBkmK5zQ8hKfkdSEF/8PK
	2WJ9wtepp3Sa8Y4kjKsE8dNA1NatKXdUug3oqkx4gcqc2nihxbvRe6t7hfj6qQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ref-manual/faq.rst: limit systemd as default question to Poky
Date: Fri, 31 Jul 2026 11:36:17 +0200
Message-ID: <178548999952.2379643.9236142662255160887.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724-rephrase-systemd-faq-question-v1-1-ec769dac4965@bootlin.com>
References: <20260724-rephrase-systemd-faq-question-v1-1-ec769dac4965@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10215

Applied, thanks!

[1/1] ref-manual/faq.rst: limit systemd as default question to Poky
      commit: f65d4b4ac18fb1d303d25eeb66a9ef0e42c7fbd0

