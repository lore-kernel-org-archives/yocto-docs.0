Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77204CD6E57
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 13:31:10 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28590.1780320661161675049
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 06:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RvpOljBJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7defee656dcso17195667b3.0
        for <docs@lists.yoctoproject.org>; Mon, 01 Jun 2026 06:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780320660; cv=none;
        d=google.com; s=arc-20240605;
        b=ectp9Pt8zjeOtIuHU8EsqBl8hhmW7Ik8fQAqKhNjP3fL9NCwgL+TcMoFZOdDvEKVjx
         pt2nJdkpzCbZ2IWTxEOj1WPlsffL5cC/emDNrGRsRThKSq6RarI60nF/6a4zGECYveJ4
         MaHX822gp/5NLcTo4Lcb+uEv6jv21O0HMs9k3cL6EOYcuiQv7Zs50bLrHVaYHoMNGxZG
         EqWMb7vl0VV6dLhiSbGr4yEYHbyTqxggd+PlDmoJ1Gb4q3wTi+fRHFb9Dit6+a+oit9h
         TEbalrvZdEVTquEpz3eYr6Y12TO/g8btKmkGJ4z15Y0CNLlYSTXGsj/1uLXHOzma5XIb
         VU/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Rx0qeAhYPl3GXaFN07BHks95TydvlEkG6uOdr/3uFyQ=;
        fh=D0+gOZZ3eyNuhwnjWeDumCzSvK9xugtQViJULnunL34=;
        b=kug79oxxBCIRnEVOq6yB/tSmEIohXjIHflJs7HHakrLZxImnj7MnUnOSEFW+W78WYr
         ZV9XN9jqhPtR66/aIatOt8dEfFiEcr4ntMP5OwVdV8p1FQOMALK/S2yxPb++zZ+NV5JX
         cug3VojNToHbwG2fVHbvxAP1C1iAprBCBniGPmtaotYAimMMXMKVQ89NACbrdiuidTtz
         qtHA4hg9XdjzLP59zuGtiuOHeAdS5IoiuzpgjPLbtXBmd0itkiC8ZfEuJLQwulwmi5mZ
         6JgwzFBdsv8iy1YhNZWzl2gPz4M+k/emcyeDL5n8Y2vsbzJBvb6emmNWaxUQpfq1CG/z
         w1PQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780320660; x=1780925460; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rx0qeAhYPl3GXaFN07BHks95TydvlEkG6uOdr/3uFyQ=;
        b=RvpOljBJqmiQSMBwZ5/ZiHtjK/eylHhRKBroIJXiCLNjVn2EDd4/8jCKVeBuAg03Ax
         lvV4wv3eQW+cXbCc76sP8gwxfSL+u56VLr9u/aM8Bdayoi1HVYPa9s1KTEDcF0TWz1SU
         ZVe3D1O4Qg4VX4XZUQlphW7Jp21Q4RIeJPDEECAtSkZuXHBsaV+eaZtySBh4Um9HqA/n
         +4rWpypGZ1TQsxMUA8NaEO8Y0QiUhlKi1+tGRj+6NvbNJq07DQnvq/HLJHFUQ1cnvKa7
         fvdrlLA+ycAZo4wBQ14qHwgr4bzIMbdJ6X7+hoHXu0KZ7smFlBIpTIe2PNN0foU4XNc6
         SwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320660; x=1780925460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rx0qeAhYPl3GXaFN07BHks95TydvlEkG6uOdr/3uFyQ=;
        b=Wc/sScr61ihBoIVGwRGgzTi8GYMB0X7i6wud6QXMxfK1dsN9pmC9LVZ3ul1HIISx4x
         C+w9iWvJo3goLbwq88vV8OWWTNs8aeq5xdoOHkponUJBBh2Xjv0F6OeqAWLDWV8VE2R8
         +kCsH4xgR94SEySZCUfCEXyWeaDd/OnrwwsGNsWCVYTQcyw0UAjHOf9iDvNJMtP2TWRp
         n30a38sTu+2wm5kRE0n2Zwhue5giCUkCbu7jd531spO5XShfe0HSm1BLN4PZ9ZYHT5Lw
         Ylx+ekiT5fnLIEm8xky2O0F855UcekkUOq0bkaJyZOUwbtNHMq1/3f4M/lHjAdv7LZrV
         97hA==
