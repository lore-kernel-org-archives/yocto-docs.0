Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E451CC5DF67
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 12:02:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17367.1786622566781763230
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 05:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=fsLpxP4Z;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F1C621A15EA;
	Thu, 13 Aug 2026 12:02:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C775B602B8;
	Thu, 13 Aug 2026 12:02:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FD5A11C4DE68;
	Thu, 13 Aug 2026 14:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786622564; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HnPEj7kLLwjRKjSZP10vSW7jB5K0uzebMDzrqYobIMQ=;
	b=fsLpxP4ZOX+lt3RQJ8e7YAj10TBveGBVe7d1UUbnrcf+fsONyl06KX8QeY5kIkaPfkQy5Y
	7tsKH8FGVk0pl6/74kwcdB6tX4bHxUwqQSQxG+/ONQkXvB0mtp5FDu3JvP6d0ByXhmF5tU
	9q1VazmPQaWNY0rFRvsLV6LsCZtLuoXtef5wTTGKAJ8M3iYed9jYzjyiHy0xxIWhdcd3BY
	CyIu54GheRI/G3tfWgTanYeJeNiQRdMAFIBGCvOVaTGID6MUSJjUbH4xJNuIuVgNjBpq4b
	GMBGc0Lws+XWqTteG1upoaeUsNfTRxv5AnWr3ljE+SffnEAZsYSFpZiDP8QiRA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Paul Barker <paul@pbarker.dev>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: Re: [PATCH] contributor-guide: Note patch complexity requirements for stable branches
Date: Thu, 13 Aug 2026 14:01:44 +0200
Message-ID: <178662237143.775933.15366998791341529193.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810-stable-patch-complexity-v1-1-f192d51f6311@pbarker.dev>
References: <20260810-stable-patch-complexity-v1-1-f192d51f6311@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10285

Applied, thanks!

[1/1] contributor-guide: Note patch complexity requirements for stable br=
anches
      commit: 33bf0ff80df6be2aad8eb081752648d3c408a54b

