Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC3EC02196
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 09:54:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.65853.1738922039017440376
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Feb 2025 01:53:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZXxvTApX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361f664af5so20306365e9.1
        for <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 01:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738922037; x=1739526837; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9pNCZJ0oUzIesI5k4Uub8boyxJZlPKHz4eyY0soFJs=;
        b=ZXxvTApXv46OHaOgoGl3lSkaMDo7qMrSQzV4qDISzWUSjnqWeyDNMj7w47zTxbGUWv
         DeAPQ1IfodHtywIlzxxU13faxonVtVqnFOkCMgqUXDeDbY44E642pGsGBM/sYcogbSN1
         ZlCLwridU4glPNiNC6lHkGncFUTDdGGK716Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738922037; x=1739526837;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L9pNCZJ0oUzIesI5k4Uub8boyxJZlPKHz4eyY0soFJs=;
        b=ve58hjVhJlG8KWIK8C+1KfzPlyD3q+ITkzHwQYgPAfwmJ4d7P3T3KHHZp06yGYGFxJ
         PSQrqAUTNq6Umw19a8Di8Lt++1byBApLXo6pXmtIUwEW7Cd1C6BwslHqF3IUAv4oh9DA
         lxPSJLXfy1WRGkZQH+eGFxLMzw6q1jHBAdlMOM/IP9TYEUqjGCEOGarIKMceAajOrWt9
         ZNJczeNPneyM7cFVSWZh0FEPswatyg8ATzMu2/KJluTwNzXiAryI97aCdsQpZ2m5oB+r
         XvcUxWYCpBrHkcj83Cw57g/UkC9aqo5bKxi7D2tkAIe+jG6H6rmC2oe05iVPTtwdogri
         Ht6w==
X-Forwarded-Encrypted: i=1; AJvYcCXikyLRnnOHV+iDtmmQXHYuOkU9kP6VFi2s7rZS2DV+QOvYStPeuzA9qgvCSigCMITKGR3n@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YziIptzbHFBqvceZrnuCptJBnPFrm/QvnPyeMU7g68VbLbKzgOQ
	7VEXZMhkR4ccKhurOW5RF/PVXXTAXn3p9MbRNQYpR/GYIxH48CEyHildBEMfsTQ=
X-Gm-Gg: ASbGnctLqT94M83WvLgmW/iILZRMw5fCbmegGdQZWwAnyFZU814qMIGG4FDEtcACx9O
	MqtaIZ5eC60JHu5msT9OvCua2kj0wOQYaXPLbdaKTbVF723hGCTB6JmdfK5M9FNyqZOH7cE5akn
	qHerpnThqEYRt27I6RAsq1h1/DWIz0ZYxWmg+tAfvt1BOgu3ureYI6sytZITeAm+uY0p6KqCWou
	mBFP7Oe9bq5NzZDvrHNjQHfM67GJkR87Io8VYyv6OT+u+jb9GlO1FMwc2Br4IMrMs8AtugXOOYG
	SK6TX1/xxTQzTIsmpFNXQMHp/kfv6VEI/a+ezXi7l2TcReEbASp9IIODdZzt7XP+TeP/tPKzqBw
	aBPet
X-Google-Smtp-Source: AGHT+IESqVqe4qX3rjhQXxYVl7iRkHDwKs1izxuvJxrqEbjXDQ+KAmXbr43LaRCCE9qry+pgIOWxLg==
X-Received: by 2002:a05:600c:4687:b0:434:fa61:fdfb with SMTP id 5b1f17b1804b1-43924991398mr23205955e9.18.1738922037375;
        Fri, 07 Feb 2025 01:53:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:dcae:28d1:c97a:4196? ([2001:8b0:aba:5f3c:dcae:28d1:c97a:4196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf44f3sm86436855e9.29.2025.02.07.01.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:53:55 -0800 (PST)
Message-ID: <1f9d3cd9c29beb5dd645eae977e34046e277b1b6.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v2] add basic b4 config file
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@cherry.de, Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz
	 <foss@0leil.net>, docs@lists.yoctoproject.org
Date: Fri, 07 Feb 2025 09:53:55 +0000
In-Reply-To: <4d4eec55-641f-40ea-b332-f24569682ed9@cherry.de>
References: <20250205-b4-support-v2-1-b0ffa83bdefb@cherry.de>
	 <D7M3GM34KQS7.2FXQ9D5DD967T@bootlin.com>
	 <4d4eec55-641f-40ea-b332-f24569682ed9@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Feb 2025 09:54:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6290

On Fri, 2025-02-07 at 10:26 +0100, Quentin Schulz via
lists.yoctoproject.org wrote:
> At the same time, I've done some shady stuff with b4 for poky where I
> check (rather **guess**) if the current patch is the last patch in a=20
> series. c.f.=20
> https://git.openembedded.org/openembedded-core/tree/scripts/b4-wrapper-po=
ky.py#n44
>=20
> > In any case we might also use your container scripts for this
> > (which I will get
> > to soon hopefully!).
> >=20
>=20
> That itself may be adding a lot of time to the test since we need to=20
> compile the container first. Additionally, remember that absolutely
> NO=20
> message should be output to stdout or stderr by the script otherwise
> the=20
> check is understood as a fail. I'm wondering if we couldn't add
> support=20
> for a PIPE between b4 and the scripts so that we can ask it to print=20
> stuff (e.g. "please be patient, this may take a while" and maybe even
> print some progress). For example, I briefly added some WIP support
> for=20
> patchtest as prep-perpatch-cmd in OE-Core, but it takes a long time=20
> before returning something, not very user-friendly :/

My view is that any preflight checks should be relatively fast. We
could ask someone setup an autobuilder in a container and run the whole
AB test matrix but that would be unfair and crazy! :)

I'm fine with having two levels of checks but I do think we need
something relatively quick by default else nobody will use it.

Cheers,

Richard

