Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D72C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 17:13:29 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.19147.1752254001726950408
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 10:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eucr+uXw;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fb0eb0f0fbso27736316d6.1
        for <docs@lists.yoctoproject.org>; Fri, 11 Jul 2025 10:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752254001; x=1752858801; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6HvEPDVQNFN0RoMxfwAxIIdhvy/ZBIPLf1WpybU/fu0=;
        b=eucr+uXwse5vEdmKglzmLxhgK1wv83OKRv3UXFsgrQ3j3Tl7hFF7RtkmOXiQS9M68j
         UP6bUdNg0K8vXcHIuGCCWVZEbOIDEPNj0UEk5a1Ta/3tgSV70/F8S5tzFd5RTPlMJ/Cy
         wDA476R7nm6JNisWLl7l1//BfkEoyZNmu9UoNunT7EblavfXzMA1v7Fo5ibdjBfhUO++
         F1UXnpuGT6imBhZNswo819ECYcZevp/0gwFdBvfzwSiwmIhrOcjPSF/7/XsS8kjQFQ9g
         VGFjyOjoWKnH04mtsgjeP5mTZgv3H/xUg2QsrRr1gB99DFa6nxEwjX4Yj+3WRz75T99w
         Fkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752254001; x=1752858801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HvEPDVQNFN0RoMxfwAxIIdhvy/ZBIPLf1WpybU/fu0=;
        b=DxCKIb54iWnuz9PFIFBqxfA+MOvMfeX8ft5HKp5qpOgCk1/bvKjmlVq6TMwN1Mbe8q
         S2TYS23EsSop6UmdesBg4Ne4LE8ryBIQb8Cn5rcKpXL3nq1/46MPBROEjVjw37guLr9k
         eKjjOE2bb0d+f+1oqF2qHh8QA75xMs6gS+BSiR1peVCSWlsqThZsYntdmK/KE0WtGAit
         6KCrP7hkvm65LrC3O5XjdlHiE2gD5G/EbzHD2ihLnhDIxWwOyrVwq6gbRjUy8it5NmCX
         3rQK2dwl5/azzSAP6KIkFaNNwuOhXbQbN8bj6IPRI3ISP/NnQh/fmqXuTDI7ao0b4HiG
         eQmw==
X-Gm-Message-State: AOJu0YwogZUB0bE3i3OdSU60EApivc+OBykCoUV+eF7Hw8QDfVFughd6
	1tqWN62TYLJV5lTg/VXFf09V7OHJkzKcvppumgT/wjyMN+Z2arUYNTR65RNrgKaOGre/0spq+EL
	unyp1t0v8LhAVSqE+xBMW702ea9oa1Stcwg==
X-Gm-Gg: ASbGncv8eL9gjrkVSEl5l26cSmkapU2YKcqmxJSsW5iSMBV+NcEvL9jxdSFg6WYItWh
	GxXsVpDScVNTkSbJ9iBYCeoPHhafKgca69Aa3cUZPgne6hFZ+QXBkfiupJtwg5YFMEXPEzzUyiD
	5dFpVUINcfgiyAlmLoBpTHxfzMn5NgaLWzMtQ712xCqlfmPDEaPSP1MvfilWZ77V2GkgYMPh0My
	Vr3Aj27JprIN92fr+4hit44rscWDd8lml+9LEw=
X-Google-Smtp-Source: AGHT+IG/AHiNkmrgIScZ2ulG4GeLrs3QmGp0mywJJdW5/KgBG/DXEG60uPTUH1eqCovPd0xKSuUKLBAM83bQjzZOzfM=
X-Received: by 2002:a05:6214:2e82:b0:704:a59b:ad21 with SMTP id
 6a1803df08f44-704a59bad24mr38794806d6.6.1752254000488; Fri, 11 Jul 2025
 10:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-update-sstate-dir-docs-v1-0-9114688f33d1@bootlin.com> <20250709-update-sstate-dir-docs-v1-3-9114688f33d1@bootlin.com>
In-Reply-To: <20250709-update-sstate-dir-docs-v1-3-9114688f33d1@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Jul 2025 19:13:09 +0200
X-Gm-Features: Ac12FXyB38d-NHlfTd24y9yUhpXtpU33ygvp6_KELEdhUlIh5rzE5OdkO9_1kGM
Message-ID: <CANNYZj8ACRCBpEOfBp3k506b6yUi2k7BAcQwqr0MJ3BvN+UCkA@mail.gmail.com>
Subject: Re: [docs] [PATCH 3/4] dev-manual/start.rst: mention that
 PERSISTENT_DIR should be shared too
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Jul 2025 17:13:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7317

On Wed, 9 Jul 2025 at 09:57, Antonin Godard via lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> +       If the :term:`SSTATE_DIR` directory is shared for multiple developers,
> +       and you are using a :doc:`/overview-manual/concepts:Hash Equivalence`
> +       server with :term:`BB_HASHSERVE`, the :term:`PERSISTENT_DIR` directory
> +       (``${TOPDIR}/cache`` by default) should be shared too.

Same as patch 2: incorrect, do not merge.

Alex

