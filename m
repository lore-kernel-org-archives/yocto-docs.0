Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0579C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 08:45:14 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.17618.1752655510598298523
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Jul 2025 01:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LTozAUtA;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fafdd322d3so53532476d6.3
        for <docs@lists.yoctoproject.org>; Wed, 16 Jul 2025 01:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752655509; x=1753260309; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lb86JSWbcFlwldJumeCuo1Ekbmz/+bB/ju2W0bjDjDc=;
        b=LTozAUtANjGT86Re0p/L6vnqJeh2Jsr+O6qvs+Gcx+ixzGIif80ixnHFxvcObc07Ts
         37TKVe1DjamqpyWbzyE6qDCMNEBB1e3P3HtZVNm5R0M1yz+ZYcojfZrgPAf+gSBfwr8V
         OgnNzKWdqSW2/SDi3naQ/62GVz4OjEnPguswj3N621r2LW9MQyhbkJT4dMLs1Dy35UgS
         0fGNCmMsn/ocH2o77jCGpJf3BVuuWfa7d1U9uSfIe30Uib21Yw9iMXaKoRvfKscIqWCW
         uYRQfAKORx/53VQXreyhZISM8h4DarfsvVmVNhMkArnGFck8waRFFz6+dZ2BMhelbXuf
         F5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752655509; x=1753260309;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lb86JSWbcFlwldJumeCuo1Ekbmz/+bB/ju2W0bjDjDc=;
        b=OnDO66z1GCj7Sv16njpTmF+0aKWjPjm0CN7taincukF6ytmMWLZTTIGFY6GhB5jVeV
         5+P8wyKceGUDto3SJbXu/Yu26tnKalmvyQ1dMbSGGNNZ7thcCCDLdXRhqia7r+JYz1o+
         NKTBkM1FTho8uoPB0JQgKvUGF2FyLrzJZdzoqFKydzvqcYKfKtc0+Ocv1D2Wy/3/DSvn
         D7rjUsUgqcDGqfQ6cti6ssPTZCjNSoLsuHk9pIhMZS1zQv82DutzvzvD3E8DtPb+8VZt
         z0ljcq4V0jHFam/A4Vwsh9Dy9yck0kWLEhZgfQRfrsCHwSRek8vjK7iBUO0rULbJIviK
         1xBg==
X-Gm-Message-State: AOJu0YyAQTktiPIoIdu3OKLWov6pUL+xf9I0MHxbAUlY6dSHzkNIydlN
	f3ukRoernnv6h7nv0QCKhCi7RSvjY74QcbSCA4IgqAvRvOJ8XgkTZ8YZfeAGsGDwgETJYbjfaGt
	q8bxhivY8aP7/sQRTk+7zf2FygXRvSZs=
X-Gm-Gg: ASbGncstsknQsBqi6keWLCdhBd5bqDbKkD9Rt+tcIxkxhwWQk8zjzJeCX1pyrGrAltQ
	cRcmDg5AM6qEOoVNNRYMrFsUuIAepUldpRuiofvdfAV9pqesIHVA5ETcrL/QLWDP4VBR4xl6eWA
	lT972f2vucWKMnlECQJLxdMC862x15ZBXJURkiCA4l6rF9CSRtgYkJzQh6TBKKnUCm29oiJSeyg
	IjsOK/U2RY38mOUi1+c8BVfLnceqfj0Z2v0G3My
X-Google-Smtp-Source: AGHT+IHFvjHImqEWTRI+rCiy96EpXGxVxQLR+t6VE9nZ/ep1B5uxVh79AZqkSn7Z9EHUsudxB0iiDAxKSc9swEMQ7MY=
X-Received: by 2002:a05:6214:5681:b0:704:949e:9514 with SMTP id
 6a1803df08f44-704f6a907d8mr26854406d6.19.1752655509458; Wed, 16 Jul 2025
 01:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250715-fix-persistent-dir-v1-0-e3f31214b677@bootlin.com>
 <20250715-fix-persistent-dir-v1-2-e3f31214b677@bootlin.com>
 <CANNYZj_kvLsZG3sgH+nPu9B=pqWBU785w0SGHGdQqB4UW-DtmA@mail.gmail.com> <DBDAVYFTZ6JV.2TSQDQCH9NU87@bootlin.com>
In-Reply-To: <DBDAVYFTZ6JV.2TSQDQCH9NU87@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 16 Jul 2025 10:44:59 +0200
X-Gm-Features: Ac12FXwrIFlR7cElLcnh78rLdQiyyc4CU3-aqK1YEyACTudLSnyZbDiF2el1UFE
Message-ID: <CANNYZj9O4NoJgPbt07Wq82KChONjj8Jp_+-x+EbmvAYOr9_eyw@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/2] dev-manual/start.rst: remove shared
 PERSISTENT_DIR mentions
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Jul 2025 08:45:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7341

On Wed, 16 Jul 2025 at 09:28, Antonin Godard <antonin.godard@bootlin.com> wrote:

> Yes, I also feel that hash equivalence could deserve its own document, and
> should go further than a server/client local to the build directory only. Thanks
> for the clarification.
>
> I will try to work on this soon, at least for now the shared PERSISTENT_DIR
> mention is reverted, which is good.

That would be good, I also feel that the whole hash equivalency
feature is very under-documented, and poorly understood as a result.
We could probably also issue a bitbake warning when sstate is shared
(e.g. placed outside of ${TOPDIR}) but hash equivalency information is
not.

But please remove the suggestions first, they're just repeating poky
defaults and will cause sstate mismatches with shared sstate.

Alex

