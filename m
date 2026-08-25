Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAA0C61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 15:06:08 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23723.1787670365529041951
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 08:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZQRld+UQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51bfe810293so23196251cf.1
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 08:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787670364; x=1788275164; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tnc0fBWJvIri//qH/J8cUifovJK8QnGTXBxtiHhk4EU=;
        b=ZQRld+UQTFeVuwCXU9ENxl3/nldB/epJ601Y03bGf5RYFEeRhAWUVpTU5qODMIbG2l
         3QGHWbzupa8pJ10WErUaIpnv6al0V9ae0xgnMFaR7lhARJTYI+wfD9ARHxTMBU8UZYMx
         D8hwJ/Wp2s/BYcYFWS5GxzibprYJdCpLf3wlaCcFVYbmr+96bFJNLNw42sV+FNBONKO1
         5MGWcTWavCGvTfTC4HHW6y1j81pXtfStMEUr0ErEs2XIeXEn9TvOXoYHTg7CGeMXKqfc
         kyXUrPa+Gbh84bXVrR3dfOg3HAr6Y0m5zad0CzNrZLqiTQ80fVdwd7P4uGHhXXTfj4Xp
         wRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787670364; x=1788275164;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tnc0fBWJvIri//qH/J8cUifovJK8QnGTXBxtiHhk4EU=;
        b=OSBKj5UymVbY7BD26lmkJrO0IPruUolMqdMDeNVnS2p1HBwdxvuXDPxC+WpqoC/Otu
         zPmyRN2bgKAyGp32P0SqVVldqjFtxNwTT/AgrPlj3xu2B0QZwGzlAUuQ4LTFKXnuCDu2
         lqVo2ZOA9rTGWGvM6jWNLQz672dYeE3ASxyPtXrdYlJUX/a0pxmpSL1dKv61yqQk4Wqn
         wzWhO/GzyRQC1qJjpuqUFbGoFF6OlY8aINlkewiI22s3zwDouXv1BT0+r3YgyKKMHF2R
         4Eu5yMqTACQsaQPKC0i2nyBb9OgqE9Px8C8PGU0gm6J2jhi82iuGEl7+H7jKLE7EZfyx
         6fpg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2bznZsRPfjCuxNu+WM8G0uR1MGqMhaGtpw8oaBltTFP63wmbzyqxWlljwldcPdOi7OPJs@lists.yoctoproject.org
X-Gm-Message-State: AFuF++lWX7U8s9xQ9emxpyyXURdJOVwAmeFobG9dNZfOfCliTV8cMZ+o
	u/16dnK/3N0NSgP6eNoQvgaQOqDXOJbkncxqV6b8I45kFtd2xQCXkig2
X-Gm-Gg: AR+sD12zyTGKwZNlX4Z7alt9jexPg3btk2Kun/shvoLZgJZk8x4EWuRbDxGuZDbe5IQ
	h6yFN2cqbc0xU4MNEdctGfGfFVyQmfyG+zGBw5sVpcFzjO7x8CW0WIWSchc+HkM24JjsZJzYwVI
	5ULnAxrHeYgZlLRiNrpTum54HnCgeMQCTOqsYWQX2EpWZNoYPH2GiLfOEYY3A03KNGqrbnb1WMR
	mryBUpzFGpazHM2IGWmyBKwAM78zS4bW3Avo4w8aNf2kSj/W/0PHcB/CfFGm2YP/zreM5C+U/NL
	rFrKV1aQXtFVOUtRiVHrc8H10G/Ec99V5RSLUhwB1xOOvbtmY7qRq84IZhM4lJgTRq2n69eTUwg
	qHDDSrXgbjskSxSkKFOGzJaJuiUkNHxVJFoDa8BFmff2AQkT/DmDn2YhrC5EWEIOq8FZebVNLOY
	Vrd5bYm84SVur3zWlPixT5EnTVtMBGuMD/3yOKVsv9M8+HvXLSchm+IGWPOasN25/AWFmS9y47Y
	VtFLfP8UcofkewgR8jWHrZbaSOEVufqVX8p2SOjKA==
X-Received: by 2002:a05:622a:986:b0:52e:12e6:6d7b with SMTP id d75a77b69052e-52e2f162237mr81683321cf.39.1787670364150;
        Tue, 25 Aug 2026 08:06:04 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09aaeecdsm69864081cf.19.2026.08.25.08.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:06:02 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:06:00 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	docs@lists.yoctoproject.org
Subject: Re: request a rebuild to pick up Pygments 2.21.0
Message-ID: <ao2vWBMw1ka8k1UL@localhost.localdomain>
References: <aozKcnogXKWfOiFA@localhost.localdomain>
 <53235180fe3e221ea8bd27c81afc4a35085226b7.camel@linuxfoundation.org>
 <DKXU2Y2J3H47.1TSOGHLLAVS2U@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DKXU2Y2J3H47.1TSOGHLLAVS2U@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 15:06:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10341

On Tue 2026-08-25 @ 09:07:41 AM, Antonin Godard wrote:
> Hi,
> 
> On Tue Aug 25, 2026 at 8:36 AM CEST, Richard Purdie wrote:
> > On Mon, 2026-08-24 at 18:49 -0400, Trevor Woerner wrote:
> >> Could someone build buildtools-docs against current master and publish
> >> the result?
> >> 
> >> scripts/run-docs-build line 29 pins the docs toolchain to the
> >> yocto-6.0_M2 tarball, which ships Pygments 2.19.2. The newest
> >> published milestone, yocto-6.1_M2, has 2.20.0. OE-Core master carries
> >> python3-pygments_2.21.0.bb.
> >> 
> >> 2.21.0 is the release that added a BitBake lexer, so it is the first
> >> version in which
> >> 
> >> 	.. code-block:: bitbake
> >> 
> >> does anything at all. I have a conversion of the BitBake snippets
> >> in yocto-docs and the BitBake user manual ready to send, but on the
> >> current toolchain every block would publish unhighlighted - and since
> >> run-docs-build drops the Makefile's -W, silently.
> >> 
> >> I've tested the change. run-docs-build feeds every BitBake docs branch
> >> through $builddir/buildtools unconditionally, and yocto-docs from
> >> scarthgap forward, so I built all of them twice - once with 2.19.2,
> >> once with 2.21.0 - applying the same docs-build-patches and master-file
> >> checkouts the script does:
> >> 
> >> 	bitbake     1.46 through 2.18, and master          14/14 identical
> >> 	yocto-docs  scarthgap styhead walnascar whinlatter   4/4 identical
> >> 
> >> 36 builds, same exit status, same warning count - zero warnings
> >> throughout.
> >
> > How urgent is this? Could we do this as part of M3 and use the artefact
> > from that release build?
> 
> I was planning on doing that.
> 
> I have a local copy and build setup that has an updated buildtools tarball with
> the new version of Pygments. Trevor, if you want to send another version of your
> patch, I can review and test it locally.

Sounds good, I'll start posting them to the list.

