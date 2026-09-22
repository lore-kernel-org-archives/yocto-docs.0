Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D1CC982FD
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 01:35:33 +0000 (UTC)
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.907.1790040924293610627
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Sep 2026 18:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rNCmhDHV;
 spf=pass (domain: gmail.com, ip: 74.125.230.205, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a222edc62so388065285a.0
        for <docs@lists.yoctoproject.org>; Mon, 21 Sep 2026 18:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790040923; x=1790645723; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DZ8SIleiKENrh7SED9+X7LSgmqcmJEDbRp/2oKURwnc=;
        b=rNCmhDHVDZsGoN4fYrF15cjd6jtaKtkQHmcbt/lzSERmU93EY2nP25GPP2TLh15tb1
         n1zaMt3tABYu+jsjKjPUydFuEShlZSWEKqZtByrYR9taHJEIv8gCy7s82PCHCwOHhV7u
         cCnsmxDohBfWJf8LzI+PNtZFOa/K8aCY1Hh8jB4IbwK0zRx5C4VKorS1vE+lzqUA5hL8
         EVZ931eYxDjrCm5HLxktbDazEJA4ldpa+a9lUshzkyB9fcYbIp459lHxNEkTjbNfBJA0
         Qltyj8AD+qoO3inOlNfv+0Rs+zII6PBBKiRv6b1U/O7Zxflcsl0RqXmgDneTHtD6A7UT
         rhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790040923; x=1790645723;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZ8SIleiKENrh7SED9+X7LSgmqcmJEDbRp/2oKURwnc=;
        b=p4CXNlvseY655WaqIRNIPn1Rnud9cIzxu1ulpBAdeAKBROMf4L6nHGk8cBdsLvgGfw
         4GfR5iLK1h1KtP46KohrMK2O5jaSsQNNlSumeh3sHQaXWVTGISeqhT7ZI2M3BNrHOaRn
         EGghhQhQghq49g83px/yYBCGNFuq7fb1BLsBvLhBKlA6yHNutfE/6+clkXQ/NPYxX87M
         iP/WGPv6wPahVcblpMXWZplM8Val9LyEEgMtAEIK31rr3u38/qzuVX2GUbOt2RScKkFW
         R0doMxRFPptg9eYrwNB6w2mkLC2ouoxtkA9iVDQVPcYzsW0qIT/FvcK8ZxbER4b1EZXk
         yllA==
X-Forwarded-Encrypted: i=1; AKwUvByThpmWzuPPuTZsjbpBMihFpUHkoEI3hRw9k8KkZN9r47P7+b6zCq8J1LjRDaoLCWBIsPaE@lists.yoctoproject.org
X-Gm-Message-State: AFuF++nrM2tA7BuG2IMeKIsK8EykIXwW7DgUc3MxA8qkTXViWVL04k9W
	wWpebSble7VYEICQJAteszNUQbNFC1VOr3xBmJ+FbAZfZnuVxZvI8tid
X-Gm-Gg: AYBFou0gavSZ0HJ10ocq/No8qh5lwTTPj0Vf1GIaoenS6Juz/i1+ssnQZoqWdgWx84U
	u9d0VPN2tPaQ7NyqK00QS9HHslcqZRUKy9K7jWcrgskTRMca2wBtzdydgEPyqZ8eHovnBEUlz//
	s6Wdu4/vShGQal3oaOtyfc39fjYvAYrq/DI6MT3ZhYphtUvFA4UDpCdi/ghVvnFLvuU5cO3If3x
	uwtI7G1GQEnhmqGmTZQ2PkX1TmHJ5ERVCmwbY2uaa0fA3Lvz/Fj/1VwPoUqSO23p22WfaAWYU8w
	XKcizysaKS0xBQm5Yk6EyFmUAW0i5Tw461dX1JuEdrD48rWkE7/bULH0PTocSQWJvDQgEk92fBI
	yEcX1iWcwNZCxfvnJIYkz//sr39V2n1AX8bFozXZ74q3l24akKBnLNFMPs9pnDIJ+XeTJwi6QUY
	p+4cVc9DVpCcVwe5GM5Gn6zBcyQ3s3unrtKIe9YHnp0obo2RxRH+xjOPBgsMAO2vacoXzlpj5gN
	ochJC8DW3fCJexL9Vy4aY1AhMauTG7QKdeYDt6h
X-Received: by 2002:a05:620a:45a1:b0:93b:d79b:9a62 with SMTP id af79cd13be357-93c15f8672bmr357773785a.67.1790040923107;
        Mon, 21 Sep 2026 18:35:23 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d1ea155sm11958885a.31.2026.09.21.18.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:35:22 -0700 (PDT)
Date: Mon, 21 Sep 2026 21:35:19 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] docs: document the conventions used in the manuals
Message-ID: <arHbV_euXtr9_t0x@localhost.localdomain>
References: <20260831031458.4070250-1-twoerner@gmail.com>
 <DL2ZCLBWUBX3.5ITP3G3AJ0SV@bootlin.com>
 <apWCaeB2azEgKMlK@localhost.localdomain>
 <92a2c1b9-16bf-475f-aec4-4fffbce0012a@cherry.de>
 <aq4o7Zu-ILYDZnGw@localhost.localdomain>
 <DLL2HTQFFELI.15X26RE9UVCZF@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DLL2HTQFFELI.15X26RE9UVCZF@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 01:35:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10556

