Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0C3CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:27:02 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16075.1781083613215638725
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 02:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bPYSr9G8;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9159951f05aso752301085a.0
        for <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 02:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781083612; cv=none;
        d=google.com; s=arc-20240605;
        b=TluKne4zb6n6JbfMX+SVbUX6J2o19NRFyxJvsbIKET+mXsh1H58+EJh8Z3UvaOJCx4
         2WNImVRoDkbFr/9mMNmivA7wzlzgcQmlNV+jAaogAav6KwtiZ4kNLnqPPwXjpYvp2ZgC
         E9R0qTMUaqgaZYDD5aTYc86m7OH2TCfIdHjSjYJlVSdFasN7zgue72W2dmo0IebXE7BL
         wyCUq58hOr0HvIcK2rqfv1ES9o0jvQ9yEHqxsBnoyltY9q+oBXgHp0E+NXUj5TcLdkI8
         mFKFzMiWYSQvBXB1nObVbwbrEv/LN6Igap/VbWAeI33pdmyd6UO37OOPg9SN8YMdYan2
         htgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G+hfm5Ycg8K9CmDXRy7ROT6aiUFEfI8AE76HfBoFL0M=;
        fh=QlW+n/Qq/ZUiZPTrJNYMgFNzN+XqkAuHHXKAmDJH3jo=;
        b=AdZshf8ykRc5nL8dpVdF/1KKXxUk2vRLARwwRDBgnVM+gGRbQ9j2N8k3EteKY8tpJA
         bNWH+cdHnG7lTDDWwwW8+GSDG5MeoeqHDWSVq4ekzKeskPk8C5khNBIrSS0U/MMGzQqO
         bxy4mfcNvOEgXAW17LY1taMaOuYTP0pfkM5yjGDgik9leUiVC5RQv/qbNMxmu3Ml9a7p
         3HWtaIk3e2kd6/vZoctgm0Lg73sU2/zlcaXVmSPOiW9+lZLhxMG6Gxc/1uc/3IPaFG49
         RvarpWJBY1yLKTKh85OtFP4X//sBKxFt1aac5A9w4SA8IuFi23Cu6c5l1+L5QX/VdKLw
         ZHeQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781083612; x=1781688412; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G+hfm5Ycg8K9CmDXRy7ROT6aiUFEfI8AE76HfBoFL0M=;
        b=bPYSr9G8g5Ryvu75MCfE7D9rPfKaXJN79bPXfJziH86snpCrzN4fbT9sLrYD+hGnW0
         8uTel1iQhjjOAiHzqGQlxUb+RpClWOk+PPwgbn3FTRAu5YWGjCuTCnvDdGOrcp79napU
         Fl+LMRyGjYzKdIId72U/RDcrwBXpXSx4ZwgSX5w6Oigl2tkO5lIHLCtjqsJq3fTa2cuQ
         IKQwU7780SRarwHBOZZ+ExZMP7yluWIPwCMZRZ/QGFSpLK2IhYwU5dQmZoEUlwFmTTDp
         O47/pOQtaT+24gk4UqVZ/gO7SxZC2MDRSaRLjQ03j7X1dyaYxzEr/jp1MK4Cv5/ZazmZ
         ZcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781083612; x=1781688412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+hfm5Ycg8K9CmDXRy7ROT6aiUFEfI8AE76HfBoFL0M=;
        b=LiT38kZHlpznxpfuOrgeRpB5ciKkSmJl818i85/B8FsuV3t7fVEryMsoJZNpSSJhN6
         G25Zs1mzVO7TjXz5sXgMZt2N8xu8uPl4OJClr/nYt6acRKPhNzDc2vE3ueT2epK9E5gm
         R/FO+39oLgqrxo5lO5Am1Mt7OGCTiJ4WrDrDUT6tABTT8TFqrSTTrysM0SLEm+Vm3ugp
         ZxWRwYI5VEVNPGG8M4IBOhcN+Utq3AXmiPEbw24pGvmQ4t4dTRWSQl/QRE4pAs4IhGkO
         Df2RThuHKbdE6iKRPULZ6YZtzdHrnfsEK8H3eNaNXtNN4JoQ6oMKncMX62txqVEb68SF
         aZfg==
X-Forwarded-Encrypted: i=1; AFNElJ+oxUSwvCAtr/F30Xs1N+7DZrPUT/sfv1DNPU/WyZxU68CcFE9oejf0DrMUAzRxw2K7JiG5@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzLpnhXoA5YThf53yud1H36AuEpVrfNThmyShyrNqPmcfvauv7h
	b7+vPq98dN0CvBYvJITVYKjcK0ZraJXCPsG2VayUoesVuLgu2jAYgwvT/KZYJ9kk53s2YTM8WPA
	PYsnL8vhPlTtvGNoAAhoiO9YqOAgpL6o=
X-Gm-Gg: Acq92OHPjkV1aB87eg/5P6it9PsVD9Tv2H2CYoUO8NC5SHTsRq8zRDKu11wPAMo1vML
	uaDI91Sp3VxcOduqGW34q1Sex+QJ5Uh3pbTQoFYFhjEN62jKXATA6eRhRTMmuB+85hHaeND5PLm
	Xvx46Y14kBH38QoFJEYG6GiMJFerwXqy6aE624L2ylC9uc2svbQurs0rfWrq+qZ55zD6t2W6tNm
	VrdnCdfIjJPLux3/87AOSR4WJTW3M7+KWYio6K1xQ/mD+Ukxbnj3DiFVWsFHAlKacA5ilKZ+hva
	WecRrepQ3FgWiYjRwn0=
X-Received: by 2002:a05:6214:6017:b0:8b9:3907:166a with SMTP id
 6a1803df08f44-8cee601f5b4mr376985916d6.17.1781083612025; Wed, 10 Jun 2026
 02:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <06ee4e3f-d477-0b55-be14-ff74aa2383c1@crashcourse.ca>
 <CANNYZj8OeT0eQADFc1fE7MkGhFeWC-yhb82uBasDBDQkL3w=bQ@mail.gmail.com>
 <03d3e318-bbc8-4b50-969a-908205b8e5ee@crashcourse.ca> <cbe72dde-6eb7-4006-a17c-0268b88458ce@cherry.de>
In-Reply-To: <cbe72dde-6eb7-4006-a17c-0268b88458ce@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Jun 2026 11:26:39 +0200
X-Gm-Features: AVVi8Cdgfhl36NbmAQEdeb0Jw94fKTiotRDpk41z4IqiWwokAApL5upn2cJEufk
Message-ID: <CANNYZj9EaHwoGNyGeiNV=LYWaDwR31A5THogT-7m9X4g1jjNWg@mail.gmail.com>
Subject: Re: [docs] [PATCH] dev-manual: add command to force a recipe re-compile
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 09:27:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9674

On Wed, 10 Jun 2026 at 11:24, Quentin Schulz <quentin.schulz@cherry.de> wrote:
> Do not modify a recipe's unpacked source code, it's the best way to have
> your changes lost. There are non-negligible chances that it'll end up
> being deleted and unpacked again (e.g. because the cache is outdated via
> its dependencies or the recipe parsing resulted in a rebuild of the recipe).
>
> Using -f also taints the build and you need to clean the sstate-cache
> for this recipe to recover from it last time I checked, which is
> something we don't like recommending to people (if you need to clean the
> sstate-cache, either something's wrong with your recipe or there's a bug
> we need to fix), so I don't think documenting this enormous footgun is a
> good thing.

I agree, I'd rather not mention it at all, and point people directly to devtool.

Alex

