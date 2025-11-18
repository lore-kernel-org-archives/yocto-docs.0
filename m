Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4338FCED25D
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:29:19 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8632.1763458149854394464
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 01:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mcMaCZdL;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8738c6fdbe8so57557856d6.1
        for <docs@lists.yoctoproject.org>; Tue, 18 Nov 2025 01:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763458149; x=1764062949; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pusW3JUNqAf0VfljNaU2ND+svvC0VYbC3ysky7kYTKo=;
        b=mcMaCZdLj8PGU30AoX67EHBHZukOz5kExIPS3uH1wyquJm6JQT/g5rbpFiMgz8zhVS
         K+Wa7dwYjIEqwoqN8zaycd4T7GOZWoP4kmUA2rYQw3LRNh0hkTUjnp1s/36Dv0egyHU+
         63IEBQVu1kq4YaEF7EmkeBde2jJvStwpH3UOe5wMgRGIJZPrlC+N5FsX6AdAepasx1cl
         /tf9Fy0aELSlBt3w4RSK57H8P3/NA5xhUiL5VlaevvzN3Iq/BZspmEK1IE2LK4z7GULX
         3fmW/s+FE+DdmMpQppnfAVVZGCm7bCleI9lPVOhlu6GwMzIT/GLFPAkUpDhL4oqIS/y0
         2eQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458149; x=1764062949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pusW3JUNqAf0VfljNaU2ND+svvC0VYbC3ysky7kYTKo=;
        b=A1W0+l+E1ygFizvIf+Tk8XbFL2UqlYa9W7ilJ5pfuQ7hpEJAZyx2vjMDhiFwuZ1++G
         0uRR8iQQpb5aHeJpvzvshsBBij2EtKbWtunyAagpoRE6PFAn6wwKGz92zHWWnUAetY7u
         5Bg+Eu7IA9/V6/vnXVfyAiOUoYeyWB5dtmeQs0JxzpFOlsVSa/LbpXMncf1SMSpO8Wnv
         l/MWHVQjyXMEJxyNrGlRMn0BQ6mMt9a6Ni6uoIq4Xm+QQFYVfKQI2NivFAu9qC4YYrm3
         tsKN4JS+74p/CrTTzFEKDZPRXaGxWMQH44/e+e51SNngOgThpXquS57H0LYU8n/8vPFV
         Sodw==
X-Forwarded-Encrypted: i=1; AJvYcCXYv+HaJbaAIxWCPFA8u84/jnObghBHct+TUpzzLylRCaDrasfT5CEgsMJmFSIG26+wgA1v@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yxf1IHY/kH6sXn7wvj4OvCTa1Gaah2eE/U3mi+TX9H3ewZpChrG
	KMOMrV2jWH5wAD24FH/jyPKujaL/px+9Ul73ohnSCZDyd/gaL6JY/rztjtKcBlYxqoNAkCHO8V3
	F2CmXtJS16vFLnGMGZ3j4ufy+CMyTquM=
X-Gm-Gg: ASbGncuXns0RW5Pd/eHpDc9fvdInif/PPbK3TRaeC57a7oYRp1nozh+6tBJ+h+6iB/f
	f8TALZiUUMopnUKqD321fgI3PRCd3o3gwMHd4Hl0YSVDAQQd8MDZg4tTSQ89w+oXLcRpAztikNm
	q3VNa2YfwkEfT9T45P06e3CtO9McsLp0ZeEsTZyaAj/a2kKrbvU84avqM0rAQ2v4USUb7nPGqPY
	E14OeWdchXCYcmCn0FnylUImyO5XAO7gNe5HT0haHPPvlwAU7ZC9pJ5KF3YMhCEmtTaGppF+ful
	+CsObnctsoGdhnQQ5YgGTPSOmuuvGPOxG8976sTe
X-Google-Smtp-Source: AGHT+IGk3Rp8q0c2BOJ/Q9r7LUklezvX6Lk5S4FIhlV+zL6U7WUA2ZQWa31peXwYKyVdX8GlGw2jXTJMZoxJh3g0C6A=
X-Received: by 2002:a05:6214:2682:b0:880:4c2b:1c31 with SMTP id
 6a1803df08f44-88452c0df35mr35583636d6.32.1763458148604; Tue, 18 Nov 2025
 01:29:08 -0800 (PST)
MIME-Version: 1.0
References: <20251118-bitbake-setup-conf-updates-v4-0-7336b663bca6@bootlin.com>
In-Reply-To: <20251118-bitbake-setup-conf-updates-v4-0-7336b663bca6@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Nov 2025 10:28:57 +0100
X-Gm-Features: AWmQ_blHPbYZmizYzJc8MRavt5ozSgQqTYBZeZTPXiP4BngSL6QwSNEExZF5-n0
Message-ID: <CANNYZj8LQR-VBPzsk0fLbOtqLS9+jcY73aBOxA43-=rag5MEfw@mail.gmail.com>
Subject: Re: [docs] [PATCH v4 0/2] bitbake-setup: update: add a
 --update-bb-conf option
To: antonin.godard@bootlin.com
Cc: bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Nov 2025 09:29:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8071

Thanks, I think this patchset is now ready.

I'm glad there are now several people that actually know the code;
that means you can experiment and implement your own ideas :)

Alex

On Tue, 18 Nov 2025 at 09:20, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v4:
> - Simplify argument passing in build_status(), as suggested by Alex
> - Link to v3: https://lore.kernel.org/r/20251117-bitbake-setup-conf-updates-v3-0-46cdf826e79c@bootlin.com
>
> Changes in v3:
> - bitbake-setup:
>   - Change the conf diff logic as suggested by Alex.
>   - Use args in build_status() to get update_bb_conf.
>   - Use get_diff() instead of git diff in _setup_bitbake_build()
> - test:
>   - Use hashlib update() instead of file_digest() for
>     backwards-compatibility.
>   - When computing checkum check that the item returned by glob.glob is
>     a file and not a link (previously it would have tried to open a
>     directory).
> - Link to v2: https://lore.kernel.org/r/20251117-bitbake-setup-conf-updates-v2-0-209637e01fbe@bootlin.com
>
> Changes in v2:
> - As suggested by Alex, Rework the logic to apply upstream configuration
>   changes first, then print the diff and ask the user whether to apply
>   or not (default behavior).
> - Behavior can still be overridden with --update-bb-conf='yes/no/prompt'
> - Link to v1: https://lore.kernel.org/r/20251114-bitbake-setup-conf-updates-v1-0-990583d8251b@bootlin.com
>
> ---
> Antonin Godard (2):
>       bitbake-setup: update: add a --update-bb-conf option
>       bitbake-selftest: setup: add test for --update-bb-conf=no
>
>  bin/bitbake-setup                                  | 53 ++++++++++++++++------
>  .../bitbake-user-manual-environment-setup.rst      |  8 ++++
>  lib/bb/tests/setup.py                              | 41 +++++++++++++++--
>  3 files changed, 84 insertions(+), 18 deletions(-)
> ---
> base-commit: ae9a70c919f14ca323eb7c03ef9080fd0bd52c29
> change-id: 20251114-bitbake-setup-conf-updates-91ae4efa86ae
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8068): https://lists.yoctoproject.org/g/docs/message/8068
> Mute This Topic: https://lists.yoctoproject.org/mt/116353215/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

