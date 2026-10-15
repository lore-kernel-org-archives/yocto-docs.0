Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7633DCC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 08:58:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35324.1792054711130268067
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 01:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FovxBNuB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a02718da81so40086585e9.1
        for <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 01:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792054709; x=1792659509; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=60tDC3+nHLRJo6a9aMzE0GDdGGCgpbqW0tTFylI4gjs=;
        b=FovxBNuBSb8RmOq7EnMWCBQygorWazoikr5w5havyLgDhHh6n5H7JhZhuOJ4/Neu/F
         7IKq5KYw+scG4QazD2U8zgaU/uwBARToV976r4gKiL5qC/74uCzQYn3B4u7+GD9FKuKv
         rsFMHICcEBoSHuUoD1A05Ha31NpAfwZz92x7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054709; x=1792659509;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60tDC3+nHLRJo6a9aMzE0GDdGGCgpbqW0tTFylI4gjs=;
        b=06MSAAiKozgERaoJGlxYqAE3VPPsON+emiyU4IOTnljQ4zxwGv9xMKge5rgEdiIM1s
         AVrx2u7JbCFAj6klQ3AOhOUisyvQIwLt6ZHrIrydGr0wwfmf324nMK2NC7OJlGhg3hL4
         q8scBhOIkKmQQXxKRLwx3uwJjUkKKSwlLJocS/AR/EJyzOOj3oVWMqwlBQSMU5kW2dzM
         H2xqkcVk1XXUCQLLsLVQ6FACCZGfEKwHkzyicMAa5XBzNWnW8jWj+rOOFtAA64x9slEg
         b1Ggo7Ruiz76I0HcirHKs9QEbc/N9KwT6DDBywSZFGqvkLxqx6JzbeFDuSACwbnkLhH9
         uwpA==
X-Forwarded-Encrypted: i=1; AKwUvBxA+t3mmmvYkCNuk7w0nvKZIyhUHoBmOGje6S6TsE319tfnkWQldhNjC2hlD4DBMqBGvJRa@lists.yoctoproject.org
X-Gm-Message-State: AFq9FYJvTabxDA8PqeYNwT1qslDVhT7c/u4rkgmaQG5wvreSHA2/ejQw
	Ll50bIUHU/sfchIXZzLdSvtikKbTMq3xTPWYiAKFcjdsBbss5JS3nCZxusfOtsWx5Sk=
X-Gm-Gg: AYBFou3CwkbOcm3EqVXXSFTs3wtD0KST7PrnUN7jc2ADZnNr3wNJuGoHE5NgFrMPr96
	ZBO6G8nAYCYNMSCo5VXZgMs69GgRDrVV5iPnYNUuEPHWluntILnQlpwOn/i3+OETGKwebQlJXfK
	pw1n7ZFjI7tspaQqhXY/t1H6txsW/oE8PYGu38YT3T9bOIrIMjMfgEa+J64hdJfhD6BxtOtHGn8
	/g2MVClpMmfiL9+1//WvjFleBWIZ36OGHV/JyEUPcjJ02WOVM50zHLIT3tdp8qtRaocqq3cRKMH
	b6EWnKcaLhf8zd7cy/REyR/p4Bx7KsPJMLsLDTNMNIdJue8/2FBr1CHPGfMRqUQjq9TP3mSAl5G
	uXxJfQsCsuAiiD42ZGYxzSIW14ze8xMMlB6Vs4Ry7epBL0o0/NMbD9fnLEKmYPDpeP31dHsCFUM
	8uRLMWSVqLIZhYp/UmLgKGBRM4KHsuOSrovcTcscMIWu8s5OZJGPOl7uziFIapO70WcRiNqKr+P
	3HQOeP3s+xfNkrCelBzx6/8xPlizTAeeVQCpijh0xWgX43HHzbopB9QSIKvTkc=
X-Received: by 2002:a05:600c:8b09:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-4a18e4a95b7mr398190995e9.14.1792054709143;
        Thu, 15 Oct 2026 01:58:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8627:1727:8a8a:57f5? ([2001:8b0:aba:5f3c:8627:1727:8a8a:57f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd97ef4dsm61569165e9.4.2026.10.15.01.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:58:28 -0700 (PDT)
Message-ID: <5d6d74ea44bf61549823ccde83e4c4ed1e274dc4.camel@linuxfoundation.org>
Subject: Re: [bitbake-devel] [PATCH 3/4] knotty: convert warnings to errors
 when -W is passed
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: antonin.godard@bootlin.com, bitbake-devel@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	docs@lists.yoctoproject.org
Date: Thu, 15 Oct 2026 09:58:27 +0100
In-Reply-To: <20261013-warn-as-errors-v1-3-ab3658758ceb@bootlin.com>
References: <20261013-warn-as-errors-v1-0-ab3658758ceb@bootlin.com>
	 <20261013-warn-as-errors-v1-3-ab3658758ceb@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 08:58:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10673

On Tue, 2026-10-13 at 14:13 +0200, Antonin Godard via lists.openembedded.or=
g wrote:
> When -W is passed, modify the handlers to show warnings in red and set
> the return value to 1. Add a summary line informing the user that the -W
> option was used as it might not be obvious when looking at the bottom
> the end of the console log.

The trouble is this doesn't make warnings behave exactly as errors and
I think that is going to confuse people :/.

Specifically, if an error is encountered in a task, it will error and
fail. The warning will show an error but continue anyway. I also
suspect the warnings will still show as warnings in the log files and
only appear as errors on the console.

Cheers,

Richard

