Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987D3C44501
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32891.1782720304536967691
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=o2X4lI/N;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D53EE4E40B56
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A55A45FF96;
	Mon, 29 Jun 2026 08:05:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68D68106F157B;
	Mon, 29 Jun 2026 10:05:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720302; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M2+1Hi64rGB0qPfo/IUUFRkuABBRRHepygTPxchV0FA=;
	b=o2X4lI/NcPKI4GbwmHCJwIT5CU7YWxNOqxYL2Aw/ZL+oLkUAB9tnud0rfTFt3ksYK2np41
	dH3v3pUcvHXQEchIQVk0Zdetzp4ROXJVG6tlKM28IRkX+cu/E5eJA55AwPyMmE9h0UHHNf
	DU3eKIITc66pRTaiLhfXrB+gga4UsyIqlBBYYuXpw+wC4KY+6ebF+hhfnLxWa3Cri6Lcjc
	deQfwOhUz3oKrZYeaJQJ4U50RHog4Sm98WpzgSlQ1qSArLN6NvcTKMO2+fvs5gQXUyPb14
	6cQuReBd8ECX+doYdaK91JYH8hUG8eN4KGQFYQSIHghAPxlP6WTvYCEtek1jJg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: SysVinit is the default init manager for Poky
Date: Mon, 29 Jun 2026 10:03:10 +0200
Message-ID: <178272012534.45179.16698897947525177158.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2b679560-e819-76cd-5e54-9213b03169c2@crashcourse.ca>
References: <2b679560-e819-76cd-5e54-9213b03169c2@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9940

Applied, thanks!

[1/1] dev-manual: SysVinit is the default init manager for Poky
      commit: d467da2ccb5a78ac6a5ca9d976a435b4d4e0e270

