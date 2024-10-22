Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37B0D1CDB2
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 08:22:13 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.13439.1729585325647449372
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 01:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IZs8yMNW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFA30FF80E;
	Tue, 22 Oct 2024 08:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729585324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=edSGdUjqpf4fP+2819bSx9gJ4TnNUkfI5M5+MjtAtLw=;
	b=IZs8yMNWrQ73py6pjZUEzdOtXVVgYYOaoOnkQUaEaV/5qqHmN4iCIBJHW5p1pJzI1sqelI
	qOrM10YQHU+aEXSeR4/ZoqdPpESdJsPZvd4ekDRr0bpIjqSzQQ4Si2m8VyKjXm8YEtv0Pq
	3mQcrd7257q9Hh+C6g82yWwpgRdqE9yaou9OvRCaPGvjBnk32swGk7i1+Lc5B5Q2RBg+BN
	RjakQYHbLDbnYDzyGK6HsaKrJ84KmcZQsuh6z94Rii7m9jaurQti+LPgu7uSz345ZlmZYN
	wD22Szmix9/KsdkF6FGfCHOyHB6YKsP+Ct+QJg8JPtGIdOIxSX/CL7pV/Hde7A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Oct 2024 10:22:03 +0200
Message-Id: <D526TSIOP7XK.20ITMC5M88EU7@bootlin.com>
Subject: Re: [docs] Possible new entry for the FAQ section?
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>, "docs"
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r77.gd58065ac
References: <f2329d5f28bd22f75a29a3cc7f4332025de65603.camel@linuxfoundation.org>
In-Reply-To: <f2329d5f28bd22f75a29a3cc7f4332025de65603.camel@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Oct 2024 08:22:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5546

Hi Richard,

On Mon Oct 21, 2024 at 9:30 PM CEST, Richard Purdie wrote:
> Q: Why isn't there a way to append bbclass files like bbappend for
> recipes?
>
> A: The project has consciously chosen not to implement such
> functionality. Class code is designed to be shared and reused and
> expose some level of configuration to it's users. We want to encourage
> people to share these changes so we can build the best classes.=C2=A0
>
> If append functionality was available our evidence/experience suggests
> people would sit on changes instead of sharing and discussing issues
> and we'd end up with bizarre class interactions when new layers were
> included. We therefore consciously choose to have a natural pressure to
> share changes to them.
>
> There are also technical considerations like which recipes a class
> append would apply to and how that works within the layer model. These
> are complications we think we can live without!

Thank you for the suggestion and write-up. I'll take a note to add it to th=
e
docs' FAQ. It will make a good pointer to give to people asking the questio=
n. :)

Cheers,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

