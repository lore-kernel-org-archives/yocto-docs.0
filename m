Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D99C79FA0
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:31:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30053.1788769878686022678
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=fRRnnT4z;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EF7F14E41562;
	Mon,  7 Sep 2026 08:31:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDDDB60383;
	Mon,  7 Sep 2026 08:31:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 292E711C79353;
	Mon,  7 Sep 2026 10:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788769876; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j/5U5BM52U/DswlLRCuHXp+CuZeOq73GBQ+RJh2qDTg=;
	b=fRRnnT4zLC4NTGgkGj3DK7m9BL5iU7ZWT4WeGNAAp1P1TPBgeLHvMa77fy1Dx4sBwXrqKI
	BbT00IUj4/0KehaBnR/nqbeqk6LLDJ/AgHJdXew0qQ71UpxLu2VzS51zBos6jNID/MigMl
	DgwQ6IDMgjua1F7A1wjQ3vdbbGqCVIC3nAZlWdcAudMxfBcDX9kmxHhRgHkZ6A/QymHKln
	sijakZ6NGQtTpWBa4slAlBg/kd+NeOLSVb+386diboWOFqQeE3/5me5K1JJH5J73u17EqB
	qFlDZuwqmNafQ008X9KGHUm/K1F+B0QYhNsoXgavNSYnN1aQQ/aFosDjvbXgXg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] documentation: use "https" protocol for git.yoctoproject.org
Date: Mon,  7 Sep 2026 10:30:22 +0200
Message-ID: <178876977210.61738.15988749872150067251.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <a297f905-8632-7861-aff1-cfdf143e7548@crashcourse.ca>
References: <a297f905-8632-7861-aff1-cfdf143e7548@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:31:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10440

Applied, thanks!

[1/1] documentation: use "https" protocol for git.yoctoproject.org
      commit: abf31bc25d542048f4c07504f3363e93eba9bb61

