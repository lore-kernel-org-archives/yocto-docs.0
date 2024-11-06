Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC552D44D5E
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:34:46 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.45816.1730900080632496254
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 05:34:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=VTJooiga;
 spf=pass (domain: baylibre.com, ip: 209.85.167.48, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f58c68c5so12162133e87.3
        for <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 05:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730900079; x=1731504879; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhFEvoUoYjvPqa6u/5fnKfBQd81BzAKGlzwFUl/k9Y4=;
        b=VTJooigaRvz9glaou7U/tNt2hWNywcRmqCfabuRxye/bw/4BOZBMOTdJ17HvXI96VN
         XFk940CMlu7DPJ3GLts2oxL1N1qdpEY0h+PjvwmkfdONACceZMfejeo/1FG006ytCvy9
         xSKsadcnxzjZrqMZ8j7YLh6XrrymffvlwLU+iRZj0/uVTjMrZGfSAUNNPTnB33ZvKHYk
         e1nZBkaVZ7uSz73VEwy4PAN7Hx6Yw7+cNFzAitC7KsfbvOuVoCIpD1Dwx+m924pwpFVk
         p4wHnSE1t33RKNK2iIcLsXSM+hiQas63WvoMVtRKTl2d0k+0x/vnBIfJHRGMrIZVtMuw
         0S5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900079; x=1731504879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhFEvoUoYjvPqa6u/5fnKfBQd81BzAKGlzwFUl/k9Y4=;
        b=WHdVfl9DWZYr45sEcQHN5Awm2IJCHFzdKNwT3FhuGqCtRz/xGyNj30dfqYFjF9EY+Q
         RhTYzh7NTRhgOCeHAy2zkOXzeo2nzT6GPXdSdAcfdMo0RbvjbcTW5rHLKC5rStV9B1uM
         EMVG213c0XG7mCE+6oXTEGBn97wRXmDEaX6WPgR4/fG5zAEMFg4/3UrR5BXERMyImthz
         ZdJL3gPnz1nsRBLF9So880lYrIZWzmR7ufHfnK4acHYN733ikqjTmymX1qSnhbHIfupB
         VX0vSU0om7a7WoIlNWTbsNLL8r4dCaUQGy0a1hwUddtmx59FXGUIwZOCxI2hkJvWJ34W
         Yz6w==
X-Gm-Message-State: AOJu0YzR0MGnIC7nRfWXJlWQlRKIdDrLlPD8oWDdlwtFBSnUGY+b128d
	aSrq7HtmPFX9RiScp9JIq6T0THFDdDBxuHTnM7FBEcJM4yTZkeY0svSSTZq5tLYpvRp0m+7GF6W
	3Dpq+UQ6tzkwpVi9EcKPM6gf6TmaWMW7ehlQQZQ==
X-Google-Smtp-Source: AGHT+IGHBRvoROqEIUiohoIK/hqxfYan1M3xDtOuVOmUE6bdeJ4mJ8jCJgUE8mnirRmYBFTnts9iAAOtnc1ZzCnv8wg=
X-Received: by 2002:a05:6512:1314:b0:52c:deb9:904b with SMTP id
 2adb3069b0e04-53d65e0b4ecmr16466496e87.38.1730900078662; Wed, 06 Nov 2024
 05:34:38 -0800 (PST)
MIME-Version: 1.0
References: <20241106-add-bblock-documentation-v4-0-9f24dfe69243@baylibre.com>
 <20241106-add-bblock-documentation-v4-2-9f24dfe69243@baylibre.com> <D5F0XZ9II0MN.2U9C8IQFOD6MU@bootlin.com>
In-Reply-To: <D5F0XZ9II0MN.2U9C8IQFOD6MU@bootlin.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 6 Nov 2024 14:34:27 +0100
Message-ID: <CAEHHSvadv3uyRciqnG2LwxVhRCU=CogZ1EYQof1WbWLJTXZR0g@mail.gmail.com>
Subject: Re: [docs] [PATCH v4 2/3] ref-manual: variables: add
 SIGGEN_LOCKEDSIGS* variables
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 13:34:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5696

Le mer. 6 nov. 2024 =C3=A0 11:30, Antonin Godard
<antonin.godard@bootlin.com> a =C3=A9crit :
>
> Hi Julien,
>
> On Wed Nov 6, 2024 at 10:02 AM CET, Julien Stephan wrote:
> [...]
> > +     Then you can look at files in ``build/stamps/<arch>/bc`` and sear=
ch for the
>
> Didn't notice before, but it should be ``tmp/stamps/<arch>/bc``, right?

right, I forgot the ``tmp``. Should I use
``build/tmp/stamps/<arch>/bc``  or ``tmp/stamps/<arch>/bc`` ?
I want confirmation to avoid another round ;)

>
> > +     file: ``<PV>.do_compile.sigdata.09772aa4532512baf96d433484f27234d=
4b7c11dd9cda0d6f56fa1b7ce6f25f0``.
> > +
>
> Also, how about s/search for the file/look for files like:/.
> The current phrasing makes it look like this is only valid for `do_compil=
e`.

I'll fix this also in the new version.

Thank you

Cheers
Julien
>
> Otherwise, this looks good to me, thanks!
>
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

