Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2EDD2FECB
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 17:45:51 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17965.1769535944609762665
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 09:45:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HMAAtqpE;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c6c922850cso613383085a.2
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 09:45:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769535943; cv=none;
        d=google.com; s=arc-20240605;
        b=bvLLjzac2ADpqTOLrys5P8daVmIZ0yqGRtYlkNKA7D1Y0FXxlZ4cgKPWZf311wkBoF
         slC619wEL6jyT8rqE5cOp5a40POtotVImX4x29k8zsnD07hUftFx5N7MiZK2PsnKj4DZ
         JHiDgGfMt+FkkDLCsRtQ4RoxkorUOXjeVFRtA1G/qLG6UEBXbo5ljVlCmy3sskfgu2tY
         kKuPfQDzC+rEZlLGzMfZ9WTwwAugng5FHXh5Xny0QAZluPMoHztER2JWuLhzaZx+ZLDm
         2a5F1uhjjLtr6F0btCy9agCcjURDUgMgr1vzPMksrkhMnUwkdW1PXlWIYuuVYe2L3vLH
         5HJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=91EVQTgcyqcWbfl+778KP0bQEXvVzkOUpPK1OsTRR18=;
        fh=n8EAYiWUW5Dn/v049EcStdnhkVQJvPjgImlwLMOc3EY=;
        b=LCGPzjFHYm5zlh/9kICRzX7faNpji7Kfpl1tO5HFIjrmFXm+P9/nobGfgdUCeH9esl
         4bxVrbmKbu79kjZpgFfXu240iA29q8UGh/EWsNbCOOEpJdFZlRei297sss7PG1OioBnF
         IN8Z94OglrbuMUdHsU+hYNca64+5ohOW8rw8F9jScdPLqLFwc6k+pjoQqfbaleetdq1s
         xtvSv27sepNrMRICVzyEG03BUfcikgh2gKnO942RIcdJRGShKBdpaXI8fMxnt/7v0NMI
         K/RIPzFDjZcLgXQOmDPBJzjgp4w4HxxGrBHJDmFT0Gs/7PkNwNF62iaS5gkrto0FMOt/
         iwTA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769535943; x=1770140743; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=91EVQTgcyqcWbfl+778KP0bQEXvVzkOUpPK1OsTRR18=;
        b=HMAAtqpET/gl8LgBl3PyTeAvW3G57CdVbBIqu2XjYBZOPz504WTN7mMoBWVADVyG+K
         AlZem9gpQ/NS0BaV4II25fjOpt8p4TDe3beNpfhL52cxACEBhnrMRFXNSYaCgvZqdfjB
         yNphOBMZVsKcfCe20WrqyiguHYMZz2xv2o3QN4oP8xaO/Hr4HIdlDkuXE8QY8t9NzyQe
         NYoP21THhH7mTNjn0NGbSSMvQDpjTETAU37d2OCBVfuqG6R10hBEP3AYuMlOZBmvnOk0
         JSSiJzFvyX92rM8aV6TsITWcDIRO/gcn0FVDJobWPwDGy+Dg13cqKsEcMvZBfcR+GIU5
         GCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769535943; x=1770140743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91EVQTgcyqcWbfl+778KP0bQEXvVzkOUpPK1OsTRR18=;
        b=CuwUXUv756ECBZkI+bfAy5rL4ut1tWLU4Qr7gLbcdHMjj29Er7a+U6OneCnlqtoMlI
         lNOPkSYRcgI5U50kvdKZEjX+Jg+jlRUMjaF1kwVtL8jTwvm8M5uviRx0twF86mUCQWV3
         gXmge+FnPGWLLH1s3zNoGYz1fGrUHoMcn2dry/hBcv/zOpmFCwpPas/8O9Je5dR4oT6f
         e5wyHp1z8B9eY+sram5NGboMg7OgeO9UwYGWtg/pYM2zUFPXPcbpUgmingBNwxAHfvX3
         V6U6PrYuahInhSApwqVk4FYfjajRJEw6yrsFV0/PJAZe446zCkQON6yA1q5HbiWG/Z9x
         99kw==
