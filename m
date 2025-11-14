Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8CBCEACC2
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 19:38:06 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6821.1763149082976306427
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 11:38:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i2JjAaj1;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88246676008so27040146d6.3
        for <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 11:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763149082; x=1763753882; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ylcrtZHUcDlniPKUvb7FgqRcI2w4SO5/SBoBzf/qFvk=;
        b=i2JjAaj1T2iQqMFqy6JaPMKhV+RUjIMXGJHrwjJWeETsiZyVZijgV7gl98VFuq50o/
         orEP9u1zUdPdaepgcXHlL+Tz75aIfqtYoPGRj+8dQOf3MHZOnOsn1dVACUkXdfOCfpMD
         8f+FBobqEwrswVMCC/S1V1aWJwVAZCll9sCOTBxZc51t/V5T4iNgZ6ubdlRfl/dV94BT
         vrHkJ3MIAf7G27Hqjeurj1IsFsHK2PFio6n0dgUAKFWKkmKdXYiS45ar1V3iNxRwMsoT
         PbX6XxtjmrpTKowDX0PUb+PJo083imPNaJMw6bHP9y3dX+8ZMRy8ddLHsHbcfg+i9105
         9jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763149082; x=1763753882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylcrtZHUcDlniPKUvb7FgqRcI2w4SO5/SBoBzf/qFvk=;
        b=YrSBaywyG9dxtfrxe8TfC7AtrBJmJdZaUDeKusJ0G+X/3Y+DQF8Aeo+54Y2AX4oK0s
         thHrFS7fpN8TVGHiEM6DohQuPT8Wh/kW40+ipaMvHej5fatBuByb4KadIE4DrcBbpaDK
         mti9OIYXJS6JOnFtuNXOunIGGgOugcwpIXUcnmKsLqz//yr7TjLpSkVD5fFBKKWz+In9
         mavxd/jCx1AlpHNHSoyh2cs4vWPTKtePH9MTNCijSXpQIk7lVFXgTR7W4Fjw9p6LZoy2
         ISovj3foyUZCdmceMohPV/hx6+IRx9DNBMflgZj4B1MsDUhz+LJy9YFS0lJDVRhCGRiX
         rgUg==
X-Forwarded-Encrypted: i=1; AJvYcCXbez7wWu5KHLE00wBDPLVQrB22heQ/zXFrB+peKC6mTWdiBlfHzo2cSAHtdtW++WX54acj@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwhMMUuvLLO5ek6r0SQM7sMxqxEKuxEcLAgfm4ibPHTCLjQBFUO
	XPYtUC7b9cM6Mm+udXA0+bftGmUsPcf7Sm0Y5SL/E6+S/mI8rYlwA4dEklTpSJT2yTo4CQIdvi/
	DIbafDUlp1j0pAKPQuwBsQ8QxKCY9WCs=
X-Gm-Gg: ASbGncu5RI97GQINtwVU1xEnOW/PF1RsHpZL9xnbZk0QDyflZjP2hq2Ka0c6BcaLCHc
	5N8VuiFZz+4TS15WvFoc8XGn5kqUzGZO6HlRy+55eRJ4M6YcMk5fklAcbra1mGUgXo75sHg0S0e
	OX7/5KAeQ7BVe0wenL2qmPzqd2WgrkkbGC3pVlkEhGTjxPu4F56qK/xYcRv+V4eOB2VuY1KGwR3
	Y4y2dBrFDmThEITVrYKX2LULR84wPtdvz+UcjsyltU/+rIOpZd69O5pdvNrNBNqEny1qOI0HNQE
	MsLv
X-Google-Smtp-Source: AGHT+IGlp/wVR8BKYzkVJoBPN5i7f4sAE0YXh8mTpIWYqoVxeLctXa2kUe6KspJcJ+ibMNqnDrx6YiGN2EwE5EYPMB8=
X-Received: by 2002:a05:6214:21ed:b0:87d:e32:81c4 with SMTP id
 6a1803df08f44-882926ac72cmr57380306d6.48.1763149081909; Fri, 14 Nov 2025
 11:38:01 -0800 (PST)
MIME-Version: 1.0
References: <20251114-bitbake-setup-conf-updates-v1-0-990583d8251b@bootlin.com>
 <20251114-bitbake-setup-conf-updates-v1-1-990583d8251b@bootlin.com> <1877F5CC2B8BC1DC.1114802@lists.openembedded.org>
In-Reply-To: <1877F5CC2B8BC1DC.1114802@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Nov 2025 20:37:50 +0100
X-Gm-Features: AWmQ_bmSMJj0L5Hka6cP_wYlfC92vu40o0qsZ2fcasSA9MABHPgQM8EWS4QbW24
Message-ID: <CANNYZj9iwjsr=ZEg6=k15_gkDdfHogdNwcuif6-BqfJHmEuHPw@mail.gmail.com>
Subject: Re: [bitbake-devel] [docs] [PATCH 1/2] bitbake-setup: update: add a
 --update-bb-conf option
To: alex.kanavin@gmail.com
Cc: antonin.godard@bootlin.com, bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Nov 2025 19:38:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8056

On Fri, 14 Nov 2025 at 20:20, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:

> I don't think this is the proper way to implement the feature. Even if
> the user answers no, they should still get the new updated config that
> they can inspect and integrate into their existing one, so rather than
> ask the question here, it should be asked *inside*
> setup_bitbake_build(), and only if that function determines that a
> config already exists. Then, depending on the answer, it either
> renames the old config, and writes a new one (current behavior), or
> leaves the current one as it is, and writes the new config into a
> newly made separate directory. Then there's existing code to compare
> and diff the directories, so if they turn out identical, the redundant
> copy is deleted.

Come to think of it, we could do even better:
- write the new config into a temporary directory
- check if a config exists, move into place if it doesn't
- check if a new config is same as existing one, remove the unneeded
new copy if so
- if it is not the same, then print the diff, and ask the user if they
would like the new config to replace the old one (if the answer is not
already given on the command line)
- with either 'yes' or 'no' both old and new configs should be
preserved for further inspection

Alex

