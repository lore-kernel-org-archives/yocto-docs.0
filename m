Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B271CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 15:21:21 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24101.1782228077369209719
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 08:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D3fAnWbi;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59d541955f8so2071007e0c.1
        for <docs@lists.yoctoproject.org>; Tue, 23 Jun 2026 08:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782228076; cv=none;
        d=google.com; s=arc-20240605;
        b=bHFXzKJaJhJwW3NnTOe3f9Zafb/CgTwDclczSCiCVc2DEYEoIxHQy6OrAZD/1PhvQG
         z/jkS0FRpY0eCGHwrHDYeua6A5bxeFrAWpIwtXWx02bLPshqSfvtu+uLNa7w7gI2GTdk
         1H4kVJHe0+qkORpexD3fN/oTCTY4KIjujWkNdFbuvHf0/qAcmpKb6LhAk7zESrY2wwzc
         hLZ/wr2h4ZZsnMTsFW+e8zgxyL6tGSGVnpWRe6Xwv8fhnbbOAPp02+ud2HzOFe6mOSPp
         uMqWqeDZMpP2nBIr0FISK88ml6nPvtKCH89uk//XCSp6GoWY+f8i8BLveaTaTiljP9+r
         ioeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vc8mb+TWRs0EXSPgGCqamsRZll0LYWuExo4hOczpJJM=;
        fh=w4udndNa3z3dS987rpA732l9rCEUCMDw7O6T9DWWVD0=;
        b=fiyAZzrL5CyD2LIrWn7r1nAKLoEX84j+ty+/Glo2xsFBHXSOh2BxcYVbcthbwEJqVL
         5DH+n72xm4yFVHwRWrfa910kERURy0GvhxWJ2U8JgJpFtVWRo+b6k+tBTIMJvuII9xRw
         V2CScEyV+egaXVEHTk5pt53A9mbAoUgwLFbAA+1tziHjCOpULt4Ne1208hicVf8cFH0o
         OFsSzsTJyglHTzQ6mRorkqaFilLEPJR3uHkeY+2UoWpxhZfh1lwDv8D0rbQR7ft0t1gk
         ipz4LKOJGvdSL250eCbRl3IVNTv7yD18VJulrXnR664iaK35yYHWAG6+idbzlP7FVS0x
         4Mqw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782228076; x=1782832876; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vc8mb+TWRs0EXSPgGCqamsRZll0LYWuExo4hOczpJJM=;
        b=D3fAnWbiOcfp/Ox76241RIjssSbIoE3yWjSHw0QdyOowYk0590QHvCeu2SCDU8ZZf3
         CHNLYRZKK7gGhyH34imzOJv+JglVBLwz0tNqenobQwNgm3vg85aVtPRhd0LPoxqCILRO
         yZRl1OsYwKKECDNHs8setKPYEk0LH1sBYRmq272HYNXaMG9Jr/x5sds7H52e/SGXOCH2
         rGqHlv6lO4tSPEJ9stJRSqf666EZ8MUTGMx+qk+MH8gAFC0HCPv6rRKA5Fu7OlQ+hQWt
         ANxu/oaZbQpCPgMhqUu4iIOK0ErpihoJtiVowh35wXp0bHn3P+/oVSOLESwi+WevKVsG
         ZvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782228076; x=1782832876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vc8mb+TWRs0EXSPgGCqamsRZll0LYWuExo4hOczpJJM=;
        b=hAxLNR/H/EKB8ZCvqNTpjMel+4sgZu2pcysnp6Qd6lKCZGi3z3s5krv2VKTcNa1tmX
         rCUlBAlTH405TmJ1/8/HxIeXPU2VuTakrtWaF9sPIO+UP67DgYOTcliAtwnIJ8gtfYuJ
         Ab569OIYSoI1nXB8khw6dDf+SUIlfMOdPZwPCd/xwHwQh9ZakIBtGaBvWmkgBGalM4P0
         jHhG6QqcpHh62GHtBIqjCAbKbKsR6ZDlZK1BkaZpQRmdG17mdLsgbjtBeBLU87j54lNl
         8xGHV6f8hSpb9hf6r3R05lSdkudjt7xU6Qpl6Bag+dzGl2n8cprpGa2drY3heKradv90
         ELfQ==
X-Gm-Message-State: AOJu0YzN8283ZUImQHfm1mK5cw9cUy9c3caE7Pw1CKKOEAyA6rMmAztI
	eoP4uTSIYX7Mpfp6yoExV2sf28jKHX+/t+AUOMyM26a+gCi5ZNee9PM3f5kI5FPdKqH4c2gkmSL
	nCSnYkwsJGGbSc0zEE4vPq7DvRAX1zdQ=
X-Gm-Gg: AfdE7cn1Vbdd814GKVN3lZxC+RTHVVWRZMXf6tfRbWhkDkcvKBtbE/JIVkpKhsSO54V
	8VggsF4AiekbnvQYb/a10gykb5s/d88QycTF2Yas0XpmMgxwqKeMRE7dyPoeLDjwslmOXzYNQKK
	rvXQqodtweKZr/dKByn1ShNcFj7YD0tmeyG0XxXkWy0i+IutKpeFa4MgHokwL+6hvjJvTHo7cAd
	rWyfCDEp0tk2PohUJdfhFPBRQ1fw7M80vcJgSnhWpIpF+yHMAqN7FGCm8kvxlnCgW6UwIKtXw==
X-Received: by 2002:a05:6123:123:b0:5bb:d01d:451 with SMTP id
 71dfb90a1353d-5bbfbe465f3mr7526722e0c.10.1782228076185; Tue, 23 Jun 2026
 08:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <b5c0fc79-1ef3-48c2-885a-75c92402cea6@crashcourse.ca>
In-Reply-To: <b5c0fc79-1ef3-48c2-885a-75c92402cea6@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Jun 2026 17:21:04 +0200
X-Gm-Features: AVVi8Cee0t9C64Hgp4PJGfEwv5nLfLii1TT9ZT0RUWUx2sxjI_5FR8XtH1qSTd4
Message-ID: <CANNYZj9dQAamq-3yChFc-qweeLcepgY4EcVJDpFPFFzo7TdkfA@mail.gmail.com>
Subject: Re: [docs] should more entries be documented under meta/conf/?
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Jun 2026 15:21:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9842

On Mon, 22 Jun 2026 at 21:34, Robert P. J. Day via
lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
wrote:
> here:
>
> https://docs.yoctoproject.org/ref-manual/structure.html#meta-conf
>
> there are a few missing entries that might merit inclusion like:
>
>   - fragments
>   - templates
>   - multiconfig
>
> should any of those be added?

Yes.

Alex

