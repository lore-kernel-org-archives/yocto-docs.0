Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BC1C44500
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32882.1782720294876315430
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=KVkrN+Uj;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 400CF1A0CA9
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E00C5FF96;
	Mon, 29 Jun 2026 08:04:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42A25106F156E;
	Mon, 29 Jun 2026 10:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720292; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mbRYK2Z10jKO+j5S2qEa1n3/Qt/LuvEFr6kdw6jqcsQ=;
	b=KVkrN+UjA9gaSwy/Wy0VPyWgBpp0Qy9aQO8gjQ1jVcrsKdtwN8tLZ2eWicNgcY22rspT6f
	phYjLzoTQ/VnfpJtenUKTBqHY2z2ApqUtC5EskUj9Pdy4FSmRJwGvQo6JvOzQFmq1Z1WS/
	KnRm+eiwC0B01tmZfwOCDA8LjcsNKIEAmt454CReLarByVNnC9Wy2AfYnhmk4ufMMdbJfi
	gE4O7dgzua1JC7dcASU0xAk2gPnnhtBeEtz/ccFU1LGqzH5knKkjQ1VE7d3CtxCRlaAKXK
	lZtTbPy880BzAkwjo6PnABO+toU0Pkdu+feZCl4l5H1WiOPSQ98YF/4q1/nAkw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: fix grammatical error, missing word "with"
Date: Mon, 29 Jun 2026 10:03:04 +0200
Message-ID: <178272012447.45179.12937118908137007954.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <a1d31ebe-dd6b-ce3f-f1da-4dea86f02010@crashcourse.ca>
References: <a1d31ebe-dd6b-ce3f-f1da-4dea86f02010@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9934

Applied, thanks!

[1/1] dev-manual: fix grammatical error, missing word "with"
      commit: b2820e987abc15b474152e51cd76e9bf30660a69

