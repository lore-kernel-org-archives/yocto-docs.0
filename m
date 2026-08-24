Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC21DC5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:46:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17071.1787579157831141532
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 06:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=1M62GEnq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2BE7B4E4138D;
	Mon, 24 Aug 2026 13:45:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFC275FFC1;
	Mon, 24 Aug 2026 13:45:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E10D711C79573;
	Mon, 24 Aug 2026 15:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787579155; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/euIFq0PO+P+MypCZr5RjgBZhXJbnz/IUn2Bw4YMIbk=;
	b=1M62GEnqYUa1RxrhKQ6AGwaXcZkw77lA+t1CCj6jLxGp/kTDzETGYP7FufA6BMg006u6Uj
	wI0eV5JCLlbdtqH4vKPtSORVFC2SZxODaNZR9VRtnXVs5TXSnZwr76iBYqcxPTEHOrzne6
	k7uzqV/ZwYny91pzLH2ldmbp5RfwFdOBx6vId9iZc2BYE+312pdcZFUPbw5FNIdfjkmiNA
	J8t+LuBdzbzxa4rz8cnOtTdqn+1u/3DfSo2TdZh64AaKZ/k6i9B7VDkEu2plt0ZWiC3iTB
	pQjZWpAYk+a1OveRcgCe7MOVDBgLhMo6F5+gix3JGEjsWUyxWvMyX8MNxan6rg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Peter Kjellerstedt <pkj@axis.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual/variables.rst: Correct the default value of FILESPATH
Date: Mon, 24 Aug 2026 15:44:24 +0200
Message-ID: <178757686695.159281.6807216386199503998.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813143054.666806-1-pkj@axis.com>
References: <20260813143054.666806-1-pkj@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:46:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10333

Applied, thanks!

[1/1] ref-manual/variables.rst: Correct the default value of FILESPATH
      commit: 6cd7b745abaf1191f35e492f2aafdb56dfbf2921

