Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4550C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 16:34:38 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.171412.1673886874377577216
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Jan 2023 08:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DLJU8sQB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id o15so20377462wmr.4
        for <docs@lists.yoctoproject.org>; Mon, 16 Jan 2023 08:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KdBb4wccv+7s0Eh2kma+2pxTZkS7kOg5elxuBDYcZH8=;
        b=DLJU8sQBsb29OmeofW6grd4xI/3onTbw3nqbAZ6yOa3n+6FblQMCnkNIsU9GRIdMe6
         KoMQcWbRpQqOrbrey/18FkahFY/pktWuSBY4ss3QxDUJnmB6NixBAYEVqsNFwShPk4n1
         zrZaL0rZtIFv/ALkzepyhFAb4kOQj32IWBVy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KdBb4wccv+7s0Eh2kma+2pxTZkS7kOg5elxuBDYcZH8=;
        b=FxZatHURvubgaCpnP663EJgAE+fFjl/ybLBlFCBLKsAKnljZ6WMFWLbKlGase7OWTD
         iq9owhonKR4PpJx2dUqjQencicub+6dy4iE0rhex81eRIKq/6ZJ/2EBOLMw8PL7D92bC
         yryaQ+J6I+dsiKSqDCtiIc3Q03eBO+mFdcEcRbcCptRVBdUuna2M/MThHewVzXLXnfGZ
         dljSPumYLprL7KgH5Usl6c7tTtwMcRUI4HKIw84oCIr5lxC27fNzyUdchiCf+gBeFhAO
         r2IMlNSev1+mnpha1C0v69r+ophsBbBgu9vkqi9sdDj/TAmMoI/DlYF8fUzW9NEZJhlu
         AK2w==
X-Gm-Message-State: AFqh2ko6dNbRcVYmuls0CfYOpX9N7WFKbOZhEkpXoVX3z2WW5jNjvOlP
	kNcvlfVKIoAAHyLl2S+kPjpskw==
X-Google-Smtp-Source: AMrXdXuQC7iJw85KyWvrvOdWBL/huPFh+voSC7PaZAnaMz+GwwD1DRsnd72kbtrig7fqKDD4U51hbw==
X-Received: by 2002:a05:600c:43d3:b0:3da:fbcd:cdd2 with SMTP id f19-20020a05600c43d300b003dafbcdcdd2mr140753wmn.9.1673886872645;
        Mon, 16 Jan 2023 08:34:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a31:564c:3393:642? ([2001:8b0:aba:5f3c:2a31:564c:3393:642])
        by smtp.gmail.com with ESMTPSA id i5-20020a05600c2d8500b003daf681d05dsm5261869wmg.26.2023.01.16.08.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 08:34:32 -0800 (PST)
Message-ID: <313f2f809ffb451062547e7c5438a82173549d09.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] ref-manual: document Rust classes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, Ulrich =?ISO-8859-1?Q?=D6lmann?=
	 <u.oelmann@pengutronix.de>
Cc: docs@lists.yoctoproject.org
Date: Mon, 16 Jan 2023 16:34:31 +0000
In-Reply-To: <173AD6377FCD14EA.23170@lists.yoctoproject.org>
References: <20230113180932.1507356-1-michael.opdenacker@bootlin.com>
	 <6rsfga2abu.fsf@pengutronix.de>
	 <2a53087f-ebe5-e571-9731-cfc680ace44e@bootlin.com>
	 <173AD6377FCD14EA.23170@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Jan 2023 16:34:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3611

On Mon, 2023-01-16 at 16:15 +0000, Richard Purdie via
lists.yoctoproject.org wrote:
> On Mon, 2023-01-16 at 17:05 +0100, Michael Opdenacker via
> lists.yoctoproject.org wrote:
> > Hi Ulrich,
> >=20
> > On 16.01.23 at 08:35, Ulrich =C3=96lmann wrote:
> > > Hi Michael,
> > >=20
> > > I am no inhabitant of the rust world, so I can not evaluate the
> > > technical content
> >=20
> >=20
> > That's not very different from my status. I'm just a tourist to the Rus=
t=20
> > world so far ;-)
> >=20
> > > s/and an ``src``/and a ``src``/
> >=20
> >=20
> > I'd disagree on this one. If you read "src", what you pronounce ("S. R.=
=20
> > C.") starts with a vowel, hence the use of "an".
> >=20
> > https://editorsmanual.com/articles/indefinite-article-a-an-with-abbrevi=
ations/=20
> > seems to agree with me, but I'd be happy to be corrected!
> >=20
> > Thanks for the proofreading!
>=20
> As a native speaker, it is definitely "a source" or "a src", "an src"
> just sounds plain wrong to me!

I was thinking a bit more about this, I think the reason is that you'd
always pronounce this as "source", I'm not sure how you'd say "src" out
loud! :)

Cheers,

Richard

