Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02241CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:40 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73962.1780990119176959327
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=mb0G/npO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5A4D6C4FED5;
	Tue,  9 Jun 2026 07:28:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EEA385FFC1;
	Tue,  9 Jun 2026 07:28:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54279106A2AC3;
	Tue,  9 Jun 2026 09:28:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zx7WxizoAkA/DJtQu0MN1BsXqj154u2ZIDz5L4HRImQ=;
	b=mb0G/npOdla2KIBZ6AFWlDRyJM/czetX+htKHahcZii+1glOCxqo/w4tp0PwofEvuPLmKv
	zH8jSAjdmYDnZhufOdeEC+vzjNe8/DZg/GBeFHaG0Oemg5+/pgxY4isYeTKp2wUN2vY/Kx
	VQNsFOl3k9eJn2oID00fBaYMjJycyjbB+Wjye8XLPHRoYbZLkB7gvHLIIr9MV05D9hdoDv
	5fzASmQIoY5zBEs2Y4ZY1sz028GZn3ygz6kXI/sLAFQFBfA4GKucXJGs63YxQPxZ93nzRT
	s7psX9VL+FeNNQ1Qb+PRmB/sDnd7Liz3d6+wenoX1jFZITk0je71YRBG3GPmbw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] bsp-guide: update guide to reflect newer beaglebone
Date: Tue,  9 Jun 2026 09:27:06 +0200
Message-ID: <178099000080.200930.13060715888394011472.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <8ba8789a-52b7-d979-1fc8-04224055f60a@crashcourse.ca>
References: <8ba8789a-52b7-d979-1fc8-04224055f60a@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9641

Applied, thanks!

[1/1] bsp-guide: update guide to reflect newer beaglebone
      commit: bd5be9cc9d5aa7cca63877f3a22089c9dc02f135

