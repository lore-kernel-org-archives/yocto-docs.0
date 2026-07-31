Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C926BC55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:37:09 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2959.1785490624627102614
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=G+7FT7s1;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4495F4E41047
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15CA56039A
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5CAAF11C1660F;
	Fri, 31 Jul 2026 11:36:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785490617; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pn6EJxQyMSmB0GApGNGI6OagyauDo4sCqKo0dPR4Fq4=;
	b=G+7FT7s1btTKvaEhfkd+CvZv6N9kUwiZPFU8hWC+J/sioEmewBt9MfK8zoRgCv0eW9/Cs8
	JVw7tZ1J3E+TjPrLl8MjpBBMixwS/6wogjEjw6I7lEd9PmKjrCT6cTAU/f57dG8sSJf34c
	Hlp7rY41NFpN1IXfgx7ycTgz72dPS8FH6LPW2VB8fZ42q9xIGaxiSsz9gtm6n4cl3G9x5/
	WoT3tc2/zuOSyOSHBkWCbQXGOm/ESCWT0ngm82Kiym9Gv1cdl0r/c6m9yyel4aOkl+ku7k
	hZL/OKLQKSU80jxkOc4qFfRIIm9lDZGUPnt2zPaHYQS2Y9mEGGqaBAX3rUSiVA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/5] Add shared state mirror setup documentation
Date: Fri, 31 Jul 2026 11:36:14 +0200
Message-ID: <178548999961.2379643.3746153683273697082.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722-sstate-mirrors-doc-v1-0-570baeb41c32@bootlin.com>
References: <20260722-sstate-mirrors-doc-v1-0-570baeb41c32@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10213

Applied, thanks!

[1/5] dev-manual: add a shared state mirror setup document
      commit: 15b08adf30ddbeb9f9911d4a6ae207e95f94ca87
[2/5] ref-manual/variables.rst: SSTATE_MIRRORS: remove uninative mapping =
note
      commit: 8719aae97386f185b89c0fa1dcaa11d4fdac3969
[3/5] ref-manual/variables.rst: SSTATE_MIRRORS: remove directory structur=
e note
      commit: 3c319bbee89a9a57c1baebf90f79b04ffe9f003f
[4/5] ref-manual/variables.rst: SSTATE_MIRRORS: move password note to sha=
red state mirror document
      commit: 23e84fcd28cd0b4839fd1363b26a9f3791736f92
[5/5] ref-manual/variables.rst: SSTATE_MIRRORS: link to the new sstate-mi=
rrors-setup doc
      commit: 41dae3c3da3ada1745fc60228ff6269c64ee2361

