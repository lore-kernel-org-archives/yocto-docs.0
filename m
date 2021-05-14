Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.10924.1621008582640059647
 for <docs@lists.yoctoproject.org>;
 Fri, 14 May 2021 09:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UG8+TuXf;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.52, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f52.google.com with SMTP id d11so30510104wrw.8
        for <docs@lists.yoctoproject.org>; Fri, 14 May 2021 09:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9FvQRfz9dz7hX8qWL7A/f7WNEIlG45xDy2xEFBoX0JM=;
        b=UG8+TuXfU/IQI6MUANhXGh4vfE8BxlSLbMQmbMgoKislRZHiluWRTsnZpRC0ubL1Ns
         DIJZHdjUxEk2E+wogQDa+18FAHZIYO8Go+znzPKSNXLHMKsbTTKBbdyhfPMVEbvCpPpb
         YSn/uUx3SLXMx7wVt4OXATKH/ugxKhlBSpzerQMVOWE2hcGtgbk348vatFnSSqAtRdj5
         Jx1JcoFYAQ+oszkAs8+uwNQqTLfZFahxaJEoXBBK2BizAJJyuxV/9vj6fiOKVhqzP/6d
         E+hwZQ+3uHxel7xu6SSRHMH1Ney2B2rs3nUj1+QFFjGir/+yeLhYBtSOvaGJaTHJPM9l
         C9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9FvQRfz9dz7hX8qWL7A/f7WNEIlG45xDy2xEFBoX0JM=;
        b=JAJerJDmNpJgY6CX03HiXvhl57+ddBHhT7lHvEPEL0jshbRI6RlWwapLawBfdkW2j9
         NqjMBOaorr68mwh9kor7i0JQeBegAmwnV3YEz8dVT9ids2XSDHk3zBsRpD7o9UEuh5a8
         q75A/JH0FKaHZM8odtoDG5rSPQBe+mkgzwOwdb6VW7o5Fggd5Uxhbu+krMFQnNijyArx
         ZTqYrAOO1iMao4RRPUFV8qcM/OUCERSAt1bPhFdn7mALdp7z/TVL2phVLcivvLxpy4ia
         ARhUTyb2B90XmeAv6LY5wV3Pmi8dAUnFpHFIa33ytfXrVkyo1XK5RYPrXKVd74QsTbKY
         rslQ==
X-Gm-Message-State: AOAM530iMidmfyFBFwM+MsdNEdwyoxUMY28qSbEtY1dY2ebrzyk7i4uo
	UTXq2EMzRAVe9VqLotytXS46RqojaVNA/8njx6KN0A==
X-Google-Smtp-Source: ABdhPJzsMb7L3xFPgriYznoUAiUQLXNAmdYfERLzQn2FftFDqwLECdAZQSC93T6Zk9NSaT2UWEnJxB/gwyXmZn6g5j8=
X-Received: by 2002:adf:f788:: with SMTP id q8mr4649541wrp.205.1621008581073;
 Fri, 14 May 2021 09:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620838359.git.steve@sakoman.com> <07669400a5affa6bc19a5bfdea9ebc05db0b07e3.1620838359.git.steve@sakoman.com>
 <995ed3d0-0f9d-5780-bd69-e7b4a2975239@bootlin.com>
In-Reply-To: <995ed3d0-0f9d-5780-bd69-e7b4a2975239@bootlin.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 14 May 2021 06:09:30 -1000
Message-ID: <CAOSpxdYgWptnMrUR=GTS5tqJ7aJY59gkygq5r0KSeRv7oYi+Jw@mail.gmail.com>
Subject: Re: [docs] [yocto-docs][dunfell] ref-system-requirements.rst: Add Fedora 33 to list of supported distros
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 13, 2021 at 11:19 PM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Steve,
>
> On 5/12/21 6:54 PM, Steve Sakoman wrote:
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  documentation/ref-manual/ref-system-requirements.rst | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
> > index 65234d072..bb688772f 100644
> > --- a/documentation/ref-manual/ref-system-requirements.rst
> > +++ b/documentation/ref-manual/ref-system-requirements.rst
> > @@ -55,6 +55,8 @@ distributions:
> >
> >  -  Fedora 32
> >
> > +-  Fedora 33
> > +
>
>
> If Fedora 33 is supported in our LTS, shouldn't we support it too in the
> next release? I could propose the same update to the "master" branch of
> yocto-docs...

I suspect master has more changes than just this one!  Taking a quick look at:

https://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/tree/meta-poky/conf/distro/poky.conf

shows that there are some additions as well as at least one deletion.

So, yes, master should be updated to reflect the current requirements
in poky.conf

It may well be that gatesgarth/hardknott aren't quite correct either.

Steve
