Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4A2C43638
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87415.1782720307651306164
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=Mj1iSSXo;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 027E01A0CC2;
	Mon, 29 Jun 2026 08:05:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C59175FF96;
	Mon, 29 Jun 2026 08:05:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D547106F156F;
	Mon, 29 Jun 2026 10:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720305; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gIDjNZHYZEQN2MMUngnBNkMcoRZXg12pXmDh0+3X73Y=;
	b=Mj1iSSXoWE4yewi3XIr1nUB0Ga/VdkKuoAYQMNIu3yTRN2C0l9XKQI5DZkLVK0aPcjW88/
	Gt6xFz8y7heQD4l61MiVyLsfyDu0unZ0yIEbM/DN8EbKEkNsTF+hUuRvSe7D7XBcGsztzK
	FvrlCjcc0eRkkLmkyy5LM2fYWFqkTDV1yGp53YGlY7pSnk/b/Zt60kPBz0/iLSeziDvv3e
	FuZK0rb20NI2j7jY3H7O9OHfFhKNCvJ/WLjJTz6KUoAlxGm6iJBADoiwSNwH8Uwu/ht0Lw
	l+w8ijSxy1BvVGFKDwaN/OlWQkxkGOcJJYGqg9oTRWHBF6OqLTJcGB0MdXQ+Dg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] kernel-dev: break a paragraph into a bullet list
Date: Mon, 29 Jun 2026 10:03:13 +0200
Message-ID: <178272012505.45179.3945083516681525643.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <100f2882-f73b-4664-84ff-94819358dd0c@crashcourse.ca>
References: <100f2882-f73b-4664-84ff-94819358dd0c@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9943

Applied, thanks!

[1/1] kernel-dev: break a paragraph into a bullet list
      commit: 73a473d306b10e9ff93e4214483dad5125dc1315

