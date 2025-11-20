Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4690ACF8860
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 14:15:56 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35033.1763648155063568418
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Nov 2025 06:15:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b9QeHOXc;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-55b22d3b2a6so558697e0c.1
        for <docs@lists.yoctoproject.org>; Thu, 20 Nov 2025 06:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763648154; x=1764252954; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=duCryiQiurrKIQI2Zq8deaL3WXTEVK62Jq6ew1ctIWQ=;
        b=b9QeHOXc2JYdXA2/Lhm4MNBIaeLvu6+QjhRkxyijFKe1lfiB87jR17VWYnHOBRYAqk
         y1ASGQkalEUTVYAlIbERdC5FVq2GyvlUT5mTZVkjq6zExH5mOLR+eVr7ymfccBRAGLnS
         SeZ8PzSb5VJyraMNeLlwAOsbyId5VDp2u/qhSPPh0AsX6+RhpaKPYDmzBvTiqa24O59/
         KDa4x+HHUYXURQ4bPR31FOBLZGibjQKJL+eHUlt0+29hugHJb4d3pfstjBmqgsn1MNTo
         r1k9RgMdS4wv6SbwKM8ZibRy5UFWyLiaKft16+UD40m57m/o5Sw7Fe9UNDpJjgZ7fue3
         N6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763648154; x=1764252954;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duCryiQiurrKIQI2Zq8deaL3WXTEVK62Jq6ew1ctIWQ=;
        b=lEywt7m71KsPlIGkOdOT2DxJ7BM6mc4QSblFdx4AxPAtpiWyEFUYkbKJrclXwBPnE1
         vdIJdqzdxLCYxdsCJbocJtkD7hf99bsfmiGPhF3jQ0uMpwcIijUmJjdCqC5vNUJarDh9
         wzcdGdmDGjM/TDWhCvZ0cF0ZWeJ0RDT/OGNEJWvANn6GMDQqeANrVbfGl0gWUvxufokU
         TkhEra729duAHJMUCwnH+S417m2gJh7psq5qqyW7t9eo1NfS4D0wMgC2vG/OXTYEJDi3
         Vq1pxjkCEHcSiMzqrztG4Av4rQ5e3jXh7jCPZnTyZ1IR58dWjRgHwv3QJzjKLDGlXOrj
         cyDg==
X-Gm-Message-State: AOJu0YzoS5y8E+wyBl2+yRxw9P2p6rhPglfwG6xpVgmJzzMsz+PubXRb
	dG+Oxaw8CMV9g1Aw7N4RMkBKaALr9mzj26mz1Tt0lpmjbtN6ckIEL5AWzvYkjNKrOI/4eNEJdr7
	sxfjbQxD9NG49f3xBslzhMp0p5xKsfB975sHQ
X-Gm-Gg: ASbGncs8vKkZ8jUw0QzkSHffYZRLWzZC+MSnuhtyF/F/+v6tj8ozLDoYF6FnXQYx74W
	yEF4V/GN43Uke3BG1MyAqch5A86PDADtV484WGclidK4tHL4miurhQgYYoAIfVYzp0Et26XqhQN
	LQfwhRuIXw5YqgF/tMaiaUQZL6kYfezu+DgNEK/8HonDwczxvPFED54d/ArU7xyA58meDKKYLr7
	OCB8au/s513bPfFP+0kSpamBFziZuzh0wN6Pca7bBJ8BnJSmFmf+Rbs/guPCVTI/XR+ueRKy4jK
	xuMKKRhtlmjznsTKfRt8Qjrf0w+kTg==
X-Google-Smtp-Source: AGHT+IG4ckA4dpID5MEP8yZIiz8ClDdYf6N/9uJsQXVdp7o5D+LbdO9m6NM4Rcgas0dNER6oILkk/5MSjLNwacEfXX4=
X-Received: by 2002:a05:6122:3d0b:b0:559:a247:8c8b with SMTP id
 71dfb90a1353d-55b81a741f1mr769757e0c.8.1763648153756; Thu, 20 Nov 2025
 06:15:53 -0800 (PST)
MIME-Version: 1.0
References: <00a37b3f-b40f-f58c-3af0-3512f1f40c2a@crashcourse.ca>
 <CANNYZj_sH4Pt+aaOP7+2oPibC32QbrYyKYZaKc2CDcVNrExXnA@mail.gmail.com> <1ea46cbe-beb1-3837-9c0b-26735a3cccc2@crashcourse.ca>
In-Reply-To: <1ea46cbe-beb1-3837-9c0b-26735a3cccc2@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Nov 2025 15:15:42 +0100
X-Gm-Features: AWmQ_bkvELxZEugy3BR7oAZtY_Jp8_cTgZ6qzYdpokvh1gO-IaixYD1ZYtRmpqw
Message-ID: <CANNYZj8BJBsYdJZhmf5JWY_=szKdpmKOrPt_zsAmBHAsF2-FYQ@mail.gmail.com>
Subject: Re: [docs] "bitbake-setup" suddenly works differently from QS guide
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Nov 2025 14:15:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8103

On Thu, 20 Nov 2025 at 15:07, Robert P. J. Day via
lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
wrote:

>   based on what i learned and posted in my followup, this change seems
> confusing if the name of the generated directory depends on the order
> of initialization. but if that's the new standard, so be it.

People wanted short names. There's no way to make it happen without
causing name clashes, so something to avoid that had to be done, and
falling back to the full name was the obvious option. The tool prints
a notice when this happens so the users know why they're getting a
longer name.

There's a new setting you can enable to revert to old behavior and
make it stable. You can also pass the dir name explicitly with a
command line option. Or you can type it out when asked.

Alex

