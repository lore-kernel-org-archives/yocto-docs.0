Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BC9CD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 14:44:03 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9679.1780670635680364141
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 07:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ThSsaz8O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68d232e119dso3267589a12.0
        for <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 07:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780670634; x=1781275434; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7MAIU7XIy0uag3lGHpAijSGDO8rBPIoOpV9X6bV6lvA=;
        b=ThSsaz8Oed+ug44ePZEE3yhFp5uhpxxyXWtv3afG2wLuSoXmFWXDXK3yQG/G5DwPjH
         f+V3ZyINzlU2gtxWhOuoVmPUqipu1z6d93+4qcxCZWe+A/yM6l4DNvivZbWSUwBwpcc4
         lyEZroC60/i6TA8Usvodk+ii4eYKOysLqe9yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670634; x=1781275434;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MAIU7XIy0uag3lGHpAijSGDO8rBPIoOpV9X6bV6lvA=;
        b=GG0Dn4cvHAqacTeJw/vkSKGjwQv+F24lU6S0Z1DIXrqMFJqaWv80BGg9BQ9hJMyl7+
         AqdwOUQszWH3InANnyCFTBxsYzXab5HQl483ojmGXSj7Khoaq13QhBUe6wlcsYMvUkqJ
         ZNI3MMtPSO0kzRhj8/X77B9lE3ZGPMcOZNGW3V6e5ybfCAXR6H9qlHuwwLmvb4wuTVbw
         4d+E0xGBG0WqiqMFrYUaYZh7g5VOEwT+hF0YbuYdFmEqpSgUvLiw0Yjncwc9ioeG+dIj
         IFynrK1PbwRjk3F/a/ZeOWrS9Pf9fWPALmUicV2vlTrn7RDZ3lqZ9850V90/GLHXPR8t
         e8OA==
X-Gm-Message-State: AOJu0Yz/Pn8+oCRpa/Kchi37lDqUwi03l3tsvyLNYfRcOVYu/WMGw1Er
	7OZpp9DdCKvIa/rqn4wC3X0gREzp9o0ng0EcD7b9xvAYZEpSsrC4/+EQ4RMHCQ1B1/g=
X-Gm-Gg: Acq92OG5+gxz466d7+xtZkszS5ObtGOL379DUbtCge+qgUuhqXoc3rgpAO2WMZcy4R/
	jIrPYKnmPz8AsSXtKV5MZDK2Jn594++uhvxhJGy+NznE7qqx4IkUhrUPS+zY1pLhuOMzi20zJFW
	gir5VlI0AItgKnzPypIJzWpzA44C11i2C8eQZLqoBe1jAzG2dj6bIiradDPP/VUbSVRnnhwMp+q
	ywLD5jJ81PrNYw8aSvrIzcw6umcEy9OToSNEC6l0agdcaQK/UVtlJ1zsVpzC8Jf4qapVYNIl/cj
	2zItS2R85iTgz0HbktUcXsOyPOYShK5VlORICjW8hkGGAxNLIxxcbaUmEAOMwnMghlT5fajrdzM
	VoJfDppkch7F+Rpzc/gLMTUwyaGEH9jTJhF/CXKfbhBveZwXIfUan8puVV6lqFS+wIL0D9qySs+
	DDoV/xjZHbUG19354TXJBPe20v8GCeQPwQNgVI2IGGt152ze6EmWK5C5+4AlLlHPIpNLjseHhP/
	M79EUG8wKPksF+edayAs23U1vQ=
X-Received: by 2002:a17:907:7b82:b0:bd2:bd3:1ef8 with SMTP id a640c23a62f3a-bf372d28df7mr207203066b.35.1780670633637;
        Fri, 05 Jun 2026 07:43:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:176b:6db2:d527:85f4? ([2001:8b0:aba:5f3c:176b:6db2:d527:85f4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65027662sm3892872a12.11.2026.06.05.07.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 07:43:51 -0700 (PDT)
Message-ID: <059b9f24b250f12dfd262d2b44d3afab53d1bdce.camel@linuxfoundation.org>
Subject: Re: [docs] "Required Variables" aren't really "required"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, antonin.godard@bootlin.com
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Fri, 05 Jun 2026 15:43:51 +0100
In-Reply-To: <3091fc6f-a221-8af6-c844-4ffca0bd0ecd@crashcourse.ca>
References: <8571c31b-3d25-c00c-df7a-68b61c48cb63@crashcourse.ca>
	 <DJ167JWTFOGI.23YVKLIRK8LG8@bootlin.com>
	 <3091fc6f-a221-8af6-c844-4ffca0bd0ecd@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 14:44:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9610

On Fri, 2026-06-05 at 07:22 -0700, Robert P. J. Day via lists.yoctoproject.=
org wrote:
> On Fri, 5 Jun 2026, Antonin Godard via lists.yoctoproject.org wrote:
>=20
> > On Fri Jun 5, 2026 at 1:40 PM CEST, Robert P. J. Day wrote:
> > >=20
> > > here:
> > >=20
> > > https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.ht=
ml#required-variables
> > >=20
> > > the section "Required Variables" goes on to say that four variables
> > > "should" be included in all recipes ("should" does not equal "must"),
> > > but a quick test build showed that none of those four variables seeme=
d
> > > to be required for successful parsing -- only a missing "LICENSE"
> > > triggered a parse error during my testing.
> >=20
> > What do you suggest as an alternative word for "Required"?
>=20
> =C2=A0 Well, it makes no sense to first say that short list of variables =
is
> "Required", then say they "should" be included in all recipes. It's
> common usage that "should" means only that something is *recommended*
> or *encouraged*, not mandatory.
>=20
> =C2=A0 Then based on my testing, none of those variables are actually
> required since leaving them out didn't cause a parse error. So I don't
> know how people would want to word that or what it should say.

LICENSE is effectively required and should be in the required section.
SUMMARY/DESCRIPTION are also strongly encouraged else they get defaults
which aren't particularly useful. I thought there were QA checks for
those?=C2=A0Perhaps the QA tests are limited just to oe-core by default?

I think saying they're required is fine to be honest. LICENSE should be
moved to the required section.

HOMEPAGE is also strongly recommended, again. Perhaps the section
should be:

"""
The following variables should be included in all recipes:

LICENSE, DESCRIPTION, SUMMARY

It is also strongly recommended to set:

HOMEPAGE, BUGTRACKER
"""

Would that be more acceptable to you?

Cheers,

Richard

