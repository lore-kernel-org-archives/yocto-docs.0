Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E78C44502
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87419.1782720314093087346
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=jdY9vTlN;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 659734E40B5A
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BC205FF96;
	Mon, 29 Jun 2026 08:05:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC198106F1577;
	Mon, 29 Jun 2026 10:05:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720311; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WZ3yI2yRyexXqhqhxw36o8o9U9J0nKf878auf/wn/UY=;
	b=jdY9vTlN9o5arwd9+Os2SzRUW9PQheKCsmMhcdsJOErTW4mr+84DAYegUsTA4+NTxifQQn
	QeU1rgUv0AyJq0rLTAYZcNjOTVPH/I3X4gU3LwP2Yu87Ulch5bY6rVvyyy3JOF4d57R7DA
	UeRTB0JUQPNo6fd9kLkjXMnJdNd5CRPLVPlhlecUd+QSTsCfLujUJPz0FbRPxcHxcDHqRL
	xczMsqDSt+cDky0DUBA2E125dmzWbeKtuXTpZIIPLTDEQ4YAXtJ6dF4rNNusG524H2r6LU
	y52T/8xBwkULHaFPSOIPmWL4T/b5ZaXY2nE4R9e9zQaSSRcPeTtlFE2pZeLNow==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] security-manual: clarify text on avoiding root logins, empty passwords
Date: Mon, 29 Jun 2026 10:03:18 +0200
Message-ID: <178272012601.45179.12293813494838891865.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <e743d15e-b808-f571-22ae-7034e0155914@crashcourse.ca>
References: <e743d15e-b808-f571-22ae-7034e0155914@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9948

Applied, thanks!

[1/1] security-manual: clarify text on avoiding root logins, empty passwo=
rds
      commit: 97e949dd2ed6ec7af05e355e755723687ad57c09

