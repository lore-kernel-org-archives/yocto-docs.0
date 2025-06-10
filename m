Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E9CC61DB2
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 22:07:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.240.1749593250521879079
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 15:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S0ueube7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a51481a598so3470852f8f.3
        for <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 15:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749593249; x=1750198049; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mjGxidS407kDGvNKgVYTFbuUENGawi5/aYHyYIYbGJU=;
        b=S0ueube742WSVP3wlhzMamE2Gq7jUlAjyXYAI1OSA8f95njpCJc3s/L5Ib5+bGNeVO
         kTX2iYTDEQM+ohCqHvalc/gL8S7jy6MI0RZOvFc/lp1Teymtf1GiHlbFEp6dnt8CWcwO
         DtxoEderC2AFpOXGens8msXgkB9GfCrO6r9tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593249; x=1750198049;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mjGxidS407kDGvNKgVYTFbuUENGawi5/aYHyYIYbGJU=;
        b=a0uBbIPJ+MVPbNIki/HGQaZL4IR1Qo/rh5K4qsWvUtX6+RKiSh3WYzkAN+cXWPz+d8
         LRzfxTd633SWVtMxjnRREIlOEsdGMaAYAs1Obbo4hmikYJEpfR+uLjpWXZESYBtBAj7q
         t9nqXY8AnHoYtfsGA2jODdzH4ShamT7uLh5gCAx24P+f9dH+rBHvV+TCSEGTl0T+/QQV
         CS7wbzwrfXfVOPGIRd7Q48jsNgJlcOcaljuug+IxgQXSmZUKsfSlrdWcPoo3oVHOuXsk
         IDBHYtS4GYY+ftl1qMHRUOIGIXAssC/4+qTpONmi0P1oFlpJxYUhv+soI+5CRVluReHo
         jlvg==
X-Forwarded-Encrypted: i=1; AJvYcCVsNaqdf9P0inqf9p7XZ65VKwdrWdssyJplHuETfStUGX94jko6smJRmjGteIql30eIzZVC@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyfrdVKm8UAtLQFthC1c/gMIkkMw79P02k9qtBTSNlv8UcXYI8x
	82OrQ+YlR6agSPfARhl9vZ0nJi1BjkZtgj7Xb3loz2xuGIbRCzQNaiuhTJ48KuCZG5g=
X-Gm-Gg: ASbGncuao+1Iwpx8KhGtjs6qVWp0cw5EkuAFfHgf9wtDELc1Qv1R+7yJIqGKp1I70Fc
	rfFjvZjxpe6GD0+HQHBlkaFiBvsLdZSAvXJM7bfnejYVQxDOiFTI2vWUOHpJNDTCffRhlqws3un
	QsNWl6F/J2SV+WTsfYnNmrLhAGpDVahDQsDd9mDkSjNNzSPn3U1m+UWprM+7xFo5/tCRNBug2am
	g1bQVK7IMSCFNvaGtyrGo05NtoBhQTYXVj5i28V5S4ka1Q2ITZvLRccjfghvgM3/nzQv6r38/Yf
	3aelw6ksd83qxB5rX8yE6VQmj/ebZy5fKoFhDagayy68thfgLkX9DKzLt55/LOYPsIzd4+CzARW
	XRYy3R/wT7AmAR+u4R+8E69JbelXUodWUIrV6ASgibgBZHzVIO2I=
X-Google-Smtp-Source: AGHT+IGl+yN5QtxmRIEgq/L5uyEzIZu+xS6fq0V1/Vbtk2dRPrK/p2hmYj3or0zjysDSk2j3gfKUgQ==
X-Received: by 2002:a05:6000:4287:b0:3a3:6415:96c8 with SMTP id ffacd0b85a97d-3a558a4465fmr474484f8f.41.1749593248809;
        Tue, 10 Jun 2025 15:07:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a404:24a5:298c:75da? ([2001:8b0:aba:5f3c:a404:24a5:298c:75da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244d66dsm13275713f8f.70.2025.06.10.15.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:07:28 -0700 (PDT)
Message-ID: <2ce8cdf28b73175beaf1a94dfcddf033061befda.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] Add a document to list supported Yocto features
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>, Antonin Godard
	 <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Yocto TSC
	 <tsc@lists.yoctoproject.org>
Date: Tue, 10 Jun 2025 23:07:27 +0100
In-Reply-To: <50df3e5f-7f15-4bf4-8ea5-d639ecf2fc72@cherry.de>
References: <20250606-supported-architectures-v1-1-5eae2c4a2257@bootlin.com>
	 <0cd19563-a1dc-48ed-9924-63a75c5e72f2@cherry.de>
	 <DAITNWBR6NXN.2LBDVZFSIHX02@bootlin.com>
	 <50df3e5f-7f15-4bf4-8ea5-d639ecf2fc72@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 22:07:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7055

On Tue, 2025-06-10 at 15:21 +0200, Quentin Schulz wrote:
> On 6/10/25 1:38 PM, Antonin Godard wrote:
> > Thanks for the suggestions, I'll prepare a v2.
> >=20
> > Otherwise I'll answer to what I know the answer to.
> >=20
> > On Fri Jun 6, 2025 at 11:25 AM CEST, Quentin Schulz wrote:
> > > Hi Antonin,
> > >=20
> > > On 6/6/25 9:37 AM, Antonin Godard via lists.yoctoproject.org wrote:
> [...]
> > > > +Below is a list of primary tested features, their maintainer(s) an=
d builder(s):
> > > > +
> > > > +.. list-table::
> > > > +=C2=A0=C2=A0 :widths: 20 20 20 40
> > > > +=C2=A0=C2=A0 :header-rows: 1
> > > > +
> > > > +=C2=A0=C2=A0 * - Feature
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 - Description
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 - Maintainer(s)
> > >=20
> > > What are we trying to achieve with this column?
> > >=20
> > > What am I supposed to derive as information as a user of YP/OE/BB bas=
ed
> > > on that?
> > >=20
> > > Is this some kind of public recognition from the project of efforts f=
rom
> > > some people?
> > >=20
> > > Are we supposed to be able to contact those people maybe? Should ther=
e
> > > be some mail address there or some pointers to some document on what =
to
> > > do if we want to contact them?
> >=20
> > I did not want to display the email adresses of the people there withou=
t their
> > consent, although it would be nice to include, for sure. I guess I can =
mention
> > that layer READMEs should contain more information, including the email=
 address.
> >=20
>=20
> Fair enough, especially considering that the mail addresses may change=
=20
> over time.
>=20
> Not sure the layer's README will contain information about machines' or=
=20
> some autobuilder builders' maintainers though?
>=20
> I'm mostly perplexed about what is the purpose for such a column in the=
=20
> table.
>=20
> @Richard - or anyone else :) - what is/was intended here?

We have a few challenges. Is these things are going to get tested and
maintained to some level, we really need to show how you can contact
the people responsible for maintaining them. There are project
processes such as the autobuilder failure triage that do need to know
who to email.

Ideally, we'd teach the autobuilder how to do that. In practise, it is
hard to know what is a real failure and what is not, so automation is
no where near as easy as people think.

Ideally we'd just put a list of email addresses here. There are privacy
concerns some would raise, spam concerns and so on. Some would say
these can change too frequently and should be maintained on the wiki
(which we have plans to deprecate) or somewhere else. Equally forcing
triage people to look up addresses in layer readmes every time seems
suboptimal too.

So really, we do need to have this information somewhere and we do need
to hold actual individuals accountable for some of this. But we also
can't identify anyone.

Cheers,

Richard




