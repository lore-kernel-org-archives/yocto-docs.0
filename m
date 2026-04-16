Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E96F8D747
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 13:52:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14654.1776347535780883042
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 06:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=vPVOt6YV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 261414E42A20;
	Thu, 16 Apr 2026 13:52:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F165560495;
	Thu, 16 Apr 2026 13:52:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE38E10460889;
	Thu, 16 Apr 2026 15:52:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776347533; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hJyEAA+fKN0st8Li1Qxwd4adQlKiFcbG1cIh0R/ZERM=;
	b=vPVOt6YVhRcrqfD9FDWPZDLpkM5knU1YNVeTL1CYJHffFDWx0bonLL9JKb30UBvnsAJS6J
	/C3fET6VafwNPuUeEYDAhts9e7Nj+Sf7piDYNIWkSLCxIRJovO6vvibsk62PFZwTABWWtV
	qQjGD5+hI0GFBKSSez6WlhY79EHOZynA+s8gXqA7c4xvd88AsrSsrwEM2CVqaGgTE01/cn
	AQjiRSsdHvjZvxS6YWSxy6bit7c3io14Fs3j1dYgsDADosVNmy9t6wGSPEp/Bxnezv6Hzq
	2Mfj1CYpzDE/uwvmYWN4ZuIXF6jyFRkQD2lR7UcKuunQZfkrnMcdHpxr+s3e5Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 1/2] brief-yoctoprojectqs: fix the allow root login command
Date: Thu, 16 Apr 2026 15:51:11 +0200
Message-ID: <177634729841.75801.6192230139271651036.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416092512.99054-1-elmehdi.younes@smile.fr>
References: <20260416092512.99054-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9270

Applied, thanks!

[1/2] brief-yoctoprojectqs: fix the allow root login command
      commit: 808686cd98d39fdbb0022089a661a44ad86104f8
[2/2] brief-yoctoprojectqs: fix runqemu command
      commit: 906e7283c6ea1bd9c5b94b1699dbf4092ee25841

