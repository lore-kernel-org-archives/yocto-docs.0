Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660A8C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87411.1782720301022052451
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=EIw8Ls48;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5DE7B1A0CB0;
	Mon, 29 Jun 2026 08:04:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 331865FF96;
	Mon, 29 Jun 2026 08:04:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F121106F1578;
	Mon, 29 Jun 2026 10:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=leOH1KVAyaz+eRhM2qgBn9u1kPfaerOHUikHsEJoI98=;
	b=EIw8Ls48KbIrbcueg5btRecTf9VWPlmRxFlq/gLl6ntE1KkzG+eGEPKTK5uv6dT6TEX1qa
	ID17lYhdhl1AM/lJZgv1y3/jU/+g/YbQVS9ISq3N6hfzlG2DsFUnzBUi5Me1bM1d1ItDov
	l3P5+qvSio1v9HmAEMULk0mAQDqajm+RJl4OwakPC7N/6F0dkxwtM8iJ3mAZK9shhRKibG
	Coe4nqEOJFaET+ZgOPHJblaRgN4vqlGcUUFfcPEQ+9gwcCZPa8naKDiEDxv/MjIh3SowUt
	7VuYwSVizJ2mivWsqgTKvUEBBWfhkwuwnluhF3PHMOUW/onrE8D2jAmblPfHyQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: rename Build Quality section to mention "buildhistory"
Date: Mon, 29 Jun 2026 10:03:08 +0200
Message-ID: <178272012663.45179.15485457400874078899.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <dfe0ece3-617a-02c8-d1bb-1baa904d2988@crashcourse.ca>
References: <dfe0ece3-617a-02c8-d1bb-1baa904d2988@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9938

Applied, thanks!

[1/1] dev-manual: rename Build Quality section to mention "buildhistory"
      commit: ff0a50eb3bb6e8720f6e0befdb26c7c44077d826

