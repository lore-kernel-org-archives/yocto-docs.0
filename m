Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3ED5CD4F3C
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:07:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31085.1779347250038385184
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 00:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=CvEj5GjV;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 80D211A365C
	for <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5038360495;
	Thu, 21 May 2026 07:07:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F359107EA6C5;
	Thu, 21 May 2026 09:07:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779347247; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vz3Rq6MqcnCGvXpZ60mOn8hyWe79THY46C8e/jYGqZQ=;
	b=CvEj5GjVL1+Tu7x05fz/y86b8CWBulaeOvyn36FbgIjkRgLonhcX72FgggC+pWrEDfx8Rh
	0w2yO2XMZ1XkVbiG0zAVtIY4T0gLHUBrA0qTzvCFrzsZGkhDtylpwF11dgMdMT4ieTikXr
	YFTTqWKktpzBDhY5MKc5Rlt+DHvzUrQiYn/IsbEmqQlEl5/qGkiVNbzCgQjbpH/V7LFuVT
	XG3P3OGxHnRRWb0mqxkyWCUJ08gdmSRMAYh5l41QKLZ4oNk9S7KJ2qH1oOquHdnu0v0V1q
	orWd88PeBQAGunC4NkQshpHLvp135EbIBPU+tlAjYbUGBalBsDJlIC35p7EybQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] YP Quick Build: delete extraneous periods in list
Date: Thu, 21 May 2026 09:06:32 +0200
Message-ID: <177934712472.33890.7577702979776770731.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <f64194a3-9050-eb01-9f41-64b20b33019e@crashcourse.ca>
References: <f64194a3-9050-eb01-9f41-64b20b33019e@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9512

Applied, thanks!

[1/1] YP Quick Build: delete extraneous periods in list
      commit: 94ebe744d0e95672456b8157daf0ffba333397bd

