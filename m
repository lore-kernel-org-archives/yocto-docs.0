Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FBDC41513
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 13:50:31 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.16030.1716472224544577538
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 06:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZGV65dkQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-571ba432477so13352046a12.1
        for <docs@lists.yoctoproject.org>; Thu, 23 May 2024 06:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716472223; x=1717077023; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PDVGw9YpqamgZGNftPZhz8LiNZi5EbwKeXMmh3+FbQg=;
        b=ZGV65dkQ9xgKWFBDycsEzCqVzG4YzKZ/pOb4iXvM1ogpPlupmNzOENolLPjQ1RBAg7
         Yt75bi668BlTcMLE8VwOxtDfNmkxwQEQppg+kd1qHB5yT/Ip8v0syb8Q1cjZzKCiuSZ0
         Ugs0uklbRhIl/Tn+0wBAuS4/YCvg/Xig+1QEabrt/1qZNoAKMF1Uutagr0f/nDajA/0H
         hBHeAO2seI+GVJf2EBWH45EUdzSA5VPVXsTzji/DhsbY5QAqucrT7z3H0PeW4Ykobyy6
         sHToULaLym809GRU5dpie0X4RYWRqHLuxN2wBgguMqVoNVF5RouC/j1THYXdlY9EfR30
         txWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716472223; x=1717077023;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDVGw9YpqamgZGNftPZhz8LiNZi5EbwKeXMmh3+FbQg=;
        b=KT3ROPanhncOAqamm44ytUUu/qiNxAyiedV2d7IQPkSSUStqCz83nBYyH6EmsIGjO6
         njkQQBdiRSMbYofPPLTFcnBXRyvJoLwBDyHMsjollSAPF4mUXOJdV9X5GESY+uSH7GtP
         06sLpSSK413CoDLZmSJu2IttMzVGQxpzoc16O5lBhp+MnEkNnuUgCkEwIe81g8LxXJ0w
         8/8O8s8kSNOCavOp9FA80ThxC02fP3F5st2UI+ueDGWW6jEo/G6Y/oleuNlb+xX6ZDNf
         wKbtU9JDMG/LASwMkGYWSQ+kfrLCbPtYEUmRgqPuJvFFhnRGBkW2FypI9wi5wBJy+aw3
         xpbw==
X-Forwarded-Encrypted: i=1; AJvYcCX4ThBsoXAAemzaMpxUyVwXChPf+4F6q8NvMTTXchsZiqWdeZz7rlu4VxolAug6+f3AsvJRPHh22rCqBWqzMnbmZ2kjjAQAeKGgY5s=
X-Gm-Message-State: AOJu0YxMTbO+ULo/jGO2KY3U1AWpwvWH018r6noD/hH4Y2gNSlgA7JrA
	et+xDCAbJZmWr4VrpUgarC4ESsdNeaKz1kInLaHJ31jVL0n/pVpi
X-Google-Smtp-Source: AGHT+IHK66Br1ecEZZCgRVcuFNX5CB90dTjdoJhwxutI7sc/legAprAMbTtQPjY1wCalj3Qvfr2AVQ==
X-Received: by 2002:a50:9e2e:0:b0:572:7c99:a280 with SMTP id 4fb4d7f45d1cf-578329e295cmr3354464a12.15.1716472222683;
        Thu, 23 May 2024 06:50:22 -0700 (PDT)
Received: from gmail.com ([85.235.16.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-573413b2ac3sm19779810a12.38.2024.05.23.06.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 06:50:22 -0700 (PDT)
Date: Thu, 23 May 2024 15:56:33 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
Subject: Re: [OE-core] [PATCH 2/2] ref-manual: classes: add new
 image-bootfiles class
Message-ID: <Zk9LEdzTFcU22mH6@gmail.com>
References: <20240521173343.2954628-1-marcus.folkesson@gmail.com>
 <20240521173343.2954628-2-marcus.folkesson@gmail.com>
 <76a18407-d650-47a2-b8c8-f639350c3630@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <76a18407-d650-47a2-b8c8-f639350c3630@cherry.de>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 13:50:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5241

Hi Quentin,

On Thu, May 23, 2024 at 03:33:00PM +0200, Quentin Schulz wrote:
> Hi Markus,
>=20
> On 5/21/24 7:33 PM, Marcus Folkesson via lists.openembedded.org wrote:
> > [You don't often get email from marcus.folkesson=3Dgmail.com@lists.open=
embedded.org. Learn why this is important at https://aka.ms/LearnAboutSende=
rIdentification ]
> >=20
> > Describe the newly introduced image-bootfiles class.
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >   documentation/ref-manual/classes.rst | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >=20
> > diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-m=
anual/classes.rst
> > index 9520d0bf7c..53b3697bee 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -1169,6 +1169,20 @@ Yocto Project Overview and Concepts Manual.
> >=20
> >   .. _ref-classes-image-buildinfo:
> >=20
>=20
> This isn't the appropriate name for the reflink, we should ave
>=20
> .. _ref-classes-image-bootfiles:
>=20
> instead, to match the actual name of the class.
>=20
> > +``image-bootfiles``
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The :ref:`ref-classes-image-buildinfo` class copies over files listed
>=20
> That's not the appropriate name, it should be ref-classes-image-bootfiles
> (it currently renders properly because the reflink is incorrect).
>=20
> > +in :ref:`IMAGE_BOOT_FILES` to the /boot directory of the root filesyst=
em.
> > +
>=20
> Tick quote /boot:
> `/boot`
> it;'s not meant to be understood as an English word.
>=20
> > +This can be useful if no separate boot partition is used but all boot =
files
>=20
> Replace "all" with "some", it depends on the content of IMAGE_BOOT_FILES,=
 so
> we cannot say "all" here, it is misleading.
>=20
> > +should be included into the rootfs image.
> > +
> > +:ref:`IMAGE_BOOT_FILES` is the same space-separated list of files used
> > +by the ``bootimg-partition`` source plugin to populate the boot partit=
ion.
> > +
>=20
> I would not mention this here, rather edit the variables glossary entry f=
or
> IMAGE_BOOT_FILES to mention that this is also used by image-bootfiles.
> Also, it seems bootimg-efi plugin uses it, according to the glossary entr=
y.
>=20
> > +.. _ref-classes-image_types:
>=20
> This isn't the appropriate name for the reflink, we should have
>=20
> .. _ref-classes-image-buildinfo:
>=20
> instead.
>=20
> Cheers,
> Quentin

Thank you for all the comments, I agree with them all and will update
the patch accordingly.

FYI, I will drop the documentation patch from this series and resend it
once the class is ready for merging.
It was suggested by the doc mailing list (had to resend it as I was not
subscribed, so it is not part of this thread).


Best regards,
Marcus Folkesson


