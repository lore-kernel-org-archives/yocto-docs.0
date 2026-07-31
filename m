Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF58C55180
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:37:11 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2964.1785490629339514823
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=Iksq4jao;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AE02F1A134E;
	Fri, 31 Jul 2026 09:37:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D84A6039A;
	Fri, 31 Jul 2026 09:37:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99D3311C16614;
	Fri, 31 Jul 2026 11:37:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785490627; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VBRv8J55VJDVupCk2osgzLgpGrGG6bhcwQgZkFO+wnQ=;
	b=Iksq4jaoByRWirWBW9GTQj1dX9RyD15M8ZUaHW1EB1O1LLYYLvPf7z8XIj2cKcG1E/ZUVR
	CDIsfaQMSwggbDpWCVTzij8hNsWfAJ2eZ3gQiEHsCqT72YhGX1u3WyihOUqOLLLrhwYNio
	b9zb9DznX4LO9yEZ/8nOFo0zjCC8N29M9xWwEn5+Gee6NU7Fz8FNNKpAE5p0q45FNZV3En
	RVoGp7Bx6Epvy71NJYBdGD/UpwnJMf0zmW0ZNYYskzjT6nAVB/eiPbg1OUBoCKzi77FblH
	vPIMb+3ox29YOrRo/nu1HCFP4lAvoB+r6Hlt/4ZMn3SznluB5FAMEoLvztK70Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	daniel.turull@ericsson.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual/release-process.rst: update LTS supported versions
Date: Fri, 31 Jul 2026 11:36:22 +0200
Message-ID: <178548999939.2379643.12780876268841273891.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724073803.1260044-1-daniel.turull@ericsson.com>
References: <20260724073803.1260044-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10220

Applied, thanks!

[1/1] ref-manual/release-process.rst: update LTS supported versions
      commit: 563e100d5663713e593fd92d2d0fcbddcf25c1c5

