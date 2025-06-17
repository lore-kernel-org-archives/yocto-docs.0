Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE60C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 23:06:16 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.33704.1750201569237276783
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 16:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QzikcZrL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453426170b6so787545e9.1
        for <docs@lists.yoctoproject.org>; Tue, 17 Jun 2025 16:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750201567; x=1750806367; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xm7jDY13MwOmQSsugC8BZqSpcOSjJpUBIBFilX2pzzg=;
        b=QzikcZrLyv9YLaanP7Dltj9kpz+nZuFE13KEYOF0qQFoAkOIyYkbTQdqkr06f7dp2T
         Z3FYlPqi4BigwjdcYBmUr79Jqf7xar8eck8kO0VgtqQfrlWRndgQEQoJbf9Ps5aN0+fb
         pNQQbETePvFJdU/VVrevLUWT+EByT6JN3rx68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750201567; x=1750806367;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xm7jDY13MwOmQSsugC8BZqSpcOSjJpUBIBFilX2pzzg=;
        b=C9H0xfZOrfpxoGUVzftUBN5RAhPVPhazasYBCabafyJnYvw5EqcWi0v0/lbnXcFH90
         2ez5faL++vdyD8scWxNVvXTzZlKWiS+Vx5bNUn9IVwo5tnKRegPfqewxz7uQKJ9Dv2rF
         r0//g1eKovn7nERLozAIH90AbN/tyTmlvCKFL6/v0BMvmM7JvJlWdX4YEbTRGQ09V17t
         T1ct60ug6pWLt7OrWNWYzXeX2udmvrH5hTndmO/TY4xP6lWf3S6bsdxXfGsX9oB8OvmE
         p3nWVzKhXg1h4cFw1YTA7Tex1MDqpqUsOaDjXGRdCKLYMIWPm5ITgZjD+/RjTzPbqgBo
         GsoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQSkXl9udhIbGzNIs0I3MgNYlD4czFWwQTSydMkwTyDsAyu9L3AuVWDyMeK2a9nbzJeVn7@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Ywwq54Kve73jbIcDEThnz2HttdfDHr0kRQ9gIDTOyReXf5rT3HS
	g6T1C4RuIGYzFUrj9jXO+6nA2D7PlrigLETpsEAMcZNPSs5fL2Zh3rwHgFAIIsasDBiLQrAYLrN
	zM6O/5eI=
X-Gm-Gg: ASbGncu1lq0o3suca8RJK3FDCjOs4gXpLysfLfnXsNpT8kGJfsy3gGUg/3FJSRP+DU/
	3cf6y91F0/gJLMY6xbwqOKY842hWyzAZzoF5Z8jFGjeCNwUesukYBb89jFd9GXfuu+Gax0bOgmU
	9LmUKs2dAxcPqNQeD5tkB04cbuf7CnKEehd68PcB5z7QJ8rlU5+cXqlvjjLYcvIL34pl+s9djRq
	H5ZojF2N75/pkuuRHVD0pr1+OzzukHmxYp91bIo2To03aAi1LIt4pNlq3p3pVxN09Npcycigsoc
	RYpBMCOqw0iQu8GXO8hKDMEwldRhYtyTknut2cjj5VOFDgWwQaMqUQ074F2oMWmcvv3M6KHmG4O
	2dfMUpowGRDRt6m2XSqKl1tvp3/19OyOnX509XYkGfQaaArEDnak=
X-Google-Smtp-Source: AGHT+IG+B0JkKBGZGVXExTzHcyUJ33FNLYT1/WLX4mljm/Re5NiLPhWbw34P6yW7zXAUGgXO11rVTw==
X-Received: by 2002:a05:6000:26ce:b0:3a5:6860:f47f with SMTP id ffacd0b85a97d-3a58e13fda0mr264840f8f.6.1750201566763;
        Tue, 17 Jun 2025 16:06:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7be4:6296:45d5:785a? ([2001:8b0:aba:5f3c:7be4:6296:45d5:785a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b74313sm15316698f8f.96.2025.06.17.16.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:06:06 -0700 (PDT)
Message-ID: <ebb65514201c35ac94c8d4ec747e3e7e37600300.camel@linuxfoundation.org>
Subject: Re: [docs] do layer names need to start with "meta-" or not?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Date: Wed, 18 Jun 2025 00:06:05 +0100
In-Reply-To: <c0a49c8a-94e8-2c97-4c4e-1df6863bae87@crashcourse.ca>
References: <c0a49c8a-94e8-2c97-4c4e-1df6863bae87@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Jun 2025 23:06:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7088

On Tue, 2025-06-17 at 15:34 -0400, Robert P. J. Day via
lists.yoctoproject.org wrote:
>=20
> =C2=A0 this is confusing ... see here:
>=20
> https://docs.yoctoproject.org/bsp-guide/bsp.html#bsp-layers
>=20
> "Because the BSP layer naming convention is well-established, it is
> advisable to follow it when creating layers. Technically speaking, a
> BSP layer name does not need to start with meta-. However, various
> scripts and tools in the Yocto Project development environment assume
> this convention."
>=20
> =C2=A0 so is it a "convention" and "advisable", or is it a requirement?

It is a convention and advisable, not a hard requirement.

Cheers,

Richard

