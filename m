Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACBDCD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 16:44:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12319.1780677880035230379
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 09:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d9JzoI8f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso18897585e9.1
        for <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 09:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780677878; x=1781282678; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9VRs3GSe5/mLXR0xCyfS/3nv/xKxXM0SZxAb4TPvoy4=;
        b=d9JzoI8fFUHXq/sVdfshRoMSBhs7DiMM643/8yCOpOXvraDdssUUfbPCx4/DoQ2kVa
         sPN/mNHCCJ68sBVhktMifJqBxHs4O8KhXJHmyD8+DEMNbUQOoVZejiGBJJ5jLORlPqm1
         or7qx4UwdiRkPsEWd4B72Ia/6GAoJM2xHOADU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780677878; x=1781282678;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VRs3GSe5/mLXR0xCyfS/3nv/xKxXM0SZxAb4TPvoy4=;
        b=b9d3eG0WwXpiiQXeacWI0/jQFVX6LB7Jrk7K32kDn9rys0c+SAJe+UvS53lo9ibgTN
         2zXsWTIZETAyfcxSZEq0HUA7XghauMiMgMW5AV/lJMS8XIhUd2saIzER9BQKykXNadpC
         8zBm1eX4kjWXRAUXp01k6Vua5kDxQ/tqekLl1BOw7mcA4NAg49M1/sySXiW+UQ8sqIgb
         ak5NKqSHpPy2pf/vIUCpqJHlW+YaNhuGSg3Hi7ipPhFRQQ+WjPJGT/Cj+Ly5M/DQa6g6
         M8UhPsKR/UcmW7/r1r1i30aAbUPeu22CS+svf1LrXMWBS7XN2oGrp112nZxZlXCSuT7k
         A1Pg==
X-Forwarded-Encrypted: i=1; AFNElJ9eFbrUH7yPNJjFNz/vesDRzP7CB8KdxeyFg3nq9Y6IFy5g7eOvfqbr058l+lBErfgxhpDR@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzHbiEs+3Tv0A/T/M4QdVjmQov0uyt6fQEq1cLoqknu17NA+ni1
	eod+P9CvG9GMgaztWqhTcOg8nwMsB3A8Kp8F1BQ9oij7FUn/JRvuj8ZrYqzohoIjlf8=
X-Gm-Gg: Acq92OH6xeMlvSnUrlmfM8m/H/8zSC+poldwSZb97emses3pl5pQ7cgPlNmDPhynwOz
	jMde+5dQIhW+NDFDwYrmzBdDZfC26w+ShqS0nE3IIhCwRBn7gS3qcrSX2cF6TuwLcx5ZLVyMIdz
	FEYq9UnDiHWnwWnehvV1f+FrEO/TYIYa80hxwHI2u6FhLsjhDsr0t8QCb0JMnXqHLLd0JQBVjEW
	Obek3ciMvlzy9hvopONjx5mdpb/lXwP7CcNRxqdNuv8mLesJXYq+aOW8xoTYRcWnquO2vk5d/yN
	oZCCfEI9I8+Bq6fy/9/pcjoNVkJgL7O12aRwUmLXK7BYdWmLv9hVxNb/fqTNbuNTaFoPZAFL4ic
	OIA9lTe2ut54qBCpROt2DZXyPsovhTccSPxLgg4dt0RqJep46VgVdnkdO656xKKwqiDmwNfEUzv
	l7fYyi00AD11zmpguP6+SUUzg57G1t9iNVlgVYXP8d7inXdzECRt8Ub6Z5eSOuhKcufyDzuXrbB
	gknAM3ZJtgZRMnaNs3hHIqhSBw=
X-Received: by 2002:a05:600c:a088:b0:48a:5301:bb5c with SMTP id 5b1f17b1804b1-490c25fc129mr70845995e9.16.1780677878485;
        Fri, 05 Jun 2026 09:44:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:176b:6db2:d527:85f4? ([2001:8b0:aba:5f3c:176b:6db2:d527:85f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm26426581f8f.37.2026.06.05.09.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 09:44:37 -0700 (PDT)
Message-ID: <fb282cc79d2400a2c7737fe3d3e2f83ee3606f50.camel@linuxfoundation.org>
Subject: Re: [docs] "Required Variables" aren't really "required"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: antonin.godard@bootlin.com, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Fri, 05 Jun 2026 17:44:37 +0100
In-Reply-To: <b68c0573-dcba-8edc-6ea2-7e898fbf960d@crashcourse.ca>
References: <8571c31b-3d25-c00c-df7a-68b61c48cb63@crashcourse.ca>
	    <DJ167JWTFOGI.23YVKLIRK8LG8@bootlin.com>
	    <3091fc6f-a221-8af6-c844-4ffca0bd0ecd@crashcourse.ca>
	   <059b9f24b250f12dfd262d2b44d3afab53d1bdce.camel@linuxfoundation.org>
	   <3bc0de42-2b65-212b-c8ac-39898b4fc0e4@crashcourse.ca>
	  <b5010b6b2373955c252760ef900d860b3480d85d.camel@linuxfoundation.org>
	  <e8e3de5e-8cd0-3a86-92a5-11bc0e943ecd@crashcourse.ca>
	 <4f5e74f5e90c8eac3eac7c4a590455735c649ab7.camel@linuxfoundation.org>
	 <b68c0573-dcba-8edc-6ea2-7e898fbf960d@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 16:44:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9619

On Fri, 2026-06-05 at 12:32 -0400, Robert P. J. Day wrote:
> =C2=A0 yup, and i was a bit surprised at the result (although i'm sure th=
is
> will come as no surprise to you).
>=20
> =C2=A0 with wrynose release, i picked a random oe-core recipe (util-linux=
),
> and edited the associated ptest.patch file to delete the line:
>=20
> =C2=A0 Upstream-Status: Pending
>=20
> i was surprised that if i simply wanted to generate the environment or
> parse the recipe:
>=20
> =C2=A0 $ bitbake -e util-linux
> =C2=A0 $ bitbake -p util-linux
>=20
> that worked fine, so i guess neither of those operations checks the
> patches.
>=20
> =C2=A0 predictably, this command:
>=20
> =C2=A0 $ bitbake -c do_patch util-linux
>=20
> generated:
>=20
> =C2=A0 ERROR: util-linux-2.41.3-r0 do_patch: QA Issue: Missing Upstream-S=
tatus in patch
>=20
> so that works just fine.
>=20
> =C2=A0 in short, the necessity for upstream status applies only to oe-cor=
e
> patches. should the docs mention that distinction?

I went and checked and "patch-status" is being added to ERROR_QA
unconditionally so it should apply to other layers too, unless you've
something changing that locally (a layer or local config).

I do feel this discussion is off in the weeds but I really don't like
the docs being altered based on incorrect information.

Cheers,

Richard

