Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3705EF8A17E
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 13:52:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14648.1776347530534174771
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 06:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=nctiRgV3;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CF04AC5C3CC
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D128660495
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EE3B1046088D;
	Thu, 16 Apr 2026 15:52:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776347528; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jRlfuNeGvM+VzeQ9yocvNWkaBVCevpGSaT5fWciRkTU=;
	b=nctiRgV3O9vju/40Sd+fZA26Eqgg0Eq+6KXanJzsWUd0vRvC2MR3ioT1R2L++nV7ATbv/h
	rqtGtgeU++kAA3y5d1xDg5LDpW4Jg7bEJQGgHWT590BZaEyx+CCEd/m9ojH42LxH/RcuGG
	EPJ3ZCJE4L8QqXu2E4bwg2UsgTP8htvLyikXI5KznSh0l/iL2dX69BUjcjzXu/nA98yH6h
	6lQDd+vcH+2MX4n7RUIXQRakpy/s+RwnTV83vRjDLnNFdkSRs3jfAjODq9fizW0POsVAA0
	dW2JyGsvbAwc9Hpaf5uZKfz9XdPpY9SAzd7sjfBUzZEzkJrIQCLplYjle8NiVg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/2] set_versions.py fixes (continued)
Date: Thu, 16 Apr 2026 15:51:04 +0200
Message-ID: <177634729838.75801.15778286257347358165.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-set-versions-no-current-release-v1-0-9c40207c8604@bootlin.com>
References: <20260413-set-versions-no-current-release-v1-0-9c40207c8604@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9262

Applied, thanks!

[1/2] set_versions.py: change strategy for the default page
      commit: 601b191dd41806bad2a2aae563445344c803681c
[2/2] set_versions.py: make active releases unique
      commit: 1500f2b6b7c1263781f16627091f8f3b1df86d80

