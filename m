Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62A4F8D743
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 13:52:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14655.1776347536705855237
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 06:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=slKsDrzj;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E95321A32FA
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0E1560495;
	Thu, 16 Apr 2026 13:52:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFE1410460890;
	Thu, 16 Apr 2026 15:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776347534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eXNqjSHJVsRUFnYRNHroVCv2act1GkxrWHLvxQB3oBQ=;
	b=slKsDrzjorKh3SAsdsJZupnY+lxNLvpaOWjfy8GtURfqKNSi1Xl3mRPXB8GaNyzlyfvQ4h
	rhIBo0ODk6uRtV+mLVRed7rDRB+5J1SDhsvp8JYtCNI+L/6JGWzEntTpTHLB3ef074qnwm
	PZMtYrM+9FxHm//i8Cn/qTaXyoAJMtklzkk8okwH/376Rqgdg2QB/hRyA94oM5+FjekTKU
	F9nDwzCTlc0b3OT/ofP/X62bHRVlMVp6I9c35LRFbojxsRVEPw/1OHQ1IGH7cPxG6Qt6WE
	B7/eOuedUCovVFyDJMwBpsT1Sb+4sd9EdZjUoPFb89ppKJtQPv7CDX5k1vD/GQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	martin.jansa@gmail.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] docs: ubuntu_essential.sh: explicitly add libcrypt-dev
Date: Thu, 16 Apr 2026 15:51:12 +0200
Message-ID: <177634729834.75801.222070403337045030.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410093916.3788848-1-martin.jansa@gmail.com>
References: <20260410093916.3788848-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9271

Applied, thanks!

[1/1] docs: ubuntu_essential.sh: explicitly add libcrypt-dev
      commit: 2b41d175ea1924bf401a203fb678261fefb228dc

