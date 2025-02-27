Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D44C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 09:42:28 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.7316.1740649339183530095
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Feb 2025 01:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HVolQbNe;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7be49f6b331so74332685a.1
        for <docs@lists.yoctoproject.org>; Thu, 27 Feb 2025 01:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740649338; x=1741254138; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAPef1XjUMfGMD3Tu86xo+MmA2j+0VM9HXNODX+7UP4=;
        b=HVolQbNeBEwzFB2aFPcoftu3lT5d+nsYHSreIiBodqKSK4kLcTjS4BYIGbJ12ps/ph
         MYQQUdksxOPWpqGVM3u0oYQyKDrxmjg0EAfL5F5QEv8XDjBbcawMjpEgTDKY4Kc4qvEv
         etXvPbSfTqH4DfJ5DIw8qIewEXztSjzlsCf+FAXksJ6tro+nZwxScxi6u9y6WvjAONfR
         jR1C/dDSguYpoqrsfRlttIiYSnjRMsrPVSjZaxuxNzeSOZJkzFGIp6O/aH5Qf8MOlgPm
         sTnJduRrtBr7BYmHcCwu8OInK29az/Ca+on47TSP1vvId3lJozVVbb7adMtZM3G1JMu8
         mh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740649338; x=1741254138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAPef1XjUMfGMD3Tu86xo+MmA2j+0VM9HXNODX+7UP4=;
        b=oUee+CO4ayOq/qtOwoUuExn5T/EsacTG6RsOBqrjgpG0xk60XmMSPkhcUCVkvO812Z
         jZtLTKIbtCgHuBHie5pKgwtSCGbrLz3iDoDl3yf+lxy2oL5Dr5D2NNx5N4qJXPf5yKDu
         ZvWhCa48UBnfmUvlXDZNwj9cjdE6w/CaG/D6pp+uyrvbzhRTfqzKUbwVZmXKuOQgKAfJ
         TfqPww1PPUhun20yn4/QkTHxB9cHaZusZdBPbGrgOg08sueVO160cKQ7CVwkVaOubBb/
         Chf4OQRI/I24pmWDoVq/oTzKrlO0MzY//BPLxPkw00+0qwGdyo0X7MJSCOD0MCWu6naA
         xVEg==
X-Forwarded-Encrypted: i=1; AJvYcCU6AUkHtYUXNJkmYD20j8cgX0ZQGVRzPggYeEiJ8tYM5lZQoDaumnhi2VxxH9f0SPutHmHO@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyVXwdFo9atb4VI/L3lcXgQM6WFGFeRrOetJ2N1L+C8DmbRb96D
	1QngGrifAF/pFZ1HrPTe5oHThvnobOs/+0rU8lVvPSlmYqm/3M9EzYItABwxWcwxM6peuhVt+eW
	2a0Yl3VK9dPZ8R/R3rKfGc33g648=
X-Gm-Gg: ASbGncsZNuGBf1C/CeFxZuVTHcnOFSgGLP5GRawaHc7pDb3J2dBal6eMkyukNWz6wlL
	+lr3GE5mRVHnMYYbgVLk4LczWYWsZDXZb/vUQx/UzGgt7CWFIpiwqZxVoQsK5AxneOtSzas3LTE
	VaojkCx8A=
X-Google-Smtp-Source: AGHT+IFv0kG/zK4EejGDlvsaaRLsDps3FoLFc1E4rk7OgqhM8S3ooxdM85e5BJaaIQ5JVVn7U8ZJbGlN7DuG/hhjgkk=
X-Received: by 2002:a05:620a:2414:b0:7c0:cb96:831e with SMTP id
 af79cd13be357-7c0cf8ea13bmr3177939285a.27.1740649338084; Thu, 27 Feb 2025
 01:42:18 -0800 (PST)
MIME-Version: 1.0
References: <20250227090853.1632280-1-l.goehrs@pengutronix.de> <20250227090853.1632280-3-l.goehrs@pengutronix.de>
In-Reply-To: <20250227090853.1632280-3-l.goehrs@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Feb 2025 10:42:05 +0100
X-Gm-Features: AQ5f1JobGgv5dKmgARRP8VawGzQD6FSxHOnS1QDSsOD0mAIC3Amr6i1oj2ws8Lw
Message-ID: <CANNYZj_8DU=8eFrbjEBPhupuu13KG7a19V9z_zcj+WPhWAQ_ig@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 2/5] fetch2/github_release_artifact: fetcher for
 (private) release artifacts
To: lgo@pengutronix.de
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org, 
	yocto@pengutronix.de, =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Feb 2025 09:42:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6464

On Thu, 27 Feb 2025 at 10:09, Leonard G=C3=B6hrs via lists.yoctoproject.org
<lgo=3Dpengutronix.de@lists.yoctoproject.org> wrote:

> Authentication is provided using tokens, for example by configuring them
> in the `local.conf`=C2=B9:
>
>   $ grep TOKEN build/conf/local.conf
>   GH_TOKEN =3D "github_pat_123456789abc...
>
> The token may also be provided using an environment variable,
> e.g. for CI builds:
>
>   $ export BB_ENV_PASSTHROUGH_ADDITIONS=3D"GH_TOKEN"
>   $ export GH_TOKEN=3D"github_pat_123456789abc...
>   $ bitbake rauc

Unfortunately I have to say no again. These still put the secret token
into a bitbake variable, and are therefore not any more secure than
just putting the token directly into a recipe. I have to restate: you
need to find a way for wget to pick up the needed token and produce a
header directly from netrc or similar file that is managed outside of
layer/bitbake metadata, so that bitbake never even sees it.

Alex

