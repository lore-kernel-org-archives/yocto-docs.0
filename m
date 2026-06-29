Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC9DC43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:23 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87422.1782720319192626316
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=SqfzJwNJ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8B81AC51462;
	Mon, 29 Jun 2026 08:05:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8AF5B5FF96;
	Mon, 29 Jun 2026 08:05:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B2BB106F157B;
	Mon, 29 Jun 2026 10:05:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720317; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lb4Q4u9XWMeRDsOTzjt/Eg35xm0uk/KjiJWnM4vcLGc=;
	b=SqfzJwNJtAWe6NJUCybIxv/N0eejnhlq8e4lOE9md+xBszPnT05RsJPWpD8zsIjGOIlMdX
	ynN8ei9DI4JTuD2Wg6+K0sOpOs9Q2+KyqKFcbcsnbSwOM2OpNaxzHcH57KroJWCN5MWpmm
	xeMYQn62NGdS3rUv/9h7Nz3uU3oh9RiHQ/RBb5p6JlzJJ92xBzQMAPoSlO28WPmlSgt3yt
	RZdDKcyYTfH4FDkYtr6Z7aCUB4J+wkRilzfqmPj/aqUkal9X/YEa4aFAZK/KOLhvAqKN9R
	EA5rNlPynD19ABKLi4xwijOuyOTWCD7RJRxXgtJRekCxuSa7JMVtxEs3AM2yTQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] dev-manual: update AUTOREV explanation to match current file
Date: Mon, 29 Jun 2026 10:03:23 +0200
Message-ID: <178272012524.45179.5757545756883813015.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <261bea68-6fde-563c-f56c-bb4daefacfdf@crashcourse.ca>
References: <261bea68-6fde-563c-f56c-bb4daefacfdf@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9953

Applied, thanks!

[1/1] dev-manual: update AUTOREV explanation to match current file
      commit: fcf87058a1e6ef77904d74128574028660d5a4ab

