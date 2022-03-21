Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F358C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 09:39:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.28647.1647855551142415062
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 02:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KmomtIBI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C7EA31BF204;
	Mon, 21 Mar 2022 09:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1647855549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xF6TA89VKcpWLPiXHV7dRwFEwktfOnPfwrQB98VMCdM=;
	b=KmomtIBIx81r6Ll1AFS2Fh5d0p5TsBvwft/Kn5rk8nwOwLnaIX9kxzZF0pzVoK2ZXvgR2L
	OrijAzd6plCh74sVl3s2W4NKS6t9uPwA7EVBVs8Yp09RD0uxe48WfYMtcTBB8VAwQK7bgM
	JBfrG2mHNJjpJMF7SpMvQF2cOtbN/uM6ZdN9eFBZROYZygGB6PWPlxLl3vfxiTIbiXi943
	Yw2l04GRvwRBQ7dK02vQa5fsL9cvjpmcQdKltlS4fUztH+t+rycYZNKlH8Rq7N1iZJl7uz
	u8yRBPruh2ox1uX0tl3eHS0RSz65oQsHqP3W9DJ5N/OARvYYLrqPS0Zoy9PoZQ==
Message-ID: <b5b6afcc-5e7f-1948-bccb-abc25441b368@bootlin.com>
Date: Mon, 21 Mar 2022 10:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Cc: Quentin Schulz <foss+yocto@0leil.net>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [docs] [PATCH 1/1][transition] Makefile: Use switchers generated
 from master
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20220319152803.1110539-1-richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220319152803.1110539-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Mar 2022 09:39:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2647


On 3/19/22 16:28, Richard Purdie wrote:
> This allows an improved and custmomised switcher for each release
> showing the current doc version, the latest in that series and the
> latest releases for the project overall.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/.gitignore                 |   1 +
>  documentation/Makefile                   |   9 +-
>  documentation/sphinx-static/switchers.js | 233 -----------------------
>  3 files changed, 9 insertions(+), 234 deletions(-)
>  delete mode 100644 documentation/sphinx-static/switchers.js


Looks good to me.
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Thanks :)

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


