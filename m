Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06397C98321
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 15:55:46 +0000 (UTC)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1687.1790265344056218576
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 08:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eWYhwj7p;
 spf=pass (domain: gmail.com, ip: 74.125.226.235, mailfrom: twoerner@gmail.com)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-98514b4115eso669241.1
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 08:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790265343; x=1790870143; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E5IMQRRnjpHwdt3ha3GXI1tMB7gpYSmNnmrSSCBGmBk=;
        b=eWYhwj7ptjjtkr+mcMakY0Q9sHTPH9SZ5//9oQVgkRrjJxy0L0pbhQvnDoQpXNR6KC
         wNleRK66fc2SxndiSfaldYoxzl+xfRclmQ8+fGt1dFtCe0M/8Z1OfoJd+oUTUhzm01MN
         KgcaDtXyPaPm21O9uBQ7hxn/UzJKBDrnDsgk3betpUtFvk6pTSLNc6ON+Yc3AsVE5rBv
         y1M4kFl/CacBW0IJdH4c5ZRO3qhP8Ahp6eFUJoU5eymbdZ1obAQ5W5dpw+maiYeGiOq6
         llluAiwloUcZhGk+l+MYZdCxP2dH+oGHi7vsicajSyNm4FajLLAzQxA0VF5cLTN2pzAp
         MVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265343; x=1790870143;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5IMQRRnjpHwdt3ha3GXI1tMB7gpYSmNnmrSSCBGmBk=;
        b=w53DXeIxbfDVrDQybxlmUv0uF0PUDQKSo6WDeX2ou/befSBTgeTsxSUTwLblcJ63GQ
         l6Z120d/1qIoq7KSBCwbVBu0ThOghZO4IsBIXwk2uJTXKFNxh+kou+edpqswaaQAzA/7
         qSFmqJ583dHKuRIQloFDQfcGpxI2gr/bJrrySN19YFbDJVk5KtVfE9QkpSlxKlnTLren
         zEX9VgH5p8VFxnavF7PXfg612G7A/3LC5V7CjlYB3JGTxRfDktIL9o4FpNz2m4BEgJwh
         YQSn4MXUrYsmbm26VraD7BTbXTZCf/TdaEljtINTi1qOPpXx6Dv/KMlFzYvJJMl7nylu
         wlAA==
X-Gm-Message-State: AFuF++m6Q95EMD9OI1mlZUxrZ/JaBi4RZScCofVv6KqkP2+h3NJh0gz/
	1Ugl56czZV72vTl9Mgpn/ysqEvDRJw1UG3oCu0IRa0k3LI3RTL461Zpg
X-Gm-Gg: AYBFou0ClofkGVNKye5WK6IpjMjEBKi57oMF9XQJ7TE6ghYKOZYZ5MNKlGDLKlFI/BD
	rZjUudoIzB6FVXR5k68fzF1xqFyVnnHMfwcma2l3F7thsuRC7cbuvyaKv6iaymNI6DJyeTJGS/+
	naUFCEnsXw1sNxJqGZj6ZErQ+QdHDt+oMILINTAy9KKW4o3u+EpZs1kAPqIQ5mXSeJcEIxQo3+u
	/9UJdWbK3RHJFMxB+jkJB7Aj7UhUhyXuAchmJkOhZZ+m1su4Qggekro54kDGL48lVEyuicx/f0Z
	8tGPd9k0eZo9dfNNI+C+3XzN/X6KnZNEAnsC0A5y1Fan1MXXcXfqcGNnDmb+tqfHC4OAqpNwwmL
	z18uZkJ23tY+2RFLpKyX0BLes4KiWB0TPBQ0qj/TueosMBoUQso5DQgavweVF5p1to87a8wm0dz
	QiVgRamPtvvaK0HZswrTRdy9VwcG5B5JLGkardd9uGE3yPJDG02YyzH2FogqooJPRcVJp6Bb/Zl
	dzo2cF7c6/+UJYC7YV4l+0Qse92a7qoyxskmJFW
X-Received: by 2002:a05:6102:61c4:b0:7a7:b6a:b022 with SMTP id ada2fe7eead31-7af38bbded1mr753312137.22.1790265342994;
        Thu, 24 Sep 2026 08:55:42 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04c05b3sm7707418e0c.6.2026.09.24.08.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:55:42 -0700 (PDT)
Date: Thu, 24 Sep 2026 11:55:40 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 6/8] docs: remove real accounts from the
 examples
Message-ID: <arVH_CL40IlR7ZY_@localhost.localdomain>
References: <20260922183249.2433345-1-twoerner@gmail.com>
 <20260922183249.2433345-7-twoerner@gmail.com>
 <8c5111cf-4018-4e01-9043-b4c567091d75@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8c5111cf-4018-4e01-9043-b4c567091d75@cherry.de>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 15:55:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10619

On Wed 2026-09-23 @ 01:02:05 PM, Quentin Schulz wrote:
> Hi Trevor,
> 
> On 9/22/26 8:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> > Examples across the manuals carry the account names of the people who
> > wrote them, in home directory paths and in shell prompts that also
> > name a machine. Use "/home/user" and a bare "$", which is what the rest
> > of the manuals already do.
> > 
> > The autobuilder's own service account is left alone: the paths containing
> > it are about autobuilder output rather than about somebody's machine.
> > 
> > AI-Generated: codex/claude-opus 5 (xhigh)
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> > changes in v2:
> > - rebased on master-next; no other change
> > ---
> [...]
> > diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
> > index 185a63feb700..a36f849a0c3f 100644
> > --- a/documentation/dev-manual/layers.rst
> > +++ b/documentation/dev-manual/layers.rst
> [...]
> > @@ -958,7 +958,7 @@ above:
> >   #. Run the script directly with no options::
> > -      alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers
> > +      $ meta-alex/setup-layers
> 
> No, the path is known there and is important. If you prefer, you can modify
> /srv/work/alex/meta-alex all over the file to something that works better
> for you, but the path in the prompt is important.

Okay.

> Cheers,
> Quentin

