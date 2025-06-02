Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BFEC5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 10:27:45 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.46546.1748860063015797233
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 03:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZFWh//Vw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so1684318f8f.0
        for <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 03:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748860061; x=1749464861; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZyYQ9lXWf0/tofLNmMFt8ZwuqNZuZzpv1b5BUWjKow=;
        b=ZFWh//Vw8qYp7C7RwiVlQ6J7BbNaYmH2mlAyIXoVnCoz2S8jPZRA55Wc5QgjH2DgJy
         dKl0maZNr0Ooe+5YNsFtA7ern36cH43L1yPD1YlDu2OF40qqpb+NE/kyTrsOhrEFdZqx
         uvVDHwOQObKKgYBqj5H5ktPp5+aOkAB8nFg+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748860061; x=1749464861;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZyYQ9lXWf0/tofLNmMFt8ZwuqNZuZzpv1b5BUWjKow=;
        b=gTzRqa/JyM2e6ru28/39EoPtzX2FHQGoJDeGFXUnbIMXavVGNbYcAMrcRZr5gFlX2f
         FlHHobwGg1pVplbqwgChylxTW+csAPYTyjYaHE+R/iSOEbkb85pn1Kcp8mwROeJ+JTOf
         +bfDMZVGU8qMjywRQtbaa/KWrfT8TvleLXni3QwNyEycieRNNNA9xbDSj1WMUeCKv23Y
         tPeIX0yH1qf5wKs8ZZvCHHsuhlWNsABQnOb90FWcMase23ogxWXxWKqltfBKOmR0I0Lc
         DXTIbEvS9ZVQyvDOs2Ln5GiCF2q+ri8GG+WplANJJYLV0TsrMa9qFcULIpOuIhtEPHqI
         xFTw==
X-Forwarded-Encrypted: i=1; AJvYcCXRVBqyAAooqLAFRIgO62BiRq1N7FM5moM6vBEnaEXlDxsDUC4RtgN79lztt/RrG2FgFjvk@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxxWVZ6VMK/A0KiSLNtGZTnYSLlBjAPxhow++3X5KU+sUTEiz/g
	IfKlhDy4aeSY2p3zZ3lJkEjTSEs1q9MStzAkxmyPRy/nyJIS529XYJiAR5YNvkr6qYs=
X-Gm-Gg: ASbGncsRt2oJ4kr+jpI0BLsJhekN6OdJwEV6sf4sAPnXPIKPyYCzNlwpnL6agyZKk1e
	Qx6G6k9t++ORxzMZhQdePv3T6Q6eUaKTtzQFvrQ661DrJkD3OWf3bMtOJU65302Y8WBST8FtRsU
	1nVabBIM0PdtKzQkh4C65AeUbrNgQ5YK63cqqt0rRZudzq4/F4Qr0Fx8Mf8Rq9s8bWtubQxDzJx
	CuuPbASyqgI/r4fEHP6fr6pBNr8EpSzN2XA9uGIdbESnb1jAkudl8T+w8ZsqJJOxmMmgLr+vgpG
	rcHttcQ13bOewz+0+8feZuUUrO5t2vzHSnMoL/XpBdLVJUhsj0XnXdk1ZhaeI3JXOkdFnoQx/vb
	5DGcLKojWBQAPI2pQGq7742bHJxrHCdFWS7LIQXuonWHivFT0A28=
X-Google-Smtp-Source: AGHT+IHIvAiOu99SYQHovrj25c72pLHJ7x0TeorNZqtkowE/wBKmYop8jNRBeugKjShvSo0BMdiuQQ==
X-Received: by 2002:a05:6000:4313:b0:3a3:6b07:20a1 with SMTP id ffacd0b85a97d-3a4f89dcaa6mr8541475f8f.40.1748860061306;
        Mon, 02 Jun 2025 03:27:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:907c:f576:5b06:73b7? ([2001:8b0:aba:5f3c:907c:f576:5b06:73b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c82csm14453317f8f.30.2025.06.02.03.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 03:27:40 -0700 (PDT)
Message-ID: <24b874c1e05cd7e4582f803957a807f45a9284e7.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] brief-yoctoprojectqs/ref-manual: Switch to new
 CDN
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Date: Mon, 02 Jun 2025 11:27:39 +0100
In-Reply-To: <22f9f4fa-3ad5-400b-90e2-475238d30e6a@cherry.de>
References: <20250529163440.3116537-1-richard.purdie@linuxfoundation.org>
	 <22f9f4fa-3ad5-400b-90e2-475238d30e6a@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 10:27:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6963

On Mon, 2025-06-02 at 11:35 +0200, Quentin Schulz wrote:
> Hi Richard,
>=20
> On 5/29/25 6:34 PM, Richard Purdie via lists.yoctoproject.org wrote:
> > The project is switching the way handle our CDN provision of sstate
> > objects,
> > update the URL accordingly.
> >=20
>=20
> Will the old URL still work for existing sstate? The answer to that=20
> question will tell us whether we should backport this to all/most
> older releases I believe?

It won't and we should definitely backport.

Cheers,

Richard

