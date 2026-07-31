Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FCDC55172
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:37:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3039.1785490624889463223
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=CImwqldO;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 35D634E4104E
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B1356039A
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6357111C16614;
	Fri, 31 Jul 2026 11:37:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785490622; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rzduzOaC6jjOUf4NEhwZ0iJlE5+l/LWJXas8gteTCb4=;
	b=CImwqldO3LnsLhmuA4RGY6jV40ddeZdZ+yZ/5YP2cZCL++uvb/xWKjogRMkGrJCQQlujgF
	ZNK2+wvJyKnmOFi14QqIpzQpdDBNVzA/x807h0Ad9IhQAwzO8qPZlUm5MUjhrH/whAlX/I
	LUWJG7Ny678kRWV2KUkoT8KcM15+1SgMGpaPzUIS4yyi1rJtlYqJ5dq9CaUUeBPTydT1Qz
	kagT7jk/a8MeVZr0ngJOE4xXYbHRKVIqyxIZcfCxIFol3dz2pWuqpWpkJSRxclLSvRBH0/
	TTqX12qB3o11Z8BakIEPH0YZN3tl/cRy4xvj6XQAQCPojHH1TpDLpYsXX5UdYQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Louvel <paul.louvel@bootlin.com>
Subject: Re: [PATCH] kernel-dev/common.rst: remove taskhash mismatch note
Date: Fri, 31 Jul 2026 11:36:16 +0200
Message-ID: <178548999950.2379643.18192064465805594501.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724-remove-obsolete-taskhash-mismatch-note-v1-1-47a91133b3ed@bootlin.com>
References: <20260724-remove-obsolete-taskhash-mismatch-note-v1-1-47a91133b3ed@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10214

Applied, thanks!

[1/1] kernel-dev/common.rst: remove taskhash mismatch note
      commit: e8debfba3458618a25d21286581adc22bf78a836

