Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9243BFF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 12:29:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10021.1777465740296742181
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 05:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=0ifuySi7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EB0104E42AF1;
	Wed, 29 Apr 2026 12:28:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C102F601DF;
	Wed, 29 Apr 2026 12:28:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E345F10729CCD;
	Wed, 29 Apr 2026 14:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777465736; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fbwko/CDuPjkG/SrSo9BOetYBiKXA+sF+xFKEihpppY=;
	b=0ifuySi7t5T/Zb8IGQSeD/1ADVl1133wY8HBEWQRvJRT7AUlkgpc2USDdRG92lnfPEePpC
	VQOU8Pz6RAjjppuxu+XHtDGzgtg/7SHVTDDRVMSxONBjz45/vlzd+ULaeac3BMjf8/bPra
	BlaH5Zuml+UFt4rkqeubx5GSjo+5JOxciTN5Z+PH2IqTFniywvp3yKvo97Y8ri6MwRWL9e
	ghHWUZEXYZfiiV0tZnqYJ0DWP0gSL95u1QsSrMBRMui6nZ+mi6mIiLlikJuj0Ws2qwSWx0
	2C48PkMH6QnrtxV6G0iJkddUM8yp6Q1lMjj0eK/Ae4KPBKFH5CEC+n49V7v3Aw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Dawid Bijak <bijak.dawid@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [PATCH v2] overview-manual/concepts.rst: fix do_prepare_recipe_sysroot task description
Date: Wed, 29 Apr 2026 14:28:42 +0200
Message-ID: <177746569616.815029.9210269059579848994.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423164925.13326-1-bijak.dawid@gmail.com>
References: <20260423164925.13326-1-bijak.dawid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Apr 2026 12:29:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9383

Applied, thanks!

[1/1] overview-manual/concepts.rst: fix do_prepare_recipe_sysroot task de=
scription
      commit: b50e8d36bdab53b004711ebc284d8ce8be593859

