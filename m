Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FF1CCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 08:44:57 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13201.1762850691144930554
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Nov 2025 00:44:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IhM4qCbg;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88044caaa3eso41222436d6.3
        for <docs@lists.yoctoproject.org>; Tue, 11 Nov 2025 00:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762850690; x=1763455490; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HvW2oLj3AFceaGfWj8IubLQ12+fvvRdczGt2rWSRjhw=;
        b=IhM4qCbgG7CnyDRgpF0Mpl0+8yRR5NtyfPLtuhwhIU+/H1+IhbEEezrhXmr/zOKcvu
         zhb6yRKW4TSfw80M1WwDuRggJxETzfT6WbvMus/zV11Uv6VV8r8DRmnQeoMOqKoRHYAP
         BFPYC6OZlOM2SOVYK06R1GXwnRrTTFp3cVuEOff15kmGNsVB7L7/4z6pfQ/B6owrvBF6
         yJuCUWOFPiqQQUQk4OLoHkdC57T89MZvKTw6RR65tXPKOjnS69r9ZZ7v//PulZyOP4vT
         BA//2Ncg9zNQkUXbChjWeYwfjjtiDbToS1mycU3cxbOqfI7PKoPLfPh71wXQg2CgnprY
         S6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762850690; x=1763455490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvW2oLj3AFceaGfWj8IubLQ12+fvvRdczGt2rWSRjhw=;
        b=FKnNFHfZJ7mB6FSeP6EQLSykgSu5k808t7kgLdG3dwYPi3P568hn+ZLbD+zSZmmSng
         WUOSGYPycu7aZwd4lsySF3sJkCuowNabeAG7XEnTsFfWWqxf7G/r0pMXzdpKylpg/UEx
         RNyxFnd1CfeEIlbzeKucmAxlWP7gBle0t/aox1calNw5pCsfu4R2AfccZ8PciRES60WC
         JXrd8FoHMbxoh31qYJv5jNrwLlYjgzeNdKllW7WL8SJBaQMQZtJcmODznBRF1ayXb46o
         +i/cnVrIki1JjND5rZu4q31c4FjeAInv9e8l17JcG+MQ8udxdSbNtw9btW5W55rFm9D8
         /XkA==
X-Forwarded-Encrypted: i=1; AJvYcCXKqycb++OZuP76b2+4KCMbdoHQJ3oTPjChNGt7ai1HANGsYYPWskL/cEQsuH1hCBVj4+fB@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yzxv34/cW9bbEX8nFHa7+rsEO0fl8z/Gbyn//FsAw4XxPpMaIwU
	VUvdOiu/e8ehOuc3xRuSchwH6bNjUzQl1RAayWb3QiDJpkUmcTgxHzB0bVaV+/IclsYgT8A4Jod
	bmV6w8J6N985e3z00IO0f2k2HSUmC+7I=
X-Gm-Gg: ASbGncs7p9ODS7eJzMgfcVQEol0MnMTBbFfopngyZTmh0ZA+Ske9XSgvOLKBAvGPblZ
	ADpGcb1bIspkBgVQrTpMY+2+5vwpg+hX1FoGDV3w6dOi5XP9bVxk1q5jT8q9GWiGJZJWTPGhksK
	C1kudsur1wIIgLcfsxpS0EsoQCZ6cl1dQyTP8JMB0bQ4JUbgkuugosBuTqM7rJ+q9gSTG3r+FyW
	Ras7vZkWqefmfyLwJam5SxRY+kf9vPiT5h0xcB3k310Z1hMiXtIkJ+oxYHoJ+8=
X-Google-Smtp-Source: AGHT+IH9aNtcOBhU9O/08k4a+lNAHJ6KNYtdoUdSnsTld4L/ScDSmBNWiHtZtb6LyUGXdag8Z7A60xWLMnV/kh+zt8Q=
X-Received: by 2002:a05:6214:cc4:b0:880:4bb9:4c94 with SMTP id
 6a1803df08f44-8823861121emr149769106d6.22.1762850690058; Tue, 11 Nov 2025
 00:44:50 -0800 (PST)
MIME-Version: 1.0
References: <20251107-bitbake-setup-v3-0-9aa227ade002@bootlin.com>
 <20251107-bitbake-setup-v3-2-9aa227ade002@bootlin.com> <743a968c4958035964411ed3be7d434065f9404b.camel@gmail.com>
In-Reply-To: <743a968c4958035964411ed3be7d434065f9404b.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Nov 2025 09:44:49 +0100
X-Gm-Features: AWmQ_bmKOGorg64VznyFeevobunzaq7Rtb2oc0_kI42s3QvPo3FlJcDYWd5xsnU
Message-ID: <CANNYZj_j=RmGD6kSDs=4BZcmtqZAT4=0V-EkwfsJYFCGKPFoUA@mail.gmail.com>
Subject: Re: [bitbake-devel] [docs] [PATCH v3 2/2] Add bitbake-setup documentation
To: adrian.freihofer@gmail.com
Cc: antonin.godard@bootlin.com, bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Nov 2025 08:44:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8022

On Sun, 9 Nov 2025 at 16:29, Adrian Freihofer via
lists.openembedded.org
<adrian.freihofer=gmail.com@lists.openembedded.org> wrote:
> This is based on the assumption that everybody knows how to get
> BitBake, but that's probably not the case. For many users, it was part
> of Poky for a decade, which is now gone. There should be at least a
> link to https://git.openembedded.org/bitbake and a hint that git clone
> is used to get it.
>
> From an OE-Core developer's perspective, it might be self-explanatory
> that BitBake is a separate Git repository which can be cloned and
> executed without any dependencies to fancy Python modules. It's also
> obvious why we need BitBake (the fetcher) to fetch BitBake.
> But for some users this might looks a bit strange. Why not pip? Why do
> I need BitBake if there is now bitbake-setup to get BitBake setups to
> my machine? To which path should the bitbake repo be cloned?

Please trim the quotations when replying Adrian.

Otherwise, I agree, this does need a section, up front, on how to
obtain the tool. And we absolutely can and should put bitbake into
pip, once there is a release tag that has bitbake-setup in it.

I've already had one confused user [1], for whom it wasn't clear that
bitbake-setup is not tightly coupled to the yocto release it's aiming
to build, and one should default to latest bitbake master. But because
bitbake-setup is hosted in bitbake repo, that isn't immediately
obvious, so the docs should stress that too.

[1] https://www.linkedin.com/posts/michaelopdenacker_yocto-bitbake-openembedded-activity-7393585408602718208-0kUF?utm_source=share&utm_medium=member_desktop&rcm=ACoAABJHgsUBoC4rs3Cqeu3vM4cHkuvzT90KZf4

Alex

