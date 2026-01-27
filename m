Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA91FD2D8F7
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 10:46:48 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7703.1769510801599830574
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 02:46:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VgHXmanE;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-89461ccc46eso97928106d6.2
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 02:46:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769510800; cv=none;
        d=google.com; s=arc-20240605;
        b=UgDUp44I8nw/VZ8QzKD+eSlnqk+/ZZ+KGsl9c8bEt+IVtWhg102PGiggPbXQCV6LYm
         AX7r5z9uek9g/wvtHO1w7tUt/GvrhTfMU/hp7nUP/0tGIiBZDrDSYZ/lGDhLkVoOiVTo
         ZgY0eHU15oIAkX6cZ6Z+6wX0VRiVlmRZprSwatFAAy186ltWHQcGDf8sx60bc3SGZIHJ
         8TUAqXMr+odpytCMp8yghAyJqx4ger8272Ro+hBIyb7YwA4NW441/G2mYexjFoJWSYuP
         tgHQDXq0geJUlP5Le/4mwv32BiThVt8suub0uLMZqYJvCoyqTqx04sgUpxaphB7XeOhH
         u2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GDtJqARYL5tTnhAZzQ/M7tcj0QG/dlz2RJEyUE30480=;
        fh=qk5tuIia7DAuK96E+uqn/Ipud//lSpWUaTFvvPIcKBc=;
        b=LEbsiwL5L/75aPtWY5QwfwNLd1tkeCMioyTfvjUGGxsxWDzC7pJumrCb39eAZEvMj+
         oSl+9tIOeF63QOjD7PIYs2lgw/iCszoGzih6xL3zj1KkUqc0gne+Xz7qSunVx+2uqF0C
         It7A5/7X+Gp9UxyjnclrFKIkPXuLTQ7HaDNk8ezDacutEwgBEmm+lX3/tcrhi3GXxP5E
         KSYRppjBn2AcfWaFuio6zyk9cqPjF3bIXByWCDu3H2e41bM9Umfa+EsiY++UriyJllq3
         2VyN6ioJHJmfymEwpRhjBmXQlUY5n9S2Q4tJilXVxd+RQETnshpGeslF3g95yeUbdaEj
         TyWw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769510800; x=1770115600; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GDtJqARYL5tTnhAZzQ/M7tcj0QG/dlz2RJEyUE30480=;
        b=VgHXmanEqmYzPxLFyGTchRb3IujPevjVf10xhH4idzlolbjIwctW8AnxqLvDcAvsk0
         JtWCSXE4uRqU5ZgNGefASNfVKextV4A5gKOtNl0ETWqY9kmsRxLPobzLiLejcFT5LEa8
         yaakC0jHx9+lB9jrY4oV7RNOtXoy8cIR11TXM0JuIgoIJc1YFzasbw+dUkHPi0mIYp5J
         nx1TZXZ6F+DEpXPiAdGZfC+pF7N6YVz61sWkUcNrVEsyY5wEuIb5sRS65xCPs7WUj2xa
         NupjmzkUj0oW5qKoh2QK4VTKKW1VGgE/1j9HXFXXYQ3y7dTmwjcnE7iNap+qK6OcWsF1
         njnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510800; x=1770115600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDtJqARYL5tTnhAZzQ/M7tcj0QG/dlz2RJEyUE30480=;
        b=OnTwjUmMl9qOro/NeGWqVph3U1ot/A+cHVp3Q4tXsbWIZF4Z2c3D0PnEF+asi4iYXD
         0nbus2uhnUyql+eArmMbW83OJ4f7JjaLWnBlKU+UKXd28yXcZJ1iYpPJRIqKvu4FmSCc
         0H9eibxivvH3+VEXEGP7UHCd1xbbV9EGF6zl6eMNs8KdmmWpf2jDGlIhDkCO7GHuKaV7
         Sv0hzWxRTOSKZ8iwhjhmSIgNNMTKbjJpPS1uLGOQ6wh+xN125IcjYMdAtEBZtwyOpHeK
         HO56b1RCggeKDksXRlAmxVY8IwxEeZT94Xb4+/ubMzZqK9ATOBswr7bVDohPWnK4CryX
         8/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIWGw+5aRezkHyYCHuBaRApFcjOUy7n9s+/tiLyUHf7tB1HQu6JMZIhlcpdwfG8PYi/gpA@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyKdqiDHarBk5uCw0OF+z++R6OmIF/FYJcP/JoumGRqxHJTUcqI
	doszQCfUUkpGxm6/WrpuBB6ox3VaMZWjfi80rvlTqUsTvR6A1Yl2t+m8aegYNBCsyw0mH3CzmGc
	Xaxpz7XDLitk4CV/shvoGkPVCiK+AosdWAQ==
X-Gm-Gg: AZuq6aJKSbs0wm4WYscdnn5BIAIrujIu7qOullELKC25o7c2g3UpST9lirW+dGcJDbL
	d1U6MVApsQTQiI5TtiA7/bf8tRSLPtqJ46Uy2+Elbrge8gg+mpIr4kzeSYFzDcpKiIh3BgmrSzr
	YmNnqS+5IojwIbWp1MoONAMK8xYyUKXXlpweS9L5mofwTAPZiJN1lXCOAmVN1hHhQrT6imb+/7L
	WQ1ayb3u+DbNKJwBcbXA3RfvoG572+JEGPx/bmIO21HdYlOO51OOBQALNWdqTtogEH9yxn9q5XK
	LMdUCsQh+j1IWGn2DRt3/if9FdZyIDT8JESaS5ec
X-Received: by 2002:ad4:5cad:0:b0:87d:622d:dd7b with SMTP id
 6a1803df08f44-894cc7cfd68mr16207596d6.1.1769510800625; Tue, 27 Jan 2026
 02:46:40 -0800 (PST)
MIME-Version: 1.0
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
 <20260126222743.411405-4-daiane.angolini@foundries.io> <DFZAUMTS82AH.ZQEHCQSFT7EU@bootlin.com>
In-Reply-To: <DFZAUMTS82AH.ZQEHCQSFT7EU@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Jan 2026 11:46:29 +0100
X-Gm-Features: AZwV_QgfoL3oLNCWBPlsaVhO_gtzI-noCLrmkYF5KwLMxqXek0ElS53XGsJYSyo
Message-ID: <CANNYZj9qjZ-3YV21-i0dcMeQDTKjwOvPNzVjC9mUtPuVCbvMhg@mail.gmail.com>
Subject: Re: [docs][PATCH 4/5] doc: Add the term Variant
To: antonin.godard@bootlin.com
Cc: daiane.angolini@foundries.io, bitbake-devel@lists.openembedded.org, 
	docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 10:46:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8727

On Tue, 27 Jan 2026 at 11:29, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> I think multiple variants could contains different set of layers too
> (bb-layers). So it's not limited to fragments?
> Also bb-env-passthrough-additions, etc.

TBH, I think we should drop 'variants' altogether, and just refer to
'bitbake configurations'. We can explain that a list of bitbake
configurations is formed by flattening the configurations template,
and when a user selects from that list, and further selects from
fragment choices, that selection (together with the layer spec)
becomes a *configuration instance*.

Alex

