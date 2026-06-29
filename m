Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B246BC43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32883.1782720296482426179
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=hvYJnDtG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CDB9C1A0CAD;
	Mon, 29 Jun 2026 08:04:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9BBF15FF96;
	Mon, 29 Jun 2026 08:04:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06D78106F1567;
	Mon, 29 Jun 2026 10:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720293; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4iMvdcAI/+3r15puJUAd/vAHZSmWIJaPhQ9/1oOwy2M=;
	b=hvYJnDtGfN90CDZIINOaKxYdsc9+Vhh1VPfEX3WgTCvHRQE8Gu7TYAwlDoti6V6d0jgeXZ
	P/18LfRfvi7/UY0AIC9ygqGOxUoruO88tB1D4eWymHMxprv6dQEIQLXMuwhHFfZh3oKrz9
	9l2AoSGBc1uCaDTGtGsJpR8fMqjgp1ByFKHVWMmyCKmvSP6xKKADyIv7bp9ieAieTmeIGw
	lZDTcc+jox1DAHfDoQgxcsXqT/mA3bYiHSNeIS2v7JFLCP4PYc0nUouuQvkN6uTFH51+P6
	GivqaDEHmIHyyIAaWy+3ohJ3MSawlj7NKMD7lZv8UoAnurOWePu0QbGkBSwjmA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: for testing local changes, refer to devtool section
Date: Mon, 29 Jun 2026 10:03:05 +0200
Message-ID: <178272012434.45179.12455084187419993684.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <d5b8fa2c-b21c-74ca-edc1-0273e9bfe0e1@crashcourse.ca>
References: <d5b8fa2c-b21c-74ca-edc1-0273e9bfe0e1@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9935

Applied, thanks!

[1/1] dev-manual: for testing local changes, refer to devtool section
      commit: ed66fb25fa7faf1c0a72675396e5843d94023290

