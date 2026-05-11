Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB83CD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:23:49 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46778.1778495022570560286
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 03:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=psDQiit4;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8acb09ddbf6so66841696d6.2
        for <docs@lists.yoctoproject.org>; Mon, 11 May 2026 03:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778495021; cv=none;
        d=google.com; s=arc-20240605;
        b=Tc9P4E+rHJDT8YREXtgtvVG5gGWvTIC+6WifG3l2GEUu14F7H05Ga5ZpliPsjZAsgL
         ArU9nD7Ob9cM84Ow0hhU83akYCtwVP8XSqmeM86swtFZ4c+7Kgs2TecenBVU/SOXlnK+
         YTDfQOdH8QjbYO0jhpaeeWmsLx0aMImCFzXd83YGQ4tkSYI450gWmq2hy3iV1gbib5Jd
         vzXcs5nl73x0sAH77MqdSRfTzyf4f9NaAydd6THqOS46N6V3UAdGahl55Urzj6+wi2NC
         jEQjWWgJaSolOr/EO0GAxr8vKykw5OU6SD3BarsVUefFVm+4Y5pzHCJCBebAPRMNkfYi
         af+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E5vlzXJikQOkbxeAx86KiP4T/ZUuNJ84aQO/SFYFLrA=;
        fh=ZpweWOMhl+vC0VXWfJOuYaZZDCfxlH+QHLvDobq/Omo=;
        b=h5LrcGoVgy1hpoWEOpCCWM935aDAj/AkaRGSr0T5mri7nJ0zat1Oe0j9B7BavIldFS
         ZMHjoprJOOjbFym7Pi/+7GLj0krjwRBh1+iW7L6YI0BV0+l3DLCWbZ96lMMf15QW85bF
         OjK6F2c1py5ypfXOdy0Saqjd1M+0iEzJiqsOcgUnz2phQfmGGoooNixM6lCUFv6uYyXf
         uuOKzFO5i/9tbzq3uOVspLL/BDMAAd98fRvnqNMOk/88l9dFRgmAf5p18LJR4ILOh6Vz
         FfKH98yS/EYZhcms4M/RL4vm65olIa69wIkd1GjQqah8C9VeG57ORVt5uzDZaNtTAil/
         aU6A==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778495021; x=1779099821; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E5vlzXJikQOkbxeAx86KiP4T/ZUuNJ84aQO/SFYFLrA=;
        b=psDQiit48iYeputv+Sd510eF99xwWGWNT5+g7U3+8lAQj1HP42UknqcyoLM4mJ/q4R
         bJSpelJtPfAAte58eg/KdTFCItujQMm/FcqJVkyl0z9Yxj1Ide/bsZNDmBjShR3zIuiX
         I943vxnHzlEDu593YWiHTedNm3buOgUP5/vm4uBGgVI2BjP5Jz2YXdq9XVLt72ftAF9G
         OCxkyaEizNylM94jIFJWjTv+wDJhyhn6OSWTOHqFXlnQbBZXFEMamh1tSh+2DrAuHx+A
         BCPzME9gxZQKgU100WFABnRSn28Q/C2h+z3QBVEljjlU+4HYghGv6J8stdLOcVB5Uu0F
         5irQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778495021; x=1779099821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5vlzXJikQOkbxeAx86KiP4T/ZUuNJ84aQO/SFYFLrA=;
        b=VcsRtPPhGrBkYx6n7HhgLrCMbhIc+9v+sEN6kZ3kP3KoMBQVbuwF4gRkkhYkLxaMi+
         iX+CjWDAwo+wi+PMqzvimvbaWsEjqmL5jaX2jbSUPR6WxgL6fSM9iqbn4GRJNhsOufCN
         R5Tw66l5Tk3OHJxBhUBay9jj6jvCnVkJBTBzGNqhW/f7gtaUScltVGEQk4hJwfj5GO6R
         mCciHY396z4Xbo/73N1R6//j6fBsIFAa3o/Wrj0cKt9ZdvSOghMsRBtg7i14oqVO5nYJ
         gQF5AKVHzdOZ6HT9vWU/E0s6A/Im7nS1BxwUy2caTIbjELPTPCl3Qnhy8zmb6ta/olWn
         EkEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OFBk69Ce7qmKHIAQIqKt4Od3IC5Bfe6XnmesZWjX/jIyghiIIHrX28Tuwr+lg6VGbrmx6@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzudzlF/3BzgUUT/RDKRY9IL6u4hEsqw/Zpd6orkTvqpYZWVJUd
	Flk0eMGojPigRfC7uvC8CYmcMOdkyZXd3RYoA4L3aQsBtidDjBUcD5z4VxQYgWf3vFhjQKM8x5o
	wAOLiGAI5ixfV+eDTX6dYdQ5khRu44/k=
