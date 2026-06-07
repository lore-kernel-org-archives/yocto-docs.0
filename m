Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FB5CD8C88
	for <webhook@archiver.kernel.org>; Sun,  7 Jun 2026 12:00:07 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32300.1780833598108828536
 for <docs@lists.yoctoproject.org>;
 Sun, 07 Jun 2026 04:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TBCWyMg1;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51788280e71so38121471cf.0
        for <docs@lists.yoctoproject.org>; Sun, 07 Jun 2026 04:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780833597; cv=none;
        d=google.com; s=arc-20240605;
        b=emd4LomGkf1Asro42KNSbD8FNiIU8LFYZGGoU1K6iOqwUfZVsM2wVQ9mfE83HEBm8J
         raNBaGYpAu6+SIyComjeyHTxUxc2rdL+RU9TNjNLtY6+1V3eWzsWiLvRSthQF7LQ43Kd
         xcDBFlWWWkhsuttRkLsrDyjrtQK6Jk0AYS8IpRUX8tjqw6/aAnfgWUMvbWzoA/0dMt7P
         ilWnkDZyoVoUHRsti59iULRcjNVoumMx9OjkuZ6ITFmUH6hmjG+a5wgK7BBpSX5NLKEp
         AJgGLj/QxPsMHBefZdlK98yYipzxuHQFCMGOftW80/gYvPPRkfrLzx8CIwb5ggIoeA5U
         HlDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jzzUI6E5Rw4d+doJCfySGIkjFTmCl0S3TnNtI4XT0JQ=;
        fh=k8odaTN/Ks0bCDA7NTWCPmEfUZUfbpySNaA+cbRYWWM=;
        b=JQfzpFozmCoI1GnU3XQzt/UUZZXkhKYLitGHFXp8fC4uQDDGeraIKpGlAWWpt+yJe4
         8PGKAyayFdyiyjQgWQUdA0W4KsqRXKYHXmS04oXrF/Et7pJ1ctIgIbxeUyGZ4kWQECIq
         RGdMT8SK+DAguy2dl2yQWU8YemVN+8iZLGMK4XcXVknBi1kEznjRQ0CDMdMRsoIBxBbo
         TAyM+r1Re6LlTpM4P3U6PmCUYuXZn7tr9ryKe9zM18yvE427dDxieDK4KGnoLsHxTPIJ
         hvF/6qZQyLLbFf7/NhFbdUraw7GekUx/X6ERcD/8lTUBjSTvOH005CwUQQAW3y8CrhNE
         rk2w==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780833597; x=1781438397; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jzzUI6E5Rw4d+doJCfySGIkjFTmCl0S3TnNtI4XT0JQ=;
        b=TBCWyMg1fhGKkcuNMsJAF42LNDOjF5UJDWE6rZkZRbKekBo/wclfDAVf4LAz0wzZrs
         iAE6DWV/8rJOe529vkHS1wQU+3Y+t/X+4cWu5tCVskff0fBLAPybJNTGWV3XLBQnMlK5
         fEkM58lzB58gPgy+o1O8u3cmaRLZWW55/IdoylOvYsCXsIf6UunopfaElOyFYI5ChXIG
         VJqdLRkV88OCPG5u1lsSTA77l+1n+icfMCPfTFT3dRgrSy92rCcPL/6sOJMjmyb1mK4V
         ConZCtWhI40ABlZ5YAw5M7Fp9hcrokXdy3dZc5d41E5rmqxERwSjuN6J8ZR/zHTciljm
         A/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780833597; x=1781438397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzzUI6E5Rw4d+doJCfySGIkjFTmCl0S3TnNtI4XT0JQ=;
        b=l2Q1HJesN9fXda1fh47x0DOvSDLI1XaXx8oQip+eyTtObnx6/8SuqIJk3bWknch9Lo
         D0b3Bq0manVpV00sCxmLOUeSkTI3LT1IRkQgnkv6XoT3wqmFBZQo2KIVFZ4fLvEThzR7
         EL7vAjk39G7s5UmtsoarZxqySyd39BcQvt+n8L3X/WXzNXzaIL0HwOljV4BJHTkpNfGY
         F52KW2DlBgt9rvZRI706es83FaO8VIMbFWNldB7kRtBVcuB6BRSwTjJj88D3op0UXFcD
         NPyHH2vOGMnfKEnX6tria1Qhqgl5OkdqyLdWkZ1jJ0nFVFWAmaJGHULXLYHSXTrNNT78
         FwyA==
X-Gm-Message-State: AOJu0YxompixeZhYne4IMleFkdvgGuvsNqrYkikDb3zc9MfTV84jt+Rb
	UxkOfEDOoU5vnq1K9iLcVvoPjP7gr3B4ctAHY5DnRgSWclYbAuIMs/Sy06oz9i44pPjzCa8Cuwl
	BQjIuQq8MPAGlcDmBgfxoQgZQIoThXNM=
X-Gm-Gg: Acq92OER7ZlAQY2VnPFt71SIpKOV4bYbKGw/LvNxTVSPngBASb9RdcMlqQ7KvDFZZPZ
	JdOyDPZwoXc8yxLqoTtdu+qEk0yt/Q5dw7yLEQQ4hGwC7VKWWvZC1q7ZQqMNkmdsnez3Fl3yeUG
	zrlcCGxDn3fXFN+qFv7Td2l4On5sqhycfp/bifgEcB2byYxkElzNFQzu1Smvo+VqmAvo3NSiQjF
	WsgmL1e1jn2MCZe4sKXNRyzy+lJ+nzTwBjWlcyb1wbtuJ9gxJ37FhEoMxc9yo3S3UdD/SWRgDvL
	gpoJwR5sKel7J6KvCPHI6wbOp1nBniyddcZpi3o8dTByg2RhvcVND98rclVGvOY=
X-Received: by 2002:a05:622a:91:b0:517:9593:ed90 with SMTP id
 d75a77b69052e-51795bcb63bmr153473381cf.34.1780833597113; Sun, 07 Jun 2026
 04:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260607-license-update-v2-1-877d92a588e0@pbarker.dev>
In-Reply-To: <20260607-license-update-v2-1-877d92a588e0@pbarker.dev>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 7 Jun 2026 13:59:46 +0200
X-Gm-Features: AVVi8CekL5h-NmQYXPfD01ucWu99CqW3u2MPJWopJb1zWFAeQEBkj8mm1T02E_4
Message-ID: <CANNYZj81QRWYwRZ_T=oR1-iQvMUMGM1RzPRjOVe=LetnqqtnXQ@mail.gmail.com>
Subject: Re: [docs] [PATCH v2] recipe-style-guide: Clarify when License-Update
 tag is needed
To: paul@pbarker.dev
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 07 Jun 2026 12:00:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9625

On Sun, 7 Jun 2026 at 13:44, Paul Barker via lists.yoctoproject.org
<paul=pbarker.dev@lists.yoctoproject.org> wrote:
>  When you change the :term:`LICENSE` or :term:`LIC_FILES_CHKSUM` in the recipe
> -you need to briefly explain the reason for the change via a ``License-Update:``
> -tag.  Often it's quite trivial, such as::
> +due to an upstream license change, you need to briefly explain the reason for
> +the change via a ``License-Update:`` tag. Often it's quite trivial, such as::

'due to an upstream license change' reads like upstream has actually
switched to an entirely different license. A better phrasing would be
'due to upstream making modifications to the license files'.

Alex

