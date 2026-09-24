Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C9BC98318
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 16:00:08 +0000 (UTC)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1814.1790265599963853184
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 09:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p2NSNOkD;
 spf=pass (domain: gmail.com, ip: 74.125.227.43, mailfrom: twoerner@gmail.com)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-79028ca9371so838828137.0
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 08:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790265599; x=1790870399; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KWIcIhG2o6EKYhsULMrAJA7ykfTi/hb+LuiST0sRcjw=;
        b=p2NSNOkD3t8+yBcSWzVFJoP9wzV42tz3bLdCwgSPT/EDsVJspaaLEG+YO2CPy+GKR3
         MexPCzWVu69ifv9npKAVW40L3N54kRJ5OCYeLwiCkyvoZenKeDLqCIzm8K6uY+/lIzc1
         lva6TvYem2x+weY6nA1J43726yW3FprTS0Du8tOrwuklmzqWO1CtVwPk/7P1AWqAfIN1
         m3WJWbXPKCs4cxf6dAVj/5kV41Vq83enlAOaSvSRucusQ7kI+G5NKNcwc0B8kxp8iZXn
         gwArE2BEjODr+e2G3y9efrr3mPYOe4XDwTl2gGLeB5Vjt5hCI7Jz1sPr8/4CtTNuZZnp
         Ng8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265599; x=1790870399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWIcIhG2o6EKYhsULMrAJA7ykfTi/hb+LuiST0sRcjw=;
        b=V+YCRrijCfVQ9uXu0nN9wxxv50HEVS0wzQoBT+s6eDHgXCWYv5T4zz3g+8DUfAt9By
         MbZ7WxqVJcw7z3LyqQz/Oyf1O4FPNZ5RO0F+nyGm4im/1dpoF+RPB2AfsD61pRd8EN/D
         XnLwPDHcQplja65EhC6wOjr1lvxa8iQrj+xCGipIJ72IoxDtmREbdXp6v8ozWvU9pDtB
         zhnEyeD9g/C+ii2yN4+RhW4TGWtgcTkBFrdqhYo39CfSfgIG27v9QkdXTSo0gsbe/c+s
         fvM1qrwOiANXoq0k3XhcriHarVLOT/Kb5ZwEe2jWdGe74q+zHMzXSRRxjIBDfjghDLju
         gzlQ==
X-Gm-Message-State: AFuF++mokk/LM0EWd4HLb1x2987jeRU6lfPyt4gKXF9zzT9kIIcCrOAF
	dCwZMkDFHS1mKjJzRHUqiJaKLWPvggCocu122kV0oPkjdo6bhwpiH/vi8B0htg==
X-Gm-Gg: AYBFou1Zry9BRZ6/tY2HMt6uOQywcHX5jEc7ZeBgBXUKMVBV/dvOhae8/d3LzU5zKHq
	4OsGQ5fYk+9LrmO2DYNi1DhFP3CV7AcxsYNOKl2V0o/wjAfMq3b+WDKm5CYnpwo2X/3B6gMZEKt
	imOX5mZZKpb2MLeFobQAVMkG04niTk37AVRLqKaEVA9J8Zge1HAas3ohrfPAltXAJMLd2yOWR78
	9s/9E5Y5Ian/ph5AfbzQ2KVmLT0aQg5RVxFGIJDbuBusRmRmC+FGH4Q/rMbGQj2oD1b0oqofEfC
	nGLEgtrXf8bCeaTyhoLV6cNJkcwoTQZjHJJALO/J57j0JW2KVL8wqgTODBjtQuUrsvaibJF3Us3
	bumz0Q/w86I4Tjn4oDbgZIo/fZDItIwuzfpeUBq6/kQHkh2YKNld4ckAva3ui/8X2NAumMbLwXJ
	N2iKHA4S6Ifu/Y/iQOMPsNma0aLAfLblnAH7LQm6g+6tTuszD7PdNDWuoc1zA7My7LunuTpecIc
	o9C+2YPCAL27CFaW8Bf4yEBIH5D3HpJWOn+qlJCSA==
X-Received: by 2002:a05:6102:3706:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7af1f619c90mr1405589137.33.1790265598766;
        Thu, 24 Sep 2026 08:59:58 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf5674f44sm7455180137.3.2026.09.24.08.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:59:57 -0700 (PDT)
Date: Thu, 24 Sep 2026 11:59:56 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 3/8] docs: show a prompt on commands the reader
 is meant to type
Message-ID: <arVI_IAsl5VFGdgi@localhost.localdomain>
References: <20260922183249.2433345-1-twoerner@gmail.com>
 <20260922183249.2433345-4-twoerner@gmail.com>
 <dcf71aea-ce33-42b2-b014-07bced443f76@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dcf71aea-ce33-42b2-b014-07bced443f76@cherry.de>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 16:00:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10621

On Wed 2026-09-23 @ 12:49:12 PM, Quentin Schulz wrote:
> Hi Trevor,
> 
> On 9/22/26 8:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> > Most command blocks in the manuals start their lines with "$", but a
> > scattering of them do not, and those read as a file listing rather than
> > as something to run. Give them the prompt the surrounding pages already
> > use.
> > 
> > Transcripts take a prompt on their opening line alone. Two things that
> > matter only once a line is a command go with that: a bare "$" at the end,
> > the prompt returning after the command finished, and a trailing "\" on a
> > Windows path, which a shell reads as a continuation into the output.
> > 
> > AI-Generated: codex/claude-opus 5 (xhigh)
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> [...]
> > diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
> > index c7d0fe3dab8d..73b7d9501ae4 100644
> > --- a/documentation/dev-manual/start.rst
> > +++ b/documentation/dev-manual/start.rst
> > @@ -423,7 +423,7 @@ your Yocto Project build host:
> >         replace the PackageFamilyName and your user on the following path
> >         to find your VHDX file::
> > -         ls C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState\
> > +         C:\WINDOWS\system32> ls C:\Users\myuser\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79abcdefgh\LocalState
> >            Mode                 LastWriteTime         Length Name
> >            -a----         3/14/2020   9:52 PM    57418973184 ext4.vhdx
> > diff --git a/documentation/dev-manual/wayland.rst b/documentation/dev-manual/wayland.rst
> > index 5e333b6265f4..3e1280943bf9 100644
> > --- a/documentation/dev-manual/wayland.rst
> > +++ b/documentation/dev-manual/wayland.rst
> > @@ -80,9 +80,9 @@ the CLI, you need to do the following after your image is built:
> >   #. Run these commands to export ``XDG_RUNTIME_DIR``::
> > -      mkdir -p /tmp/$USER-weston
> > -      chmod 0700 /tmp/$USER-weston
> > -      export XDG_RUNTIME_DIR=/tmp/$USER-weston
> > +      $ mkdir -p /tmp/$USER-weston
> > +      $ chmod 0700 /tmp/$USER-weston
> > +      $ export XDG_RUNTIME_DIR=/tmp/$USER-weston
> 
> This is to be run on the target as far as I could tell, do we also plan on
> using $ without a user@host:path$ for target commands as well as the ones
> the user is supposed to run on the build machine?

I like the preamble; i'll change it.

> >   #. Launch Weston in the shell::
> 
> Right under this context, there's a command to run which doesn't have the
> prompt and needs one.

Good catch, thanks.

> Cheers,
> Quentin

