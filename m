Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389F4CF885E
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 14:01:56 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34815.1763647313387262218
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Nov 2025 06:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cKI/6dlr;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88056cab4eeso5275216d6.2
        for <docs@lists.yoctoproject.org>; Thu, 20 Nov 2025 06:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763647312; x=1764252112; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aOjkZ4x+fAI/bpwg0LAgjFZsf/K4QNb43g0VQosLO3A=;
        b=cKI/6dlrvCoXF4Q+Os6ygPnGd0pO7qF8H3dQycAFmU0So/Thw8hIGPG2QSD7203L5c
         Rv1Ju7avUH184GUk2OxCm1izKHfiiFTuTwU8lVA2Wo1k4SwyYvbokyTFrGZNP9NEFvU7
         PK9vpD1PagaVEgPw7GrVqhNR5IrY+arkdKZOf6ZXv4jiwXYCRV+6W3TQZFTcDovBLt/f
         M3YQ+bBEkq9EjChezI8dYP6CU4Lw7+yfcyQxHeLUaAAQ0cqm2XfMon8GxU5XTGiaroCN
         IsaYNrtDrJJUef5FXSv+6ag9LwYXcmyx7ytrqu7MCpP0p6mVs9ZAcmUKiM5Jg4SVASGz
         PJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763647312; x=1764252112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOjkZ4x+fAI/bpwg0LAgjFZsf/K4QNb43g0VQosLO3A=;
        b=Sjipig3DO2AD+SrgHwyfCNq5BpoQjcfHKaVENVNTchfHSU0SLIV6UkWsM7XF3vS8lf
         1R2A1kuV/QaTn9/DbqIw9yTNkgEdJdLQkf1M5eXvL5MTQ5jjH9/yWx85Q+ZwHp/I6JN3
         SCrd+v3En4TD2gwn4ETlct1uBwrbsmwSaP4iWNAVna9+0bdNPHrtY6bxOtEaEmz4iKJk
         H3P04wo/yHF+LqZ5cxKBxvysgcM3uHLfksusjgFhOm7QL71Fs+VgpPb4XHMtEJXrChja
         94WGjvy36/MhhHaYxt2PmzhK6vQp5on28bwqtdeQYiAkvTEDggeCDOVB77m3so5Cj3lF
         sBaA==
X-Gm-Message-State: AOJu0Yw1/ms86vHvkJhlE61fSTqF/MjOZ+SH0M9js9AH00L5UtQlJNgN
	zYrrHN5VnA1NTVCARGlQPTIJzA08wPgvaiS3DiKhxl1heeckh/WE8W0bty+7h+85L+fnwB/WeHk
	Xbld38/nG0j6sa3t9ecuaKpase9wU3fA=
X-Gm-Gg: ASbGncv0IsQxytw31J7/KJea5Rpq1WuQchT0+4yqzNSVe0EopanJc2BnEkEdB9PN5ly
	y3hflu7j4xaivo6YAWf3qwjKF+lo9onp58wwGGqrHjwTv/Wk9sbBqMyKFNX9zBAehJKaIXg5d2S
	ttjl/iDO2Hu8PLgorngTkkn+/h35mLn+3UPwtOCccWG2t72Ak/g0BA7QHgf0SdUnhc8eQ5KpElH
	Zos7GU6i1TnFCW4CI10vvo8rStGiH48RfS5BWFmd/OGRyGjaqU0rW+h+7sWxUd2y8D89kvW9kC8
	582Jda3q7YAXVj22dj5T/S+0HIMAfw==
X-Google-Smtp-Source: AGHT+IHxR5cZECpdkF/WCx8tr35l0senSxegR7oQt0SlKzf0TmShly9NSYdmZENz4hx6zNvwhU7BOZcgcpg1bapVxqQ=
X-Received: by 2002:a05:6214:3118:b0:882:3ecd:20ec with SMTP id
 6a1803df08f44-8846e1f7910mr40448006d6.60.1763647312038; Thu, 20 Nov 2025
 06:01:52 -0800 (PST)
MIME-Version: 1.0
References: <00a37b3f-b40f-f58c-3af0-3512f1f40c2a@crashcourse.ca>
In-Reply-To: <00a37b3f-b40f-f58c-3af0-3512f1f40c2a@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Nov 2025 15:01:38 +0100
X-Gm-Features: AWmQ_bnVDX6NLwO5UzLI8FJ3wsOYuWuQT9qHuA_-hyLUWAwnGPN8l9xsaM0Hkp4
Message-ID: <CANNYZj_sH4Pt+aaOP7+2oPibC32QbrYyKYZaKc2CDcVNrExXnA@mail.gmail.com>
Subject: Re: [docs] "bitbake-setup" suddenly works differently from QS guide
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Nov 2025 14:01:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8100

On Thu, 20 Nov 2025 at 14:48, Robert P. J. Day via
lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
wrote:
>   something seems to have changed dramatically since yesterday ... i
> was following along here:
>
> https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/#use-git-to-clone-bitbake-setup
>
> and i'm sure yesterday, the build directory that was created was the
> verbose one as described on that page; something like:
>
> Enter setup directory name: [poky-master-poky-distro_poky-machine_qemux86-64]
>
>   suddenly, it's only "distro-poky-master". i'm confused.

Robert, I don't understand why you rush to the docs list instead of
checking the newest bitbake commits first.

Yes, we changed it to something shorter, after lots of discussion and
prototyping. Yes, the change landed just two hours ago. No, the docs
can't magically update themselves when that happens.

Alex

