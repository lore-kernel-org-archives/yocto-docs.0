Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BBCCF31A6
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 11:16:36 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4296.1763550991698812170
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 03:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E0YRe1tp;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88244d1559eso9053816d6.0
        for <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 03:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763550991; x=1764155791; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CS3qNs9WRyLcXFMr1kEPsJ1FwC5oYE/ciGFStyxfV0M=;
        b=E0YRe1tpEcpLEci4UXH+9j4wMtE/Gbwmhm86fGg1ba1T8yH9E5lqhUjL7AmzVlsM4e
         dcGu1yrNRn/GF3HqAl8S29h5iCVauXQi7RJEeAUe1h7NxcIjYsQw7IVcRAU3cLTjjKIp
         EX0Q+nrcvmt+Z3cnDyiKHzC9Uy4ETwJwBSCwyweuJNhnBdg/DQoTkbBHztyHiombnZYq
         RIjY6Xgz4e8BKW4g7McCkn7TFjRh3v/cfILKw5EXn4tAZuhZbYEg220MO5C1EBamlHft
         UmTmeY99IFhkPbMS7kRRTTZR1zDQCU9wi/EuWnepVWp7282R73Ko/mt3qM4h9aSzj50u
         jUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550991; x=1764155791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CS3qNs9WRyLcXFMr1kEPsJ1FwC5oYE/ciGFStyxfV0M=;
        b=R3fheF1aHpObTJQ3zawpcPHKv2qPzJfqje+5a8mkWZAYn42UdPZUkNov8v8RTzqieN
         ET17Oiq8NdnrdliNqcbBLeghtxDElx6QKltd5NDV/47Iheqs0VKPw+Eg/5A70Qg8HPWO
         RMpDrtXMpwmCmNDVq3H1T3xJiZA+xMqYZnKbMJAu23s48OUEiuZZtgPM9y3qxRpDLDJh
         C32Z7z/Vbb+VP939lhB+TzaJ8lKoyho8hovwkiadO9GPNBP26vFsGxrOSMhAKwJ3zwsZ
         L67RB+DGKUrO+YqnAaCIWU+0C5njVE81KCgWDkFgrYolniqCZ+XEf3/2/7ssIe0MroBR
         qljA==
X-Gm-Message-State: AOJu0YwNdU040lm70fLJTmO4KHIYHJms9Hsdd8IUMIO81cqbkV9JpAu4
	O33+A8VuRE3VzD8FE9e47ykF+5Dn7V7878fguZdy8MKgnvqelw2EC2rjdg/ws6yLaIWvqpkN0JW
	INC5rX0UjdOBTU3bq5DCXTe35hGMXqpg=
X-Gm-Gg: ASbGnctQPLu4p4aa0l2CxQhR8OvKKDUBVGEqGUXgQeC5lRPuaJWFvinaa64LUD6eNXs
	vC24JmdxLjXxfj7IhyYW5SxjsoIT/vFBUhPnGpR5L0xF1PibdMU87ae6niNef6efrrfy7UiysCv
	GdnupEeMScIUTUSM2iqpvu2Dct39pltWu2y5gDUQffmp5XsZORTtQ/MVjrTjpXod/N2pEdpq8fW
	o6RaLhiXZLhBEWIASJCPL2GyYkqomlzHa7xF0k3zaCL8mA4DC2pcmkIzZ6CcvkmwEokbxlx/h1P
	IIg8lsjNhoe7ONQ/slEkQP3+2nd9KcGd/ji3rjNX
X-Google-Smtp-Source: AGHT+IFTuttXCfaSlJ7Cqke6T3/oYnNyb3FnY4vpKpVsJScjds0+IJXaLyCLRlEdT0bPr0nH6IT+ZdaQrm8X8/ItXW0=
X-Received: by 2002:a05:6214:76c:b0:880:837d:aa4c with SMTP id
 6a1803df08f44-8846038358cmr25633626d6.28.1763550990610; Wed, 19 Nov 2025
 03:16:30 -0800 (PST)
MIME-Version: 1.0
References: <9e6f88de-bd43-49ff-bcf1-aa2d912b9fb4@crashcourse.ca>
In-Reply-To: <9e6f88de-bd43-49ff-bcf1-aa2d912b9fb4@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Nov 2025 12:16:19 +0100
X-Gm-Features: AWmQ_bl0iRhEf9DFriEdLUZ0XBVrD4ZLapQMgbmv0LC4dx91pSK_TGyr38dORjQ
Message-ID: <CANNYZj8oUjBRDJic0Xo3vdLScBnrxGBkEoViBsj1r5Hx=a=fAQ@mail.gmail.com>
Subject: Re: [docs] first observations on YP quick build, bitbake-setup section
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 11:16:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8075

Thanks, yes this needs to be tweaked. We're in a mad rush to fix the
most pressing UI/UX shortcomings and get the release out, so the docs
can fall somewhat behind.

Alex

On Wed, 19 Nov 2025 at 11:49, Robert P. J. Day via
lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
wrote:
>
>
>   (i don't know if the YP docs related to bitbake-setup are meant to
> be kept in sync with the development code, or whether it's all just
> going to be left until the end and updated all at once. so some of
> these observations might already be on a "TO DO" list somewhere.)
>
>   here:
>
> https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/index.html#use-git-to-clone-bitbake-setup
>
> one reads:
>
>     Setup a build environment with the following command:
>
>     $ ./bitbake/bin/bitbake-setup init
>
>     By default, this will setup a top directory in $HOME/bitbake-builds.
>
> that's not what happened with my test; the bitbake-builds directory
> was instead created in my current working directory.
>
>   is that one of the issues currently being addressed?
>
> rday
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8074): https://lists.yoctoproject.org/g/docs/message/8074
> Mute This Topic: https://lists.yoctoproject.org/mt/116371514/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

