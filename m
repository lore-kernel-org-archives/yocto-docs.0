Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE361C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 13:08:26 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.9198.1634821705370238283
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 06:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=KezLRedx;
 spf=pass (domain: foundries.io, ip: 209.85.221.46,
 mailfrom: daiane.angolini@foundries.io)
Received: by mail-wr1-f46.google.com with SMTP id d3so986020wrh.8
        for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 06:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lDtbb8mUmNrLMslLzUSiQ3+goHdcZZr6IKbpuVUrxSI=;
        b=KezLRedxjtSiT+wbwQ7xKtseb78PrKoE2Ug22bXSTpOc5KYByED6lrEOy7jxaGKnBP
         0isnTSsmzikA1W5DkKt1DSzqTBhFRbdEoLeqClyFz0KrbBlzFLyyMktSEbmlnNadxdgC
         mS0cdBSRbMmd35TtkdxUlSioXeNHP4IA5NkUskICLK2SaSV59D5+Blbkh2s5XsNmRQyi
         mRHDcrq3Fv0ep01Ma3jg0GK4NHOUfGTADTxyX/bdmMXH3VNYk44bQuUzDhP9WT29NlaG
         gBEsdPaC7HPFG5+bE64Qkvfh2yTiRhVGQIBgvr6oR1gSIkyjpTHxGfI1ztd4geSSaxSl
         bU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lDtbb8mUmNrLMslLzUSiQ3+goHdcZZr6IKbpuVUrxSI=;
        b=SudjcJQoioOgSEMpFqUCiNfWGRnZlx2M4LYqmZGAYUkXcsyLVaX5D03dqMfZyyT0eX
         6NwjREXzpKCQx/4M27EmaKnep4RP8GePZtrXVSxItR+mshIpmK4h+Bxyi18VK6opGMyN
         0vX/okpXV4PlE7xbr5vCyNcsTohzEu07yo/5JPhm5+ib+zHUTif+2wgk8AJi2mIOk0/G
         TD3eZ9mllenZ+0xvQ0t31cc+OYBRYl50Td3Vs3pTYWFH8mJw4AiUWfVZOqXwLF3/fads
         20/wK1GqTuK73ZpK2mGEmlCBx8rHWXrnras1t4XXN00IdGhK1s+xEArYxBk9YmeD61sd
         e0rA==
X-Gm-Message-State: AOAM531kh8sn9DwRKTl2zXyKY/9NZNcK6p3SMOpojmJvavldKL8xBM1t
	ZDEv0nLvu8HZElFUdHLMwR+z52Gi5+iBrlLqnJrE0g==
X-Google-Smtp-Source: 
 ABdhPJxc9kv+pMC5l+lQYPHk6NSUH7e7MMPBz4ryOKsIpX8fM/G4cea0uFbjqdbOrXwJ3vJw3AQMGqs6PANnt/VzA38=
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr7397698wrp.196.1634821703866;
 Thu, 21 Oct 2021 06:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <16AFCC10F2844E5D.10624@lists.yoctoproject.org>
 <CA+HEL7-2J1mkD_9JAv+-b+Ydr6U=b=nUemJn1SN4O4RLu9E3EQ@mail.gmail.com>
 <ee2829eb-96f7-95ff-6949-3e68a48d6217@bootlin.com>
In-Reply-To: <ee2829eb-96f7-95ff-6949-3e68a48d6217@bootlin.com>
From: Daiane Angolini <daiane.angolini@foundries.io>
Date: Thu, 21 Oct 2021 10:08:12 -0300
Message-ID: 
 <CA+HEL79gX+By6jWJoqv1b3p99aP7PngYMErgekqwiBt1cBRhOA@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: Update how to set a useradd password
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Oct 2021 13:08:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2024

On Thu, Oct 21, 2021 at 9:30 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Oi Daiane
>
Hi Michael

> Many thanks for the patch!
>
> On 10/20/21 7:25 PM, Daiane Angolini wrote:
> > Hi
> >
> > I am not completely sure of some details on this patch. Any
> > suggestions to make it better, please let me know.
> >
> > There is a bug [1] and the commit which changed this behavior is [2]
> >
> > [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=14605
> > [2] http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-extended/shadow?id=759df7395908f18b3b68f28d043ac9ebd42dd0c8
>
>
> Your patch looks perfectly good to me. I'm currently testing it.
> Why do you say that it only partially fixes [YOCTO 14605]?

Because I think something is also needed from the oe-core perspective.
Something like this:
https://lists.openembedded.org/g/openembedded-core/message/157090

But I'm still working on it

Thanks for reviewing and testing the patch.


Daiane
>
> Thanks again,
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

