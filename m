Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8EBCD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 14:09:50 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29760.1780322984828185448
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 07:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bpXxVRzb;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59bbe027424so2163984e0c.3
        for <docs@lists.yoctoproject.org>; Mon, 01 Jun 2026 07:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780322984; cv=none;
        d=google.com; s=arc-20240605;
        b=b8tlkLgN/0qItfNXGyEzbH9ZvoGgDPT2T0Ncz/+j9mYOzVd0lQ5K6Cjwi5ZcvvT9oG
         VzIJhvCkNTfmZaE1yfvot9tqeT8ho27y/qqq+MsOBQ4MShhqqJ4T8dghxjtDy+pDG5xV
         kbGDNiG9gCoCpw9TqBQuf9w4oLeHzDRXtJ7HNeUQ0rcZ1TePL3yYEflbAejASqoOBzuf
         c4QrjDBb8FPpwB0CG0pUke0S1j2P1laNrn0hA8F2ITbZMpTS9/v3QrKfk54pF1VWkj7R
         qZPUY4YgqyBCSZStLppK8S79oV7ECA926mzmlpdPp9ci79vyhKZRK9kJK/xm4VTa2biL
         DkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FrAxFsP4cW4T2VuKat6K3FjXZL/KR17AD9B4Ow5sk0M=;
        fh=Ni78vj4Fh2Oxt6JngXKR2Vvr0mzGSsIXIYvwcyOLrrE=;
        b=i7Ta1fYyOX8AhtPE2hNwkQX+9zqjAAVOCRuetNefxu5GaiuiK+pW2EwO7i8zhQJyB3
         lfNc8uy4U3NvkDwvSUkD0aYhEjECv98AmX5GYLAomr7LsTVI2NH93AAFbSylk9oJslO2
         YN97DG6VEoQ8swNGy7v/2xeN/i4R9n6Nq9rc2hhIzT0XXuM8uKOi2rqVWCE80nHvzvAi
         qii7DFH2cjJsbuceUMKTON04N/fOt8jZT7iyb99e2GsgAFxs1YGoa/apfOWFtQscyPK+
         EKDBzYvgbULPKklCSyh9v6K9H9J4wvAIJ0OxGYGS9C2TM2xuXnH+Z4FtVxjdZLidQOcu
         o8SA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780322984; x=1780927784; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FrAxFsP4cW4T2VuKat6K3FjXZL/KR17AD9B4Ow5sk0M=;
        b=bpXxVRzb407d2kT4/kx+BIL2tswOeHODJtqVq/KtKrZDNisiaWA4aOz5SHV+WAcrU9
         A0NQkqwtHU+uqeqV/M9aEobWzQddR5BOW2FuE1p72T9byp6hEazTR5uX9bowreQHs61M
         9753fuPm2FJFylJ4Irzh/abXkHmLhOvEtcxAILNWqbj/JuoRCxk/N1b3IIJH2090gEOc
         LdMHvEfsRqySpvQHWPrhjw1NDthGE5YpxqY8x0/0QCyLgOz7k+CUatwX4hOzYVOArPRf
         AF/76hA9VYqW/8rjGrhWNvWSKkyId+iIeNVCrhlDKV/DCnxYCUi+6PNxmpt9EXRSjz3i
         Jy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780322984; x=1780927784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrAxFsP4cW4T2VuKat6K3FjXZL/KR17AD9B4Ow5sk0M=;
        b=oeb/iPKmYaeF2mN/S59gck0Pg4WpbnePTmJht+/odWhNnmpcqetD4zM20yWRCBAwnx
         DApmqelNlBVxF+iZtKlZ2CyDmd1KzettLyfrwXIiSuuK4MY2EbB/qe4MGDpJun/PlAiC
         TqqYWs+fAmyc2XCaKdy63bqwRXrcsX4JPWSiqpJLoFMrbnxy5LlAVpTsSQ/ePAf0VvXM
         pcVELASD+CmhinONp4d2NuNi32ia10yRNba1CYF6aWvyeoUcI5ekzZkvCfr5woDXlGlF
         sHBAmM/6DTa+kLFBMrD5ZHmLLla2NPiC821d+FxVqYBgHEgNjJeqVNTm6iOY+mfRsp2X
         S4ng==
