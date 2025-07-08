Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B17C83F0F
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 11:45:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.16509.1751975139975484074
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 04:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T7HawZVe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-453398e90e9so29170245e9.1
        for <docs@lists.yoctoproject.org>; Tue, 08 Jul 2025 04:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751975138; x=1752579938; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5kVaiFze6l21/D7XIb95cGasiPxxGqJSWQqxEl8L74=;
        b=T7HawZVeOFV/zQkQQFafb/Ek9g1oi3gObaCqa3bSAXFdxIjFfN3mdFcCgfttvuhNtQ
         +vdNs/SGpY5qtA2hx5g4bgVk7sPnnCV+vPCY8eHS8MqaTQnz7qhvhgSEWxkpcGmNfHk1
         IzRi2GrWGTj/PROjYJnkNuX3sUxbYJmoBYmNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751975138; x=1752579938;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d5kVaiFze6l21/D7XIb95cGasiPxxGqJSWQqxEl8L74=;
        b=saW0e89VIn8VA+160CjOoo2rR6IdzYUcRZT4TR5doPFPvUoRytGiDKk/xruuE/alw4
         xgSSx+HAaX3VjoAFCzykfEx2+oP6mBvHnu4dATUbyre741mCr4WBpeZQ/nMItwp0Zqos
         qGf9XeEgQ0MqiuHvyY5px8cJFCCca0sD3Z9BMZcObj4fiCqiPFFFZHDVpxVQxmn/yi2U
         0MmN0nUNdTz3wo3oq+/yyOPMFp3vzquLtuEEvXJSyNvxzV9CzgBo/pzMvzcfLZhAOK1F
         zW6gMQoF3zyT2ft2GJYk4sFIntSl03+zMT9U8WDFDVrYci8Mg7vCnOiIwwUyCkmR/J8M
         6vJw==
X-Forwarded-Encrypted: i=1; AJvYcCWU64riKXfRe23IVN4tW9R3Z8WjWmhGE3+En7hHSUCVWy0DXyrRsGy3VWAwlBIb3M1OtIgF@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzGYT8iH2Mwl0mrUzSR4YuoTlBZ0+pU1CcUM0ly/iT3PtqfCRDH
	osxdmghBnwvERFtXaPI8kiasYHyYKQNKsPwLq3QSJj8i2oEx8276tR6akshqiOcqY28=
X-Gm-Gg: ASbGncuQPJCaLTX3UeleQuWAkRkPf9bVwVn8j0uVS8F82iVwbwaqbntVb6/Qfsu8TDN
	YfIZCbJLbBpJsVFAIX7uCmsbqJnSXKoY5tVjSB4iVS7hlu6tHvvNdGOr/k+jfAWF753H8jKNJDw
	UpgCSia+MGHtaEyn+ghjv3OzP/LVU6hW/LIIAaLgaZAQc106/w7STNR8rEgQjBwCaMVuJoRPQ6l
	5BzZZ5HxViZlgooEUWexV2W+dNhtt39CXOWcx/4DukW060xBnGkRXPwX5YNDtATQpnrzfIadNbe
	MGiHxxTnDzwM/cBmTd1NRlY0m0rwt5KjFLJYuxyWMlZuINTwLuAeh4ZQqdEMizIswAvk9CE0DUo
	4Gx6JnIujaSAgwwbhIM9jFV51llWk06wOAEpsJX6QCIbiuqlzl2Tuf+PGBrsWzw==
X-Google-Smtp-Source: AGHT+IGrhfMly/DYL32Z6NCDfRM/3X4CZCvETjiuDTrJ1TikTPaDQ4cwXq5y9LWMy8wB5evPjOW0jA==
X-Received: by 2002:a05:600c:45d4:b0:450:d01e:78ee with SMTP id 5b1f17b1804b1-454b3168ae8mr143298755e9.24.1751975138249;
        Tue, 08 Jul 2025 04:45:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8fe5:d709:6d45:bcaf? ([2001:8b0:aba:5f3c:8fe5:d709:6d45:bcaf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285e22bsm13069558f8f.97.2025.07.08.04.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 04:45:37 -0700 (PDT)
Message-ID: <3d8e904e18caea11e3e2be542a8ecac45533ddbe.camel@linuxfoundation.org>
Subject: Re: [docs] is there anything magic about a "virtual/*" PROVIDES
 setting?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Date: Tue, 08 Jul 2025 12:45:36 +0100
In-Reply-To: <cfef6b70-4f85-a25c-974f-d32122b79a63@crashcourse.ca>
References: <cfef6b70-4f85-a25c-974f-d32122b79a63@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Jul 2025 11:45:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7282

On Tue, 2025-07-08 at 07:14 -0400, Robert P. J. Day via lists.yoctoproject.=
org wrote:
>=20
> =C2=A0 from memory, i recall that there is nothing special about any reci=
pe
> providing a "virtual/" value, other than that providing something like
> "virtual/kernel" was nothing more than a catchy visual aid to
> emphasize that this was meant to be a *general* indication of a
> general functionality being defined.
>=20
> =C2=A0 is that correct? or am i misremembering?

It is just to mark them as different from other normal provides so it
is a convention.

Cheers,

Richard

