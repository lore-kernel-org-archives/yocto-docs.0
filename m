Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBD7CCFA19
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 15:20:57 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12060.1762356051322233966
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 07:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wr8K4O0O;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-795be3a3644so42884096d6.0
        for <docs@lists.yoctoproject.org>; Wed, 05 Nov 2025 07:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762356050; x=1762960850; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c145gcSGx3zmBTc0oe+A1CukAbxmWoLPCYMm5ZmlglM=;
        b=Wr8K4O0Oib7TZUJoRYfyCc3M1YE0wPxcABWSV4JHFCDRuj3qYhAy/wxn6B+QlbyOD1
         3Nq4xmpUhmQy0ytB15Fvtxs5vONk0rco0LLg55PhHJKd8r1ILOxdKI8+3aSEDRHYbB48
         5kg+qX7CG9KCB3wYtybv3iY2uK9a73ajD4WGKHcDBC7yDtteIZA2u2IhK20oVGn7zmVx
         5xphEHO+p3ZVFKJRKtbjzPbtbbMaozzAul+YrNKEwS0pu/a5qqVcKpSq0DZW0imgkMgl
         Vv6rBNYwHbXcbFYYC/XnYkTTqomo9PqGa9igurFo6EI/yPtqun68VZ/8wVqrBvcljEth
         tC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762356050; x=1762960850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c145gcSGx3zmBTc0oe+A1CukAbxmWoLPCYMm5ZmlglM=;
        b=xO5Yu7TKpoJ20PUiZNkpSEpEUOewiOiL1lW63oeVnFzMAb7I5W9labBdg8O2WoCHF0
         Ofyr0F3JqjFGOjmIHdhWA7PaqEUIZ0DVyuHGEVcI/0ppl9NadeGMMvEt+zxAJYg56qUQ
         S2ryMhrmoZh4kByoPD4xttFm/tSBEh3XLw4Dw5HwxWueY94b24prHbF0tc5N1Jansnnr
         qY5iJ6QTkMQOWg2zDizHAUnCdzbo4A0/NZCi76hV3zpzBX22dnvDPOreXnUZwHvBrpfI
         ikAEJXgUB9aMompgD+F/homuc8R621eZ8EiII2p1DjeVlcVmiw8RVvmQuj6ceK5gW3TN
         09Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVIwygGGMYbXOac0wt6GWyp1O+n6u4fRH6cEMHxLOueJpTVN7E3Y//jy2hRreFkxlvLbYzh@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yxk0KBWOO/zfCdCuFKLh+yJSuun1CTPAX2lxAJ5xhr9OibqqMBw
	9fB0I5XAGq8/IWWjZptVnoypHqcYq8HXLsIghe+RMSJMiCJn4diMGMAdMVyJ+HouNKjzksskSfM
	36A4VkvZC21ns2czIvv6Hln/jUd/gLIM=
X-Gm-Gg: ASbGncsy4FfnRjrkJAJHCcsfbuQ1FizO5p+T4sSvNMl8om53BbfZxo6zAzW3psjqnbZ
	Cg2EKW4JNoqsQdUwFC3BULmzTImLBDCg70dTxYj7xwJSt0e3vHBfzlBXLrCApfv/Su2X7mBSyd4
	RdCSejOgYj2yIBYaM/SzRqaWU7z+AmvBuNbXru9N4Wme7lkaOnk3KgNDjKmpyHe/AdQCqgiBMIS
	3BAOo4NwZM2kPFA4clz/oXvvS5idVhK4Xb10uKDExTq0SVaXtxfGoa12/FZejw+4PC5LMMF+iMi
	iMbsArzI9VCTo/EKyZE=
X-Google-Smtp-Source: AGHT+IEyPbubrA49Jqssl80+r76o8zqmtABuRJvjok+iXzU+jiavn+G8PrWv+kRRsV+yotfBoeecLRZDtLuCMhKX5wY=
X-Received: by 2002:a05:6214:767:b0:880:486d:18de with SMTP id
 6a1803df08f44-88071196b59mr41820006d6.50.1762356050289; Wed, 05 Nov 2025
 07:20:50 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8p5zTnzo3AO88_c7Q=qDtO1-QWaFNh+z37xLX4Y1H8Bw@mail.gmail.com>
 <20251104151156.3125937-1-johannes.schneider@leica-geosystems.com> <DE0USKLW9WXP.3MKV2P4AI36E1@bootlin.com>
In-Reply-To: <DE0USKLW9WXP.3MKV2P4AI36E1@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Nov 2025 16:20:38 +0100
X-Gm-Features: AWmQ_bn5CGblQHrQXHWC9nt6tKW3-ZgwdImZmRkr2D3cLIKKRWLhqND56rH30BY
Message-ID: <CANNYZj_bTNkWmDLe=wmDOXfL1xWxSTx6yP2yqAbjLVaomXoVaQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add bitbake-setup documentation
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Johannes Schneider <johannes.schneider@leica-geosystems.com>, 
	bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org, 
	thomas.petazzoni@bootlin.com, Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Nov 2025 15:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7990

On Wed, 5 Nov 2025 at 16:07, Antonin Godard <antonin.godard@bootlin.com> wrote:

> Thanks Alex and Johannes for the suggestions and corrections. A v2 should be out
> soon!

Before I forget, THISDIR in bb-layers should be also documented:
https://git.openembedded.org/bitbake/commit/?id=b3153be29de8b8570b0c184369bd41f4c646cf92

Sadly it isn't part of the formal schema definition, in hindsight it
probably should have.

Alex

