Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B26ECEDDA3
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 14:41:31 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.18480.1728484888979835805
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 07:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eRRMvZQ8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37cfa129074so4568307f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 07:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728484887; x=1729089687; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YMP3Qx1huRpSuKErbDx8Nl0pmNf3NKNUv1FCh9CfKI=;
        b=eRRMvZQ8KqojfgH1d5r0pR9JUYsF/MUwauJ5L5zBiAXKXOYRprGXiyDXnDAVME6Dsy
         FmSfm9yJtWRcLqps+KrATliQrvuOwwYZ3eeNtDe0vy6n9kaos/U+lHhN6gslgpx0tYXf
         pmIPqZXD7RlsY7WgUOL6vnrJSPtLLcpJuw1+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728484887; x=1729089687;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/YMP3Qx1huRpSuKErbDx8Nl0pmNf3NKNUv1FCh9CfKI=;
        b=OQRF8mEElOfB0einK1utgCVO27mt0U5OZgi5kRQNc8m/fglQHBnfhW+sjUSrWV4fnk
         j5Y80EC+jm9BcpO1E1rYj/FNQS1O7KK94J2cLKZpic2UHl9YRJyl4rs9EB5xkxEvZiVh
         IJXOsT+I9d2XL/A2sy8PQmd1B0JeugUFWIz9aI32b/l9BVyLomBhWA7bVYGCVqze7XK7
         bDRB9eMIeOYEhSDWhCQorMKqX3moILzLumCQl3RZQcJNqv1t5Fq3izr01Enrw3kDxTnk
         uU5eyrkqJ0Uu5vNCcePBPNsEC/utoNZGCnWQ+v9gHuXH4sYxFZ+jh8enLEHB+a5mf/Ms
         NZ5w==
X-Forwarded-Encrypted: i=1; AJvYcCVXU9a7oJRPSQWEu8b6+kyfDyVYkrDXEmHkCGLriOJLd5olSqOnsbJZGudFpnilzcqsyaBp@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxQu/dObRv/RyGQeNa4+vByqfr4dyZYiURIMKtGfuYR91/E6uxW
	aFvJZWMlD0Y13nHMHCbglFKBfAu9L/dsATIkYyiuLAop2W4sPt6F1f1kop/EIy0=
X-Google-Smtp-Source: AGHT+IGyo7PTrZc06SLnAN4BoB516XxhcrF398Rvu4S8J3WBifYLmpN3z1MmkTcG92AuVgkRI3YWBw==
X-Received: by 2002:adf:f00b:0:b0:378:e8a9:98c5 with SMTP id ffacd0b85a97d-37d47eb7406mr72351f8f.34.1728484887307;
        Wed, 09 Oct 2024 07:41:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fb33:4e5d:4941:5018? ([2001:8b0:aba:5f3c:fb33:4e5d:4941:5018])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d16921aa4sm10619515f8f.64.2024.10.09.07.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 07:41:26 -0700 (PDT)
Message-ID: <70e949a3068384d846a80960d35cdd2bf213e60b.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 16/16] release-notes-5.1: update release note for
 styhead
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Date: Wed, 09 Oct 2024 15:41:26 +0100
In-Reply-To: <0062b62a-0c75-4a78-ab67-3a22033ef060@bootlin.com>
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
	 <20241009074120.866786-17-antonin.godard@bootlin.com>
	 <71c1b7f5af4f8fbcdf736246e1fc7eadd46bce9f.camel@linuxfoundation.org>
	 <0062b62a-0c75-4a78-ab67-3a22033ef060@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 14:41:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5428

On Wed, 2024-10-09 at 16:33 +0200, Antonin Godard wrote:
> > > +-=C2=A0 Rust related issues:
> > > +
> > > +=C2=A0=C2=A0 -=C2=A0 Rust builds are not fully reproducible (only ``=
rust-dbg``
> > > and
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``rust-rustdoc`` are not).
> > > +
> > > +=C2=A0=C2=A0 -=C2=A0 There are some remaining rust selftest failures=
 that need
> > > to be fixed, due
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to the way it is being built.
> >=20
> > In general these look really good, thanks.
> >=20
> > I wanted to note that the above is now incorrect, rust is fully
> > reproducible. There were points during development where it was not
> > but
> > those issues were resolved. These known issues can therefore be
> > removed.
>=20
> Thank you. I must've misread the log or got the order wrong. Anyway I
> will send a v2 without this.

We changed a few times during development so I'm not surprised it was
confusing! The end result:

https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest/cases/reprodu=
cible.py

is no rust restrictions (or anything else) in there.

Cheers,

Richard

