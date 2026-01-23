Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57AAD72376
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 11:09:27 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65407.1769166557752561477
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 03:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bCyILHsY;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-89476eaaf16so23034006d6.1
        for <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 03:09:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769166557; cv=none;
        d=google.com; s=arc-20240605;
        b=hshOBM+xV+EixB0Phnj7Xikk6idqgKpzcU2doEJDtDD2WRBUNkB7fjr0UUMSZhVsiE
         KQi8Qpulp3JE8EpL/0Pn0ei49f/8T4XkbLb9zCZDAT/i1eItz5qxSJ7Cz6sOlJ922JBs
         +xTQfneJxRFXakdHuzwRoWvHEomBDcQqP5CiZHX5Nq8O6zNilYvdgmE0sHkmLpF3BS+o
         yrWE5Mm4MlKu1jpxsF6Xx1ijY1rO9zR5Yvcx9oskzOpbIFHr4jOO8VqXiSmo+myb1D9S
         6OSccJrOUX0+CSkPl9TmJ/uQBBY3vg6PVoX1QovZobdsEvzrJrzrJrxXN1BUIacC/mkZ
         77SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H9ypVLGqkEz5lVU/SbxCBdFL7hoTe8Jo+RnCSSr8R4E=;
        fh=LW6+Sv/+Iwp0xxZ69KWDYw81LUbnkOJb88WMg8+anw4=;
        b=UIe+mvrJ+AwOk/P9ztRqaC4PA6XAlAadlTNgjj2bYFexYcrGwW+RENULRi+KYxheSA
         lz9bLqqXl62CGPkh/vj7K83nN6R6+CVq9PWnIPO+rGKe64lhhGTs1TIp7E0irRQMI4DD
         +1xJYGGKx5Vlir2HOLuPKJsdOTF8OJOrzaYwVZlhC3VTomTNGQA06P5Qhb0rkb3vJecu
         tejzCMD8PbgECh1vensjBHV3OFHZU4ys7GcRMnzmjKV+42UVNCOzY/nVZyhdIYj74l6Z
         CUtAoKdimk+DxAAXvNrBZJtx7JGZ/zaktP9SDRPauXXw4cK8w96/7mnTrCRTGA3sneef
         gR4g==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769166557; x=1769771357; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H9ypVLGqkEz5lVU/SbxCBdFL7hoTe8Jo+RnCSSr8R4E=;
        b=bCyILHsYB+fNEoxfI5Br80DKUGAW3bCdLMBzgL+QsGCiAxFTTD8JmsGcGBLjzQIic3
         3t+0W7MBjRlT2Ig+jXHdPbJv/7pRFdvve/GU60YAvNHrOyfGPDgsSKQliZZuG61M7t1H
         Z7S/LMSijD9zVRjhLIsA2NQ3BJZ497UGIRB4D/Az3NvF9Xf476FgJN2ILB+EiY0JSeuK
         ffOAwSYj5wJyCDStuvYwLD5y4mRGillRJD6uMxLsRnDqICVqg8hxnxB8hRTYKCVnSKUh
         6yTQ/oGJ4jDDSSpNEN1dQHP3yQ/wcWKxiXXYHsAhhfQiTJGTwFkq+turxWq5w7E7hGDy
         vVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769166557; x=1769771357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9ypVLGqkEz5lVU/SbxCBdFL7hoTe8Jo+RnCSSr8R4E=;
        b=jt+NYry7yIxD0SKYxOUby+/ZN0xM3pXqyYjDR6BWabO37YWvcaVGL2Wj4Ma9s8v9I8
         HBbDrHsUyPEKYqkhqtmVFBGKKG53oLuzzecRbrR+WaZyao9ZkOF7of8OnbDMBPFtg7I/
         NWdoR0k9hauNfpNli0zOcQOc1hJS1DBm7clxLrZ7GzobJctYjdj0xb8ipArJvT30K+/t
         ZZpSSHOL72ZK9E+1XxTVvO9cJG76DhTGWT0kIsvnU4xxOMHg88ddDgmNCnf6AhWvha6R
         AdV0ikZVGf1hk3SLzPGp7ewUwacA8reaU5KLk4P6VihyFoCg1/GiF074VYCMIhNHLvpC
         sszQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7ToS8QQL1fjQDt+CnZA8V0jdpZJTJvI5HJm8CEtWTJx9gJtwolnheiPoY1xnJkw2RedjJ@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzxTrHDlwV9IchS2YpINwOlYp2cP4RG+GWTArKLZrRwkIByu8+m
	qI2f34v+dMo4xQ290M0J5ETIgiqePBEnEJ0ZRIvrzxia6WwJlKtIfkBwxRrDPirbFKoOH0lMbhd
	0Tube8D3h7tbcorZiep7UdK/3KE17a50=
