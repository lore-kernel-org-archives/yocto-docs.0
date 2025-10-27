Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA25BCCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 10:41:43 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.28748.1761561701307985735
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 03:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YjOUh68V;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-87c1f607e72so52692196d6.0
        for <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 03:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761561700; x=1762166500; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B82m5JMJUZi3uZvq4GfIwYt8VTH2/VOIWt5shMTI13M=;
        b=YjOUh68VLvum/UEzKAOUr90wLLs0pO4ve4gfzaIqRJ++tlPHAxN6PPIfd3wIlLQJ87
         2NJPJI2nIlSsZZN8oOAL1cQUYNVe/houfEw5Dlutvs51oza0x/iVNzVeVW8jKQ0F8W+6
         LYWDRof3izWkSVd7oEpwPjZaCFfD3Wv37jGQfIIslPo+FWhgX1z8D5qPpVa/+yqBIQ+n
         zcFIlSgzH5aHVlsqoxz+5HD6rkqcgZUgOnrfF0vFvFGAqgUE63zLSDmeF6wzFFodT7cS
         nbrdgMMkJIhCdpecq526rOEqmOl/svSigbukAdarZEW7xuNHG5i2lcBAlxhLDmfC5X8f
         464Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761561700; x=1762166500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B82m5JMJUZi3uZvq4GfIwYt8VTH2/VOIWt5shMTI13M=;
        b=n4zx4FT2C+2RKU/zjF0IPfwE6ZL+PLdgv5b1QaihAjIW9kVz896T9QJuauGYd0oyfn
         097tdws17G/108Sf54MG+rVtpdXG4E7DdgG4ri3BTk6+I5tOABnKCzbco6NKLjBfmx6i
         GShv8w+04jugpmstUov6/Wb/l/EhiVuWRnpdB4a5STsWYaMSEIOboCX3mAXHv+eP+9fa
         mb8xfq1+pjk/c1htPoyq1JlcNYPs+a+Hc0EeCoXvR1pNrZls9aE9LOydY9frZpGEbe9n
         7ybUd1ptwZqpMj9x2E5Cb8F+igRcBQqoaKhCJpWM7iNgcGC1D6WzJXcp+cCqSA2wNW87
         JRcQ==
X-Gm-Message-State: AOJu0Yy1bAUOnIEoD4Z/gL6p9QxD22vE/2xwtNZDSLhyjviC9UE97k+J
	76QerM3YsI6B8uASpd6KvEEfxAYWeIOEXWTR1CLzq/BIMwlge964D3xK/S82ahHKD/51R2INSqx
	Q1D9A+5RhjQRigTzyzm9RnbbRBN44oT0=
X-Gm-Gg: ASbGncsFTRBPYgeNgQPs39saPShyh9XfALnbegBTpRH0q1jsqSH222aNUD3BgG/zRdK
	SDz3LvjiovKrTf6QdYO/9AMEYH3HITjZGQ9LGSOxmz1fH/W4yLgZ6O4e4DxiLkcDCZSMDcFEMS6
	nUTyQNHKyGgfUcbco2TTHJva8CahOWjnXDYlVariGR7bBmnjI8V1EbSkhiEoXeTS9nagWuGhMUR
	yAa91zIROqRNKQE/txRAFFmEwai8Asw3QkmbviXk6XRyksb38e1vyOW+6cIvcUzEaX8kiTH12qA
	xSjG3pk0M2ujMKwQbPPZ/RySfWke4Yd2IlFjdzEqJCm0AVKQwsRT8BPfc97Qe0NSp1mk/ngmnMV
	6er1X/UmDnv/iYpEu8c9qtO+RUNG1
X-Google-Smtp-Source: AGHT+IEw+xekVjrYDMU7olDAkstQxVaA4WLr4/R+wKdnC6rYf/nKF2NqrlszQa/tMEm2Tgm6D3lnWbKffBnkKCH76hY=
X-Received: by 2002:a05:6214:1309:b0:87c:2c4b:f3d3 with SMTP id
 6a1803df08f44-87fb416952emr152318936d6.30.1761561700237; Mon, 27 Oct 2025
 03:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <fd973751-adb0-636f-a9f1-b22f63573e60@crashcourse.ca>
In-Reply-To: <fd973751-adb0-636f-a9f1-b22f63573e60@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Oct 2025 11:41:29 +0100
X-Gm-Features: AWmQ_blaUcORcs_CrhXoz_MdRhErszPyCgX0AaI0OZoTp2MLQz6-XcYdEuC6_JY
Message-ID: <CANNYZj8+a2VC+g97Y9qzJ+yNEBzf7V6Opp6Ez2WdZsQaaW0FKg@mail.gmail.com>
Subject: Re: [docs] we *need* an earlier and better explanation for "container layers"
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 10:41:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7846

On Fri, 24 Oct 2025 at 15:43, Robert P. J. Day via
lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
wrote:

> i realize all of this sounds trivially simple to denizens of this
> list, but i recall those many years ago how i was confused as to how
> these "layers" worked when there were these different combinations not
> clearly explained.
>
>   thoughts?

I do have some:

- first, let's just drop the 'container layer' term altogether.
There's no special handling for that, it's only a matter of arranging
the file tree.

- instead explain that a layer is defined by presence of
conf/layer.conf and enabled by adding the directory containing that to
BBLAYERS

- and multiple layers in a repository can be arranged in broadly three ways:

-- repo checkout with a single layer at the top level
-- repo checkout with several layers in their own directories under
the top level (meta-openembedded)
-- tree-like directory structures where a layer is nested inside
another layer, but neverthless they need to be enabled individually

Alex

