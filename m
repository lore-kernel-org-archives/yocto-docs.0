Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E378CE8D70
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 18:13:26 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4803.1763144002462203891
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 10:13:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YRRRSUSI;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8804f1bd6a7so24085636d6.2
        for <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 10:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763144001; x=1763748801; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9pq9dkG4yS0xbAaSfZGBfQMtUBX3EjboiR9N3zEULBc=;
        b=YRRRSUSIDLwtNWOrNiBj4fMltnzQ3xVgIzByuj0IuDD+1dBHIEBpqLMQlszezc3i/j
         XuN2WzDIU1m1p4kR7N0z7d+Xh9iebffG8X0xHGqh23QrFFdFU35FtlmrtTNY/jr04K+I
         dLVoHwBdbifPdjsKLikIUYK9DYqzz27g2VzE244Hhm/lkq+swSdAxN2/BljcaYWw6eeu
         +m2jNmuyIMlJreYD3r7YKNJtBEsqduhigmaQ+3gLb8un+sg0YbB9CJbOL7eqwLLm6SVX
         7wSa6EkfMflt3uMsAz/+I/MF9x61P7+FSaWnTqMHQ+kKCaNMABGaWezJ+9jQHe8jmHNg
         76EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763144001; x=1763748801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pq9dkG4yS0xbAaSfZGBfQMtUBX3EjboiR9N3zEULBc=;
        b=PHDKgGc5LqZ2mTc2lmb6S/VbrUZR7xNhu+pHmC8j7Q+0wx2hzVVyX1pXB5GsgaaR3h
         ZcYOIFkF4q4m6lTMsbyH/eaf8EDhGmwDruWKkedW2O/wEePe1CN+sHs6TCKO6ag8Y1Ob
         CtcNPZjbRMe1xYU2XE8ECuMAzo450F01+dTckVMm3+ls7e4vn8mOZ6/oRYX9iRN+HoVS
         qeADMGBlDAue5vFBI7cQhA5FfVb6bHG92QlIxKlVjrhLfBPaD/LSMCcVarr+5QVG14q/
         N6EjrieX/Ie6OO1LsBMOm4k0WPJD5NTmxcwMZ5S1pRAB5ts+mFZTrQydSM1S7VBcLsVl
         Klbw==
X-Gm-Message-State: AOJu0YzBr3Grewg5lX5Fr0cHCO82nyXFIwjtiVySjPxMB1QvnqIK4ru1
	Rs2rt/LXDOqsVFPUqUOIa1lVs32cpxJDgHisqFhmc+2C8J7zM43ZiFJamZE4mMDR/yW/VYxACO/
	XikFjSEPvCvjmRi7jE6ZKakIJ7dK/K34xXA==
X-Gm-Gg: ASbGnctS1mKVIa50bF19b3Db56wGakH0+H93a9m0T9vexHk1XdJtrQGnH0Pao6Xf5D3
	6n0TdYSkOYr4A6SHJ4FnJPfuLYtE9v13dqh6Qp03jGUyWJo86x6ELRqaX6FpRH/AjMXg8nBVqIn
	uMVyQLLqKK/mz57GIkuDZmHLx4iiDDNoQhszf7ATzGbSouZpc3zb0TmX3Ew7xA2rQ9Mh3SxOWks
	lU+4toWyGcCDZsoH3bRbwgntd7H+iRPeWsSN+AF35B2/ZNhjLgo370V03b4UxZPWI1ZzA==
X-Google-Smtp-Source: AGHT+IGx/Iil6b7ehMhg8AgXv77ULsMsjAlZBcW+kkvBySc06CBIduqk1vzNCddeMT6rqczm+JWLJTg8hOnpBrDrbEw=
X-Received: by 2002:a05:6214:f6f:b0:80b:11b7:210b with SMTP id
 6a1803df08f44-882926508famr50299626d6.43.1763144000949; Fri, 14 Nov 2025
 10:13:20 -0800 (PST)
MIME-Version: 1.0
References: <20251114-update-bbsetup-doc-v1-0-07e623b8ad2a@bootlin.com> <20251114-update-bbsetup-doc-v1-1-07e623b8ad2a@bootlin.com>
In-Reply-To: <20251114-update-bbsetup-doc-v1-1-07e623b8ad2a@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Nov 2025 19:13:10 +0100
X-Gm-Features: AWmQ_bmG8xDqaR2ejIYVkrkX1Nf4eYjHBY53jSxMQ2UYA-fyaYKN5tXHvL1ild4
Message-ID: <CANNYZj9MXORgiBL6+3b+5nef=JLVh0ana4_Wo2L0xUz0v9+DhQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/2] brief-yoctoprojectqs/index.rst: update the
 bitbake clone command
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 18:13:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8054

On Fri, 14 Nov 2025 at 12:18, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> -   $ git clone -b &DISTRO_REL_LATEST_TAG; git://git.openembedded.org/bitbake bitbake-setup
> +   $ git clone https://git.openembedded.org/bitbake

Same note (about bitbake-setup not being coupled to things it is
setting up) should be repeated here.

Alex

