Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3E9CD98C4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:52 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74152.1780990122839110242
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=i3NBp5iv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 391D24E42C7F;
	Tue,  9 Jun 2026 07:28:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E0975FFC1;
	Tue,  9 Jun 2026 07:28:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B472106A2A05;
	Tue,  9 Jun 2026 09:28:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990120; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rzeqsblcgIjGODZUoBF8jjerWR4xMfdHu2HK9YFgiXg=;
	b=i3NBp5ivW5CHso7KiZtFMvGocTDDqzUiDsiH+t3Go14qIkK/PtQdLUtyd+oimyPhBk37dO
	mkEWHC0rT8yFfoOfaDiBgkhpGL/4N+HlMiJ0eo8FMJJt1/KZbYOdE4ZO6gtZRhmTHKAEni
	gPMap06xbXB1RQY68ARYvgx5qY2x7IEJqZ30iao/Ij7RhxujNbEWVLi8gBvorbSHAwU2H7
	s2bBooiDHi4b3d7UNs1fUVgkQmrhwJZbKiPU0Xnb1uHaPfKQeO9vNDNVHZFpU5fAJOhzRi
	7jS91WafoZ4fVI6FegfscjWQv3V1L6PqTtJ/GY8vBCeZ/YjBy6ZGYa5jn67riA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] overview-manual: fix typo, "semi-colon" -> "colon"
Date: Tue,  9 Jun 2026 09:27:11 +0200
Message-ID: <178099000046.200930.4743362755746353281.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <4ef4fd8c-d455-4382-352f-d8e3c44e73ac@crashcourse.ca>
References: <4ef4fd8c-d455-4382-352f-d8e3c44e73ac@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9646

Applied, thanks!

[1/1] overview-manual: fix typo, "semi-colon" -> "colon"
      commit: 837e4de00f67b87c60faf21aab2dee913ba813b0

