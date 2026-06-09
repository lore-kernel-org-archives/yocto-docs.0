Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8C6CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73976.1780990130773346831
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=RY5Q8rRo;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 49A181A37F5
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 07:28:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17CB45FFC1;
	Tue,  9 Jun 2026 07:28:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 456B5106A2AC5;
	Tue,  9 Jun 2026 09:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zg1k8pJDi+pR7SkaV4z/Al34TuPX8KgMPPnjxbelzoo=;
	b=RY5Q8rRoWhRoPGRqIoNlq9CF3tK26thHlZsW0eoBgeoYRCU9VQKIG+xPAZ+4ZNgYot35ci
	UJ85RZd89kCANY9kMxsBC9rHciwcpbTJAL8CJuSWhz8p7TIU95Mq6DUWqUbNClasXRj2qf
	nuKFRArX8dHnASNzGFhzl4+NSMNOXXN1SXawkTQhVQ/yQ5/RqNqasDwc8VRYIHPMgs8V8j
	56p6fIcpbK6BnzhLEuiIbfc8MiyFCDIkebdCMMOyieX4PHdKmwnV/CsYaWoIPhFXaU5ih9
	adCDWVKurcLDtbUVbcR7Iz6+xHCT+rRL50e2Huas5JTVZkMpw3WGSGGv/cdMcg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] bsp-guide: simplify example of structure of BSP layer
Date: Tue,  9 Jun 2026 09:27:20 +0200
Message-ID: <178099000108.200930.9406989187989919215.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <6e1fcbc9-6a7a-9f72-6a91-74fc46cb44b3@crashcourse.ca>
References: <6e1fcbc9-6a7a-9f72-6a91-74fc46cb44b3@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9655

Applied, thanks!

[1/1] bsp-guide: simplify example of structure of BSP layer
      commit: 23daa6916419278dd4f6fdd40e5b8a2a89ca9441

