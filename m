Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AD4CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 08:54:05 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46112.1778489636703921926
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 01:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QZYA/G/x;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8bb4e8a5240so45786126d6.1
        for <docs@lists.yoctoproject.org>; Mon, 11 May 2026 01:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778489636; cv=none;
        d=google.com; s=arc-20240605;
        b=lCvrWZNPuRo6almKXir5INRRptpG9UDJ4QUCrvc4RrxkIPhZ21lqZqw3TVA3GwcSZZ
         n+eDtsQLD6U3lnn18S+b3HcAACBk/qqFVDfKC+ttb9HUai51kn5XsqaYgy38/Izz/FTi
         NhQTX//V8QXAbFwcAQERML9KL6a2D2s3g3QA3dYusk20SdCoBiSGB700uOzBiRlse7f1
         RE+tn7aclRBFefmJtIKGNmdLjL22PjbO8fqeXXgV2bftKCKhNWcx2I9P1nX+A5WDVUAt
         p6lfojPqdRnv/BX29TvODPyROp862cqv7atxvZt7K0trGKwZH84glia+mJpGg3c6SsR4
         Kk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=swNuqHSCzF6+7uuPtmMzDaT88wxtF1DBfetgQO1T0hw=;
        fh=w4udndNa3z3dS987rpA732l9rCEUCMDw7O6T9DWWVD0=;
        b=Fq7axlPpnqsEW9Y4zIWMSEJIvUke5HQTvYZlcyA6l2rybww37UiVuvRRfdgaj/T7hb
         JrL1JYpBm7pNdnBmFQjcY5YsJvuZza4Tkwvsp5dyokz3RqOd8MEmr2T6/Tap5Nuroxpk
         7roEvwKJRN2MLvhbcHxW4VCAt7GaQlCg/+Zrp4jv/vJSGgaoCOwFFOTDRw2qWPnJ3nEX
         mGEh/SrjG+8p9+BASVNV9dDT+ncVvzbRvflqGsc76MlFGMZ89f2dVFjsizz4G09YW2Rg
         0RED3yoLNRXDkpM2mIk3KI6JMeZEFQVev8f2bOEwaEx09e4CGNUJCto+pjpwqlEdTnvc
         Nmjw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489636; x=1779094436; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=swNuqHSCzF6+7uuPtmMzDaT88wxtF1DBfetgQO1T0hw=;
        b=QZYA/G/x3UM+hw2wd0GeHqejOxagbPBsq4Fpea5Q5Q6JwsVCqYIHSBEL+u3V/qFDKd
         yhkCvxrGytc4xRiR2dpbDsvYvoCSINya23dyhtJXw7ND6DdI3cA4hw+kC7sInPxLp8tC
         g5s6H8q2VWDkwt1BYZrWYbAur/2EItCPw6K79guSz/Z58qF5wTKSOvz33SsU1jXh0wuL
         HIKMM6FhJzzzDo5wW+gNYTnbnsArlEdITLC8BNfH3mrauYoTsPHosdIeGUmtJnnXCQd/
         1GHZGsiG8smCAHzOBglOzEJBQVeGTDFHmDssPL/TCWde0sS3c29GeP6cIXuFcZoNTqwd
         JDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489636; x=1779094436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swNuqHSCzF6+7uuPtmMzDaT88wxtF1DBfetgQO1T0hw=;
        b=L31NbVa9FR77/H5sVJIHX+jDNlycjbjJa4/0cjUJSZsK4thuvKkdNY8ZcxhCxdYOjJ
         co9P7b+mKpagNQ73xqS09qqp/LfEBMvdzvfV/3mlP/26GIpt3GcWKiSTayhQbdIZdP+s
         EulqfVmQ9ei6u4uaf4NZMSQNGsgWb8gTKPnBgERuheER4zDa4upJ8JFt7xcgSZYkXpGk
         MbzzCV4GAoRf6uFgkJnfzmUz3+RwEauOB9I54hswfvKBbvyv7Qt3qJjX9b1Zgl87uAPD
         kNTZQnJAqM1n4e47wAGI1MOstS1N9pOx3n2CWsupiG9dRgkHZpJ6oReBXtNWI/5FTZmx
         VoCQ==
X-Gm-Message-State: AOJu0Yx4IsSZ308cFSzZ2XsjIKynTPeoCrYgwVHktIycmCVkY8m8AiAf
	sKcnX86/vS0a0G2NAvaczX+6BdsE3VdLc9zpa8bBxLkJIzm6AKWHyXF53yGMjzqZ5MjIgLTqjZP
	vYVH+F8Qc4ggCKGs50k9c95GoZ5dMPMx2lA==
X-Gm-Gg: Acq92OHmWN9oEUetLYKeMRxM7WhO0qzR/KB+P3m+//tKVwnibM89UXGdGbzyU3TBw6A
	qKrDX43dctT1CCQcsxn4jCt3T9g4XczM2JnZnudNXSWshwhvieW2qTqLPE9HLbv5IBIIZQTSh4p
	n3kZwm9B2s0bo+YZey+7woKBhzUGa/HXThEcfOvYDQHIvrq1Y2albdwYuXa1k7x9eLyShRDuxfR
	F2WfLL7RftfEqsNDoKGNiM8azDTBzb/40Ms6O0EL/b/9kzK7HbIaDkZIM/jQSQG4/9x+2mMYlSn
	3JOVRUUdpvb7FOjvS4RRv41iN8NTZrQdi6yEPzuyLuNDyZ4Gznet
X-Received: by 2002:a05:6214:2502:b0:8b1:f784:7ecc with SMTP id
 6a1803df08f44-8bf443bd608mr209880696d6.46.1778489635625; Mon, 11 May 2026
 01:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <c0d4ae07-a4db-b798-090c-27782b121a3d@crashcourse.ca>
In-Reply-To: <c0d4ae07-a4db-b798-090c-27782b121a3d@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 May 2026 10:53:44 +0200
X-Gm-Features: AVHnY4KJWyGbD29QCZYR7Po09Hm5Be_A9jvHAVOlZwRsb2Pc0yOIR4M3ZLQnavc
Message-ID: <CANNYZj90n7EAL8L_cAKpjzndKjWcV_K27+FCSXSyTwPkmwc5Uw@mail.gmail.com>
Subject: Re: [docs] Should there be any writeup on using Claude for YP?
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 08:54:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9435

On Sat, 9 May 2026 at 22:11, Robert P. J. Day via
lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
wrote:
>   There's more and more out there on using Claude Code to do YP builds
> ... is this something that should be documented? Perhaps at least with
> links to vetted articles that show how it's done?
>
> https://www.linkedin.com/pulse/how-i-automated-one-off-secure-boot-yocto-build-ai-saved-siganos-y4kcf/

I have to note that Claude is an entirely proprietary product with a
subscription model, and it isn't clear if the current pricing or even
the whole business model is sustainable in the long term. I still
cling to a belief that open source development should not rely on
proprietary tools controlled by very large corporations (in this case
Amazon), however convenient they may be. People are of course free to
use what they want, but what's in the official documentation of a
Linux Foundation project is another matter.

Alex

