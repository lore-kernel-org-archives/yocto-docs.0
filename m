Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C501ACEDD90
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 12:53:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.15536.1728478414288348817
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 05:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fPBfOq/Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42e7b7bef42so60698115e9.3
        for <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 05:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728478413; x=1729083213; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xUmMYyBkgU/+2d2ePLIBu/cxk1ICdind3w2O8PqUfso=;
        b=fPBfOq/YpqSFBW5Z3WGqWz2DfvQYCUt/+I0u/R/uwj/7JfMlEfb2kE/2JYaZ97749q
         KrDuI3RRHN/ZhgIRnUp/LVBdFfMtGDASnOy0bqbNUpUdQLEvMOHmmgwd9rBiKXeZYSsI
         +ohhWIRb04aen8kkjl37HW5BE2rknGEcydRDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478413; x=1729083213;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUmMYyBkgU/+2d2ePLIBu/cxk1ICdind3w2O8PqUfso=;
        b=icpvSnzppMEWdmbXL2uD012McWPs7t+nj7PbSk1dXbglCheOwA0MSNHYaQkULiRwr3
         sYhL+VXbdQncIhkrToHoIvjSh+C50y7QJ9OQ/aLVzt51TXATOdzPdUs4O/M8b9vbHZt/
         2xfiIiTkRl3fZNHMkRMvlT1dXBYqouMFLfWbSdqejHD1I5hvvYwhbtPtAAzCscPM8Pqm
         R0qAtXuXUCT4LJb0fRGIgFcEyzlwYyZOAMPe2A/ebEqJ9RO+xk7syPRKzGfkPUnzHro5
         gxD45ip0L1ww4a80sBcCKF7D5a0iZPs4aY39tGEF1y1gS76x8aETB+8LrNVqwoBm2+Jp
         xcPg==
X-Forwarded-Encrypted: i=1; AJvYcCXmtS0LxXhC3Ywt4qjxibdt21SUquF4zuTWGXuVYIna7VKadUAHKjmM5YTdxO2ie8Vo1uiv@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yxg63Q6oc8sYA6l0G3xOXVevs4+W/nGiG6Ku90XPU0BbhIm5U3i
	W1kfuWVKaO+WrNajaZ1D8bDl7Hj6XkeEc5ccU+GdmylThMcaZbgX4PrcHU9fqFw=
X-Google-Smtp-Source: AGHT+IHBV9V/Z9bTwZx8PwyGn4vdxNjOeBxAVTnK7zIfZtDf1gaHPtTmwR9ZmsonW1UBF1l/mFjnpA==
X-Received: by 2002:a5d:5c87:0:b0:37d:43ad:14eb with SMTP id ffacd0b85a97d-37d43ad1534mr795624f8f.14.1728478412565;
        Wed, 09 Oct 2024 05:53:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fb33:4e5d:4941:5018? ([2001:8b0:aba:5f3c:fb33:4e5d:4941:5018])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d70b42d8sm20031535e9.31.2024.10.09.05.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 05:53:32 -0700 (PDT)
Message-ID: <71c1b7f5af4f8fbcdf736246e1fc7eadd46bce9f.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 16/16] release-notes-5.1: update release note for
 styhead
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: ross.burton@arm.com, paul.eggleton@microsoft.com, 
	thomas.petazonni@bootlin.com
Date: Wed, 09 Oct 2024 13:53:31 +0100
In-Reply-To: <20241009074120.866786-17-antonin.godard@bootlin.com>
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
	 <20241009074120.866786-17-antonin.godard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 12:53:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5424

On Wed, 2024-10-09 at 09:41 +0200, Antonin Godard via lists.yoctoproject.or=
g wrote:
> =C2=A0Known Issues in 5.1
> =C2=A0~~~~~~~~~~~~~~~~~~~
>=20
> +-=C2=A0 Rust related issues:
> +
> +=C2=A0=C2=A0 -=C2=A0 Rust builds are not fully reproducible (only ``rust=
-dbg`` and
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``rust-rustdoc`` are not).
> +
> +=C2=A0=C2=A0 -=C2=A0 There are some remaining rust selftest failures tha=
t need to be fixed, due
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to the way it is being built.

In general these look really good, thanks.

I wanted to note that the above is now incorrect, rust is fully
reproducible. There were points during development where it was not but
those issues were resolved. These known issues can therefore be
removed.

Cheers,

Richard

