Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DECD6261A
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 17:57:41 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43726.1769104653704165244
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 09:57:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ATrTMNDS;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8c5349ba802so122168085a.1
        for <docs@lists.yoctoproject.org>; Thu, 22 Jan 2026 09:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769104653; cv=none;
        d=google.com; s=arc-20240605;
        b=MQXM+13QqrkNMGKyGFj+JcXC1W6oAIpTAhiRSk0Ib7wcbD6roPzUmir0opnKAEa/G/
         uHnsd/k8sz9JivTOd2m+Cuyf706gzfypOFrqAoH1vZ2JK9uu4aApZdRG36nS3rfuVALL
         CMh6II2avXoofel+dX6Ftd/qKQOo4cFJ26wit2xBmZxQn6HtJ7XYeUPELwoyqIZs7l30
         JvKzkbBanlpyne7JnE3sD7MR//7/LJAV0EZxZ6JXrXb/qL1539oMCBKivoZRsDiwa/J6
         s4yUAFQuwFuPc4/hmp5++K3wLW92XqvBMFX2FN6lIkxr5lWU4gAfH+tHQSxNkpppINZV
         EZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9waowehkHPqlgBYVtsjblRMZ+AO7rarj5nCE9t788lI=;
        fh=EW+et82PLiLc1YRMGWpU/TmvpZt1w8wVcU8HEesCMeQ=;
        b=PKTHPkwXWin6svE4/XX2/mzafrUsb40D3Po6N9TJYgtBHmN5c6yh823asx+OtUP8oK
         Yv+SrGXpQBDnBZ+tzFgi7zVWi8mm7DZtvk1c0zyR13cBZOa4HyiWATXUUrSXCQcWAcTv
         IPb1SmL2jrPwSNKtNbLVY4U7uBrGE3IArcPLVK7CfsH7BkMLJ2LcJLbqB1KmTQMXsbTX
         5CbnbSNYwK25Wf5R62fvORhcqsrADxd9gQ/VsYLYaBBJmzXWNtEOaqsdpF49CiHpthki
         kz0it0IsMZQQGO9mG6NVHoQjCgAubU67dTT3IkMzJO5yd4LtXKEXRgPyLCZj2k4CmsLE
         tGsA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769104653; x=1769709453; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9waowehkHPqlgBYVtsjblRMZ+AO7rarj5nCE9t788lI=;
        b=ATrTMNDSvYV0jhbShwYMOa6KEBJ34spbB+s8gMNXUxZjswUjXci6CB0Jq9pfHpgKIZ
         QQlkXtz6r0RgGzngjwTKN2YAkcMEP0dF3wVpcZNmaDq9mytIU6aWFoK/cbKSNrl3ouQO
         te0IPy7Hp1utn+rvT2UISMMGn8z8IS1YephFaGvGs/tPPupx+Mh/Fgr5jrdyt2Fjp1nB
         xOA7nLOg37y+ZgtFpcizc73iG5ugpdS0YqQrbqt5/QWmvhC1noqsYYC5/ITwQlsZMa/g
         wKp5Sj+/Zvc4RGllXgIs7KT9WYC/beXNU0c3QTAqQ90rBq/ktfUSCZqrLf2pLsI5QpEd
         fvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769104653; x=1769709453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9waowehkHPqlgBYVtsjblRMZ+AO7rarj5nCE9t788lI=;
        b=HQDw8PkMhexGoTsZldHguFwQv2o7CegL0FTAnuLJpt4epjfBk8C7G9bxc3u0g9weWg
         +YV9CbtW5BXptFIDim/lMnTlY/CP7KcyEZHdSHhDj3axwuJ0VvzEegOcupezfLnLJZ19
         VNaScNr5FuN3XpMC4E6/tZsj6XitUlAtaLTWmJvqg0UhWh46m9bMahizltelvIcriqoo
         ohRbqB/GKXgCPKBYKmwLSKw/Tshlf18174e6SgEt2qQU3QVg5+0iqpiBaf9L/FhidIHv
         8sJiaNjDl0rqqdw6bV0ecOrbYDyFTMN2mh8Oz+YOwtkdYXBKdEl4oTILTZXOMRZxqh4e
         Taog==
