Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF812C44503
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32889.1782720303488632977
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=A+ZrSmie;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D23091A0CBC
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A357460233;
	Mon, 29 Jun 2026 08:05:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F17BF106F156F;
	Mon, 29 Jun 2026 10:04:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720299; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WFIh9aPvxYWIHwo3VCbZpjCyKAgetRXKpShhmUxSKpE=;
	b=A+ZrSmieA7WPxasrrbZejyrTqa2c1GjoWcEtkF45g9+EQts+DBH47nEF66HQo44/NuSXKP
	SUQGfH63J4j/W9dy9SK5yOnfMtczgwyU5w3Ro3ewxjOyT9ygzZGTM+280Ts31jRydvlHzd
	ngvt2bOX8yXq1LcsSjCaVEin/LulT4iDIsyNni3iPRwYVnn2KCp/hlVQSHeZQLFrJkRaO7
	8dP2uMTpThCIAu3TJZQiciUaJ11A6ASPU/7aLRV0Oog/7a80bfsG+y7DXaLSaQ0kPc44zV
	Tk5GPA++LDkLIjW8As2xNbCwvlDDVwV6fQR4QJMkZtjGhgC16GEQytIlxUDWRg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: replace period with comma in list
Date: Mon, 29 Jun 2026 10:03:09 +0200
Message-ID: <178272012404.45179.16282418934510545532.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <7c04f7ec-cc79-147b-dbbd-bd59f64d82cc@crashcourse.ca>
References: <7c04f7ec-cc79-147b-dbbd-bd59f64d82cc@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9939

Applied, thanks!

[1/1] dev-manual: replace period with comma in list
      commit: a7ef8bc57ec533ab56080c282b724a1f293c1a09

