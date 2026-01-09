Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BF3D167E9
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:30:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6710.1767951020322331969
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 01:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jebrmv/O;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 20849C1F6D3;
	Fri,  9 Jan 2026 09:29:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5668C60734;
	Fri,  9 Jan 2026 09:30:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8C1B103C87CC;
	Fri,  9 Jan 2026 10:30:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767951017; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3cvKOQQ751HPy3INChA+2RQ0958TrIRnah+VVv6l5O8=;
	b=jebrmv/OMj6EThOg9IRMwrFxrgVUptUAZEebxk1sUYrXmp2C1wQDlCfUPjKLrsPOkjKrAb
	d8MThx95eSFwxNaUcWIj+cAAzJZ8md5HmG/tjYQMDqYE4pE+UD38WeV/uX2x5DRQUE+U9l
	l3B7CB2yoNm2rDqFCwrsNSpNWte13t4uR7fIiag5/MhuO8UF2XD0S2OeZBUZm6Pj+5xUg8
	pqN+S0pw7/4DdgUlnHXLpVUwvGzxXdi8nmmy6PFrz9kDvHs1g9jg8A0SsNLRo51wIHPLqe
	s+4PKw2VOGky5++Bmks8FNbYJJL97bCPsgzYXh9hu3AI+EDc5zqJH3MPrjFXKA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 10:30:15 +0100
Message-Id: <DFJYBWC4AGNZ.2X8V6CNOZCOAN@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] contributor-guide/recipe-style-guide.rst:
 explain difference between layer and recipe license(s)
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260106-layer-license-clarification-v1-1-99c69ec1a878@bootlin.com> <76a20da7b564f312a1179d8fa955c6245f44ec98.camel@pbarker.dev>
In-Reply-To: <76a20da7b564f312a1179d8fa955c6245f44ec98.camel@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 09:30:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8438

Hi,

On Thu Jan 8, 2026 at 3:47 PM CET, Paul Barker wrote:
[...]
> Other layers may want to handle metadata licenses in different ways, for
> example by including an SPDX-License-Identifier comment at the top of
> recipe files. So I think we should keep this note more generic.
>
>   Setting a :term:`LICENSE` in a recipe applies to the software to be
>   built by this recipe, not to the recipe file itself. The license of
>   recipes, configuration files and scripts should also be clearly
>   specified, for example via comments or via a license found in the
>   :term:`layer` that holds these files. These license files are usually
>   found at the root of the layer. Exceptions should be clearly stated in
>   the layer README or LICENSE file.
>
>   For example, the :term:`OpenEmbedded-Core (OE-Core)` layer provides bot=
h
>   the GPL-2.0-only and MIT license files, and a "LICENSE" file to explain
>   how these two licenses are attributed to files found in the layer.
>
> How does that look?

Looks great, that makes sense indeed. I'll send a new version. Thanks!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


