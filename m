Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1809FD4923C
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 15:38:29 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.44001.1731944306703114283
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 07:38:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cAvu/TOE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82983240007;
	Mon, 18 Nov 2024 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731944304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ofpYcZXag4lWynGdld59mBz3vrzbF5M0eIZUa22a9lU=;
	b=cAvu/TOErse8xzTdjtBEAMM/4QifvQjqsqYA5zDQN6n1uc5L/yMnojalfN408r4lHaFpXS
	IK9BUIv62cVitQ7B38O+bq911ZUcHaEgTtPdYuuewZ2GGhjpYiBl3zUBdez3kZCN+ft6C6
	2QZR1DzYyNkcj4fVHOw52e6EubhiNs/3C+11cbt3t00CMkEqbCXET6hoFZqQmKrJVzYW9v
	hgCK5XIHgryHvj7i1Umayfzx+BxGW3wzwapeiU5YS+EAKYNjSDnIBIMNds5IcPIw/DFaRg
	ta4CM8u8Jxl5K7lDC6jWX6Djnr/Uu1Bax8HdylTVt7xF0fPTYZcFQZEOl/Nq1A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Nov 2024 16:38:24 +0100
Message-Id: <D5PF0LB1WQYT.3REFJWTP2X9GZ@bootlin.com>
Subject: Re: [yocto-docs PATCH] standards.md: add a section on admonitions
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241118-update-standard-warn-note-v1-1-0407c16b9315@bootlin.com> <b356e4cf-60e2-479d-b610-6bc72ffc4a3d@cherry.de>
In-Reply-To: <b356e4cf-60e2-479d-b610-6bc72ffc4a3d@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Nov 2024 15:38:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5762

Hi Quentin,

On Mon Nov 18, 2024 at 4:22 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/18/24 3:24 PM, Antonin Godard wrote:
>> We try to limit our usage of these admonitions to `note` and `warning`,
>> as the Sphinx documentation warns that most themes only style these two
>> admonitions. So add a section on that.
>>=20
>> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>
> Looks good to me,
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Thanks!
> Quentin

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