X-Forwarded-Encrypted: i=1; AJvYcCUpQeG5r9j8qZw+6xMWyKtDNXwmkr4tVGT9SUJZLdHkTVHv7Lxc023iqepF6+qQf74AbD4j@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yx7muqeJiolqt89EGcZRH4ZSTsGdz0u9+sKSQbXdQy5BeEc2mOU
	C5XbUHsxzbcrF94rGiU53xC2u174lSjXDg/R0b0ZGTG1fobLdbTuFfkbxzO4yScjtfsuGPb0CfG
	47DOGE/NbS6mlybqADFNEb8zAwxNhFsw=
X-Gm-Gg: AZuq6aLIMi7CgITZgLYV9kvUg7CAMZd4oD2kJLnCr3CkTGjwGK71gydwh7n1Qgem+xD
	TUr4mufWUANwgM9od08ehn+IFtq3lVzX5w5vk98l/HDs0KLl1HnDi/SNOqnuiMhTF5Q8djwTRXq
	T0Ocv45Lql1N6aYMqfJM2Z6Ut6vywzDZ1cIXskfw3EO5XPrnXEE2h7XZfiYZlcDPqOhGva1jYGr
	60Y+7ve812Gr/TiqUzDgp1sybbBIQ+4z7BZCZJq+wyVevfQAOoe5s26QAqhLP4GTeViReqXGW6r
	ho3PWoh8WOwvc/CBT7r9V2re70kpWQ==
X-Received: by 2002:a05:620a:2844:b0:8c5:2e1b:7913 with SMTP id
 af79cd13be357-8c70b841f60mr338213885a.25.1769535943572; Tue, 27 Jan 2026
 09:45:43 -0800 (PST)
MIME-Version: 1.0
References: <20260126222743.411405-1-daiane.angolini@foundries.io>
 <20260126222743.411405-2-daiane.angolini@foundries.io> <DFZAUTK11Y5A.1PPDDZRLH02PU@bootlin.com>
 <CANNYZj_DhwvpzBcG0Vi7E9aYqx7b30uDUxJFkmdE686f1+Zkog@mail.gmail.com> <CA+HEL79Bs-OaWjNa2OSrVULiBqpeXU_0m1u=vUwgh3cXWXY5uA@mail.gmail.com>
In-Reply-To: <CA+HEL79Bs-OaWjNa2OSrVULiBqpeXU_0m1u=vUwgh3cXWXY5uA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Jan 2026 18:45:31 +0100
X-Gm-Features: AZwV_QjjcqIJO3IGRTKZsKCYCx9rJ40fvewO1JWAPIQn5lMF8sDggv8IQDbEirU
Message-ID: <CANNYZj_o9A8hpmnwrJ3Ng+ZvPLHy+AbGnRcS3QJm2nUDT=SW0Q@mail.gmail.com>
Subject: Re: [docs][PATCH 2/5] bitbake-setup: Change the output to match the
 terminology in the docs
To: Daiane Angolini <daiane.angolini@foundries.io>
Cc: antonin.godard@bootlin.com, bitbake-devel@lists.openembedded.org, 
	docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 17:45:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8745

On Tue, 27 Jan 2026 at 14:21, Daiane Angolini
<daiane.angolini@foundries.io> wrote:
> If everything is configuration, all stuff is the same for the
> newcomer. Bitbake configuration is the most generic way to refer to
> anything. If I have a site.conf with DL_DIR set there, it's a bitbake
> configuration, if I have a KERNEL_DEVICE inside a machine.conf it's a
> bitbake configuration.
>
> How do you like Fragment Set?

It's not just the fragment set. It's also what layers are enabled in
bblayers.conf, and what is in site.conf. All these things together are
collected in build/conf/, they define what bitbake starts with (the
metadata in layers is pulled in based on what layers are included in
bblayers.conf) , and they are commonly understood as adding parameters
to bitbake configuration for a particular build directory, on top of
layer metadata - if you change those things, then it affects only that
build directory.

So maybe 'bitbake configuration' isn't unambigious, but tweaking
build/conf to adjust the bitbake configuration without changing layers
is a well understood concept. Can you suggest a better name for that?

Alex

