Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB498CCF9F8
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 08:28:35 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10216.1762417713318654994
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 00:28:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lGq/GRJ2;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4e8a25d96ecso3805161cf.0
        for <docs@lists.yoctoproject.org>; Thu, 06 Nov 2025 00:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762417712; x=1763022512; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93vX0/Sc1fw8nqMvo9r+Hf72mt3nrlAanhadY9VEmFA=;
        b=lGq/GRJ2X2IxL3owbl/TGPoP3e+uuYjCK511qymuiSAHn295YkaGOOptF5v+YRq+f2
         OwULM4q2aqkE6YMOvdQowHVjgtpFFxrlix3wqpn3CauOdmBr6PEXv6YbAw/r48dPJC9f
         0G/lBTVw5AosHMT9vKuua5ICtsNINkPbkd49lXAGziBeLjNFme4G4O1XQz++k06M5nNd
         wvi/IK9PL8qESdQPpVPLKnILpHnH483nr8slxja1/A4UogZlCLBoQ1W6L/ZSQh9oWou9
         yQjPnB6h0rggJHfCUwLdCMtK/xWfMCcA5MFF04klFuWnhXYDDJPNZ0VlOuZQsrtKnHNh
         VvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762417712; x=1763022512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93vX0/Sc1fw8nqMvo9r+Hf72mt3nrlAanhadY9VEmFA=;
        b=DVrRrAO9ep62alAbGlHO0Vi/8aJu+HclUr+4xP47+Ey/00BD7amP3KusKhpUddCPxB
         KxspIH+F6pvlRKOBgh4yC5C2NC+3zAsmi5RzuaW3YapI/33kS21zsrx0x32Qbq5djKAw
         uCZ0B/DGH+qrimfvJqJSqryHFlqRsMrQ+8I0skxOJxqIH5UYQvDcOCqxHvPNW9eeS4Qq
         sRn6zH/jC37FEcx8L2IiD8GhQDShApQ2ZJO8+0PQFtCejSGJ+Qe1o5yc/e+l2ZcqNA6E
         0htNX1zAxM1kt+5KsLSclchLtMLWV7f5pBRqDfVFrP78xnAjfBNP9eJfQMddSbwc+/XE
         +Wfw==
X-Forwarded-Encrypted: i=1; AJvYcCV14ZcMl4kpls9KWrjoPu7J3SIY4Jp12eHG7JOtqW4ht8n+yjE3Qv6uJ4Mj+tQUXfblAup2@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Ywdydj6sZks4rG9+bkiVGDLec2aEXQZr82+PI+BXxJ4Qwe5BFF1
	VlB9VKSTNNpoaR8tLct2Bzk0uYWE5Hi5TwiMFVA5MfRjlk5qtihUeOvxd25FxeEddkss6/jMiOr
	konpGbajlne0AVuqdxgCyAdfuBV8P1Ag=
X-Gm-Gg: ASbGnctZR5sPxSdFoG0edeCo+DJ1FWA+13kSdh95a+BTES3sAvpst/+SE5iKfWTl9a0
	cCSx0XgzGHmovw5rjysVoMxsLGgekCkfIW8qP3ciaWRNNGiwHAYfBEyfpLaTGzReXQa7Uvr7rVK
	sgB2GEX5xJF74ysoNy3wEZHbg+8xj1sKtg5CkGe5p2hhFlXAva4rlRbELh2ZXfxDWi/wLMHZj/H
	BvnL963B+fmg/nZ3FqOs7/Awk4LOT4YUhWbHrAt3ESflXe2mZtwIngxo+v0UJR9jWWYyRd/Vbu6
	YHnYwKfxehrSkEvOYPk=
X-Google-Smtp-Source: AGHT+IG4rHlqxtgrxfcSyjPjg8APP/spVouznjWVtNvSQw8vzqHRxflMY52rqkNb8eDLHB38CziOzuOSuPuid9kVpZw=
X-Received: by 2002:a05:622a:53ca:b0:4eb:779d:e8a6 with SMTP id
 d75a77b69052e-4ed72629a1bmr87323921cf.77.1762417712225; Thu, 06 Nov 2025
 00:28:32 -0800 (PST)
MIME-Version: 1.0
References: <20251105232718.2801446-1-yoann.congal@smile.fr> <DE1GB2U0LTRC.11DTXWB7ZUB7T@bootlin.com>
In-Reply-To: <DE1GB2U0LTRC.11DTXWB7ZUB7T@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Nov 2025 09:28:21 +0100
X-Gm-Features: AWmQ_bkeHyAnDTkXJ3Vhl6WhfVbWkyW1UMSkBH8lQXsIERfNkEDeVIVDLJcjRWI
Message-ID: <CANNYZj_KS5BKsGMiQkLSyCKtma_BYcqJ+W3_jw80SzR6D-80Pw@mail.gmail.com>
Subject: Re: [docs] [master-next][PATCH] bitbake-user-manual-environment-setup:
 Document "{THISDIR}" in bb-layers
To: antonin.godard@bootlin.com
Cc: Yoann Congal <yoann.congal@smile.fr>, bitbake-devel@lists.openembedded.org, 
	Yocto Docs ML <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Nov 2025 08:28:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7995

On Thu, 6 Nov 2025 at 08:59, Antonin Godard via lists.yoctoproject.org
<antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
>       This useful for a project that holds a single :term:`generic
>       configuration` file next to a local layer::
>
>          =E2=94=9C=E2=94=80=E2=94=80 meta-myproject/
>          =E2=94=94=E2=94=80=E2=94=80 myproject.conf.json

I thought the use case should be described along these lines:

This is useful when (one or more) configuration files and (one or
more) layers are hosted in the same git repository, which is cloned
and managed independently from bitbake-setup workflows.

Alex

