Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA131C3ABBF
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 22:46:40 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.63976.1746485190250864538
 for <docs@lists.yoctoproject.org>;
 Mon, 05 May 2025 15:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CHVv0KjR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ac56756f6so5388207f8f.2
        for <docs@lists.yoctoproject.org>; Mon, 05 May 2025 15:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746485188; x=1747089988; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iPr5q8mix1MDDyuA6tmHTlttjA0a8iA8gC8oLK7s11Q=;
        b=CHVv0KjRsDaVV0rzstIFCQlHmYRhK+BgQpgEOw9E5TS8Fpti2Xf+cUEl9DCPx2Cg14
         KIT/K2IXzfSptIEA1RG9hYeXTJ4PNljJkzy3lq5NnJFRGm5dmsAFglZltL5JbqY/SixT
         e9tC8CEQ9yFk/WoJhjj0ubEonIDebC2fFo5Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746485188; x=1747089988;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iPr5q8mix1MDDyuA6tmHTlttjA0a8iA8gC8oLK7s11Q=;
        b=eNxM7cQSyWaWQT5RnHfUtZFqPh05jZfWRvnLk2un5/2i/jIKohdAT6dZ6iNj05Qyyw
         qLwyWJbHtdriAT5XHBnyLpdQmorC/j5gfpyR0PBKasLiEx4Vr7aPOf8znD+8Heqrei6H
         qFIM0KeAzAtuH74/HUpfH5Ol6XkCivH9i7DYy73+mtga7H+/UXQ90mM8WP0UNt+/o1OO
         BOz6yNkI3YBOeRjU+AZKKQomx9XBHBzz17vcYwIRZxz6BBptYYAa83aYScX6yXJTKvL5
         FoszFtSwXmpBLoBZswdLHoylMlmzuvEMW9MwkhU2ttfBde1yuhObdjDO5N+kuvZJwKwq
         yb+A==
X-Gm-Message-State: AOJu0Yxoh8PmN5sgpIDrXNr0M5lieaaI0Dil2NUe0zLzZNbgOBgDByRw
	Kq7qZS2c/6FgBM3Om2VA0lcgFYqQrLxipN36MGbmYSQGSSH4vDCH62E2jaSLlqw=
X-Gm-Gg: ASbGncuhaZBorpF+RkuyKNiZ46UEbAKxr1jqPJh7wQZLb2UPrjPdi6tM6VtTQf5Vu59
	Zra+/0Q0sabw8Q0QqmrZ09iOYzPg7awjF5Yg1w2ktv6j+W9JkzZY2KKqtfqGMHCWovB0KXeB1BH
	RFS9EsMvSBY2ZbZcDG78Cb+7DsqT0bX0KXHLc4zzSkWevzNu6TCKaokM5tp96yhGek7/3JW8PNW
	ahIazawB27uwvDS7b68jZAKDIYS46dqoYx6QLsnsJO/6nxItLRBuOc0wMInztZwQo5+u4yykQVZ
	tgqBuAauYU4AYE3AY0+rehrFFVfGpPdatISDDwN5Q/qj0OpHcgafVXbX3Swgv/uJGueCD5gS9aV
	V0ZS1wqyfAOHU8Ac8h2L2ne/9MtfnTg==
X-Google-Smtp-Source: AGHT+IGp7DCY7JP4nShNSy7w6ckJk6bEJJdHZdorBb+owEdJYhSgVlXdeCuT2k4+8mdEowFhHJEP0Q==
X-Received: by 2002:a5d:598c:0:b0:3a0:9f24:7749 with SMTP id ffacd0b85a97d-3a0ac1ffa5bmr586092f8f.36.1746485188620;
        Mon, 05 May 2025 15:46:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2c56:fbf7:44dc:ae77? ([2001:8b0:aba:5f3c:2c56:fbf7:44dc:ae77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0ff8esm11703938f8f.79.2025.05.05.15.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 15:46:27 -0700 (PDT)
Message-ID: <292ee69d270d71860a7ebada65e4f6aeeca01d13.camel@linuxfoundation.org>
Subject: Re: [bitbake-devel] [PATCH] bitbake: fetch: Add support for
 remapping URL's
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: setairidis@gmail.com, bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org, Savvas Etairidis <falital@hotmail.com>
Date: Mon, 05 May 2025 23:46:26 +0100
In-Reply-To: <20250505185755.1952-1-falital@hotmail.com>
References: <20250505185755.1952-1-falital@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 May 2025 22:46:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6798

On Mon, 2025-05-05 at 20:57 +0200, Savvas Etairidis via lists.openembedded.=
org wrote:
> From: Savvas Etairidis <setairidis@gmail.com>
>=20
> This commit adds support for remapping URL's in the fetcher.
> This is useful for cases where the same server is access with
> different protocols or different URL's. The remapping is done by
> adding a remap entry to the global configuration or the recipe file.
>=20
> Fixed #10699

I'm curious why you didn't use the PREMIRRORS and MIRRORS support that alre=
ady exists?

Cheers,

Richard

