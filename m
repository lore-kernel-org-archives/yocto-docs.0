Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19F2E77180
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 14:59:32 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.103479.1733756367336506402
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 06:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HP/MfJYs;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8918ec243so45661936d6.1
        for <docs@lists.yoctoproject.org>; Mon, 09 Dec 2024 06:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733756366; x=1734361166; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+tCm8i2csGX4naXKHcAg3uZ+dz5dwrL0yNmut4jV4Sg=;
        b=HP/MfJYsBaoTC9PvDl2Iku/s8iBB48yrvJey55jhbrGD/YZl7+X/Djx/KHvPWxwXFq
         VJQFtaEzlBWlq+udAAGBH8mHWqiox+yyFjM/YodVcvFUEhSnaq2dRuO8woE6ifaMPRnN
         Mn1ax4OG8T2ZuW+c4PykS/jZVyATyfBmSPnytGxpY3cG4U57J2pR1zGydOa2R5y62FVP
         7lpi5yNQfEKh4TQQVCrYmutMzSh+RQTvF+SyGqNbW0PWG3Wi/SIhgnDk6BRUJ9+0988q
         7zkSLvV58YvZC5Tj1JrO7/og/qoEfgImdAJxYs1dGNYUEfsCyqJz5uN1LoRCl4MFMjY4
         PMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733756366; x=1734361166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tCm8i2csGX4naXKHcAg3uZ+dz5dwrL0yNmut4jV4Sg=;
        b=tMyB6yJs9TEdz1fg7UUZcistaL4ZmQTNbkUA0anvqxcReqBajC3GZbCKF72q2NkX/m
         wAR+HlYgn1rrz0e6Faq7Zo0kAWzdroXw8Ust6yBYvs/3nbZGjymjRc0ZaQwWKGMLDNVM
         NOKes8ClqTangjQfGaYnSnqqwEaiy0C7Qr2fW78qtaqj7qhc4ZrPFbhlyBd8yvn6QrY4
         OXM0OtuX7QBCZDGPxwahGUiCsVP3f/utIy+pis76jq/rMShPqslYroWXhuoja0kw87hP
         eBMBudpQXncZ4bm+at4pU+LFZNbTpVuSpzgHC6t6WBE7aYYRkV+N9o0619iGc4syiM6U
         3HaA==
X-Forwarded-Encrypted: i=1; AJvYcCUrk0qIVM0/IeK+cdXdi8ZGy08wp1X+2zga7nK8t7IkhIw1kfffmEvlhOoFwtLVSFt2eAtt@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yw+nxEc2wWh+C6zy5Jl3lThdYoXSs7B6ZnufZk6bhk0QyodRYwj
	HkH+5gI39I7tuuSduxFle0PP0K5TZbsVvQDa8Z2IO4lw23aami7PmDTcjHkOa2McJWZoAvrK++h
	HlXPn7cRO27tqM4+auAZIwjFegh8=
X-Gm-Gg: ASbGnctooV7hI+owMe83B0F4S0kX8r2eal+RgoiPIq4+zbFYZ/Bmb2oDjc68JYiC37M
	nkrjryHQ3vCwT3E97zhzRBqgMblayTz9frWqdqUpiH0NkBLbHmNmPNkogngH7+1lAuw==
X-Google-Smtp-Source: AGHT+IFSEDP6NXD6iR4Ynmx/jWIIh5ZZHHygkD4uNgTw1XLqFkKVPXcsJrONRAcV0Jklb160XLzm7ALgWmC9F+UM5dE=
X-Received: by 2002:ad4:5f8f:0:b0:6d4:238e:35b0 with SMTP id
 6a1803df08f44-6d91e314546mr12655696d6.17.1733756366439; Mon, 09 Dec 2024
 06:59:26 -0800 (PST)
MIME-Version: 1.0
References: <20241209133053.2494088-1-alex.kanavin@gmail.com> <e0d3f4c1-f252-44f4-9e45-dbfa13b41996@cherry.de>
In-Reply-To: <e0d3f4c1-f252-44f4-9e45-dbfa13b41996@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Dec 2024 15:59:15 +0100
Message-ID: <CANNYZj-LziSwSdKMCTkRQgwzHBM_TFoZhkKbx9Tvcf943zBS8Q@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH] bitbake-user-manual-metadata: add a
 section about 'addfragments`
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Dec 2024 14:59:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5897

On Mon, 9 Dec 2024 at 15:35, Quentin Schulz <quentin.schulz@cherry.de> wrote:
> > +
> > +   addfragments conf/fragments OE_FRAGMENTS
> > +
> > +``addfragments`` takes two parameters:
> > +
> > +-  path prefix for fragment files inside the layer file tree
> > +
>
> I assume you can addfragments a fragment from another layer? So that
> would mean this is a path relative to any layer's LAYER_DIR dir?

addfragments in itself does not add fragments to a currently active
build. It declares two things:

- what is the variable name whose value contains enabled fragments in
an active build
- where to find the fragment files in layers when bitbake is going
over items in that variable and transforming them into require
directives

There's an example below that shows how the transformation from
fragment names to require directives happens.

addfragments is not something users of fragments need to worry about.
It's set just once in bitbake.conf, and the overwhelming majority of
yocto users would be using bitbake.conf from oe-core. But it needs to
be documented as a bitbake syntax item.

> > +   require /path/to/core-layer/conf/fragments/domain/somefragment.conf
> > +   require /path/to/core-layer/conf/fragments/someotherfragment.conf
> > +   require /path/to/another-layer/conf/fragments/anotherdomain/anotherfragment.conf
> > +
>
> Can you tell us about a typical case this would be useful? I assume
> there's a reason this was implemented :)

This has been discussed on various mailing lists many times, you can
search for fragments to find those dicsussions. In bitbake docs I'm
only saying 'This directive allows fine-tuning local configurations
with configuration snippets contained in layers in a structured,
controlled way. ' and not more. The actual user-facing documentation
for fragments will go into yocto manuals, once the remaining pieces
(tools and tests for them) merge into oe-core.

Alex

