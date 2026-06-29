Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89179C43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87425.1782720328947466479
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=b4lY5XZm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4D7581A0CF1;
	Mon, 29 Jun 2026 08:05:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C08C5FF96;
	Mon, 29 Jun 2026 08:05:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FFE2106F157C;
	Mon, 29 Jun 2026 10:05:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720326; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I5Tvb9rxIwW3yU4FKhNzMGa6BlEGJNA7MAqDQiz4A74=;
	b=b4lY5XZmidgLACIg7ZniDJYosZgFK1nTWsy4wngsOpn3v16cHyBWYfC456a4OjaRqTCPP7
	lr64v8jy8x9ngwwq+zf3ZRc/3seQnbczH8P6jcWuN5x1noW11+0Gp/Z4rh7qZZVFTQhEs0
	RzQ0rvIh2lwTMR0p36z9tTeppOwSaRklt4XS3kw1mraadrZWxR6SO3Cy7VbaYmisdV25Bl
	GFdxw8DT23G1xpSxwUEZri4cV9ieX4XqmRmZfPfFJK14F4xF0bFkb1kfupNj1yWPhlasgY
	kn4hBBG5knlyLn2peURwFZ8sXwrus3V1GMXvRdhsbNYNntoDoHlS2PlosTFuOw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v3] dev-manual: explain how to properly call "bitbake-layers"
Date: Mon, 29 Jun 2026 10:03:29 +0200
Message-ID: <178272012392.45179.488356450378272466.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <375b7fa3-83b2-72b6-899e-45de4b79c023@crashcourse.ca>
References: <375b7fa3-83b2-72b6-899e-45de4b79c023@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9959

Applied, thanks!

[1/1] dev-manual: explain how to properly call "bitbake-layers"
      commit: 7505f0af029ac708e38eea40a6d002ae85b89404

