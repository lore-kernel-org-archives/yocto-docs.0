Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0907BD59D8E
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 10:12:12 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.42420.1732615921436890005
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Nov 2024 02:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WN9AbYkB;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so58938551fa.0
        for <docs@lists.yoctoproject.org>; Tue, 26 Nov 2024 02:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732615919; x=1733220719; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cvk9h9UdwfGP6gfYUhlLXiaziA7iHz6Z5SI3wcZ8rDU=;
        b=WN9AbYkBRsYi1rZO6KRCqAIfv2b4IDV5jvW6JIlr1Ofy2aw3CPEdZniJWeMGdg6TWN
         ernigkX8MKlOSkG3s/sMjekxGnb7X3sFkiEsPpvUHqDkf/Ga33zeT/uYW6FoVMm1pKgT
         5UOfYxBLGvrWJGRUhuTScH8SX7Pj9Mq91ouA+q8XuOEYMYvSuLaolH9OBp6nk1jlQiU9
         sQN1pz0qzMTTqT9tANQyp49wuzFiRxRwTCHCVTnEIsHvHLU5VsydlH1YR8VHOA+8jEkL
         IC4MWYumhEiYO4z2SlsOgfOddrxb8EFhp1FU8sDvp3jM+nYLO4k3EbSVpaSZxyEaLomR
         tIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732615919; x=1733220719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cvk9h9UdwfGP6gfYUhlLXiaziA7iHz6Z5SI3wcZ8rDU=;
        b=Tqcn0D7i5XMCvkD0h62bqq+w794zmAL4YhllpEmiI7vqD7jXMojh5OReD9cUQfHrof
         FUqtfNAuyXUwp2185tjJZwwCnr75xfEHeRMl6FU8ccsNng1TBJ2H8rfSqbYftaU/8WNr
         1NRJruJD4XPkT181YwURuy3v3m60nJ5aKTzABJKQ9sGYdx2yf7j61ul/+xTo3dQY4RDZ
         +1PFC7yIyYyiEfxryu9tdOOs3y1pIUoj9ky2S4bSSDmNKT0uWZOrf4+LYyZ8PT5j0h26
         pmbrb5mAnwDmy2DZz/Zm26NM1gCfYLpLAmxT6CfPO2LdRHqdm5PtmN5O9x4ueUgL47MW
         yaZQ==
X-Gm-Message-State: AOJu0YyE2KxqztrTu+xzMNGY1+g6facaiCL5b5nxPWNEQeAt9FG/B1Tl
	ViistQEsG4ZAJ1UIB8HUTVFh3AXFPVKz2ots6tmxDDcYX6Hf0ofOVGyxdC3VX28=
X-Gm-Gg: ASbGncvKqo6h0yZ2r8rKNBv3UR49fWb48YPWE0PoSmI34DDxdMJn17BstNiTt0u5QcC
	Xh57ekbnilQ8gloRXIaBI/oxIvp4ghCC+02hye+XKuLyKGajk9WSTrm6hEpqEnan6RoObfxniDb
	JP/CgxrqPGwWSmPTCJNwbd9K8oQtgve0vYehz5t/MYoOw0sJ/nCfpcYQXmIkOMtaDSyMJP4had+
	ScDvVLUYHmVeAxIktGSQOcF1euKHt8XtaavrWf8MuF+53QyPvDgzhYS29q3c1DCaWd0uaTaLs5F
	AxIY9Ef1a6cYc4Gzhw==
X-Google-Smtp-Source: AGHT+IHgfXyY5IOSRCuGdIylpcsh0+j8gYmQIMbV0RgXKa6zHMXLYrFWQ0bsAvgbCAuIOKz9ZyPqKA==
X-Received: by 2002:a2e:7a0e:0:b0:2ff:a928:a23e with SMTP id 38308e7fff4ca-2ffa928a3ebmr63349071fa.25.1732615919575;
        Tue, 26 Nov 2024 02:11:59 -0800 (PST)
Received: from nuoska (82-209-143-214.cust.bredband2.com. [82.209.143.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa7c76a83sm17599931fa.71.2024.11.26.02.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 02:11:57 -0800 (PST)
Date: Tue, 26 Nov 2024 12:11:54 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] variables.rst: document uki.bbclass variables
Message-ID: <Z0We6uLcIYDteLm0@nuoska>
References: <20241126082906.291040-1-mikko.rapeli@linaro.org>
 <5de7e392-8c41-4d34-bc3f-1597343d46bc@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5de7e392-8c41-4d34-bc3f-1597343d46bc@cherry.de>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Nov 2024 10:12:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5815

Hi,

On Tue, Nov 26, 2024 at 11:01:17AM +0100, Quentin Schulz wrote:
> Hi Mikko,
> 
> On 11/26/24 9:29 AM, Mikko Rapeli via lists.yoctoproject.org wrote:
> > Documentation for the new class.
> > 
> > [YOCTO #15650]
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=15650
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >   documentation/ref-manual/variables.rst | 32 ++++++++++++++++++++++++++
> >   1 file changed, 32 insertions(+)
> > 
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> > index ec4d7ab73f..9dac0b2d25 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -9846,6 +9846,38 @@ system and gives an overview of their function and contents.
> >         passes and uses "all" for the target during the U-Boot building
> >         process.
> > +   :term:`UKIFY_CMD`
> > +      When inheriting the :ref:`ref-classes-uki` class,
> 
> I don't see this reference defined anywhere, which we should have in
> documentation/ref-manual/classes.rst so that needs to be added as well.
> 
> EDIT: this is contributed in another patch, https://lore.kernel.org/yocto-docs/20241125153415.282847-1-mikko.rapeli@linaro.org/T/#u
> 
> Having both in the same patch series would have been appreciated, or at
> least mention in this patch that it depends on another patch so we don't
> forget in which order to merge them.

Sorry, done in v2.
 
> > +      `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command to build
> > +      `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
> > +      Defaults to ``ukify build``.
> > +
> > +   :term:`UKI_CONFIG_FILE`
> > +      When inheriting the :ref:`ref-classes-uki` class,
> > +      an optional config file for `ukify <https://www.freedesktop.org/software/systemd/man/latest/ukify.html>`__ command.
> > +
> > +   :term:`UKI_FILENAME`
> > +      When inheriting the :ref:`ref-classes-uki` class,
> > +      the output file name for generated `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
> > +      Defaults to ``uki.efi``.
> > +
> > +   :term:`UKI_KERNEL_FILENAME`
> > +      When inheriting the :ref:`ref-classes-uki` class,
> > +      the kernel image file name to use as input. Defaults to :term:`KERNEL_IMAGETYPE`.
> > +
> > +   :term:`UKI_CMDLINE`
> > +      When inheriting the :ref:`ref-classes-uki` class,
> > +      the kernel command line to use when booting the `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
> > +      Defaults to ``rootwait root=LABEL=root console=${KERNEL_CONSOLE}``.
> > +
> 
> Can we have this term ordered alphabetically too (just below UKIFY_CMD)?

Done in v2.
 
> > +   :term:`UKI_SB_KEY`
> > +      When inheriting the :ref:`ref-classes-uki` class,
> > +      optional UEFI secureboot private key to sign `Unified Kernel Image (UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__.
> > +
> 
> Same here, please move this one below UKI_SB_CERT.

Done in v2.

> > +   :term:`UKI_SB_CERT`
> > +      When inheriting the :ref:`ref-classes-uki` class,
> > +      optional UEFI secureboot certificate mathing the private key in :term:`UKI_SB_KEY`.
> 
> s/mathing/matching/

Thanks, done in v2.

Cheers,

-Mikko

