Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C10DD41C0F
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 09:02:41 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5250.1765443753472604839
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 01:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2HualOD5;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b38de7940so287898f8f.3
        for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 01:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765443752; x=1766048552; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9h1EzLK3qTBqyXmyGGhT292PFJ2RMjnYmBM5al6PdLg=;
        b=2HualOD5glwPLRqqSkR9OWiYfU2eOB2UsST3BzMJrWS4aDpX1YAnO6hueyohirjo2Z
         RPlKeRyu93SKI7SGqcBRfHNCP+554AjtmdTOfKUdKJCixmQ4OqV53pTeiQ+JCjDl7TWz
         MaCQERfzUVPJ3NZppH9ADXSQoesclLs3lYxiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765443752; x=1766048552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9h1EzLK3qTBqyXmyGGhT292PFJ2RMjnYmBM5al6PdLg=;
        b=W4lw5axneLKrVBCFtOzAyGDIojm3vfOUv+FhiHyZNy8wTI2RfrVgEB4X1E3+LIf51v
         fsmCZEWBCSv6y5MmUsxS5uaLwbpgFa/PcsTwKKrUWcxp/VDuopt5DL/ZjirjtZiyZWzP
         LwC+u2j4VPkGXybyvR+JkS4ohmieu2HZOmw4L+RHEQVZtrZSPkkryx10KnRlN0Q+6F0M
         9FYkb7jITi8a5q0u69mQ4VUyeovA9RR6DcYC/FSXe9qW8t9f2xbrj28rih813ecIP1vh
         m25TM8cjl1UVElWk3h9/YkiVk0+HptqrNYTjHdzKTgX7ere5JYK1l4xSTdUlgV0AaCZZ
         kKMg==
X-Forwarded-Encrypted: i=1; AJvYcCWGEqhNiq+eJg1TQpPyztkiHlB4iTRBAql4SGPxyDfG5WMmPOFyGiYtxKYQK0VPUyovIJxD@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy16uASb7yQEAcLxnPV8LnF8703B/8pL+ZRe0FrKh2BIoVcMHBh
	eSg5nMzK1L8b/Ur6RjOeeu9S2YuZO+Jnet30Bpotz1RoSYftS+eD/68cXS+cALOjXexzkJBY57k
	jLtMpaD7OxxGwcZfFvd3+Z9dqPOl9sqtfTeiBURs0Sg==
X-Gm-Gg: AY/fxX4s+qNN4y+ElC2MQ7bwPT3UTXVkJ4kgDgk/BtITfGIFdxxDPnhYsoQK2N2QHMh
	+hpdX0FHmOWgrcxwiygzC/mfqa0XDxDbgLNEA7mQJGyycSDqJrk6V7LOUdJzdU5Sqs2mkMtTjJM
	GOJSFm4aBvmZLWqOSDoHkBaHgiHI7A2nF87NrqvM9O8YiGYzMmq5d9tTUUdbHLupHq5QE4QJ30e
	RPEu/lwP/BzLS/E+POHyeLDcNYjlyoroYb6/PaubGJpmyjb6wmhVMzbCca9e9bQKo9nTQy6Ie3q
	WZNhF0UxDvK2LxaJeu3HVpDlUn1i
X-Google-Smtp-Source: AGHT+IEP+FMzHkZJv1CxJz5OShEbcY+cEZhBsN0d1jeKpSMyw1kLr1ifdbo2B/k2ekwWp18Y/bgsm68XXT9h6o/R/r8=
X-Received: by 2002:a05:6000:2888:b0:42b:3ee9:4773 with SMTP id
 ffacd0b85a97d-42fa39d8bedmr4426973f8f.7.1765443751777; Thu, 11 Dec 2025
 01:02:31 -0800 (PST)
MIME-Version: 1.0
References: <20251205234033.6363-1-swami310@gmail.com> <CA+-_CqnqT4roapfisF_6gt2P-OJ8gkw9GvRNEnWh9FQX6HU7Sw@mail.gmail.com>
 <CAMSfU+5enXOdO03=d2Nfx6infFOoema2Y7xQG9VErNN1DgbE9A@mail.gmail.com>
 <CANNYZj_a=DgXvyRRr8igP6HLee819-DKfjTnWd8WHu9Fs5Wv9A@mail.gmail.com> <CA+-_CqnfAQu_-h=smym8CayOxCdh1PHa7dOhvMnq6axerYWO_Q@mail.gmail.com>
In-Reply-To: <CA+-_CqnfAQu_-h=smym8CayOxCdh1PHa7dOhvMnq6axerYWO_Q@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 11 Dec 2025 10:02:04 +0100
X-Gm-Features: AQt7F2qyotZr84SRr5uZa2nqwETUhabs1GrCETmR646wfmCq9slbu3QGio0SLiU
Message-ID: <CAMSfU+6Cv-WkM_M2MNMJ_Zag4efoRnh9eCNZthE1HMDCSoW7Yw@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH v7] bitbake-user-manual: Document BB_CMDLINE
To: Swaminathan K <swami310@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, bitbake-devel@lists.openembedded.org, 
	docs@lists.yoctoproject.org, michael.opdenacker@rootcommit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:02:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8241

Le jeu. 11 d=C3=A9c. 2025 =C3=A0 09:58, Swaminathan K <swami310@gmail.com> =
a =C3=A9crit :
>
> Thanks a lot for the clarifications. This has been one huge learning jour=
ney for me.
> I will start working on the next bug :)

Congrats :)

> regards
> Swami
>
> On Thu, Dec 11, 2025 at 2:21=E2=80=AFPM Alexander Kanavin <alex.kanavin@g=
mail.com> wrote:
>>
>> On Thu, 11 Dec 2025 at 08:50, Yoann Congal via lists.openembedded.org
>> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
>> > > I have not heard anything after I submitted Patch V7. Is it accepted=
 ?  How can I know the latest status ?
>> > > Please help me understand.
>> >
>> > Your patch is in the master-next branch :
>> > https://git.openembedded.org/bitbake/log/?h=3Dmaster-next
>> >
>> > Which means it has been selected for review and tests. Once those
>> > happen you will either receive a review by mail or see your patch get
>> > merged on master.
>> > Merges usually happen after the patch review calls (which are on
>> > monday and thursday :
>> > https://www.yoctoproject.org/community/get-involved/).
>> > Ping back if nothing happens in a week or so.
>>
>> While the process description is correct, all of this has already
>> happened, and the patch landed in master some days ago. Which can be
>> seen in the link above! It's just that master and master-next are the
>> same at the moment.

*facepalm*
I really should refrain from doing anything before my morning coffee...
I totally missed that.

>>
>> There are no separate notifications for when patches are accepted, you
>> just need to check the upstream branches, either get the latest
>> commits with git locally, or look at the commit log in a browser.
>>
>> Alex



--=20
Yoann Congal
Smile ECS

