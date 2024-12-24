Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86801E77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 22:54:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.42535.1735080858341635616
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 14:54:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f9W9r8Ja;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e87b25f0so4205505f8f.0
        for <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 14:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735080857; x=1735685657; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vbSLVIZJSFc+xL7sok7D0oWol6OMF7eQyQGP/tO0Dwc=;
        b=f9W9r8JazEsFseRBL5k2nIQ0Yr69nmGvTHR9jBy4Cqt1nDHMk5XVFIfOryLGisoBVP
         lei8ZjehuxSJWMB0KM6X/w/hOfII0k9F3Fb2Z/Nv+yCbIGU376ER+eFeCMjZQk+91aSp
         KnUcl26WJdQWFXiAY79leohkOT4HLdmpHr3Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735080857; x=1735685657;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbSLVIZJSFc+xL7sok7D0oWol6OMF7eQyQGP/tO0Dwc=;
        b=ERL42hM37MDmfi/GdfUCzsE2m13HYl13scfnGOSf9fkBsLgjLS4luth0RQCGnMKiNR
         KVWZMFyMUrAV9xnY71LafLflFrMx0oO7m7MyEVlgLwV0ERudnusU4gf5FD2n04ySydqf
         eKmYjsHWs+jCU+cEKzo0ffXytYlLRnc6bxlhJjklL0yAB5E/u3+xlk4xCeYxYV/hHnIF
         kW1o9WNxtPyK2xlU9VRbsTbNk3c18q5lHO4cqv/4dr40sRaHQqQ195zwdyN09cOrQOAv
         6nrBUZm/lBMsD5bdvQ1EBeD61rFUqMbIl4ORTYvahDenbrlf9Li/yCBQi73nqyYjlirL
         tzjA==
X-Forwarded-Encrypted: i=1; AJvYcCUuq5hy4IhmxULiGO/QOQ+Bf1sxC9/j3uPCkZiIPGhCWIugDryFJmGlaZoMkLYEpk6aetzi@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyJjnQhe5XSc1LUWG3aJ/e7ycdw03fvngoRLicyxXK7ArQqJISs
	S1uULEVDnFSydpDChfm25Zv+F1SCXb7irueZXKzi6BlrB9cP5Ng1Zj+sazn/Lzs=
X-Gm-Gg: ASbGncuz1M6ovKhaqcNdn3Fu8dmw35jDhqxUXIvGf/36c/aHr9lr9lkqsO/kjXdi+tv
	b9WEhuADYHD4o9mr8tPcsuFtWi16TVBod2YNt8LR2djJirpFBhpzNQWdEe/KVlVPokwg4vXNLCM
	Rnqb6Iidnzep80kLrW07t23c5HgJQEOHbO4ltIqI6Hi+b4zDFedIwemrXlZbNpiKlshXd0ENIll
	qF2Um95iqsUMeyI8yKsC6bX7zjoAzwOQZPOcDraYxcFKFWVapjRFrSySCEGTV+S2Ie6keGTzjp4
	Nwm1DN6ydIn7fEy0/5ZF87xq7dbwfgmKTCs85Q9VvcdaIg==
X-Google-Smtp-Source: AGHT+IHcj6Eg+TltxT0AWXyolTVGKgZfx2zxbSAVzpYk8egQBtJ32uU6kkXXw34bepQpMp2XnW6Mdg==
X-Received: by 2002:a05:6000:1889:b0:385:ef14:3b55 with SMTP id ffacd0b85a97d-38a22a4c485mr13150024f8f.19.1735080856775;
        Tue, 24 Dec 2024 14:54:16 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:28b2:b947:41d3:af7c? ([2001:8b0:aba:5f3c:28b2:b947:41d3:af7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c829348sm15181713f8f.22.2024.12.24.14.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 14:54:15 -0800 (PST)
Message-ID: <0fc165187afd965a79989a412d16bc77271248a3.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] Set max supported Python version
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: javier.tia@linaro.org, docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Ilias Apalodimas
	 <ilias.apalodimas@linaro.org>
Date: Tue, 24 Dec 2024 22:54:14 +0000
In-Reply-To: <20241224221625.4092917-1-javier.tia@linaro.org>
References: <20241224221625.4092917-1-javier.tia@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 22:54:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6026

On Tue, 2024-12-24 at 16:16 -0600, Javier Tia via lists.yoctoproject.org wr=
ote:
> When Bitbake is used with Python 3.13, it generates numerous build
> issues that do not occur with Python 3.12. The documentation is clear
> for the supported Linux distributions, but not for the supported Python
> versions.
>=20
> Signed-off-by: Javier Tia <javier.tia@linaro.org>

Can you be specific about which version of bitbake you saw the issues
with? I was hoping we had resolved most of the issues with 3.13, at
least in master. We do aim to work with new versions of python but it
obviously takes time to catch up and for fixes to make older versions.

Cheers,

Richard