X-Gm-Gg: Acq92OHt2UUjQSGPvOOV/41tBeEFIKPHzunzUp5yFX3OfbsIHyenldUQdyxJ89EofwV
	UIL3dW7KoCQRjPnrcub4w9fx1Nw9Gp4iKeViyX0bP5urdStyfYwq4j0l4Y1crLikt+5fqUHFodA
	TXHmpikmB725tW4mVBEsxdwAbkBW0nxaCiA6P3q1dN9EwLMsQZ65kfTMnOoYFfhkHzUWRzuPyQ+
	6QKklqyswc8+hZpboD+sQqSuttiZsNhHWlerjqbWPMedOzWjCcXB3ZnhpDpvjm4k+tW2y7Nrj3c
	Pwcz9xX2XABCoZLHEyPqI2rH2ULEqhTA1gfcvRh+mloM+rX50JVw
X-Received: by 2002:a05:6214:3c8c:b0:8bb:cbe9:15cb with SMTP id
 6a1803df08f44-8bc44f85b29mr354542816d6.26.1778495021604; Mon, 11 May 2026
 03:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <e9ecc3f8-c93c-caf1-eb73-de73633cda10@crashcourse.ca>
 <CANNYZj8TrFArNqiE2uTowv5RvnourbGoweJ_ySDXmjFKsx=P2w@mail.gmail.com> <d3a49bad-4a51-4493-8ba5-18bf68c19cc3@cherry.de>
In-Reply-To: <d3a49bad-4a51-4493-8ba5-18bf68c19cc3@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 May 2026 12:23:29 +0200
X-Gm-Features: AVHnY4JvUlEOeyytH1AuArrLqWKjEj38P9W0ZYNUgw4mLvW-cjGKC7mKHSxgJSE
Message-ID: <CANNYZj93d9tG2ibte-KWQt9T05Z6xw_max05VSvRoz=0K8+CvA@mail.gmail.com>
Subject: Re: [docs] Quick Build using word "naive" sounds a bit condescending
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 10:23:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9444

On Mon, 11 May 2026 at 11:55, Quentin Schulz <quentin.schulz@cherry.de> wrote:
> Source?
>
> This was added a year and a half ago, so I'm not sure we can say it's
> outdated without more info than gut feeling.

Maybe outdated is the wrong word. Rather I can't make sense of what is
meant by 'interactive shell is not available'. What would be the
scenario for that? How is one supposed to then run the suggested
commands (or bitbake when everything is set up, for that matter):

$ echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
$ locale-gen

and why they can't simply run dpkg-reconfigure instead? The dollar
sign in front of these commands does imply interactive shell :-/

> > This whole Debian-specific section is also duplicated in the reference
> > manual, so the quickstart should simply defer to that:
> > https://docs.yoctoproject.org/ref-manual/system-requirements.html#required-packages-for-the-build-host
> >
>
> Yes, by design. See 411e8ebcf79d ("make sure Quick Build section and
> System Requirements are in sync").

To me it's a bit odd that quickstart includes the debian/ubuntu
section, but not fedora/suse/alma etc. I'd say it's more fair and
consistent to either include all of them, or none and link to the
ref-manual.

Alex

