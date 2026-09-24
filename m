Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F09C9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 16:00:58 +0000 (UTC)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1851.1790265655047474408
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 09:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JQSxFMZi;
 spf=pass (domain: gmail.com, ip: 74.125.227.12, mailfrom: twoerner@gmail.com)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e33b917so1717996e0c.1
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790265654; x=1790870454; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LMTqDGvBve2YOxbWfmBT5is86Zpoyd1R8haGeAcucvg=;
        b=JQSxFMZivZ8V+xZLz+UM/Cp1w3EmgKstxLDlJ+/PjWI4oTrJOcez/X3RP1ur4VDFbA
         rfTUWNqP1i+I4h8f7sBwwNAgq/rTxnc4/9c1Y2eAAeaBt1LR4HMt5Wy5NeBChvTaT+eV
         a0UaUdN2TiLclFm9FyJVWGGT+xE2oormKGyUxlo0kVnmBGvx36Yx6objjew6qAF9cq19
         jgfsXVlwWah01pfnSj2S14yfJPKpI9XWfGr213q+KTT8/1EAQcZRZd7GBps5uPax09EN
         iMu/wdg4svcG5mHDGCFpFSYtlSfnjat5mYy+9EyZaRbUU6yYikrQkVGIWNunUA5+78Dw
         pmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265654; x=1790870454;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LMTqDGvBve2YOxbWfmBT5is86Zpoyd1R8haGeAcucvg=;
        b=ZBMXdWPa+sDW2Wp2mh68eyEwqMBpKc+evimRsbz4doHzVy3WDq1nCVC+vGnFGPSM7x
         elQnJc4qxeHH/004XmltUNkpuRPaTaGvL3y3/+TpmniWdIAU1H9PlBLYJUABp0vTmcRT
         up3D6E9TCXfhQeq0V7tS4kbl3S3TX2gK75bFiB9Cx/EoHJIXyoKgxhzvr5OQ/28FF47j
         PXdNaWwtN7tL8ecGodQBWkRDs+NlHoN1O1+KuZKTT0nv+MqhdodBywb7135lqo05MJE7
         38opDWabgzfvRVyIxElp26EnREq9kfXHFEtA8NwfzBjePPxnyciXvkHkDLhwrJT/Ln6F
         Yvkw==
X-Gm-Message-State: AFuF++nS6SzqgQhdqJv6x0SpCq5A6Gikt4zPoThj7L9vENgfmUSD3j82
	qPXhI26QvO7gFQSKAxFb/J3zm8xuGcha/MyDnhXDn68W0JJGFUOXQM37
X-Gm-Gg: AYBFou1Gtbxvb46S/fTqS32gNC9zESRhHqng9Y50YeCOw6a5kVxW/3d3CmpkHF3V1Wn
	j/kfTyGC1Q6MU90fNE8ismGaxvEt1zefjH4ugmX0SYcOwHoHXQ6gEc+eDKzsuhHZ2GWKOHvOgfl
	b/iizhdeJ4CCD+AE6WG8D2Nh9LSd9RFYKdzdXG99nWmfFM52ZdqzH3YPtCnm49yTHdE/qTbJbc7
	TwZJfe9bhcfF+/R8FCWoxBy7Oz0geHFdrB2Xp1Qiv+9aHi8M+/qJOMbIvE00TrAFIK4sjWeEKj+
	QdkOXylO6oF2Mk1O1KWG3unmPY/QKqrX41VBCNnXuoj8MmjTf+oibZeHRkIBXzlkw4G61JHVmnP
	lFoWm/7fRgxEXGHcrRLpnxcXXSu8Xf4piuTJ6e6I57GPWSVXV7vCcJRCdVDlCbYVGOxF+VFdvDN
	nQXqhVXyKYD6aOQn0XXNKeTy+zAePRuM/6CksiilK9V+IWwNU2Zekr24kQHRphhqVyWk56vyxYP
	kSFY9HSWXjn93bg6Vsyb/iTtDI0ie3CbRq3s7quHrL28m2TYYA=
X-Received: by 2002:a05:6102:41a1:b0:7a7:198b:6747 with SMTP id ada2fe7eead31-7af1edf02f5mr1379380137.28.1790265653894;
        Thu, 24 Sep 2026 09:00:53 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ac2a1ea160sm6924164137.6.2026.09.24.09.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:00:52 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:00:51 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 1/8] docs: give the root prompts a preamble
Message-ID: <arVJM3mkK0oJkN1z@localhost.localdomain>
References: <20260922183249.2433345-1-twoerner@gmail.com>
 <20260922183249.2433345-2-twoerner@gmail.com>
 <44f4e5bc-d59b-4345-a9cb-bedac8e30274@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <44f4e5bc-d59b-4345-a9cb-bedac8e30274@cherry.de>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 16:00:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10622

On Wed 2026-09-23 @ 12:17:36 PM, Quentin Schulz wrote:
> Hi Trevor,
> 
> On 9/22/26 8:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> > A bare "#" starting a line is a root prompt, a comment and a line of
> > program output all at once, and nothing can tell them apart. Most root
> > prompts in the manuals already carry a preamble naming the machine, and
> > the stragglers are what make the distinction unreliable.
> > 
> > Add the preamble the others already use: the machine the surrounding
> > steps name, or a generic "machine" where they name none.
> > 
> > AI-Generated: codex/claude-opus 5 (xhigh)
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> > changes in v2:
> > - rebased on master-next
> > - the SystemTap example uses a generic root@machine prompt; the two
> >    kernel-dev ones keep qemux86, which the surrounding steps name
> > ---
> >   documentation/kernel-dev/common.rst    | 4 ++--
> >   documentation/profile-manual/usage.rst | 2 +-
> >   2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
> > index 2a65055e2a44..fe2e42265f9f 100644
> > --- a/documentation/kernel-dev/common.rst
> > +++ b/documentation/kernel-dev/common.rst
> > @@ -722,7 +722,7 @@ the ":ref:`kernel-dev/common:getting ready to develop using ``devtool```" Sectio
> >         .. code-block:: none
> > -         # dmesg | less
> > +         root@qemux86:~# dmesg | less
> >         You should see
> >         the results of your ``printk`` statements as part of the output
> > @@ -878,7 +878,7 @@ Section.
> >      .. code-block:: none
> > -      # dmesg | less
> > +      root@qemux86:~# dmesg | less
> 
> This file is also missing a
> 
> root@machine:~# cd /usr/src/kernel
> root@machine:/usr/src/kernel# make scripts
> 
> I'm assuming.

Good catch, thanks.

> In any case,
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Thanks!
> Quentin

