Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B373CD98E3
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 15:03:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.156701.1781622189916558848
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 08:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GtLB0N8W;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 44A571A395A
	for <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 15:03:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11E28601A9;
	Tue, 16 Jun 2026 15:03:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F19FB106C9E71;
	Tue, 16 Jun 2026 17:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781622186; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bI2kmf3fdIWcX9NA+Bs2BDTtWJgvdfqk91C5oZ3MU0w=;
	b=GtLB0N8Wm/ttMS0eAK9JpjlAfJRPQ6kZVpF+Nzer7stn7fVKFmeBigkheINorsevvr6/TN
	IXWkg0pVWU+2QvLphkA+eY/DfLrVXuSvDQf0WaOq4tzXqvqNo+h64TDi7RKnS0p/zG8uGA
	N4BNOqh+CY09sOttTjevUI3JknbLDDatbAUflviFA2OIHc7bbQkz3C0wLL5Wffh/P45POV
	YwaeeE2/mGnAWEp2W0lMZEb+VGxX/lNulGRgzEW0YDc4NO4gwcrj14C8R7PvJS84rhUtjF
	2vAsLyteC0XcZrbkbgSUBjPKIBY803qq5/0UshhT9Ca1isrcE/DlQJfgaiKW8Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 17:03:05 +0200
Message-Id: <DJAKCT00PT9R.JMQ30E3ELKAS@bootlin.com>
Subject: Re: [docs] should the YP docs mention layers.openembedded.org
 recipe advanced query?
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <86b66622-c80e-9f67-0e21-0743b305032d@crashcourse.ca>
In-Reply-To: <86b66622-c80e-9f67-0e21-0743b305032d@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 15:03:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9750

Hi,

On Tue Jun 16, 2026 at 12:18 PM CEST, Robert P. J. Day wrote:
>
>   while transferring some ptest content from the ptest wiki page to
> the docs, i was reminded of the advanced query feature of recipes tab
> of the OE layers page:
>
> https://layers.openembedded.org/layerindex/branch/master/recipes/
>
> which that ptest wiki page mentioned toward the end:
>
> https://wiki.yoctoproject.org/wiki/Ptest#Recipes_with_ptest_Enabled
>
> as to how to list all recipes that inherited ptest if one wanted to
> see some examples:
>
> http://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dinhe=
rits%3Aptest
>
> it occurred to me that that would be kind of a useful note to make in,
> say, the ref manual "classes" section -- to inform the reader how to
> find examples of recipes that inherit a given class to see how it's
> done.
>
>   rather than add a note to the "classes" section, would it make more
> sense to add a more comprehensive section somewhere on how to use that
> advanced query feature and link to it when appropriate? or does that
> feature fall outside the scope of the YP docs?

Perhaps you can add a note in

documentation/dev-manual/new-recipe.rst:Locating and Using a Similar Recipe

I wouldn't dive into too much details though.

Antonin

