Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CF5CCFA00
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 15:45:18 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.18891.1761925512347946228
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 08:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cgJMp4O+;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4e8850b09eeso22121261cf.0
        for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 08:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761925511; x=1762530311; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4rqTOmMGZWPAFhKRQCU73vgtzd7hbkqp8WfkGzOkAKQ=;
        b=cgJMp4O+N5gbdY3Oe/ALZu0BZrsyIspdercjlW3NGYU1qD28y8mQwZQMXKqAvBpKwx
         PcmZfRzNwyjrpkKnbjpTDuGGH+2iYfHSe7ID0KtrZ8PrrOPpcG5jRQ7aV1FZuKzjzfvZ
         Df2lVhz9tUZV24KYiDG650kU6+xtOAhNyj8oRHHE1jnDI5MhHmgEsDjYvN8/d6cFElcw
         pvKJErvZqpkAbqiQDiYfFsNzt2Qs2CYNMX05HRkQo+r55zRonSk9CvGAH21PFtl4Qgn9
         oeO7BdxBU8y/+89GxAtMh1AHarzms7kWJtnVLR5P2rfq1zsElpRzzcGdaWnihRW03yYy
         z0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761925511; x=1762530311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rqTOmMGZWPAFhKRQCU73vgtzd7hbkqp8WfkGzOkAKQ=;
        b=Zpu8lgAeX/+y1jlW/03k3CJj4F4ljXgrhvk/dLn0t8Xg/xCqeisxvGIunXVVnR6TA6
         dzoXRWwpJGT0zBSDdekUAT4PHprIIXBex3eX/Qc/izhq6D5u05bhctrdTkOHWrh8Zjyc
         96264svyri05Jt8DpqrzQ1qDw4lb98hm7yQ4XVOmiC4WIPrK7k1beQT9pOYm+qyKOS0o
         /R8z67LWc47SUenjJi/nrvf64TMh/3B1d+zEtJJqXwK73K7VrdL1Hl9kytc48xUbhirF
         nVc9EfB1qXt0d3uRSECN2MMZHtQv7m3oII20HTSv7EZD0GMJ3oDaBVIMI4k5NaFPwSBK
         xFFg==
X-Gm-Message-State: AOJu0YxhyQK1elQKjbHKWokmAWrCjZufnrzWNxmD7/MpLgzIij1KtiaO
	E6dP8ZQ8sBbe/1vqOwEekb7gkjf99VkL1R1CuFKmRXQd2CfG2gY7ri/tULk1SGQ572Vd7l5MV+D
	J95VEh+2RT9lxZvEbzGTlrIsqO2Qd1Xw=
X-Gm-Gg: ASbGncttmQJPJy9K/1cC1j1OGIKVhO+SjVTEWejg6SvmOM79+X2jfY6FVx4yH5Dk9nh
	Fq2srMCIphTM2iEimtxhPdL9dwHZ0QjwnnO+lLrf3NLLaDKH4avmkaA6pWRkDYrab0mDSSoJvXu
	i37Lr4sPE2YFN6R1DmyLrkhPEWfT5P+EEeqUQ3VcfhfgPHwU/4/7ncgpqnE684EyG+IjWBm5NyI
	WuD6zbDbNzlJWtUfZfiClMsVFipSJTJ24ZPImDUHjA/Vjvz4ME0ZKawtJ4AxkHBAM4GqVj3bPhm
	ZKZM49AkWKGLCr50pqmRvHYCMsLG5MNIRBZ00sfIdEeR28MO3mqg4IlSngPbd2ssGgjh
X-Google-Smtp-Source: AGHT+IEhxPzu8mJbM4zxf+e06RFfvOTN34z4fvPEtF12HOoMcSZeM7M0bw3/nnnbRF6elE6GBkGK9VqjhSjyCtUMqAY=
X-Received: by 2002:a05:622a:228e:b0:4e8:ada8:6c22 with SMTP id
 d75a77b69052e-4ed3109b8fdmr46037961cf.72.1761925511180; Fri, 31 Oct 2025
 08:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com> <20251030-bitbake-setup-v1-1-f44a8a2b7c0b@bootlin.com>
In-Reply-To: <20251030-bitbake-setup-v1-1-f44a8a2b7c0b@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Oct 2025 16:44:59 +0100
X-Gm-Features: AWmQ_bnPtF23SHf2eXxt3aekgDg5d88VOWU2nTQqV7J6_HbL0YccL7sxgRcl128
Message-ID: <CANNYZj9a_rsLcB8zajPocywjO8WDOw17PcLj3Pao-8UZEUNmqg@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/6] ref-manual/structure.rst: update the
 description of local.conf and bblayers.conf
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 15:45:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7952

On Thu, 30 Oct 2025 at 17:29, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> +This configuration file contains the local user configurations for the build
> +environment.
> +
> +You could for example edit this file to limit the number of threads used by
> +:term:`BitBake` (:term:`BB_NUMBER_THREADS`) or set the location from which you
> +want to access downloaded files (:term:`DL_DIR`).

These both belong in site.conf. I think a much better example of using
local.conf would be:

You could for example experiment with setting (or adding to)
DISTRO_FEATURES or IMAGE_FEATURES, or adjust build configurations for
specific recipes by setting PACKAGECONFIG for them. If you would like
to publish and share changes made to this file, it is recommended to
put them into a distro config, or to create layer fragments from
changes made here.


Alex