X-Gm-Gg: AZuq6aKR32JDXnPag9yHug6FRWrXX5BYtJVozyRpPmUmWvgxKUWYtBf6ywbSRgRZHqp
	aRfmfVPs2UuwsB8xgLOlXtkPPRf2XZv1GqYlrMCpLB4mGvOaIXGG6q5bvFvmi3vn5Ezv7FOPEaF
	iE1v1zaumAXnD1nQDZ2WUmIbcp2c3HWhjhvrIegOaYznMwDMd3iwF5GzVhN2I6JTDrYdUJVhkaz
	jZ47MHe0xWGt11l0N8daXouzUZeW50Utei7wzx0hbZGTcOc+DyfqcEGpn+qwJ2hKF/GhsjTgMxJ
	BeB2r8+fyWTV0tKCJXJKOqM08VBFJg==
X-Received: by 2002:a05:6214:c4b:b0:88a:2f46:8221 with SMTP id
 6a1803df08f44-894901ade43mr34494216d6.8.1769166556578; Fri, 23 Jan 2026
 03:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20260122-bitbake-setup-choose-builtin-v3-0-c55291acc1a7@bootlin.com>
 <20260122-bitbake-setup-choose-builtin-v3-3-c55291acc1a7@bootlin.com>
 <CANNYZj_SUcRFLWobRO9GHPzN+ZtG9koKVg4iZ-gzoKsSAUiMoQ@mail.gmail.com> <DFVTWVIZ6ZUP.1YHMAPRNIEF5M@bootlin.com>
In-Reply-To: <DFVTWVIZ6ZUP.1YHMAPRNIEF5M@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Jan 2026 12:09:05 +0100
X-Gm-Features: AZwV_QgpbTRVHI8sFhzXe3ivtiCMKGIlCeNqC7lXn65xaVmb6i5xdiXtLkgN2Y0
Message-ID: <CANNYZj_4Y=PaLX3Du+YhZxTY5NTp1RqeQhNOtaVrdmxh7zTXiQ@mail.gmail.com>
Subject: Re: [docs] [PATCH v3 3/3] lib/bb/tests/setup.py: add tests for oe-fragments-one-of
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Jan 2026 11:09:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8635

On Fri, 23 Jan 2026 at 09:34, Antonin Godard <antonin.godard@bootlin.com> wrote:
> >> -                                                                 'gadget-notemplate','gizmo-notemplate')},
> >> +                                                                 'gadget-notemplate',
> >> +                                                                 'gizmo-notemplate',
> >> +                                                                 'gizmo-fragments-one-of fragment-desc-1 fragment-nodesc-1')},
> >
> > As there's only one choice in each, bitbake-setup should pick that
> > without asking, or having to specify them on command line. Let's test
> > that too, and drop the fragment names from here.

After reading your response, I retract this suggestion. The reason
bitbake-setup is not automatically picking up a single choice is
because such configuration doesn't make sense: if someone makes
oe-fragments-one-of with a single choice, they should just add that
choice to oe-fragments.

That said, we still need to test oe-fragments-one-of, so can you place
two choices to each (old syntax, new syntax), and supply the
selections on command line, as you've already done? The non-active
fragment can be entirely bogus and non-existing.

Alex