On Mon 2026-09-21 @ 04:34:35 PM, Antonin Godard wrote:
> Hi,
> 
> On Sat Sep 19, 2026 at 8:17 AM CEST, Trevor Woerner wrote:
> > On Mon 2026-09-14 @ 06:39:59 PM, Quentin Schulz wrote:
> [...]
> > having a
> > prompt clearly shows what are commands to type and what is output. For
> > the sake of uniformity I would rather not have code-block examples that
> > have and others that don't have prompts.
> 
> I agree.
> 
> >
> > As for the "what to copy" issue. Every code-block has a "copy" symbol
> > that appears in the code-block when you hover over the code-block. If
> > the code-block contains things to type with prompts and you click on the
> > copy icon of a code-block, the commands are copied and the prompts are
> > not. However, if the user highlights what to copy by clicking and
> > dragging with the mouse, they will get both the commands as well as the
> > prompts. However, that is configurable! It is possible to configure any
> > code-block identified as console to not copy the prompts, even when
> > clicked-and-dragged with the mouse.
> 
> Do you have a working solution for this?

Yes (to follow).

> [...]
> > Having a "how to use this document" section would explain and codify it
> > into our standards, as well as having an author-facing document that
> > would give this as an expectation. Review would then be performed
> > against these documents for consistency.
> 
> Rather than having a document included everywhere, I would rather have a
> dedicated section for it in the docs so it is less invasive . It appears in the
> sidebar, so a user always sees it too (for HTML docs).

That works for me; I have a v2 prepared.

> Here's what I have in mind (note the shorter title so it fits in the sidebar):
> 
> diff --git a/documentation/index.rst b/documentation/index.rst
> index 4bfc40bef..72e51a445 100644
> --- a/documentation/index.rst
> +++ b/documentation/index.rst
> @@ -116,3 +116,10 @@ Release notes and migration guides for the different Yocto Project releases.
>     :hidden:
>  
>     downloads
> +
> +.. toctree::
> +   :maxdepth: 1
> +   :caption: Documentation Conventions
> +   :hidden:
> +
> +   conventions
> diff --git a/documentation/conventions.rst b/documentation/conventions.rst
> new file mode 100644
> index 000000000..65061d1a9
> --- /dev/null
> +++ b/documentation/conventions.rst
> @@ -0,0 +1,18 @@
> +=========================
> +Documentation Conventions
> +=========================
> +
> +Placeholders
> +============
> +
> +Text enclosed in angle brackets is a placeholder. Replace it, including the
> +brackets, with a value of your own:
> +
> +.. code-block:: none
> +
> +   SRCREV:pn-<recipe> = "${AUTOREV}"
> +
> +Here, ``<recipe>`` stands for the name of your recipe. A placeholder is
> +never text to be copied as it stands, and an example containing one will
> +not work until every placeholder in it has been replaced.
> +
> +...
> 
> Thanks,
> Antonin

