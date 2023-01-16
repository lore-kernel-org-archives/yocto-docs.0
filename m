Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDB4C677F1
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 16:15:48 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.170794.1673885744657377391
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Jan 2023 08:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MBfWSS1R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id e3so18745930wru.13
        for <docs@lists.yoctoproject.org>; Mon, 16 Jan 2023 08:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YOXphWithWpePuwbPQiJcURQx0z9EwJIQ0KR8Q28b4s=;
        b=MBfWSS1RELuG8CncrO4/NCoM587fr0gIlt27VcJS/hVLhxa5w1Q3uMvIJwuhgcb2ht
         6HHgtWchVJOfQSioSbhe1XJ/7OMv59iVuBGTJmUMhCx+M46+RYQn5NAWJr/YkVQ0HG0F
         oi1PCdEkoqmWelz0WsXm0/H2ZcCDH0En3C0T0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YOXphWithWpePuwbPQiJcURQx0z9EwJIQ0KR8Q28b4s=;
        b=5ubajZ4bT1/sZrxIHvizQOsxkVdIJWHG/ylYAkvqI2/FFaPQUnBKHxu04HnvD/xeGG
         LXlqh7IlBRh34PNkSa/2T37fxuQatwZVFMVgz80X4PKQydzA1dyPBeqmxOgZXuxfBU/E
         jooihhK5LcFC1CBlK4mqypi9vPiDFcFkQr17O02/b6W7+4Ccp7x+je3n9Q6jz10oZRRQ
         12qoqVFnJuYYq1GT6a3+4MCyj90+6vvcNjGw/OYIZ9YiJ4YPKDqxl579FIXr9VXteNCc
         MQq2i22Mc6gtFz8q0G54Gk3toNL3ZSGimzIYXhJO2wqoiriizwbXLleFbSn5xmY2ah0h
         kDKw==
X-Gm-Message-State: AFqh2kovOsJ13G6lXn8jC3iTSPVsdJiCzKDmMhpG8SvzVCEn8EzQHANh
	Wy+ecnrSN61RnMUwpSI9OQ2K9Q==
X-Google-Smtp-Source: AMrXdXtKYiwRuB4uKD18+3sfY1mRbXLhplHlJLDbqzrHFI85fyYZIMKslSFP/oOMdY+pEG022R5vqQ==
X-Received: by 2002:a5d:6b85:0:b0:2bd:d782:c2bc with SMTP id n5-20020a5d6b85000000b002bdd782c2bcmr55268wrx.33.1673885743002;
        Mon, 16 Jan 2023 08:15:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a31:564c:3393:642? ([2001:8b0:aba:5f3c:2a31:564c:3393:642])
        by smtp.gmail.com with ESMTPSA id f2-20020adfdb42000000b0024274a5db0asm26800571wrj.2.2023.01.16.08.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 08:15:42 -0800 (PST)
Message-ID: <59d3cf4aa84ca19075864dc78c827e340cde52f6.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] ref-manual: document Rust classes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, Ulrich =?ISO-8859-1?Q?=D6lmann?=
	 <u.oelmann@pengutronix.de>
Cc: docs@lists.yoctoproject.org
Date: Mon, 16 Jan 2023 16:15:41 +0000
In-Reply-To: <2a53087f-ebe5-e571-9731-cfc680ace44e@bootlin.com>
References: <20230113180932.1507356-1-michael.opdenacker@bootlin.com>
	 <6rsfga2abu.fsf@pengutronix.de>
	 <2a53087f-ebe5-e571-9731-cfc680ace44e@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Jan 2023 16:15:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3610

On Mon, 2023-01-16 at 17:05 +0100, Michael Opdenacker via
lists.yoctoproject.org wrote:
> Hi Ulrich,
>=20
> On 16.01.23 at 08:35, Ulrich =C3=96lmann wrote:
> > Hi Michael,
> >=20
> > I am no inhabitant of the rust world, so I can not evaluate the
> > technical content
>=20
>=20
> That's not very different from my status. I'm just a tourist to the Rust=
=20
> world so far ;-)
>=20
> > s/and an ``src``/and a ``src``/
>=20
>=20
> I'd disagree on this one. If you read "src", what you pronounce ("S. R.=
=20
> C.") starts with a vowel, hence the use of "an".
>=20
> https://editorsmanual.com/articles/indefinite-article-a-an-with-abbreviat=
ions/=20
> seems to agree with me, but I'd be happy to be corrected!
>=20
> Thanks for the proofreading!

As a native speaker, it is definitely "a source" or "a src", "an src"
just sounds plain wrong to me!

Cheers,

Richard

