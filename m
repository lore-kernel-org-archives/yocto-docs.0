Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D679C7115D
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 09:26:16 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.3920.1750411574203083324
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 02:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gkcm1qv2;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fad3400ea3so16066646d6.0
        for <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 02:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750411573; x=1751016373; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cgzovxX19hTsZLVBO7VIAwn/4rZyo2QXJMM5CXRtZlc=;
        b=gkcm1qv2ZQL5yPmBVHnJkIQNuIrymrIghlwEZx/pafEgA2s6qAfLPio420F5Q4fMKM
         8ujuApVcS/yY7aa3f4QL+rW3emOiZIngf8ql18y+TVo8HJsw/NSRRfpOAQE1QqQgrf1J
         ZmABkUBEBOD8/9AScRxr5CLKWTh8b5qXvOdJhTMf2o/qm0ZHzkrLk3f/PgTGfwSTVzH+
         d42faqGRSl6dldiDrbCcvn0ra6jyWEDqljY+tM1LF7qz6+Xsd2P+vFXd21nxLpb0uhzD
         8G+VYzKP18poqx4A51HSDxQttpfO48qAtjZQUtpcn33g0Jcxzpp6V++ff92wzoJWibJr
         RmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750411573; x=1751016373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgzovxX19hTsZLVBO7VIAwn/4rZyo2QXJMM5CXRtZlc=;
        b=rCoDWO9uivSITAdhiftEeqcmxmTwbO8QcXeV8dWFFwkR5p3BY5vi36xyQiEMu/iYCG
         wZLuUfo3tM4gtBYoyFSn6oJEEpd5OhlA5sNYyo7v0RRnVDX4txs9hDOH8XPXFiDEjdbM
         DUacizkrblGIcPCkk2BRKtGXGZZ5NY8PgqhJqbyRbMJ1o5FIQrwu272KoBANNwAA841T
         NQPhTn0CFq99F+ZinUyoSxi91j9EXWcHHpgChvvRMlBE4nDGHlei2cucO/XsZtAUxB1f
         lE1nPVsVAhUb0+cAjzXbN4+VFE94RL6Bm8qsww/ZpK9VMgfHIzq+Zc/kVFyCHlu3ZLrr
         PHyQ==
X-Gm-Message-State: AOJu0YzVglKOn2MfcCXOcS20V2Tk7DwxJw8MRxjBb1Q/PFx20BBQnSot
	iYE8LhDuIj7GO2veuNurjB3RSX1bm2BGPZQVGqZaLq/bKvKyBkJM9G31sTPpdvK0TdvX92dZjwO
	WqWBXcHNFN/jUzH+9CDYcW0TOAVFgHEA=
X-Gm-Gg: ASbGncviMf7aIqz8gewClPD+oDQzedyysc6QNOJsW098m7aMwbcxOJtcH6Ns2Of23Qb
	f/GFbNsGx7O2brpgc3gtd+HK0FxnsF2UW8Wx8i0zNRwq2B8PoM5CXu2VMLcHQr2Qurt/zsXgtBl
	jwnAN4nOvCE/BRTi6qD3rqrRWJjeVbyUzIFpXrGJf2ckg/UGUMkV6oQjeOKS6tns+MAZ1INVwGe
	mNikQ==
X-Google-Smtp-Source: AGHT+IHDmdHWrqgRGDEkIcLNvvVe2o1Jmv0fdgHEU5sGltEuaCQy/ZCRt5URY0t6K8qtIcbJ4zIX6682kyq0IwbFGTI=
X-Received: by 2002:ad4:5bee:0:b0:6f9:201a:c05d with SMTP id
 6a1803df08f44-6fd0a53b861mr31974876d6.33.1750411572970; Fri, 20 Jun 2025
 02:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <7da04e7f-11c4-819e-cd9b-7aaea55bd91d@crashcourse.ca>
In-Reply-To: <7da04e7f-11c4-819e-cd9b-7aaea55bd91d@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Jun 2025 11:26:02 +0200
X-Gm-Features: Ac12FXzTTbvXQWTh6z9xFTlPtVZzF6IZd0R0m-eSwBl7iC3_1NxvmmPtmutlzBI
Message-ID: <CANNYZj-vcNipixa-0e+v43ww7CCfLqtFVG4WBF7U+Tq9Fg2PEg@mail.gmail.com>
Subject: Re: [docs] dev manual inconsistently encourages changing "poky"
 checkout locally
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 09:26:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7119

Can you point to the 'other doc' please? I think the idea is that one
never makes local modifications to poky, but pulling in upstream
changes is fine.

Alex

On Fri, 20 Jun 2025 at 11:05, Robert P. J. Day via
lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
wrote:
>
>
>   while at least one of the other YP docs stresses to never, ever,
> ever mess with your checkout of poky, the dev manual here:
>
> https://docs.yoctoproject.org/dev-manual/start.html#cloning-the-poky-repository
>
>   reads: "Your local repository of poky is identical to the upstream
>   poky repository at the time from which it was cloned. As you work
>   with the local branch, you can periodically use the git pull --rebase
>   command to be sure you are up-to-date with the upstream branch."
>
> that seems inconsistent. does that merit rewording?
>
> rday
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7118): https://lists.yoctoproject.org/g/docs/message/7118
> Mute This Topic: https://lists.yoctoproject.org/mt/113739433/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

