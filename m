Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223C8D10F4C
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12188.1764162015620520245
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Z+Gwpk3g;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 16EC94E418F4;
	Wed, 26 Nov 2025 13:00:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E11E660721;
	Wed, 26 Nov 2025 13:00:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A0AC102F08EB;
	Wed, 26 Nov 2025 14:00:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162013; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h3lA2ywtpf7Xvfk1EgCSv2A+pYeXjNoSd2MD9bfHGI4=;
	b=Z+Gwpk3gxxfI1hw2lJ9h03Zi2ez/yJNK/lEmHqcBdrXfEN9Hxy6zb6HJL+r8mxiWQPR/7r
	zzRE6WVsPiW4oN1MZO6NOpRN10L10laP67w9bno8yIlIDhu6tKv+YDK1qCy6E3/TP9vhGY
	8FBLvR72UB82x2qgd8EzPft0GwDsbzUKB5OP1Dobuuf4hf/fNXHlOQI/iO8rry4sz1q3gx
	LFrodqSUWGZkt+8bMdnB4BaoQ7FV0N0i1nUqRHRU5CZ0ZzKGPEQsJzzWhIZ30yAq6faVvM
	zEh8sk1jcXWkA4vuCEr5NuZBzY5/2HB+St08pBQ5QFeNsVIlZ+EXBBFFZ/h9hQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	"Robert P. J. Day" <rpjday@crashcourse.ca>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 0/3] migrate most bitbake -e instructions to bitbake-getvar
Date: Wed, 26 Nov 2025 13:51:28 +0100
Message-ID: <176416145944.617433.12805763398541481096.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029-bitbake-e-v1-0-c06ad212db9e@cherry.de>
References: <20251029-bitbake-e-v1-0-c06ad212db9e@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8134


On Wed, 29 Oct 2025 18:42:39 +0100, Quentin Schulz wrote:
> As reported by Robert, we still have a few examples with bitbake -e
> instructions instead of the more user-friendly bitbake-getvar.
>=20
> This migrates what I believe to be the last instances of bitbake -e we
> can currently replace with bitbake-getvar.
>=20
>=20
> [...]

Applied, thanks!

[1/3] kernel-dev: common: migrate bitbake -e to bitbake-getvar
      commit: 54585646d8220f8de1ba2c7246cb3f2fcbc59583
[2/3] ref-manual: variables: migrate the OVERRIDES note to bitbake-getvar
      commit: 2293a3f2767895e9fb5c3e8f3ec11bb4951a7127
[3/3] dev-manual: debugging: use bitbake-getvar in Viewing Variable Value=
s section
      commit: 41e4e05369c4e028c679749b7b62434327927a09

Best regards,
--=20


