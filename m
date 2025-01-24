Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B00C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 12:02:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.10450.1737720160959544284
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jan 2025 04:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Eakv9gAC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4362f61757fso20670675e9.2
        for <docs@lists.yoctoproject.org>; Fri, 24 Jan 2025 04:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737720159; x=1738324959; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i2lzMjJ52UFxlro4qelfNSVT7cAe/tV4WQfLwBCK6D4=;
        b=Eakv9gACOMTmF5c7ZGJxeiEnIOi5X/g0EWZ+sEwKdIr4kTOGzJXqD3FaHN9Zv1nAiy
         o5NflnYbHf+jHonHZ+V81ohs7ksppA8gZ2QfLonRtSyu2jkUZW8MTTUhswOVLA4+VXgQ
         64MQKbKqRpdLv+j9tM6h+TWSUSYG6kj6sKkZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737720159; x=1738324959;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2lzMjJ52UFxlro4qelfNSVT7cAe/tV4WQfLwBCK6D4=;
        b=pzZWeeTYYuoeME0G23aL+DaXo0DUuod3blH7DAUV670rCtrG0DRjhai/UKNJMiZAD2
         f/vtYDOaT0S7jePcUyXVnJopR/PpE7lEQIxgDvotYH7zI32uhj3c2/plbUALEzuiktI9
         jnhPlfWnibVUJuh7LbB0ubmIqqs8VTgSlMJkClwOZ1eMxiluJRadaS4O8CfEYkkdvXje
         sMioHYj7xtvCi1WH04gXw5o2B1EP/jjRv7XXYKfS6o85uN4czYiwfY+s2orc2Y/3WDNJ
         ZCC86Ww+9H6DmJ1tgi1qtER3efPZnltiz9Q6Pjrpgo6/vfdeVBBf3IGMR80iiCc6mcwT
         loDw==
X-Gm-Message-State: AOJu0YxuIWQFrwHCCuqZF/ArIUT4Q4YX2lkXdiRADDz/XtkVYaLN+bdj
	KxBUvVoC6NHIhUiGyWuEVpKLUEVK/Mun1cUZCBCIlft8WKs6SWaQSj6BIiIueAFtXgTIBYfq0hn
	XPow=
X-Gm-Gg: ASbGncuyeOvhqE0QG8pD3QKg7rOUDjB24SkFnJkhwDHQH/cBewSBJdxjgtw050odXu1
	f1ujwq2CSSoVcRun13e9TtCFdtGjht/CaenatDva3vdQue6rUen9rIW+i+6C+bScxZAyxenQVwm
	XfrLLsGOlnAO9+Zpm6S8QXm0aEMX4DKSwDXD+TdkFJX2ZCTBVsknSYB5gqRu7QvdcyJ2hL1SPkE
	/0JzrnbHLnaA8GRfulveUMzvNVjcCGKUtuA0D/Sg4yEBWPImTVE+h55eR2xPbq0cNBsWwTfAc2J
	N43TPiwQ9SfGEjxePMPNiCamuoiudxmBd8bLXBUSiJz9J7g2kEI12hngZLlcK+32x5HKuA==
X-Google-Smtp-Source: AGHT+IHaX70Rp+Flg/YWyinvVZ5pUqoULzX/iF+fwCBeXz+90HbyhQAPRY9Hgtu2wvacDpBodgLmKA==
X-Received: by 2002:a05:6000:1a8c:b0:385:e5d8:2bea with SMTP id ffacd0b85a97d-38bf56639c9mr26222406f8f.20.1737720158826;
        Fri, 24 Jan 2025 04:02:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6369:e73e:59c4:8223? ([2001:8b0:aba:5f3c:6369:e73e:59c4:8223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bad16sm2532629f8f.68.2025.01.24.04.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 04:02:38 -0800 (PST)
Message-ID: <4d28594d59069ca0dc8c6a04db71b934acb572fa.camel@linuxfoundation.org>
Subject: New FAQ entry
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs <docs@lists.yoctoproject.org>
Cc: Yocto TSC <tsc@lists.yoctoproject.org>
Date: Fri, 24 Jan 2025 12:02:37 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jan 2025 12:02:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6169

Hi,

Since I keep getting asked this and I'm weary of repeating msyelf, I
have a new FAQ entry, probably a slightly controversial one.

"""
Q: Why isn't systemd the default init system for OpenEmbedded/Yocto
Project or in Poky?

A: systemd is a desktop Linux init system with a specific focus that
isn't entirely aligned with a customisable 'embedded' build
system/environment.

It understandably mandates certain layouts and configurations which may
or may not align with what the objectives and direction OE/YP want to
take. It doesn't support all of our targets, for example musl support
in systemd is problematic.

If it were our default, we would have to align with all their choices
and this doesn't make sense. It is therefore a configuration option and
available to anyone where the design goals align but we're clear it
isn't the only way to handle init.

It is included in our automated testing through poky-altcfg and we
don't really need it to be the default, it is tested, it works, people
can choose to use it, it works fine.
"""

Cheers,

Richard


