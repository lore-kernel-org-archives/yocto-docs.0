Return-Path: <svet.am@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C18CC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 15:54:07 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web08.1819.1646841246042134967
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 07:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O9kLAMSM;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: svet.am@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-2dbfe58670cso27950367b3.3
        for <docs@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 07:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W1J4GkBioiDX+AJmh7eTb1exEraHZn+sWGwwsxevKqA=;
        b=O9kLAMSM+iai+w0Zs2170yU/Q2874Uq8acIw1c9oa3FvbcFsk7nj4Mr/+aXfmJ0Cle
         97GPNt5ZFvAP6kQX0omMgu1nNt5EVdngTcZ+sktb1tuBfN6Gghzd5AW0jH/KuIR6dn2E
         vXx+0fLaKWMtlxzz/QVUkXIBRnrOn6znhFwrVPXNdud4S92FP9NZW3FuYrG+Sv3B3en4
         mmnOhCGd23jIgQrelfuBi4qIEhTAb9LG4vbfzml5zXpgMIrkslX8BWmzYN+14knJ2t3x
         XGBrQ/+yLxLHq3A3YdjRjObctpehlqPZIdnpOu7+9AqKFNfW4q+c7rtBQETERcCGbFGR
         9B5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W1J4GkBioiDX+AJmh7eTb1exEraHZn+sWGwwsxevKqA=;
        b=2ZAvZt5BRotzWC6z5mZ1FA8awgb2Bgot7Y7LOHeoNHTfRHPeOm6oIVrfyo2o7OQeVH
         uZiy6l9xfYeszBoHslbXGQqQAEl0XihBthf/Bko39BxTVllJsG3a1LLdjIcn/pl7SwqL
         qX8Xej0gMMrlmZU/aTxCN4Uymtcb3Ksuf+Ch4KD2oVUkoS9qd+j/V3jLNoYb2r136g6n
         ciNJiB0leZwLT2hoxnWCdoBBmRGyp6cB/Xt56Vzir/4Jxtdo1/La9XAQ45gQjOHmweWh
         /onUSHQuVUhOXyGi5yLCgXitmqdHUYlMhrDvKr7rWPApL5fA9m1EbU9ItzsON5ibXN+E
         ToZA==
X-Gm-Message-State: AOAM533pmHM6w9c5hsa3cJO0zIhTHS7a8iaQsxw+J9yvqVp/N58wA5Ir
	iyG5NDttRjaRM89WYE4D0XEmbEv6omhOWQ7bYaI=
X-Google-Smtp-Source: 
 ABdhPJwSDRWr6wPaIsZEzj+BDc8O8vwFn9hNeNV/+WES8Rk5TYiTSHyWzGpKrw63f0lODL1YFfjNfjJzGtr3XNcyuhk=
X-Received: by 2002:a81:eca:0:b0:2dc:52bf:2ad1 with SMTP id
 193-20020a810eca000000b002dc52bf2ad1mr340265ywo.222.1646841245132; Wed, 09
 Mar 2022 07:54:05 -0800 (PST)
MIME-Version: 1.0
References: 
 <CADmuqUfgVBj28RbjVwGGxcT2NnP2k=DxSZ8z6C=miBqtncoN4w@mail.gmail.com>
 <41207cc8-39a1-8257-0193-4fa353a7e662@bootlin.com>
In-Reply-To: <41207cc8-39a1-8257-0193-4fa353a7e662@bootlin.com>
From: Tony McDowell <svet.am@gmail.com>
Date: Wed, 9 Mar 2022 08:53:55 -0700
Message-ID: 
 <CADmuqUf4APus--UcjJPogGcDA3Eru=-Z16c3iO2vOi9Wgw_=Wg@mail.gmail.com>
Subject: Re: [docs] [PATCH] dev-manual: add instructions for compacting WSLv2
 VHDX files using DiskPart for those systems which lack optimize-vhd
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Mar 2022 15:54:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2556

On Wed, Mar 9, 2022 at 12:54 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Tony,
>
> On 3/9/22 03:42, Tony McDowell wrote:
> > This is an alternative way to compact VHDX files for Yocto Project use
> > since the prior instructions depended on a Windows tool not available
> > on all Windows hosts.
>
>
> Many thanks for this patch.
>
> However, did you try to apply it to the "master" branch of yocto-docs?
> I'm getting this error:
> error: git diff header lacks filename information when removing 1
> leading pathname component (line 6)
>
> Thanks again
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

Thanks, Michael.  I think the problem is that I created it with
TortoiseGit on Windows and it didn't capture the proper context of the
files.  I'll try to fix it today and resubmit.  For the etiquette of
this mailing list, should that be a new patch email or as a reply on
this one?

Thanks
Tony
-- 
_________________________
Sent from GMail Web

