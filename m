Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A90C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:12:18 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.17912.1700655133238959571
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Nov 2023 04:12:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fuSlXsk8;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c8769edd9fso51595601fa.0
        for <docs@lists.yoctoproject.org>; Wed, 22 Nov 2023 04:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700655131; x=1701259931; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iC9iFOZVDDR2p2y8RO79d1qfZtVLGt/jGtm1IQGHyPc=;
        b=fuSlXsk8TwzHCxSZ2Cu7JdXJq/2pYgh9W5CrsmcrE5h+JQ1Ew+WLvcqlS0LOBDgMzZ
         zsOEvvtp8/bjHEG0STh0EQ9DBVTx33Feo7zGd9JfRZaGWHNyaR2/f38//AymdkFwCbNq
         ONIKID64NGP4T+VhOGT3I0uCsAw7H9SFraRSl8zHe3maDaRn/S5CCsL79owew3dASfR2
         kf0HdN/0XmTfkFFxH59EnY7Y1Vn+aJnDjtAqBFqCs07hISDz9evOrkx56aOSowZF+//F
         lp7swolm+iqxPv91UXOfqHcv1FAU/g9TqqtYZ+lxqyoDoOa6Vj34TV/4Kd5UGr2y0A2V
         FeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700655131; x=1701259931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iC9iFOZVDDR2p2y8RO79d1qfZtVLGt/jGtm1IQGHyPc=;
        b=U3VfUpwCpqBfikXjKe5qq1AgT5Jsi/75gIC7/hE6RJnCRt81KqDgJGk9ZclkNBPXFo
         hks/TFkt9TcxACa2gFu200+LgVbdVTpj1Pa5LSmXj3uVmzKltOJjRXdYaryFEOyrz/1y
         JkksEoulTh4xxxqfMU3B6piwEwqn3KVCiiCQuAIos5nyzYM1RY0zyHoxLpN287/nblpS
         M88nLSEMvrdD2qHpZbGjW1DbIbN/nPhGOppPtetsz01m6xfNx6LGvrTS3eGV9QVZ7jcY
         CDlXa8GSOxb6r9ICcLkdEj08reMpQ6qOoWQEkFGfZbvnl/bDN2qAoPDem4ATDH6CKWfT
         Cshw==
X-Gm-Message-State: AOJu0YwAG12vBP4fLQv2fxPSfQSpG1269VzNyQDXIZ6xWlb2NX9aRnfU
	0ZNHN5lohWPUiwdClEqyUzWY0OhqXz97/qLuomY=
X-Google-Smtp-Source: AGHT+IEiDWbIzl6q0xHpR9q+c8s82xWQu8VIf6Dy5t7daoTeTXQBNFt+46c0euiaEpoDkHndjLrc8sDR8upe9A1DoTQ=
X-Received: by 2002:a2e:9610:0:b0:2c8:8189:911 with SMTP id
 v16-20020a2e9610000000b002c881890911mr1417685ljh.3.1700655131237; Wed, 22 Nov
 2023 04:12:11 -0800 (PST)
MIME-Version: 1.0
References: <20231122085438.7328-1-alb3rt0.m3rciai@gmail.com>
 <CANNYZj87+-6jte1KYUNg2ueWvsYzxiOQvbTzrCZ_ooo9N7uutw@mail.gmail.com>
 <CAH=B7vfs74f-vyx8JGJyfAu3NPa5xwgumsW+_ahMBXnfUmJw2Q@mail.gmail.com>
 <CANNYZj_XcosMZQHswireb1JHJahUvSy1NuHy_3-f3Km8aWwgbg@mail.gmail.com> <CAH=B7vdEtF7f51uRsN9qMcL_80M3zsPfFUsD4v_HCgJdxXLdsQ@mail.gmail.com>
In-Reply-To: <CAH=B7vdEtF7f51uRsN9qMcL_80M3zsPfFUsD4v_HCgJdxXLdsQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Nov 2023 13:12:00 +0100
Message-ID: <CANNYZj8MKBmCPYnv91aUTJGpMghNyX1KPUGTo9xW9rc8rbLWUg@mail.gmail.com>
Subject: Re: [PATCH] poky: kirkstone: eSDK: fix build-in eSDK environment file generation
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>, docs <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Nov 2023 12:12:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4641

On Wed, 22 Nov 2023 at 13:10, Alberto Merciai <alb3rt0.m3rciai@gmail.com> wrote:
> > Alberto, can you check that this works as expected on master or any
> > more recent release where my commit is present, and the file is set
> > correctly?
> Let me understand if we are both at the same page.
> That feture will be not integrate in kirkstone, right?
> Are you askin me to try that on a more recent version different from
> kirkstone?

That's right. If you have to stay on kirkstone, then you have to
maintain a private backport.

Alex

