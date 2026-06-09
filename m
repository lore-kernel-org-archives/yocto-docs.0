Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3B7CD8CBD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73955.1780990113669614043
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=b48dmMoE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 23D514E42C6F
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 07:28:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED9EB5FFC1
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 07:28:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47EDE106A2AC3;
	Tue,  9 Jun 2026 09:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990111; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2GZLEYLO652JZiXap2CR+gcYXh16MJrbe3rLwJ7tEh4=;
	b=b48dmMoE3Z4D/USfRcOV58r8lB7QdbnDM+5kIbdkwVUWCtCOgsNEtY/X1WUcxFt67vCWrJ
	pGdZ7HLBCRc97FFrrGZZ7tL/BT9agn5VuEtoT9E/IxYLB/fLCHVJ3FfIDg6C6jJT/9vN0E
	YfaAiVNEJ/rbJLMn+DFxeqmuUVVGvV7yvpszPz9+FFis6NHSDc/xQo3Zhj+TgXaKSAWTSe
	Y3KUq4HNeoD60xdxK866qfK4QkMubk5uJh3fo08yFIVbg19x5oX2iijo/S36zGC/NuapaY
	CuSijywH4fMU9pasq/RZEWnhJAUUcF+Hg7bZYexrMR8S3+aEz/R420lVet/cZQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ref-manual/variables.rst: link *MIRRORS definitions to the BitBake manual
Date: Tue,  9 Jun 2026 09:27:01 +0200
Message-ID: <178099000112.200930.3718893296089627396.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601-link-mirrors-def-bitbake-v1-1-fa69ec343eac@bootlin.com>
References: <20260601-link-mirrors-def-bitbake-v1-1-fa69ec343eac@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9636

Applied, thanks!

[1/1] ref-manual/variables.rst: link *MIRRORS definitions to the BitBake =
manual
      commit: bfc00446569b390d6786a6d7c3dff1122bbea6c7

