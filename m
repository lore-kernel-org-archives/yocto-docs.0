Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC99C88E72
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 15:49:37 +0000 (UTC)
Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.847.1789400968922213400
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 08:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f96594cs;
 spf=pass (domain: gmail.com, ip: 74.125.230.140, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6ebso24980876d6.2
        for <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 08:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789400968; cv=none;
        d=google.com; s=arc-20260327;
        b=AQlSe1hSQpWAok+I4ngclAy4+jsCJRPfYcheX1UmobrqGsmOE/kor67VKJ622iSpP0
         OYj0GNndDhUyofPhX1EEO47OgL31qUzP2gtSaI5dqbVFZXUWrOQDDRQiYdqktaFFbFg6
         wBbsfQjEP9gYHtV65Fy497OHR0/tVat4nVErkzXbiSMJhxAwHDd0VClW9WPiB3xWz6vZ
         duD7fKb75xENJ3RHG6E8aZwM1vnIIVxtJndtMaJ0W+/5EmQXrunaa54Omx2MSKyxsyXM
         ScqlsVt7EizvcmZuxXm5G/i9aGVBBonZ6HKuErcQjkLT/PRaQzC/SiNg31PZav1NqZo9
         vEjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ddlMFN/lu8YDSg/AyvW4ztIzTDGVBO0eNYlQxXwyPPk=;
        fh=iLteoAP1ztHyMOIcoW4ExpNNB+cYXNHUFmF2RpULhi4=;
        b=o0uzH2jRdX47aSrtPO5D2Dn4WQAkNQUkcutVv2Zt34FLiHl1M0k5rck9bPH5zTGIob
         EieqtAHTYmJE4cbGTm4RjPf9lOVWau57tNLOdNAoDBfk+1vJDQSsD/qGWr2jgC4I4GkZ
         X9L81EJTCOVorM9TP9NSZ/l4zrkjP5vgZBqLF5+1fnNn7IKfxBnHUIHv/jfckzphmF+1
         Ezh+DqHPkTzJtu9KJR8ppx+JclVoeCuP0BXkHkRgPWiY5pwqGTTV6uGp3Ok1NF9sChQP
         E+1lgYnQ8QX4F4/0SrALlYB/4YoDG+bJVwN3BLELdfndZQNzQrOZxp4L/q+FoKcjcEk/
         lzgA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789400968; x=1790005768; darn=lists.yoctoproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddlMFN/lu8YDSg/AyvW4ztIzTDGVBO0eNYlQxXwyPPk=;
        b=f96594csiL7HUfLXf0UNH+jRtf/IXPA+CmZpjLDp9uViNdW6DlxSvwV+7B5Xus3NUJ
         1kIoP4ljgZM6X3nEJgapsfVQl9fQzRquSMjU8Diz0H2St2/zXGppozEmLZ8AcBvw1tCg
         RMxgfoa1gwgxokV5btdVQ76/DcAe/WPq+pwwXjStgplCJGrXxaqn0iHAvRjUZz7XNesk
         53egxg3LZn8Wz/KjsDHRYJKB8kfN/R6BDmPKoDCBApSON0E10PU0w8h6rflFpqnaPxJ7
         Yd5OVZ0VIucACU9x22pl7RHLRgK1wsJ0SuP/+5qB37Nw6K1Dw5a6Ur+gmKaVaagD036M
         y/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789400968; x=1790005768;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ddlMFN/lu8YDSg/AyvW4ztIzTDGVBO0eNYlQxXwyPPk=;
        b=rcXVsbiCwX3qETDZ6sKcOl3HR3rfMtIYDV6T2KySDUcJTWAYyH+HcfMyhXctyBWVU8
         emh8DHo08a4r/SawTiI5YK4OQqDMkB9F85D8e6LvA0/twZoIN/jhYM+S0qryKV5BW1ei
         h/KmKmOZO+J1fIaVneaeIjlfh9ppjsCIDegYMpPAsHN6EOYNjO9tBMVqb7xU0VetjGZo
         QTjyUAa6VrP434XH5NtBX7iimCJH2mi9mUOV1Y8uNWioRi2Xb4ZK7v2I8eD/x8qh/pXc
         Aj8qnMC81iSjmturgU7anVZsvbAp+c0hSnvToLR6DFyGpFmGCUTXBZYNTiT1jUED34G8
         njaQ==
X-Forwarded-Encrypted: i=1; AKwUvByhKDu/R4DVPdzmWHQcUYQZlEZA4MDnT+d7S92FkBycREco3/v7Px6r0fnX0JQCcmvh19n4@lists.yoctoproject.org
X-Gm-Message-State: AFuF++mZDeSwjM70QxFf2JQ2RpmQ3NhOe8zGopsCIpoDqfP8hDO6zUQF
	xxmyHVIKItRTnmIUZwXQ1hdClQbJjVbabJZCKjjhFpVd+hGEgLN6YG9EWMC2XMxXjzq6CWvD1b0
	HD0tA0lJj0TSDe80Ovyv5X1/GNLAbd2A=
X-Gm-Gg: AYBFou0NBK+TlIcH/gTIZMQtuBizplkTeoW/O6c2vgIZRKVo+LYKlNE129aUIuXIbG9
	LI9ozumbQxL4NuLUeiPGeLfBgO8sHAhX29MCqGMvFbxKVIKG/1/U9O06LBQyhn+Ty+F8X1rLDkI
	96bIHsni6CN2arcWA0xm8MclUYQfInbwFgW/P1bykx6d7is2mAvdcXD7rv8/I50yOM5iNhpghQf
	qM6l4W9bE2IzZNm53G6UGTUJtVRr01/z2cLzhamPxpwyi115UYGDfEC7muMVeyXPwSBZw4jNOUJ
	m2JonitkSILrnt6+0TMqvRbowb2+OjdD8IPG/tR+OstHH4ZJmGDiGZAElZwOvfCeo5CY9eATjny
	F0QNwhmORBzgHyQ/oNvNOevyr
X-Received: by 2002:a05:6214:2b8a:b0:910:63b6:fc63 with SMTP id
 6a1803df08f44-9122e511ea4mr45111076d6.15.1789400967820; Mon, 14 Sep 2026
 08:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260828162612.753815-1-chris.laplante@agilent.com> <d8eedd54-51b2-4d71-a8c8-4dabe0437c63@cherry.de>
In-Reply-To: <d8eedd54-51b2-4d71-a8c8-4dabe0437c63@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Sep 2026 17:49:16 +0200
X-Gm-Features: AcwNN1WxG9OLL3FeMgYXK6N6nuhcsy2_h8wnCarl09bhaKJ_nTmfuQyyya2y000
Message-ID: <CANNYZj96bFyuvNrTtF+pk8zzn1up98o4MwoB7sRai1GxKV7HsA@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 1/4] lib: rename fetch2 as fetch; invert compat
 shim to make bb.fetch2 = bb.fetch
To: quentin.schulz@cherry.de
Cc: chris.laplante@agilent.com, bitbake-devel@lists.openembedded.org, 
	docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 15:49:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10496

On Mon, 14 Sept 2026 at 17:21, Quentin Schulz via
lists.yoctoproject.org
<quentin.schulz=cherry.de@lists.yoctoproject.org> wrote:
> I see this has merged already but I cannot help but ask "why". You don't
> explain what is the issue with having fetch2 instead of fetch or what
> this is helping with. The only thing I see this changing is adding a
> deprecation warning if you're using bb.fetch2 in a third-party layer,
> and I'm assuming at some point it'll be removed and layers will need to
> adapt or be broken. What's the context? If it works, why "fix" it and
> potentially introduce issues?

Personally I can't stand having those unnecessary numbers. We're stuck
with things like python3, and gstreamer1.0, and it's just eyesore and
extra characters to type for no good reason. That's why I always
resist introducing those version appendages, not always successfully
unfortunately.

Alex

