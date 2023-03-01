Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE386C64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:54:46 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.18421.1677664483505642734
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 01:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HqAoioWW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id q16so12597978wrw.2
        for <docs@lists.yoctoproject.org>; Wed, 01 Mar 2023 01:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/uu2IEoxFIawmrwVmIxXITlkB5lR1VKQhKMCT1vVjjY=;
        b=HqAoioWWStqd6WP1cd1RxbaH3i0UwULClG2/AH89rXkvxbuL531Mtt8Ts0epzlar2b
         TkXfgS1l5WKPgfAUuL2liYph8Uj4id2cLzNcOZ7vshTs3Jr+d5m+lFgETaPdzkvpB3Fw
         6lfly4lduoHgPgTtVp83evGX91FrOeUg3uwa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/uu2IEoxFIawmrwVmIxXITlkB5lR1VKQhKMCT1vVjjY=;
        b=mQwmAWVQ1pavk/+55tqs1JqN46g4fJvvzdAbGUxSkXk9dOuFoxxhY2XDIKEwCFbLoY
         f2w6MQ9+kqXVWxiRQrC3aOgb2CV/lAqKORCacRU0HCXNuzcJU6YyjZe6Qbv3EDgk3j8p
         qdxetsmLbmpo/7tLxN1i2oK9/KW9QHpPe7DPvwSQKrSudFwdX6n+Hu/GtavyunVQRt2f
         4zl5JoQ4eC7R4qIpEjXqXz7AFvmeMXhwZZd99J0fjubN0Sq1VAaMahQSWOTLoaXbGb1h
         d3OxsjtQ8DGjHAjWw4EGRM03WhfQ3MITEc3tLeEjZ2r4xecYmkj1nvhO/CtJWdqetX4L
         shpw==
X-Gm-Message-State: AO0yUKWcQnEbce0emjLCLVNhl4F+9O4yQLVQ3Qx5srGo08U1BlnYP9P6
	85wC815TCv698TVQ1Uit79qbHg==
X-Google-Smtp-Source: AK7set8dxJ1toXp26eJ5cjWHft0jry9ectoGoNSB6s4CqPZ0CG5wyXNQ2hE5IumTo5t53bLS21DbEA==
X-Received: by 2002:a5d:5111:0:b0:2c7:1755:30bb with SMTP id s17-20020a5d5111000000b002c7175530bbmr4394765wrt.10.1677664481846;
        Wed, 01 Mar 2023 01:54:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc9e:5433:f22d:3a1c? ([2001:8b0:aba:5f3c:cc9e:5433:f22d:3a1c])
        by smtp.gmail.com with ESMTPSA id fc19-20020a05600c525300b003e215a796fasm17267488wmb.34.2023.03.01.01.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 01:54:41 -0800 (PST)
Message-ID: <71e9db67612bf4f421043bdad32186728fe7a55c.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 1/1] ref-manual: Add info on "mixin" layers
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, Alexander Kanavin
 <alex.kanavin@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, docs@lists.yoctoproject.org
Date: Wed, 01 Mar 2023 09:54:40 +0000
In-Reply-To: <51c83c09-598f-173b-acbe-b013d7c27fb9@bootlin.com>
References: <20230228221309.82156-1-yoann.congal@smile.fr>
	 <20230228221309.82156-2-yoann.congal@smile.fr>
	 <cd39cbba-51e6-3c91-24c2-41c1edaed0c2@bootlin.com>
	 <CANNYZj9jtHeKnKprAJraa7mZaYz+pa1kV8EMGJ2faJXvroSF2A@mail.gmail.com>
	 <51c83c09-598f-173b-acbe-b013d7c27fb9@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:54:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3765

On Wed, 2023-03-01 at 10:52 +0100, Michael Opdenacker via
lists.yoctoproject.org wrote:
> On 01.03.23 at 10:49, Alexander Kanavin wrote:
> > On Wed, 1 Mar 2023 at 10:44, Michael Opdenacker via
> > lists.yoctoproject.org
> > <michael.opdenacker=3Dbootlin.com@lists.yoctoproject.org> wrote:
> > > This makes me wonder about how official these are, though we said the=
y
> > > are not officially supported by the project itself. Maybe we could ju=
st
> > > mention this repository in the next paragraph...
> > They are not official. Official things get tested on the AB and
> > breakage blocks the changes; these layers are ad hoc, as is.
>=20
>=20
> Right, but it was the wording that was giving me this impression.

I think we need to make it clear that we've gone as far as hosting
things to give a common place for people to look/share but we don't
currently offer any testing.

Cheers,

Richard