X-Forwarded-Encrypted: i=1; AFNElJ9/bKl3ZmExTxA9J7V5/xegG6wngoYbAtYwllG1Y+uUAK8u/CPApTuR/U5ebmrvsAxCIeKo@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyvzqrgaDY45EfdgsdhBiZyVFiqsMMHJF7fXR28UPxn5DtJnjo6
	iQAo3V6YVOL+GuFNjhNKey8V8YzZZQ+pjUL20VSKklcU22o4cgeu/hTCsABtLovGt94mpxbmj5S
	Fis9BjqkFD9yLLRyYEuKVvEu3bqDYFk8=
X-Gm-Gg: Acq92OF54XvfYeQAJmm7uRYqTsWKDyM7st5+l3LEFcQCd/84RZI1fG8BM8Iyzpj2Qq8
	irnstOk/Dewt4t14jnkgVUcigKr6gGviu1rypEnXe7g/xFKwlKna1hibT174uYNjks3hkVTA5D8
	1jpXR8CdjCmN8uWyJEc7NTGjKV60edY974Ebmw0QmDjBGBQt5BgV8Inm3LxMA3UDHgcsDgKd9Mc
	VYNN71POyeaMN6iU5zziU1mYcgVOWL3N13646jcyI04TxFOwadG29UZZMqaeMreF2+qpVUHFHS7
	alfUOnCQ3Jl9Qt9ZCLdL+rutTZB6Dd+6CNmr2L76C9oE69fHkQYEQHuU/YS6Fiw=
X-Received: by 2002:a05:6122:3a19:b0:5a3:1088:51c0 with SMTP id
 71dfb90a1353d-5a310885f41mr946740e0c.6.1780322983687; Mon, 01 Jun 2026
 07:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-bb-setup-notes-v1-0-a251ef1c5af4@toradex.com>
 <20260529-bb-setup-notes-v1-2-a251ef1c5af4@toradex.com> <DIXISSZ5047B.PSMH6SMC4CF8@bootlin.com>
 <3kgay5cukb3dd6ojc7ysbtd5jgglbe7i4shvcksa2wb3kh2zyc@3oegr7dacucw>
 <CANNYZj8+ToTjrpgXMzFfDB5k4Xc637ORzY7LdzW0Kn6fBGs_BA@mail.gmail.com> <3yo5dz6bcwiwkwzqe7ucg3u4lkfpgjhzgmwqnehllgehxrmopt@vtqynopxxjug>
In-Reply-To: <3yo5dz6bcwiwkwzqe7ucg3u4lkfpgjhzgmwqnehllgehxrmopt@vtqynopxxjug>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Jun 2026 16:09:32 +0200
X-Gm-Features: AVHnY4L3N5XC4nNjRk0PEx4Kytq5uSlStZidfZU2OYTtMPuOFSSBSrcBbJR-hDQ
Message-ID: <CANNYZj_fQbdbKw2h5CAz83vPswpM25_oWoDpAL=+rEVJMtp_Ow@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH 2/2] bitbake-setup: write notes for
 generated build configs
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>, bitbake-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Jun 2026 14:09:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9555

On Mon, 1 Jun 2026 at 15:55, Ernest Van Hoecke
<ernestvanhoecke@gmail.com> wrote:
> I considered this and agree, there's no true beautiful solution here.
> The description field also has this issue, granted, that's meant to be
> much shorter than notes.
>
> Since json doesn't support multiline strings, the only alternative is
> making this field a list of strings and concatenating them in code. I'm
> certainly open to that and can send a v2 doing it that way (it'd look
> like an extra "\n".join()).

Yes. We're basically restricted by json's original purpose of being a
data transfer format, and not a config file format. (the "no comments"
restriction is in the same vein). It's a lot more human friendly than
xml, but still not friendly enough, by modern standards.

It's tempting to make it a reference to an external file, but this
wouldn't work well when the config is fetched with http:
$ bitbake-setup init https://my.server/some-build.conf.json
would have to also fetch the notes file.

A list of strings isn't horrible, perhaps either can be supported?

Alex

