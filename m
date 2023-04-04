Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C81EC76188
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 21:09:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.114409.1680642573981812438
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Apr 2023 14:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ys/fo3dm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so22582863wmq.4
        for <docs@lists.yoctoproject.org>; Tue, 04 Apr 2023 14:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680642572;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dFazpMWa/ZRJMtsZmfosMVMRBsHBHGVY8x1ajgNMfM4=;
        b=Ys/fo3dmFtodxVUCQNd6e3V33OAYeLOwql2MoV8CWMjRgd/apLgQWuAK2YZyZINjHi
         Z/f6kAOpvhVEmXaxRllpQi2XLeELzYS/2aml9yJoAR+QYSA2GXdORGhYM3q1hDW55GrL
         hnHGf+6YzQgurkZdFgeEv2MOchHYnHD8yRDHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680642572;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dFazpMWa/ZRJMtsZmfosMVMRBsHBHGVY8x1ajgNMfM4=;
        b=ef2gVG6LcGtS0OGZ/Kike1mricaoHacrmvpOiiusyCR14YanzhYD8veMQG7Hg5dKgJ
         CzEUr412C/iv7npJ+btST66qXIAWgqkqSaE9cyRlnbUHfmJHCIm4ZKkNcF+GZODg8Yop
         uxsK3ulfMs4XvPi81LVo8LJeqxmMxCMTbnJ8/zdFXPv/naJpQNV9qnwzqKgQbA8bYAEf
         ZMtF9zTYFFRxSDgiJMlfiQGwCkUjWuo41ax1QQrrFv3eHCBveJXiIjeOzGAYp9o361SZ
         byZjrf7pYCn6EC9KqJEBAiS9RK+zLQOq7EUeigzCXlrUcxzY0cyFhf4QhOFvXaBjhEVa
         XgBw==
X-Gm-Message-State: AAQBX9eD6Tmy8FY0SnO1DgP792r1FKJ4V3smJRGqaCrBrYG482QkOylx
	wWFoY3U2RbN6spbrHSIT8OjrOw==
X-Google-Smtp-Source: AKy350ZpX1Yfa6myYV2IRbNS0oIQ4wG+nTbo4xLZBBEIpqOgUf3qGE0nn/ASE17fjEwjol834oN6Yg==
X-Received: by 2002:a1c:f718:0:b0:3ed:4685:4618 with SMTP id v24-20020a1cf718000000b003ed46854618mr3133733wmh.34.1680642572411;
        Tue, 04 Apr 2023 14:09:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f5bf:59d3:395c:4325? ([2001:8b0:aba:5f3c:f5bf:59d3:395c:4325])
        by smtp.gmail.com with ESMTPSA id u19-20020a05600c00d300b003edef091b17sm57035wmm.37.2023.04.04.14.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 14:09:31 -0700 (PDT)
Message-ID: <f79fec71c3ea953e684230ccf160f0ff1e7b706b.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] Increase minimum GCC version to 8.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, Ross Burton <ross.burton@arm.com>, 
	docs@lists.yoctoproject.org
Cc: nd@arm.com
Date: Tue, 04 Apr 2023 22:09:31 +0100
In-Reply-To: <bd01e8e0-443c-a148-b5eb-ff8ce406574f@bootlin.com>
References: <20230404155620.3278946-1-ross.burton@arm.com>
	 <bd01e8e0-443c-a148-b5eb-ff8ce406574f@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Apr 2023 21:09:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3823

On Tue, 2023-04-04 at 18:50 +0200, Michael Opdenacker via
lists.yoctoproject.org wrote:
> Hi Ross,
>=20
> On 04.04.23 at 17:56, Ross Burton wrote:
> > We've increased the minimum GCC version to 8.0[1] so update the
> > documentation to match.
> >=20
> > [1] sanity.bbclass: Update minimum gcc version to 8.0
> >=20
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >   documentation/poky.yaml.in | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> > index dc0c257e5..1c072c1d0 100644
> > --- a/documentation/poky.yaml.in
> > +++ b/documentation/poky.yaml.in
> > @@ -39,7 +39,7 @@ PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx =
sphinx_rtd_theme pyyaml"
> >   MIN_PYTHON_VERSION : "3.8.0"
> >   MIN_TAR_VERSION : "1.28"
> >   MIN_GIT_VERSION : "1.8.3.1"
> > -MIN_GCC_VERSION : "7.5"
> > +MIN_GCC_VERSION : "8.0"
> >   MIN_MAKE_VERSION : "4.0"
> >   # Disk space (Gbytes) needed to generate qemux86-64 core-image-sato o=
n Ubuntu 22.04 (x86-64), rounded up from 87
> >   MIN_DISK_SPACE : "90"
>=20
>=20
> Thanks for the patch! I saw the change too.
> However, I'll wait for the change to be applied to Poky master before=20
> applying it.
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

FWIW I've merged this with the other change.

Cheers,

Richard

