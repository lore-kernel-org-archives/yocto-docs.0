Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DEBC43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87416.1782720308574648806
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=1yy4h4ZG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E67131A0CCC
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBBDC5FF96;
	Mon, 29 Jun 2026 08:05:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9E66106F1578;
	Mon, 29 Jun 2026 10:05:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720306; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1JD18ZsSFB1jJHeo2+92sjVnUa+sX9+VydMKz9qNE9Q=;
	b=1yy4h4ZGxye+HSF79f5TlQn95a8NICsj8i/r3akRrmLIWpctbFkpjtmXYx3xz0HQh+Ly6i
	6XUY1f23Yi6yfbLy7+iLWSc0YMP/rGfPDuiYp12CQNXOShLGg3ul087ygAlJxtsEn9H6vT
	mKVfwlBCmvBgZDMCDLa2qcYbL5YTmMIBRfbaYv+2xhFe7RjaoXCaIJV0f7gDNFWx0AncYO
	Hbh+mpH6goE/X8xKfOQYJXpjD9/G2s1oqQ+t5dtu1Q9UmWXq04uUHBB0yOmMAUp2cWSoAb
	S3isv7wzCS4zhbp2UNM+TSALtL+u5+zkf+qkifS3RiLGKuWsvO0Mntqk1iEcnw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] kernel-dev: remove references to defunct LTSI project
Date: Mon, 29 Jun 2026 10:03:14 +0200
Message-ID: <178272012515.45179.9465185432040565491.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <df04bcaa-3360-c4d3-6305-8a5650d4209e@crashcourse.ca>
References: <df04bcaa-3360-c4d3-6305-8a5650d4209e@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9944

Applied, thanks!

[1/1] kernel-dev: remove references to defunct LTSI project
      commit: b2063f6bb4c80e533a11de87d0daddf54e16cd2b

