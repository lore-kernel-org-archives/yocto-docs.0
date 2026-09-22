Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3659DC98302
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 12:20:06 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8724.1790079599162119943
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 05:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=i5s1Md8J;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B72574E41029;
	Tue, 22 Sep 2026 12:19:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8467F60580;
	Tue, 22 Sep 2026 12:19:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC1ED10328227;
	Tue, 22 Sep 2026 14:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790079595; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=76Od4IaSibzWqPk9k139iwIaJzHLIDE+U0UJyXT/qys=;
	b=i5s1Md8JnQ96CjmmUbqmxcnoUEgFhz1hbdplnLjWUiYwx/v85+HcJ3lffZZEabTrFaJ1FH
	Pq9cy7j9r6decZOfMt4g6AwMZqkTdH8TOCi+M9dl/PnCCnId2eWets2wyvX1pFUuRVgS8n
	3pg10bF4FSz3xud/LdqnNWE2UaQRbrGBiYYY1lVDxlwnVx9py5CKDWScfJ/nL0v8risuCI
	Y7eXj40tRpusP4rLf5TIDENKrUG45fa3oZoHfFWAUneSgfY39UCuCnLbXRjSxGsWCUu47q
	zE09z8WJHRSbyTwWqqmVdlMf0htyjo62kV5qP10IlF1LOHD85Dvy3xORrTzGsQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 14:19:53 +0200
Message-Id: <DLLU98NZT6F4.3PL0SMRNUEUK3@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 00/10] docs: editorial repairs to the examples
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260922020339.481929-1-twoerner@gmail.com>
In-Reply-To: <20260922020339.481929-1-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 12:20:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10579

Hi,

Would you mind rebasing this branch on master-next? It currently fails to a=
pply
for me.

Thanks,
Antonin