X-Forwarded-Encrypted: i=1; AFNElJ9Bjy41ZFeGXEwCbM9yL+Tzl7d0FF1ZqaZTuq6yrjnF4u8N1ENwJ3fUtYyH4kXcxgbubQmK@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzdH4O2r6u3CFnB5mWAA9GKDvqnuPnYpdmGrnezPFNgJ/pyF2v0
	uBqb9WvU6bCD+4kzbDiEZwk6JKoS7+KT4ZKq0JHF23SarlThFYnBCUPBwYo+17/iySwyBQAlGBe
	sNVQNYXQbl3CAsAqe5czgSbHf1hXTslM=
X-Gm-Gg: Acq92OEVsjcRhWHEyAbc1zoFqVkaVB04UCBUqGYzq6+wmMRDX1a3JxU4CJRf3Q3uUuR
	bHL3iOPK4yXVIeiFDdk3ArpD5zlkL9h7dDoRJEkh9sxFSJeefBQ0QtI3YVAVgmplHUilQjhphtt
	WRFaD5SZXZo872q0PJ+jQmBmx/NBF0Yp+KRPAas3bKCX6PNBG3x1sqhr0WrcM2tvn5tPFb8qCvg
	qdxWj58mXt/YactTa5ngMUZDw6bhHQZYmqrmNLW9MSdPujK37GCNDAK0760R8ZUhZmAMZN9ncCr
	2olZYMvdopYb0ZtMAHJXCMKLunFvXic0m52sDGK6AJm19AWZRdNU
X-Received: by 2002:a05:690c:4b90:b0:7b3:18ff:1060 with SMTP id
 00721157ae682-7e05c94e1a8mr103934247b3.27.1780320660048; Mon, 01 Jun 2026
 06:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-bb-setup-notes-v1-0-a251ef1c5af4@toradex.com>
 <20260529-bb-setup-notes-v1-2-a251ef1c5af4@toradex.com> <DIXISSZ5047B.PSMH6SMC4CF8@bootlin.com>
 <3kgay5cukb3dd6ojc7ysbtd5jgglbe7i4shvcksa2wb3kh2zyc@3oegr7dacucw>
In-Reply-To: <3kgay5cukb3dd6ojc7ysbtd5jgglbe7i4shvcksa2wb3kh2zyc@3oegr7dacucw>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Jun 2026 15:30:48 +0200
X-Gm-Features: AVHnY4IMMmf8o6qLHOjplFQAxL3zkVKdEOpRqG2YlKHCwRgcT9ulnNQ3eUTv7Bc
Message-ID: <CANNYZj8+ToTjrpgXMzFfDB5k4Xc637ORzY7LdzW0Kn6fBGs_BA@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH 2/2] bitbake-setup: write notes for
 generated build configs
To: ernestvanhoecke@gmail.com
Cc: Antonin Godard <antonin.godard@bootlin.com>, bitbake-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Jun 2026 13:31:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9551

On Mon, 1 Jun 2026 at 14:53, Ernest Van Hoecke via
lists.openembedded.org
<ernestvanhoecke=gmail.com@lists.openembedded.org> wrote:

> Yes, I tested with some newlines explicitly written and this worked fine.
> Since it just comes from a json string and is passed to `f.write()` I
> don't believe any special escaping is necessary, just "\n" is fine.
>
> My understanding is that the Python json library should handle this well
> and converts it to a real newline in the python string.

I need to ask though: how practical and readable is it going to be,
when written into the json? Notes are meant as multiple paragraphs of
text, and it would be good to be able to write them that way, instead
of some specially-formatted single string.

Alex

