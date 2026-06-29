Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C99C44507
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87418.1782720312958048652
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=P93BmzY5;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2A1474E40B58
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDFC75FF96;
	Mon, 29 Jun 2026 08:05:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D94E6106F156F;
	Mon, 29 Jun 2026 10:05:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720309; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9eR5kc93RJtjx1/XEmBk9nH7V06+xUjqtsT+d3lXYeg=;
	b=P93BmzY5hYfXp1XkHDYTzwH3A1m7VYUZKkEqDgNfIOXQsk9O8s9ne14EhlQ3yo1bzoV75u
	KmDwAWnieCFtlnjmBHNxVnf7A4iWGdHwWhcobjyuqgKydUfUXt8/nhymD7AXGZ1vN2E8RG
	8l8SsbmdozGOO1TS5kUW6Up7BwXVdi+doxqmz1DJ+QTMy00lDEX+lhQj0qmUhqbWjLDYpt
	a/RxruRcas2Bu3VzeIubqY3Sw4AEX94nhPyEfsT8MWasLhbGkQ6pPkYDNrG0apWVaEp74x
	+FLjCGuECeNLbBSm98k4H27iWngpmd5sm7A7jcKD6nBjVIC+2Nqn+ia/Rd3DjQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual: fix incorrect heading level for site.conf section
Date: Mon, 29 Jun 2026 10:03:17 +0200
Message-ID: <178272012625.45179.8247332780873849921.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <3996e3eb-bfa4-078f-1dda-e01536e65cc9@crashcourse.ca>
References: <3996e3eb-bfa4-078f-1dda-e01536e65cc9@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9947

Applied, thanks!

[1/1] ref-manual: fix incorrect heading level for site.conf section
      commit: 5988266690f43f050356a9ce62b78a6fc2ef7353

