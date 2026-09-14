Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B61C88E6F
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 08:41:08 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15786.1789375264856644333
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 01:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=U1xs0Y8L;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9E5C44E4052B
	for <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 08:41:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BE4E60323;
	Mon, 14 Sep 2026 08:41:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4983011C7AFD9;
	Mon, 14 Sep 2026 10:41:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789375261; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z1ijDmyFazszzhp9MnaVuDFoY7bnX9WVP4BHmjjQqxE=;
	b=U1xs0Y8Lan/ZZCQ+fFeg+HiOaXgt6K5m6w5P9jFwKPBOp0tjfdutyGV712gbueQzK7JT+C
	nxzD9owAOgDX/CgHJi6DCwvO0vHSFIFBTyN7/Oie61/QxQ4QK1Kt93arXmeCyVfDkVTncL
	nXKAgF81YdqEVu1FROze3QwXqIGC1l6F8snTw3/mWxDdFRPSg4zer+PdZBjkWXpHFoe0nU
	PZuEftKewZo9NRFiFf5l0twkIGooWDfWydd8x3T5O8eF8+YcfgYNuR7OoK+GTJim9CYLQx
	i77NimanJ1kBuanzQDXpwtRWEvevgzb5Rb9SqiXsrm0fJJl7JfTE5u+u3BAgjw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 10:41:00 +0200
Message-Id: <DLEWLAIWSFWF.YE95BAIAC7TE@bootlin.com>
Subject: Re: [docs] [PATCH v3] ref-manual/variables.rst: document
 PACKAGE_KEEP_SECTIONS
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <othacehe@gnu.org>, <docs@lists.yoctoproject.org>
References: <20260911220213.32468-1-othacehe@gnu.org>
In-Reply-To: <20260911220213.32468-1-othacehe@gnu.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 08:41:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10486

On Sat Sep 12, 2026 at 12:02 AM CEST, Mathieu Othacehe via lists.yoctoproje=
ct.org wrote:
> Document the PACKAGE_KEEP_SECTIONS variable added to
> openembedded-core, which can be used to keep specific ELF sections
> (such as .debug_frame, for use with libunwind) around when stripping
> binaries and libraries.
>
> Companion documentation for the openembedded-core patch "lib/oe/package:
> Add strip keep-section support", sent separately to the oe-core list.

Thanks, the patch looks good. I'll delay the merge until the companion patc=
h is
merged on OE-Core.

Antonin

