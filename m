Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973E8CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 13:36:50 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.125851.1697463405788958938
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 06:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aeIalw5L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so44501875e9.1
        for <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 06:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697463404; x=1698068204; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GP620KAnv2C7AXwV/ZVUeAUEGP4zxO13zJlyNcyuOcM=;
        b=aeIalw5LEAkkj4D5UY5rPPfUExJeD5B5MNQXxQTRzQxGpuyuD7S+UsMfmdjdCwm0bJ
         AWgXJlNu4LCP5VfJCt0f4QnSRhYyntFrI3SV13Q8IUGobH6fuRvgiBnfM3i2KWhGpTvS
         5xWSG5f3nmzGFJNMgg+/gDaM31Iso8rkI8his=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697463404; x=1698068204;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GP620KAnv2C7AXwV/ZVUeAUEGP4zxO13zJlyNcyuOcM=;
        b=wUOUCGiC7dk5tpvDs8NknqunrSzcV7Q+y5fGdktse+OpfPkcWVUeBx41OPkNYAXWdl
         iOKik2Uj8aF7ZuNBg7MtWiHV0kZ0DT8NY52MzN2CZgsIKO9chv/+Cm7z7bmSYrDPkqvD
         c0dSneW2VM+6n7XdABFJHNpEHQHZzbuBpGzvCKnodoK/V/84eBF8e59D50ULsnnoOh4J
         tKAKtjBWSh0cWlg8oMKtLSHvw4RrJ3A3qgZPNnBu1HbrANfETWNis6PVJW2p6GBYUe2L
         talXaPe3nZQGddSMCDlzbJzmUj2dTZt9E1hUazX4J3SC3n3rIKiKVCn4XYNlYsUfMUs5
         uq2Q==
X-Gm-Message-State: AOJu0Yy2u1U9i/DlJEijnZIdYoAPo/EEVyEXM0rhOgXN8vGLaUXQB24o
	7tynA0fEQ4USUgkbm8KSi3rlzQ==
X-Google-Smtp-Source: AGHT+IHAaJkx+Xl3YwPJ/JkF+6DY2+gQFbIX/ELTLgRRduIHUpJ6ysjnZK6CeAgU39E7JGq7fHlJMw==
X-Received: by 2002:a05:600c:2298:b0:3fe:1af6:6542 with SMTP id 24-20020a05600c229800b003fe1af66542mr28645607wmf.33.1697463404074;
        Mon, 16 Oct 2023 06:36:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ece6:f4dd:6417:6a0? ([2001:8b0:aba:5f3c:ece6:f4dd:6417:6a0])
        by smtp.gmail.com with ESMTPSA id g23-20020a7bc4d7000000b004065e235417sm7110942wmk.21.2023.10.16.06.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 06:36:43 -0700 (PDT)
Message-ID: <818d0fb6780d3b7ef3513ab33dde7f4c13e73c81.camel@linuxfoundation.org>
Subject: Re: [docs] Dev Manual, "5.16 Sharing Files Between Recipes", does
 not define /sysroot-only
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Robert P. J. Day"
	 <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Mon, 16 Oct 2023 14:36:43 +0100
In-Reply-To: <CANNYZj_=WZj_1MvuOuh4Bz76L_Pc-=4gddE=xOTO1kq+wWFPiA@mail.gmail.com>
References: <b04580d85e3578125b326abb70607998@crashcourse.ca>
	 <CANNYZj_=WZj_1MvuOuh4Bz76L_Pc-=4gddE=xOTO1kq+wWFPiA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 13:36:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4379

On Mon, 2023-10-16 at 15:22 +0200, Alexander Kanavin wrote:
> What I think this means is that placing items into ${D}/sysroot-only/
> at do_install() will not package those in do_package() at all, but
> will still provide the items in sysroots of dependent recipes.

FWIW I'd prefer people don't use/rely on this. It was added due to very
specific use cases. Now it was added, people want docs and I can
understand that but we should be clear this is for exception
circumstances only.

Cheers,

Richard

