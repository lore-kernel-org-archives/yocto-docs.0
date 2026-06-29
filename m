Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865D6C44502
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87414.1782720305673474421
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=tU0d6Ae4;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 02831C5145F;
	Mon, 29 Jun 2026 08:05:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0246B5FF96;
	Mon, 29 Jun 2026 08:05:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C51D106F1570;
	Mon, 29 Jun 2026 10:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720303; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lb4Q4u9XWMeRDsOTzjt/Eg35xm0uk/KjiJWnM4vcLGc=;
	b=tU0d6Ae4ag8KfiOgtowl0r+qUOMAVGBjeLI6Ned2DtevuhpikG3qyOuQ5WFPp2FDRnXtB1
	b4DQclA6HQ+DPgPucCleTmoBZ3nML1g3Oj3+f7pHp/XmTe/RXX5XEPrJXJ+o238pp17e7P
	g55p+J1LTnNvCkw99MKE0ZjV1/zFW+Og4n1hSa8RFGrCBJihzlzONM8Rr68qJZHPe5uU8q
	WwiAWSba4K+SrdPJ0rpBl5Fx21P18QGWbpymaXQmb4hZJSd85NAh7oEgA5QfWFv13KmTcW
	D6ezxxbyOCoW9hVBqoQxA2urp7cl2qoNGuoNqB4EQD4BuYkkBzmi7LANRsT5ag==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: update AUTOREV explanation to match current file
Date: Mon, 29 Jun 2026 10:03:11 +0200
Message-ID: <178272012486.45179.18013692825479852230.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <6fcb9b9c-e179-6c09-e233-56919a855701@crashcourse.ca>
References: <6fcb9b9c-e179-6c09-e233-56919a855701@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9941

Applied, thanks!

[1/1] dev-manual: update AUTOREV explanation to match current file
      commit: fcf87058a1e6ef77904d74128574028660d5a4ab

