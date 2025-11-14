Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF0FCE8D7C
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 19:20:36 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6413.1763148036216652758
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 11:20:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mz9yZLil;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b25dd7ab33so157323385a.1
        for <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 11:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763148035; x=1763752835; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/uxJuuc3qqK5+Tz+UlhWpx131NNSuFle0rpofmZcaZ0=;
        b=Mz9yZLilkfK6s5aICjSf6svTcBHF2jXX/a/wXywEzNSKJtoHumQzPkz+o6nK4AVLWr
         oBZzBpKLCPdvY1HDm0zTRhz5nUuR8+6vGZvFM1AhYS5rQphD1sn5RLXs/nyxvJvOliAN
         2px6kTS1hCyTVcq8d9y4md27cLP3vr8p2u8G6hySXZCg1UFPiuSYw3hGxkO4TcIGVmC7
         2YwuxHTPK78d9tAvNxzUDCeU7i0B6dUquOKVUOkcnTz38xgGEvejPaqN4Ua6R6T8nfRE
         VlUhtofUT03zlVMV1lxC0Sf7Xy+R6xp8hJETX2A3CAtzkgwvzWGafk4P/4WD6YEAT7zH
         ZVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763148035; x=1763752835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uxJuuc3qqK5+Tz+UlhWpx131NNSuFle0rpofmZcaZ0=;
        b=qk3/i+5kmR6Rm5hACp09tvh8lTnZcU7YarAvvlldPDkdeAkLkBZq/qcFyP7H0iw9yH
         AoqGAZsDZCuvgL5o+TckYTUgnEfwvaUtsIyjVYWXNWPJWvhlifKfy7BsHeiXc6Up1T4K
         IvrzdUWgea+EkLEsVbszWGtHOxSkBV6q9r+ZgS2R1xS+9FBbMs+1bMY9kRUaEnmh4B2O
         WBya89vN4GDmVbK40VDNaee23aytE3ks4E3b4pyr/71DWQmxPje+8winvk3BufwT+D5j
         bLM3Zii/nYEpgcL/8XolO37LO90K803BRIobFZu6U+SirUlns6S01gufilYY7kMz/tHa
         LfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfy9HHkGXxTjlN4XfjAxJlifrUOnOeALVIXnaEnEwVzjSIZ/CSYjTaLIptH7cOCyfnwDOo@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwTgEGBYthjmpmv/jfNUj4CFnQSxJl7QYUN64Y3E7AWCuWozx6r
	qyMDBAFAOmhrSvZ5AwaOvTIbnzUE6jqYkjEEG8Je30jPNY9DiXEpw9SNtQcYdeN2S7dEn9ps0yw
	3K8hIFIdJoVtm2Cd25IbG9SDCKx+ULLlCEQ==
X-Gm-Gg: ASbGnctgrPXEJzz7oh3sC8r32PFGuGQrM7hfXs52R9tOgBwPUWeGhkAizKAr6n+VknT
	aTHjKexFQwfRzpEhssNNx8ycRpkNzCJCq4n+YyWriEc+pGaPjv+qVg+ja5mB3e28QmFsxyKDOdy
	ohVWnC+QuK4P0g/dyEf3b05rBuo9bqLusIFJYHuaI/z6LUoSI9xTr3pb4OfU3INHqnmriRMlieT
	sIUySHUeB1ittNH4gfx7X7+/Kssek932UNiMxoLMLVmU9eH0vRKn3WEBzSJp74R5fs5rpFRXkgw
	HDo2
X-Google-Smtp-Source: AGHT+IHarOXrxJbXuJMvLRN+WZIxaUOBkUtRsaomlFhHvzvPJv2q6Cf6fgJhqVr6Lub/DoO6v4K2B23QQDpKx6u2j9g=
X-Received: by 2002:ad4:4eed:0:b0:806:c33d:be with SMTP id 6a1803df08f44-88292684b14mr59263706d6.32.1763148035077;
 Fri, 14 Nov 2025 11:20:35 -0800 (PST)
MIME-Version: 1.0
References: <20251114-bitbake-setup-conf-updates-v1-0-990583d8251b@bootlin.com>
 <20251114-bitbake-setup-conf-updates-v1-1-990583d8251b@bootlin.com>
In-Reply-To: <20251114-bitbake-setup-conf-updates-v1-1-990583d8251b@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Nov 2025 20:20:22 +0100
X-Gm-Features: AWmQ_bnoIStWtm_kkPkKBSetm6XaiayHKKAvOmAzWadRJImpmt63cDiVdrIIiYc
Message-ID: <CANNYZj8GTMaqAhgbvJ213mEYtfnD-b9BgJtJV6bC163N2Copxw@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/2] bitbake-setup: update: add a --update-bb-conf option
To: antonin.godard@bootlin.com
Cc: bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 19:20:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8055

On Fri, 14 Nov 2025 at 17:44, Antonin Godard via
lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
> +    if update_bb_conf == "prompt":
> +        print(f'bitbake-setup can update the BitBake configuration in {setupdir}/conf')
> +        print('This means updating the local.conf, bblayers.conf, and other files in this directory.')
> +        print('A backup will be created for the existing files.')
> +        y_or_n = input('Proceed to update? (y/N): ')
> +        if y_or_n == 'y':
> +            update_bb_conf = 'yes'
> +
> +    if update_bb_conf == "yes":
> +        setup_bitbake_build(bitbake_config, layerdir, setupdir, thisdir)

I don't think this is the proper way to implement the feature. Even if
the user answers no, they should still get the new updated config that
they can inspect and integrate into their existing one, so rather than
ask the question here, it should be asked *inside*
setup_bitbake_build(), and only if that function determines that a
config already exists. Then, depending on the answer, it either
renames the old config, and writes a new one (current behavior), or
leaves the current one as it is, and writes the new config into a
newly made separate directory. Then there's existing code to compare
and diff the directories, so if they turn out identical, the redundant
copy is deleted.

Alex

