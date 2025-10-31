Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181DECCFA00
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 16:13:39 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.19309.1761927214014748188
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 09:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HHjRXNjM;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-880255e7e4aso18098496d6.0
        for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 09:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761927213; x=1762532013; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JGJ2XmPtvBpTZNsFAnIun3UoGLMgoBgA4eGRUC1D0Qc=;
        b=HHjRXNjMyZRrAv6mhy++vrgHvLOtZHMiETAiqk3Sko1aAE12GoYEypJORP/vMjZBW6
         CMlJKL2MdmrVAilOErBCcOB2ZCPcbrQ4o0NUv+/jds0B6f63ASKyb6TOAX/vHfafoz8h
         O1S1QCBs57X1Z0WP2UOIAZkg+OTxLqbf+H2pczaW2B7Mf9dpZPrWFZ1Pou4iETP0KtQ7
         sBv8geN5qUzWkDXAKDInQajILwffmKXxWP0ScwODNmXQj2AxbDQohVV9FWbL91bUlnz5
         x10DQRDkbmuxphNf4ZHoevnfElZC6XAmZ1GHmbj2NO0bKZccLeXcHZ7v08sNedy/4WGq
         oFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761927213; x=1762532013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGJ2XmPtvBpTZNsFAnIun3UoGLMgoBgA4eGRUC1D0Qc=;
        b=QwD4n4bC/vCVHZS21oSxnWrVWiYyHpTDo27wykz3LcLADWGzIxeWnzN4C81SZw5/2J
         TSfXe/9QW/VaG5Uh0CMA0vO3nfpAWor7xjn+QCuxlfpRZI/C+WDOZE9Mjo4Ah5ZjUa39
         SWCn5QUaRdwxbieimT4sqRcoXjqF181pCmoZfZ1+Titi7EJnscUoB/11ey1Q/9EiRgom
         LmNXnOCoMp0g9Ua1YlJk5iK7FGeVgmbd0Y2J1oW99BHJlmxyGkjrp1L3LYQ+GY6hc4vp
         u6HRdF2LEL6eTtL/ytgv82Sj9vnNFhAjTCTv2MNoDZaDZ1vT3kKn7ondMEx9D1pN78Vr
         Kt9g==
X-Gm-Message-State: AOJu0YzhVW/KjohTO7fEjXYctBXC+YcH04ZCjhI6HbP6D2L9e82JBTqj
	pbRRZIWIsO3Py5tDwzU7pvATTVR+O8tggqZWnrmoEX/Ovno0n5dndLibGjqoYVbP/kx1LAUoJN+
	oGzqVM5KewrLn4isdwVNEI/QmCPHId2bpsQ==
X-Gm-Gg: ASbGncueIQYs96Ea9DOyZAILnuZE0mZtpTClZ+oCq05DUPvoAztJaRJotUKeFJfr1fV
	g4TkasbVGuGbVDUQjzHkEfl9+yavbHofPiwxbHl9Y+DSat+3/WvJUqmed4p9PLLOzO/gA/2erzT
	HO3LG8D52lN8cOvK19dGLZIgjOXfOWDAYxUyMDd5aUwtrd0reC16TVBiLRNGeD30HAc4YXWjsqw
	mXnbqjZhCE9bmSVn67gBeFg/Md/hIoSyzN0AFRPfIjKfhwNoqGcic+SEoz1HaoPUovlgLd6BeYr
	079Mx+jS4I+3gGQv6Gl5pblk05bRztiaSi0Cs/n9W1AJYKu+8lQKUr9oaQ==
X-Google-Smtp-Source: AGHT+IGqmfP0r2fs6HpA700EevTB7yNJwCHodW8Ggty1IZw9C42jS+7KmqMEcU6YyfPKd/ig7NkWsCsXGgR8O9s22Uo=
X-Received: by 2002:a05:6214:262f:b0:880:42a7:772c with SMTP id
 6a1803df08f44-88042a77e91mr17867346d6.54.1761927212908; Fri, 31 Oct 2025
 09:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com> <20251030-bitbake-setup-v1-4-f44a8a2b7c0b@bootlin.com>
In-Reply-To: <20251030-bitbake-setup-v1-4-f44a8a2b7c0b@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Oct 2025 17:13:21 +0100
X-Gm-Features: AWmQ_bm8yI408CShjTYpmtY97HUvOfTAAJJicHRg8wlf7UI-6HMe8f7t1lyGG-o
Message-ID: <CANNYZj_+stD==a=fvhPJ5yuboKp6R3JiX_LpnaX=iv3+fp6owg@mail.gmail.com>
Subject: Re: [docs] [PATCH 4/6] brief-yoctoprojectqs: switch to bitbake-setup
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org, Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 16:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7955

On Thu, 30 Oct 2025 at 17:29, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> -      The hash equivalence server needs the websockets python module version 9.1
> -      or later. Debian GNU/Linux 12 (Bookworm) and later, Fedora, CentOS Stream
> -      9 and later, and Ubuntu 22.04 (LTS) and later, all have a recent enough
> -      package. Other supported distributions need to get the module some other
> -      place than their package feed, e.g. via ``pip``.

This should be kept, but slightly rephrased to refer to the fragment
that enables sstate acceleration: "the hash equivalence server
specified by the fragment...".

