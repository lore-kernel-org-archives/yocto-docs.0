Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83980C5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 12:02:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17474.1786622562834663512
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 05:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=Q6oKC3b2;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 28A9D4E411F3
	for <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC994602B8;
	Thu, 13 Aug 2026 12:02:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6766311C4DE6E;
	Thu, 13 Aug 2026 14:02:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786622560; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KlScVagavGmyUsnuZKWgAPPGo9xo6HwM9Q0MGoXRB9Q=;
	b=Q6oKC3b2PKGXadVsHqBT4O4gBrQ9TBGJ9sVnlCRfphqYVyMYGIQ52Qlp9O6tdRKkEfjj8d
	nTARUWInoyXLqnZWR6YIizHcMbund9gUfqvUpeMWMgGdd5SwilYu4S8NzRzqbR+dpXPz4E
	84dpH+f6kMzmLGc+1obDuGP7sL1h9f82eTMVEKjGptRikMvnDMs9oHs5l2jMS61gTTLU07
	+aYPZbpUFkAaH7C5DUG569ORSLth+473piSofDt0LLSouEMcx5bs0HuwCCcLOLyQODipzv
	c0FYBXb+AxwX7THGSMgBih1tXLuDg8eh2gwO/ajTvdSrddI2jg59zk8Rnxx/2w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	=?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v3] features: Add distro feature "audit"
Date: Thu, 13 Aug 2026 14:01:41 +0200
Message-ID: <178662237138.775933.9815864059782015850.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2dac9fa540b8fe54bb3d5096f09e10257399e67f.1785746493.git.joerg.sommer@navimatix.de>
References: <2dac9fa540b8fe54bb3d5096f09e10257399e67f.1785746493.git.joerg.sommer@navimatix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10282

Applied, thanks!

[1/1] features: Add distro feature "audit"
      commit: 1098edaf5405934decb9765020b310b0e367eb65