X-Forwarded-Encrypted: i=1; AJvYcCVaW2NP85/JKV/a0BIUJExorWgybGBdVZ1amuSyCcLf3KekIKuRKA/a+SNuR8rKBJRe4HfM@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz07/Cmg7XwSFr37bd+xMCmA4luFC3/FnniL9/EcU/U5qs8qPXc
	4H+m5rn/M8FgcT1SOuZhEAiSO3aHHUGY28h3n3NgWMU+uEB7WVqUMXBM65CygtKH9/7Fdjg2zDb
	XIr8LMdfnH9RXf2A78n/zfI3pzsmp0jY=
X-Gm-Gg: AZuq6aJJsZmXm/cDDXUnoyXcGZuivr++DzUEBSCMlUS2gThML5ZiOdwEGYmXc64jjnC
	7z75Rr1JUWY+HtfygdviQPj+9tH7ak0nacxnTohF+Vc72d1zGoX0WJ6MUi9ldXP8w8mCrIgYCM+
	k5JL66cryi9XOzYK+JpA22EjO0aynt+U8y7lM4xfI6yXC3t9QE0N29MuDbseDLCllUJxH/nnBjE
	2RpKOP/RtF2XL0Ol0Dw6bkRI0w/5mgdU21knn6PFd6kfGG6nAlRcuOJMvo+vjAp9bn1L3f5nbbW
	uKPGabhZkbD4ZrVXn+/lnhgK+/pwelIdI6Wdmd0D
X-Received: by 2002:a05:620a:4494:b0:8c5:2e5a:5c80 with SMTP id
 af79cd13be357-8c6e2e3e95bmr32879985a.65.1769104652500; Thu, 22 Jan 2026
 09:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20260122-bitbake-setup-choose-builtin-v3-0-c55291acc1a7@bootlin.com>
In-Reply-To: <20260122-bitbake-setup-choose-builtin-v3-0-c55291acc1a7@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 Jan 2026 18:57:21 +0100
X-Gm-Features: AZwV_QgE6-4n7fuhSOLmZhQnJS07jXX7CuRcW9GqTPoMYUqWjbMG0Apu4A5dPj0
Message-ID: <CANNYZj_FHvrXGk-=Q1pFd9Vo5b=puY41EERTQdivXikdbd_LmA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] bitbake-setup: add descriptions for fragment choices
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jan 2026 17:57:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8632

Thanks, other than the suggested test tweaks, lgtm. There might be a
merge conflict with the tests, as I've also tweaked them, but it
should not be hard to resolve.

Alex

On Thu, 22 Jan 2026 at 16:02, Antonin Godard <antonin.godard@bootlin.com> wrote:
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v3:
> - Rework logic as suggested by Alex
> - Remove modifications of {oe-nodistro,poky}-whinlatter.conf.json
> - Add a test case for oe-fragments-one-of
> - Link to v2: https://patch.msgid.link/20260120-bitbake-setup-choose-builtin-v2-0-ade604ff2351@bootlin.com
>
> Changes in v2:
> - As suggested by Alex, change the new way of specifying fragments to
>   remain a dictionary so they can be extended in the future
> - Link to v1: https://patch.msgid.link/20260116-bitbake-setup-choose-builtin-v1-0-8d66666a9efd@bootlin.com
>
> ---
> Antonin Godard (3):
>       bin/bitbake-setup: add descriptions for fragment choices
>       default-registry: update fragments choices with descriptions
>       lib/bb/tests/setup.py: add tests for oe-fragments-one-of
>
>  bin/bitbake-setup                                  | 23 ++++++++++++++-----
>  .../configurations/oe-nodistro-master.conf.json    |  6 ++++-
>  .../configurations/poky-master.conf.json           | 14 ++++++++++--
>  .../bitbake-user-manual-environment-setup.rst      | 26 ++++++++++++++++++++--
>  lib/bb/tests/setup.py                              | 25 +++++++++++++++++++--
>  setup-schema/bitbake-setup.schema.json             | 21 ++++++++++++++++-
>  6 files changed, 101 insertions(+), 14 deletions(-)
> ---
> base-commit: 5127faf986d8543bb88e73cf3dccb407d80c9a25
> change-id: 20260116-bitbake-setup-choose-builtin-fb199054cc25
>

