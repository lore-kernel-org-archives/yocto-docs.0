Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FE2C3ABCB
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 21:01:27 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.61422.1747083685137151185
 for <docs@lists.yoctoproject.org>;
 Mon, 12 May 2025 14:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RH7F3039;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so71071726d6.0
        for <docs@lists.yoctoproject.org>; Mon, 12 May 2025 14:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747083684; x=1747688484; darn=lists.yoctoproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qM2V6Wd6OGTJR1C7+670tAE8CmX8yMtnhEY6Z3n9WfI=;
        b=RH7F3039IJfkxwnvpCRcU5Y390OEftFVX3ODL15w9d3LzH15Z6yeWPhHGgDd0ofN3X
         OSVA9lIiUYxPCkBAYlnYFwxE7oey4dsEJYoBRuFe94ijllYx0uGb284J3l+KdvDJgWQd
         RKjMzNMHtdsYEdQD3WPbB2IdPL4BtNUwjDjzGmtBpi12O+4f79v13hDKWl5gx19lzi23
         Z96xUI7LEnyyhMUkkJcik3blHD6VFWEDVebx5L93MRxQKDTGaTzqvlYzRtaaxbkMjmL1
         o8bRMwEr8rSR5l36kXqjdDuSryDDhXQ1LSmtCqw/7vesNKavMQwr0AJ7OtNz9Bu2itlU
         +3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747083684; x=1747688484;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qM2V6Wd6OGTJR1C7+670tAE8CmX8yMtnhEY6Z3n9WfI=;
        b=vaUNa5bsu+CXya4hK38PChqxztekBGPXzrARiIv3/m6PgUOUbx8SXz0rG+APWMWeKu
         fXnipQkXY2+BOvpirekrwF9WHFmC6pqvav9ztaowLhS1Go8htk2DQleEOlfqciFt8fhR
         4Ai0r3zELJU/Ix78b3y0s5LEfEa8eYC0a4Mpq6Ms5c/X4F7VUdgt0A7DByfuPbQaIJyv
         PCs17VqOwgSNnsWC/+bQP91KXIu9pNOK+WvpxtMXu+HfJrHox2JolCnTp1dNRs1owVfB
         QHz79TKClxj91EEc4rhwVwizFZM1VYyKSOIOyA7LTCttdljrM9X+wuZXGgDLQ0LMHkQz
         zWOg==
X-Gm-Message-State: AOJu0YzmRZH3DM4opUVoz1dwIfNI7FKOKMyYyqslw0PWCkvT7yxIgm8C
	UJ26W0stwIPesx7fhk17aFUzKnTB7l40MbDZmS59samwPGNi5S778okNRw==
X-Gm-Gg: ASbGncurI+Imv536II4fRwjxYlK4u+9VvryrqmE1zYfs2/8d8bycdiSAXzdnDzyPrLE
	Owb2y13M9RkMMx36HYg54bFDTuznRbVhnBtQBgXSQt0tPrYkE5QMMIINEB83vM7EtyWslzUTivx
	mSzkn168E0z2WnB6a7fWGTdA26CXt6lOozaWrg3g8cXBKjWqifPU//QeLzySdVLx5RFdo1DdAu7
	ducDu4q8q145ewgFVpS9WtBDjTd1WNatpOD56qwRbHDGhJNDLflN50mx0x6jI3Yf61UyV8YCdy/
	3P2EGbufu1bX50OUBSdFMjxfzOVCiYpuiTj71ju3a5VhGWhKrseHT78GXlD/3y8DKwYhfvvMGvf
	9qOo=
X-Google-Smtp-Source: AGHT+IHpnjiaMGjinqpU4ooFZQR34iBttT/PPLMQK88AOJFp9aLoBSyHU7I3R/yKRVpcixOCNObOQQ==
X-Received: by 2002:ad4:5aa5:0:b0:6e8:f3ec:5406 with SMTP id 6a1803df08f44-6f6e47c286dmr225419806d6.19.1747083683412;
        Mon, 12 May 2025 14:01:23 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a0c5e3sm57084146d6.63.2025.05.12.14.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:01:22 -0700 (PDT)
Date: Mon, 12 May 2025 17:01:20 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document
 WIC_CREATE_EXTRA_ARGS
Message-ID: <20250512210120.GA25174@localhost>
References: <20250506172300.19220-1-twoerner@gmail.com>
 <8ebddc9e-300b-4e82-8ff7-20328f06d7a1@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8ebddc9e-300b-4e82-8ff7-20328f06d7a1@cherry.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 May 2025 21:01:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6811

On Mon 2025-05-12 @ 09:31:27 AM, Quentin Schulz wrote:
> Hi Trevor,
> 
> On 5/6/25 7:23 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> > Fixes [YOCTO #15509]
> > 
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >   documentation/ref-manual/variables.rst | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> > 
> > diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> > index d17f81036b7d..29f34f5b029d 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -10942,6 +10942,24 @@ system and gives an overview of their function and contents.
> >         Specifies the timeout in seconds used by the ``watchdog-config`` recipe
> >         and also by ``systemd`` during reboot. The default is 60 seconds.
> > +   :term:`WIC_CREATE_EXTRA_ARGS`
> > +      If the :term:`IMAGE_FSTYPES` variable contains "wic", the build
> > +      will generate a Wic image automatically when BitBake builds an
> 
> Maybe we could point Wic image to https://docs.yoctoproject.org/dev-manual/wic.html#creating-partitioned-images-using-wic?

ok

> > +      image recipe. As part of this process the Wic bbclass will call the
> 
> There's no wic bbclass.

I know. That's why I didn't write "wic.bbclass". I wrote, generically, the Wic
bbclass.

> I think you meant to say image_types_wic bbclass? It
> would be nice to provide a :ref: there but we actually do not have the class
> explained yet so cannot do a :ref:`ref-classes-image_types_wic` like we
> could for image_types.

I didn't want to give a specific name and wanted to write something that would
be immune from changes in the bbclass's name. Also, layers might implement
their own bbclass that uses wic, so I wanted to include those as well.

> 
> > +      "`wic create`" command. The `WIC_CREATE_EXTRA_ARGS` variable is
> > +      appended to the internal "`wic create`" command to provide a
> > +      mechanism for the user to supply extra arguments to the
> > +      "`wic create`" command that is automatically run by BitBake.
> > +
> 
> A bit too many
> 
> the "`wic create`" command
> 
> to my taste, can suggest:
> 
> To allow the user to supply extra arguments,
> the `WIC_CREATE_EXTRA_ARGS` variable is
> appended to the internal "`wic create`" command
> that is automatically run by BitBake.
> 
> What do you think?

sounds good

> > +      One such useful purpose for this mechanism is to add the "-D|--debug"
> 
> -D (or --debug)

ok

> maybe? I believe this would otherwise break the search or not be crystal
> clear what the option is supposed to be.
> 
> Looks good to me otherwise,
> 
> Cheers,
> Quentin

