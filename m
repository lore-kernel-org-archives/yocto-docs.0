Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD4BD6ACD7
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 13:58:20 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.72184.1732715897782888678
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 05:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JIgzKyhs;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ffb3cbcbe4so46456231fa.0
        for <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 05:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732715896; x=1733320696; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQ60auRe++B3qUz0yw/89szBMfXfjrelyzRiSjzlKKs=;
        b=JIgzKyhs01EugVe/yTJeZqFdKfxzsToZLhi0idm3wWtTKSYVDmAT49WoyvqGb6xCVE
         DJjfreSEmN+PZGu8zNFrHVPjM20t59EFui0NSltqJTrIi2w4rpBXoCDWHHoYbSMkD17E
         6WDWbPsASDDkhNq9pWDteU7zMvTRmA2rJT6jwtSByGJDN1LDhqXq0rvz+tNl5Tncf4P6
         MJ5SjMtvt5Y8dIKn5YrDUDufEIsXtpZXNDE32RnA8PybOooA1+HWD3ZjEr9THYjImnLf
         Uay7dZc48fuoi/uRMt3no2ei1kYiXC/C1z2SmqVQcjFaPFPSP70zcWJNzKlD/q477L1K
         YsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732715896; x=1733320696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ60auRe++B3qUz0yw/89szBMfXfjrelyzRiSjzlKKs=;
        b=BAyuwSjd833x7qpqbCPGFBMajDWKWdfeyUwo6OgXPnxc05bQLs4R8Q31WLybDKnHl4
         ZFff1s1kJ0tFlTkokLeToM0ydgeooEW8q1dwCbEr0+y1Sfhp3qD8pQ8SgEAgpZr0lMvr
         6ef6/FNjKS214jVMeFSQKB+CFSn4kc3djSyI77o1PTg6whqj5h3BDEq+7p2O9msAdX1k
         llNAjOEJuhwLPw8KfXcGAwKVi8eorxiM8CRtV8dI8OkOelR2z06eaEiO2phBobvy3hTD
         tcqHo12pIDJQ4g6VTHz3ODhw5bDLKY9Q973tkOXDsl9sXbsg1fK7zyHa9mXqJIW36gov
         g+XA==
X-Gm-Message-State: AOJu0YxF0YPi0sSYS74KvVr4iWK5JQClVL8IHe334XAFbs5KIB+IfBEc
	Xbuh3sw6sXIuq0k6tG9RfBhHSv815fjuhlCKbLE6nuxfmkFUP0WSvq5kQbckONo=
X-Gm-Gg: ASbGnctKmvXNMXvGQD/KDb/QWG9rkFlhHp5/5OxNa/a8A1mnFC74BGlLUmpksCVLe/S
	/Zm+mPYSSc9QciyVZs6R2Awt9fMmZh9QsfCyPBo9CKCUntSSjagVOrX90Qf88oNUkVRzPkn7LKB
	teRYS2OEK/0nRQZDxKFWQbnVi+l0SpWFA+Y3Tn3BnpjLqMkiqb7kZMiV/I3OyLrxj+gzJxdGe36
	DJlUONqrN3tg+1Dl5HPu710oPYQAVVcf6LFm1xa9SgL/L0XnH+lGPRmUakCqadla9UQGY3BHJaj
	wnJmyV5z0LPONG1Bjw==
X-Google-Smtp-Source: AGHT+IHSNzUevyRgvzMe7Y63jWfEizGhnPSvfTXDazjnGJXFH8c8ziZXxlaNzoLla1T1H5s6yPqQ0w==
X-Received: by 2002:a05:6512:234d:b0:53d:e4d2:bba with SMTP id 2adb3069b0e04-53df0112030mr1768757e87.51.1732715895864;
        Wed, 27 Nov 2024 05:58:15 -0800 (PST)
Received: from nuoska (82-209-143-194.cust.bredband2.com. [82.209.143.194])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24811d5sm2294093e87.163.2024.11.27.05.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:58:14 -0800 (PST)
Date: Wed, 27 Nov 2024 15:58:11 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v4] classes.rst variables.rst: add documentation
 for uki.bbclass
Message-ID: <Z0clc_SQF3_hV9AR@nuoska>
References: <20241127112056.361318-1-mikko.rapeli@linaro.org>
 <D5X0EA9D59P5.91R819T099D@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D5X0EA9D59P5.91R819T099D@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 13:58:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5832

Hi,

On Wed, Nov 27, 2024 at 02:52:20PM +0100, Antonin Godard wrote:
> Hi Mikko,
> 
> On Wed Nov 27, 2024 at 12:20 PM CET, Mikko Rapeli via lists.yoctoproject.org wrote:
> > Documentation for the new class.
> >
> > [YOCTO #15650]
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=15650
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  documentation/ref-manual/classes.rst   | 50 ++++++++++++++++++++++++++
> >  documentation/ref-manual/variables.rst | 42 ++++++++++++++++++++++
> >  2 files changed, 92 insertions(+)
> >
> > diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> > index b92f4e4f20..ad22511b4d 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -3345,6 +3345,56 @@ and the `signature process
> >  See also the description of :ref:`ref-classes-kernel-fitimage` class, which this class
> >  imitates.
> >  
> > +.. _ref-classes-uki:
> > +
> > +``uki``
> > +=======
> > +
> > +The :ref:`ref-classes-uki` class provides support for `Unified Kernel Image
> > +(UKI) <https://uapi-group.org/specifications/specs/unified_kernel_image/>`__
> > +format. UKIs combine kernel, :term:`Initramfs`, signatures, metadata etc to a
> > +single UEFI firmware compatible binary. The class is intended to be inherited
> > +by rootfs image recipes. The build configuration should also use an
> > +:term:`Initramfs, ``systemd-boot`` as boot menu provider and have UEFI support
> 
> There's a missing backtick after Initramfs here, which prompts an error message.

Oops, will fix in v5.

Cheers,

-Mikko

